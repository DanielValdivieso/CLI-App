
var mysql = require("mysql");
var inquirer = require("inquirer");


// var prompt = inquirer.createPromptModule();

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "12345678",
  database: "bamazonDB"
});

//table 
connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
//product information from the table
  connection.query("SELECT * FROM products", function (err, res) {
    for (var i = 0; i < res.length; i++) {
      console.log(res[i].id + " | " + res[i].product_name + " | " + res[i].department_name + " | " + res[i].price + " | " + res[i].stock_quantity);
    }
    console.log("-----------------------------------");
    queryproducts();
  });

});


// User Prompt request product and quantity

function queryproducts() {
  inquirer.prompt([
    {

      name: "product_Id",
      type: "input",
      message: "What products you would like to buy? "
    },
    {
      name: "stock_quantity",
      type: "input",
      message: "Please add the quantity? "
    }])
    .then(function (answer) {
      answer.product_Id
      answer.stock_quantity

      connection.query("SELECT * FROM products", function (err, res) {

        console.log("-----------------------------------");
        //To select a unique number on the list add -1 in order to avoid the wrong ID + print the product name
        console.log(res[answer.product_Id - 1].product_name);
        //Quantity requested by the user
        console.log("Request quantity", answer.stock_quantity);
        //Total Quantity in stock
        console.log("Total quantity in stock", res[answer.product_Id - 1].stock_quantity);

        //statement if the quantity is over stock or lower
        if ((answer.stock_quantity) > (res[answer.product_Id - 1].stock_quantity)) {
          result = "Ups! Insufficient quantity!";
          console.log(result);
        }
        else {
          ((answer.stock_quantity) < (res[answer.product_Id - 1].stock_quantity))
          result = "Great! Processing";
          //update database by reducing the user answer over what is in stock where id is unique 
          var newQuantity = res[answer.product_Id - 1].stock_quantity - answer.stock_quantity
          console.log(result);

          connection.query("UPDATE products SET stock_quantity=" + newQuantity + " WHERE id=" + answer.product_Id, function (err, res) {
            console.log(err);
          });

        };

      });



    });


};



