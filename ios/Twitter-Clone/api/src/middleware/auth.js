const jwt = require("jsonwebtoken");
const User = require("../models/user");

const auth = async (req, res, next) => {
    try {
        // Get token from header
        const token = req.header("Authorization").replace("Bearer ", "");
        // Verify token
        const decoded = jwt.verify(token, "twitter");
        // Find user with matching id and token
        const user = await User.findOne({ _id: decoded._id, "tokens.token": token });

        if(!user) {
            throw new Error("User does not exist.");
        }

        req.token = token;
        req.user = user;
        next();
    } catch(e) {
        res.status(401).send({ error: "Please authenticate." });
    }
}

module.exports = auth