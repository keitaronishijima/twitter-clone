const mongoose = require("mongoose");
const validator = require("validator"); 
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const userSchema = new mongoose.Schema( {
    name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
    },

    username: {
        type: String,
        required: true,
        trim: true,
        unique: true,
        minlength: 2,
    },

    email: {
        type: String,
        required: true,
        trim: true,
        unique: true,
        lowercase: true,
        validate(value) {
            if(!validator.isEmail(value)) {
                throw new Error("Email is invalid");
            }
        }
    },

    password: {
        type: String,
        required: true,
        trim: true,
        minlength: 7,
        validate(value) {
            if(value.toLowerCase().includes("password")) {
                throw new Error("Password cannot contain 'password'");
            }
        }
    },

    tokens: [{
        token: {
            type: String,
            required: true,
        }
    }],

    avatar: {
        type: Buffer
    },

    avatarExists: {
        type: Boolean,
    },

    bio: {
        type: String,
    },

    website: {
        type: String,
    },

    location: {
        type: String,
    },

    followers: {
        type: Array,
        default: []
    },

    following: {
        type: Array,
        default: []
    },
}, {
    timestamps: true
})

userSchema.virtual('tweets', {
    ref: 'Tweet',
    localField: '_id',
    foreignField: 'user'
})

userSchema.virtual('notificationSent', {
    ref: 'Notification',
    localField: '_id',
    foreignField: 'notSenderId'
})

userSchema.virtual('notificationReceived', {
    ref: 'Notification',
    localField: '_id',
    foreignField: 'notReceiverId'
})

// To delete password prior to GET
userSchema.methods.toJSON = function() {
    const user = this;
    const userObject = user.toObject();

    delete userObject.password;

    return userObject;
}

// To hash the password

userSchema.pre("save", async function(next) {
    const user = this;

    if(user.isModified("password")) {
        user.password = await bcrypt.hash(user.password, 8);
    }

    next();
})

// Create tokens

userSchema.methods.generateAuthToken = async function() {
    const user = this;
    const token = jwt.sign({ _id: user._id.toString() }, "twitter");

    user.tokens = user.tokens.concat({ token });
    await user.save();

    return token;
}

// Authentication check
userSchema.statics.findByCredentials = async (email, password) => {
    const user = await User.findOne({ email });

    if(!user) {
        throw new Error("Unable to login");
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
        throw new Error("Unable to login");
    }

    return user;
}


const User = mongoose.model("User", userSchema); 
module.exports = User;