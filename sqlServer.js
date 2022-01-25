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
    },

    //Dishes
    getDishes: async function () {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .execute('GetDishesWithElements')

            return results

        } catch (err) {
            console.log("Get dishes error: ", err)
        }
    },

    createDish: async function (elementsId, name, total) {
        try {
            var elementsIDS = []
            elementsId.forEach(element => {
                elementsIDS.push(element.id)
            });
            let pool = await sql.connect(config);
            await pool.request()
                .input('pElementsIdList', sql.NVarChar, JSON.stringify({ "Elementos": elementsIDS }))
                .input('pName', sql.NVarChar, name)
                .input('pPrice', sql.Money, total)
                .execute('CreateDishWithElements')

            return 200

        } catch (err) {
            console.log("Create dish error: ", err)
            return 500
        }
    },

    deleteDish: async function (dishId) {
        try {
            let pool = await sql.connect(config);
            await pool.request()
                .input('pIdDish', sql.Int, dishId)
                .execute('DeleteDish')
            return 200

        } catch (err) {
            console.log("Delete dish error: ", err)
            return 500
        }
    },

    updateDish: async function (dishId, elementsId, name, total) {
        try {
            var elementsIDS = []
            elementsId.forEach(element => {
                elementsIDS.push(element.id)
            });
            let pool = await sql.connect(config);
            await pool.request()
                .input('pIdDish', sql.Int, dishId)
                .input('pElementsIdList', sql.NVarChar, JSON.stringify({ "Elementos": elementsIDS }))
                .input('pName', sql.NVarChar, name)
                .input('pPrice', sql.Money, total)
                .execute('EditDishWithElements')

            return 200

        } catch (err) {
            console.log("Update dish error: ", err)
            return 500
        }
    },

    //orders
    getOrders: async function () {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .execute('GetProcessedOrders')

            return results

        } catch (err) {
            console.log("Get orders error: ", err)
        }
    },
    finishOrder: async function (orderId) {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .input('pIdOrden', sql.Int, orderId)
                .execute('finishOrder')

            return results

        } catch (err) {
            console.log("Get orders error: ", err)
        }
    },

    //table orders
    getTableOrders: async function () {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .execute('GetTableOrders')

            return results

        } catch (err) {
            console.log("Get orders error: ", err)
        }
    },
    payOrder: async function (orderId) {
        try {
            let pool = await sql.connect(config);
            let results = await pool.request()
                .input('pIdOrder', sql.Int, orderId)
                .execute('payOrder')

            return results

        } catch (err) {
            console.log("Get orders error: ", err)
        }
    },
}