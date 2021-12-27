//const sql = require("mssql")
const sql = require("mssql/msnodesqlv8")

const config = {
    server: "localhost\\SQLEXPRESS",
    driver: "msnodesqlv8",
    port: 1433,
    database: "SodaGallitos",
    options: {
        trustedConnection: true
    }
}

sql.on('error', err => {
    console.log(err.message)
})

module.exports = {
    //Table
    getTables: async function () {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .execute('getTables')

            return results

        } catch (err) {
            console.log("Get tables error: ", err)
        }
    },

    createTable: async function (title) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('pName', sql.NVarChar, title)
                .execute('addTable')

            return 200

        } catch (err) {
            console.log("Create note error: ", err)
            return 500
        }
    },

    deleteTable: async function (tableId) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('pIdTable', sql.Int, tableId)
                .execute('deleteTable')

            return 200

        } catch (err) {
            console.log("Delete notes error: ", err)
            return 500
        }
    },

    updateTable: async function (noteId, title, content) {
        try {
            let pool = await sql.connect(config);
            var results = await pool.request()
                .input('pIdTable', sql.Int, noteId)
                .input('pName', sql.NVarChar, title)
                .execute('changeTable')

            return results

        } catch (err) {
            console.log("Update notes error: ", err)
        }
    },

    //Elements
    getElements: async function () {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .execute('getElements')

            return results

        } catch (err) {
            console.log("Get tables error: ", err)
        }
    },

    createElement: async function (title, aditional, price) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('pName', sql.NVarChar, title)
                .input('pSiAdicional', sql.Bit, aditional)
                .input('pPrecio', sql.Money, price)
                .execute('addElement')

            return 200

        } catch (err) {
            console.log("Create note error: ", err)
            return 500
        }
    },

    deleteElement: async function (elementId) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('pIdElement', sql.Int, elementId)
                .execute('deleteElement')

            return 200

        } catch (err) {
            console.log("Delete notes error: ", err)
            return 500
        }
    },

    updateElement: async function (elementId, title, aditional, price) {
        try {
            let pool = await sql.connect(config);
            var results = await pool.request()
                .input('pIdElement', sql.Int, elementId)
                .input('pName', sql.NVarChar, title)
                .input('pSiAdicional', sql.Bit, aditional)
                .input('pPrecio', sql.Money, price)
                .execute('changeElement')

            return results

        } catch (err) {
            console.log("Update notes error: ", err)
        }
    }
}