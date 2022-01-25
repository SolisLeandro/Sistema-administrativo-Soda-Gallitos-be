var sqlServer = require('./sqlServer');
const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')

const app = express()

app.use(cors())
app.use(bodyParser.json())

app.listen(4000, () => {
    console.log("server running on port 4000")
})

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
    var response = await sqlServer.updateElement(req.params.elementId, req.params.title, req.params.aditional, req.params.price)
    res.send(response)
})

app.post('/createElement/:title&:aditional&:price', async (req, res) => {
    var response = await sqlServer.createElement(req.params.title, req.params.aditional, req.params.price)
    res.send(response)
})

//dishes
app.post('/createDish/:elementsId&:name&:total', async (req, res) => {
    var response = await sqlServer.createDish(JSON.parse(req.params.elementsId), req.params.name, req.params.total)
    res.send(response)
})

app.get('/getDishes', async (req, res) => {
    var response = await sqlServer.getDishes()
    var dishes = []
    response.recordset.forEach(element => {
        dishes.push(JSON.parse(element[Object.keys(element)]))
    });
    res.send(dishes)
})

app.delete('/deleteDish/:dishId', async (req, res) => {
    var response = await sqlServer.deleteDish(req.params.dishId)
    res.send(response)
})

app.post('/updateDish/:dishId&:elementsId&:name&:total', async (req, res) => {
    var response = await sqlServer.updateDish(req.params.dishId, JSON.parse(req.params.elementsId), req.params.name, req.params.total)
    res.send(response)
})

//orders
app.get('/getOrders', async (req, res) => {
    var response = await sqlServer.getOrders()
    console.log(response)
    var orders = []
    response.recordset.forEach(element => {
        console.log(element)
        orders.push(JSON.parse(element[Object.keys(element)]))
    });

    res.send(orders)
})

app.post('/finishOrder/:orderId', async (req, res) => {
    var response = await sqlServer.finishOrder(req.params.orderId)
    res.send(response)
})

//Table orders
app.get('/getTableOrders', async (req, res) => {
    var response = await sqlServer.getTableOrders()
    console.log("getTableOrders",response)
    var orders = []
    response.recordset.forEach(element => {
        orders.push(JSON.parse(element[Object.keys(element)]))
    });

    res.send(orders)
})

app.post('/payOrder/:orderId', async (req, res) => {
    var response = await sqlServer.payOrder(req.params.orderId)
    res.send(response)
})