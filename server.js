var sqlServer = require('./sqlServer');
const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')

const app = express()

app.use(cors())
app.use(bodyParser.json())

//Table
app.get('/getTables', async (req, res) => {
    var response = await sqlServer.getTables()
    res.send(response.recordset)
})

app.delete('/deleteTable/:tableId', async (req, res) => {
    var response = await sqlServer.deleteTable(req.params.tableId)
    res.send(response)
})

app.post('/updateTable/:tableId&:title', async (req, res) => {
    var response = await sqlServer.updateTable(req.params.tableId, req.params.title)
    res.send(response)
})

app.post('/createTable/:title', async (req, res) => {
    var response = await sqlServer.createTable(req.params.title)
    res.send(response)
})

//elements
app.get('/getElements', async (req, res) => {
    var response = await sqlServer.getElements()
    res.send(response.recordset)
})

app.delete('/deleteElement/:elementId', async (req, res) => {
    var response = await sqlServer.deleteElement(req.params.elementId)
    res.send(response)
})

app.post('/updateElement/:elementId&:title&:aditional&:price', async (req, res) => {
    var response = await sqlServer.updateElement(req.params.elementId, req.params.title,req.params.aditional, req.params.price)
    res.send(response)
})

app.post('/createElement/:title&:aditional&:price', async (req, res) => {
    var response = await sqlServer.createElement(req.params.title,req.params.aditional, req.params.price)
    res.send(response)
})

app.listen(4000, () => {
    console.log("server running on port 4000")
})