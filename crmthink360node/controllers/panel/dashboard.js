
const dashboard = async(req, res, next) =>{
    return res.json({
        success: true,
        error: "1",
        status: 200,
        message: 'All fields are mandatory!'
    });
}
module.exports = { dashboard };