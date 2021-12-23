var sqlServer = require('./sqlServer');
const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')

const app = express()

app.use(cors())
app.use(bodyParser.json())

/*      ----------ejemplos----------
app.get('/getNotes/:userId', async (req, res) => {
    var response = await sqlServer.getNotes(req.params.userId)
    res.send(response.recordset)
})

app.post('/createNote/:userId&:title&:content', async (req, res) => {
    var response = await sqlServer.createNote(req.params.userId, req.params.title, req.params.content)
    res.send(response.recordset)
})

app.delete('/deleteNote/:noteId', async (req, res) => {
    var response = await sqlServer.deleteNote(req.params.noteId)
    res.send(response)
})

app.post('/updateNote/:noteId&:title&:content', async (req, res) => {
    var response = await sqlServer.updateNote(req.params.noteId, req.params.title, req.params.content)
    res.send(response.recordset[0])
})
*/

app.listen(4000, () => {
    console.log("server running on port 4000")
})