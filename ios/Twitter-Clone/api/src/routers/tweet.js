const express = require("express");
const multer = require("multer");
const sharp = require("sharp");
const Tweet = require("../models/tweet");

const router = new express.Router();

const auth = require("../middleware/auth");

// Helper function for uploading images
const upload = multer({
    limits: {
        fileSize: 100000000
    }
})

// Post tweet route

router.post("/tweets", auth, async (req, res) => {
    const tweet = new Tweet({
        ...req.body,
        user: req.user._id
    });

    try {
        await tweet.save();
        res.status(201).send(tweet);
    } catch (e) {
        res.status(400).send(e);
    }
})

router.get("/tweets", async (req, res) => {
    try {
        const tweets = await Tweet.find({})
        res.send(tweets);
    } catch (e) {
        res.status(500).send();
    }
})

// Add image to tweet route

router.post("/uploadTweetImage/:id", auth, upload.single("upload"), async (req, res) => {
    
    const tweet = await Tweet.findOne({ _id: req.params.id, user: req.user._id });

    if(!tweet) {
        throw new Error();
    }

    const buffer = await sharp(req.file.buffer).resize({ width: 250, height: 250 }).png().toBuffer();

    tweet.image = buffer;
    tweet.imageExists = true;
    await tweet.save();
    res.send(tweet);
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message });
});

// Fetch tweet image
router.get("/tweets/:id/image", async (req, res) => {
    try {
        const tweet = await Tweet.findById(req.params.id)
        if (!tweet || !tweet.image) {
            throw new Error();
        }

        res.set("Content-Type", "image/jpg");
        res.send(tweet.image);
    } catch (err) {
        res.status(404).send();
    }
    
})

// Like tweet function

router.put('/tweets/:id/like', auth, async (req, res) => {
    try {
        const tweet = await Tweet.findById(req.params.id);
        if (!tweet) {
            throw new Error();
        }

        if (tweet.likes.includes(req.user.id)) {
            tweet.likes = tweet.likes.filter((like) => {
                return like != req.user.id;
            })
        } else {
            tweet.likes.push(req.user._id);
        }

        await tweet.save();
        res.send(tweet);
    } catch (e) {
        res.status(500).send();
    }
})

router.put('/tweets/:id/unlike', auth, async (req, res) => {
    try {
        
        const tweet = await Tweet.findById(req.params.id);
        if (!tweet) {
            throw new Error();
        }

        console.log(tweet.likes)
        tweet.likes = tweet.likes.filter((like) => {
            return like != req.user.id;
        })
        console.log(req.user._id)
        console.log(tweet.likes)

        await tweet.save();
        res.send(tweet);
    } catch (e) {
        res.status(500).send();
    }
})

//
router.get("/tweets", async (req, res) => {

    const _id = req.params.id;

    try {
        const tweets = await Tweet.find({ user: _id })

        if (!tweets) {
            return res.status(404).send();
        }
        
        res.send(tweets);
    } catch (e) {
        res.status(500).send();
    }
})

module.exports = router;