const express = require('express');

const auth = require("../middleware/auth");

const Notification = require("../models/notification");

const router = new express.Router();

router.post('/notification', auth, async (req, res) => {
    const notification = new Notification({
        ...req.body,
        user: req.user._id
    })

    try {
        await notification.save();
        res.status(201).send(notification);
    }
    catch (e) {
        res.sattus(400).send(e);
    }
})

router.get("/notification", auth, async (req, res) => {
    try {
        const notifications = await Notification.find();
        res.send(notifications);
    }
    catch (err) {
        res.status(500).send();
    }
})

router.get("/notification/:id", auth, async (req, res) => {
    const _id = req.params.id;
    try {
        const notifications = await Notification.find( {notReceiverId: _id });
        res.send(notifications);
    }
    catch (err) {
        res.status(500).send();
    }
})

module.exports = router;
