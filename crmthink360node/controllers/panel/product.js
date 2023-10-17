const { ProductCategories } = require('../../models');
const productlist = async(req, res, next) =>{
    return res.json({
        success: true,
        error: "1",
        status: 200,
        message: 'All fields are mandatory!'
    });
}

const categoryList = async(req, res) => {
    console.log(req.body);
    const { page} = req.body;
    console.log(page);
    const limit = 2;
    const { count, rows } = await ProductCategories.findAndCountAll(
    {
        /*where: {
            title: {
                [Op.like]: 'foo%'
            }
        },*/
        offset: page,
        limit: limit
    });
    const nbPages = page + limit
    return res.json({
        success: true,
        error: "0",
        count:count,
        rows:rows,
        nbPages:nbPages
    });
}
module.exports = { productlist, categoryList };