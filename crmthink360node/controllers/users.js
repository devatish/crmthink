
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { User,Menus } = require('../models');

const registerUser = async (req, res) => {
    const { email, fullname, password } = req.body;
    const user = await User.findOne({ where : {email : email }});
    if(user){
        return res.json({
            success: false,
            error: "1",
            message: 'Email already exists.'
        });
    }else{
        const hashedPassword = await bcrypt.hash(password, 10);
        User.create({
            email: email,
            fullname: fullname,
            password: hashedPassword
        }).then(resp => {
            return res.json({
                success: true,
                error: "0",
                message: "User registered successfully"
            });
        }).catch((error) => {
            return res.json({
                success: false,
                error: "1",
                message: 'Failed to create a new record, Please try after some time.'
            });
        });
    }
}

const loginUser = async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.json({
            success: false,
            error: "1",
            status: 400,
            message: 'All fields are mandatory!'
        });
    }
    const user = await User.findOne({ where : {email : email }});
    if (user && (await bcrypt.compare(password, user.password))) {
        const token = jwt.sign(
            {
                user: {
                    email: user.email,
                    id: user.id,
                },
            },
            'think360',
            { expiresIn: "300m" }
        );

        const menus = await Menus.findAll({ where : {parentid:0}, include:{
            model: Menus, as: 'Submenus'
         }});

        return res.json({
            success: true,
            error: "0",
            status: 200,
            message: 'Loggedin Successfully',
            token,
            menus,
        });
    } else {
        return res.json({
            success: false,
            error: "1",
            status: 401,
            message: 'email or password is not valid'
        });
    }
}

const verifytoken = async (req, res) => {
    try {
        const menus = await Menus.findAll({ where : {parentid:0}, include:{
            model: Menus, as: 'Submenus'
        }});
    return res.json({
        error: "0",
        menus
    }); 
    }
    catch(error){
        console.log(error)
    }
   
}

const getAllUser = async (req, res) => {
    const data = await User.findAll();
    return res.json({
        success: true,
        data
    });
}

const getUser = async (req, res) => {
    const data = await User.findAll();
    return res.json({
        success: true,
        data
    });
}

module.exports = { registerUser, loginUser, verifytoken, getAllUser, getUser };