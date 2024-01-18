const express = require('express');
const User = require("../models/user");
const router = new express.Router();
const multer = require("multer");
const sharp = require("sharp");
const auth = require("../middleware/auth");


const upload = multer({
    limits: {
        fileSize: 100000000
    }
})

router.post("/users", async (req, res) => {
    const user = new User(req.body);

    try {
        await user.save()
        res.status(201).send(user);
    } catch (e) {
        res.status(400).send(e);
    }
});

router.get("/users", async (req, res) => {
    try {
        const users = await User.find({})
        res.send(users);
    }
    catch (e) {
        res.status(500).send();
    }
});

// Login user routers 

router.post("/users/login", async (req, res) => {
    try {
        const user = await User.findByCredentials(req.body.email, req.body.password);

        const token = await user.generateAuthToken();
        res.send({user, token});
    } catch (e) {
        res.status(400).send();
    }
})

// Delete user route  

router.delete('/users/:id', async (req, res) => {
    try {
        const user = await User.findByIdAndDelete(req.params.id);

        if(!user) {
            res.status(400).send();
        }

        res.send(user);
    } catch (e) {
        res.status(500).send();
    }
});

// Fetch a single user

router.get("/users/:id", async (req, res) => {
    const _id = req.params.id;

    try {
        const user = await User.findById({ _id });
        if (!user) {
            res.status(404).send();
        }
        res.send(user);
    } catch (e) {
        res.status(500).send();
    }
});

// Post user profile image
router.post('/users/me/avatar', auth, upload.single('avatar'), async (req, res) => {
    const buffer = await sharp(req.file.buffer).resize({ width: 250, height: 250}).png().toBuffer();
    
    if (req.user.avatar != null) {
        req.user.avatar = null;
    }
    req.user.avatar = buffer;
    req.user.avatarExist = true;
    await req.user.save();
    res.send();    
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message });
});

router.get('/users/:id/avatar', async (req, res) => {
    try {
        const user = await User.findById(req.params.id);


        console.log(user)

        if (!user || !user.avatar) {
            throw new Error();
        }

        res.set('Content-Type', "image/jpg");

        res.send(user.avatar);
    } catch (e) {
        res.status(404).send();
    }

});

router.put("/users/:id/follow", auth, async (req, res) => {
    if (req.user.id != req.params.id) {
        try {
            const user = await User.findById(req.params.id);
            if (!user.followers.includes(req.user.id)) {
                await user.updateOne({ $push: { followers: req.user.id } });
                await req.user.updateOne({ $push: { following: req.params.id } });
                res.status(200).json("user has been followed");
            } else {
                res.status(403).json("you already follow this user");
            }
        } catch (e) {
            console.log(e)
            res.status(500).json(e);
        }
    } else {
        res.status(403).json("you can't follow yourself");
    }
})

// Unfollow user
router.put("/users/:id/unfollow", auth, async (req, res) => {
    if (req.user.id != req.params.id) {
        try {
            const user = await User.findById(req.params.id);

            if (user.followers.includes(req.user.id)) {
                await user.updateOne({ $pull: { followers: req.user.id } });
                await req.user.updateOne({ $pull: { following: req.params.id } });
                res.status(200).json("user has been unfollowed");
            } else {
                res.status(403).json("you don't follow this user");
            }
        } catch (e) {
            res.status(500).json(e);
        }
    } else {
        res.status(403).json("you can't unfollow yourself");
    }
 })

router.patch('/users/me', auth, async (req, res) => {
    const updates = Object.keys(req.body);
    
    const allowedUpdates = ["name", "email", "password", "age", "bio", "website", "location"];

    const isValidOperation = updates.every((update) => allowedUpdates.includes(update));

    if (!isValidOperation) {
        res.status(400).send({ error: "Invalid updates!" });
    }

    if (!isValidOperation) {
        return res.status(400).send({ error: "Invalid updates!" }); 
    }

    try {
        const user = req.user

        updates.forEach((update) => user[update] = req.body[update]);
    
        await user.save()
        res.send(user)
    } catch (e) {
        res.status(400).send(e)
    }

    
})

module.exports = router;