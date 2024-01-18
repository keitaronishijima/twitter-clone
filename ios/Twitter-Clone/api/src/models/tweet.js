const mongoose = require("mongoose");

const tweetSchema = new mongoose.Schema( {
    text: {
        type: String,
        required: true,
        trim: true,
        maxlength: 280,
    },

    user: {
        type: String,
        required: true,
    },

    username: {
        type: String,
        required: true,
    },

    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },

    image: {
        type: Buffer
    },
    likes: {
        type: Array,
        default: []
    }
}, {
    timestamps: true
})

tweetSchema.methods.toJSON = function () {
    const tweet = this;
    const tweetObject = tweet.toObject();

    if (tweet.image) {
        tweetObject.imageExists = true;
    }

    return tweetObject;
}

const Tweet = mongoose.model("Tweet", tweetSchema);

module.exports = Tweet;