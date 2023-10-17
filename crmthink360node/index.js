const express = require('express')
const cors = require('cors');
const app = express()
app.use(cors())
var bodyParser = require('body-parser')
const port = 3009
app.use(express.json());
app.use(bodyParser.json());

const router = require('./routes');
app.use('/', router);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
