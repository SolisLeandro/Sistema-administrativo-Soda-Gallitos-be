//const sql = require("mssql")
const sql = require("mssql/msnodesqlv8")

const config = {
    server: "localhost\\SQLEXPRESS",
    driver: "msnodesqlv8",
    port: 1433,
    database: "SimpleNotes",
    options: {
        trustedConnection: true
    }
}

sql.on('error', err => {
    console.log(err.message)
})

module.exports = {
    /*      ----------ejemplos----------
    getNotes: async function (userID) {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .input('in_userId', sql.Int, userID)
                .execute('readUserNotes')

            return results

        } catch (err) {
            console.log("Get notes error: ", err)
        }
    },

    createNote: async function (userId, title, content) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('in_userId', sql.Int, userId)
                .input('in_title', sql.NChar, title)
                .input('in_content', sql.Text, content)
                .execute('createUserNote')

            return 200

        } catch (err) {
            console.log("Create note error: ", err)
        }
    },

    deleteNote: async function (noteId) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('in_noteId', sql.Int, noteId)
                .execute('deleteUserNote')

            return 200

        } catch (err) {
            console.log("Delete notes error: ", err)
        }
    },

    updateNote: async function (noteId, title, content) {
        try {
            let pool = await sql.connect(config);
            var results = await pool.request()
                .input('in_noteId', sql.Int, noteId)
                .input('in_title', sql.NVarChar, title)
                .input('in_body', sql.Text, content)
                .execute('updateUserNote')

            return results

        } catch (err) {
            console.log("Update notes error: ", err)
        }
    }
    */
}