const mysql = require("mysql");
const inquirer = require("inquirer");

const connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "bamazonDB"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("Connected as ID: " + connection.threadId);
});

function showItems() {
    connection.query("SELECT * FROM products", function (err, results) {
        if (err) throw err;

        for (var i = 0; i < results.length; i++) {
            console.log(`ID: ${results[i].item_id} ~ ${results[i].product_name} - $${results[i].price} (Stock: ${results[i].stock_quantity})`);
        }

        inquirer
            .prompt([
                {
                    name: "itemID",
                    type: "input",
                    message: "What's the ID of the item you'd like to buy?"
                },
                {
                    name: "quantity",
                    type: "input",
                    message: "How many would you like to buy?"
                }
            ])
            .then(function (answer) {
                console.log(answer.itemID);
                console.log(answer.quantity);

                let chosenItem = results[answer.itemID - 1];
                let stock = chosenItem.stock_quantity;

                if (chosenItem.stock_quantity === 0) {
                    console.log("Insufficient quantity!");
                }
                else if (chosenItem.stock_quantity < answer.quantity) {
                    console.log("Sorry!  We don't have enough to fill your order.  Please come back another time.");
                }
                else {
                    connection.query(
                        "UPDATE products SET ? WHERE ?",
                        [
                            {
                                stock_quantity: stock - answer.quantity
                            },
                            {
                                item_id: answer.itemID
                            }
                        ],
                        function (error) {
                            if (error) throw err;
                            console.log("Your order has been fulfilled!")
                        }
                    );
                }
            });
    });
}

showItems();