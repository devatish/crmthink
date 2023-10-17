const jwt = require("jsonwebtoken");
const userAuth = async (req, res, next) => {
    try {
        const data = await jwt.verify(req.headers.authtoken, 'think360');
        req.tokenData = data;
        next();
    }
    catch (error) {
        return res.json({
            success: false,
            error: "1",
            status: 401,
            message: 'Un-authorized token.',
        });
    }
}
module.exports = { userAuth };