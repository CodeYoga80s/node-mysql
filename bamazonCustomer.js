var mysql = require("mysql");
var inquirer = require("inquirer");
var Table = require("cli-table");


var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "Mp03101981!",
  database: "bamazon"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  start();
});

function start(){
  connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;
    // Log/Display the results of the select statement
	const table = new Table({
		// the table above is a constant
		head: ['Item ID', 'Product Name', 'Price']
	  , colWidths: [10, 50, 10]
	});
for (var i=0; i<res.length; i++) {
		table.push(
			[res[i].item_id,res[i].product_name,res[i].price]
		);
	}
	console.log(table.toString());
	inquirer.prompt([
		{	
		type: "input",
		message: "Please provide product ID",
		name: "id"
		},
		{
		type: "input",
		message: "Please enter desired quantity",
		name: "quantity",
		}
		]).then(function(answers){
			connection.query("SELECT * FROM products where ?",
		[
			{
				item_id: answers.id
			}
		],	function(err, res){
			if (err) throw err;
			if(res[0].quantity >= answers.quantity) {
				connection.query("UPDATE products SET ? where ?", [
					{
						quantity: res[0].quantity-answers.quantity
					},
					{
						item_id: answers.id
					}
				], function(err, update_res) {
					console.log("product purchased successfully: total cost ="+answers.quantity*res[0].price);
					connection.end();
		
				}
		
				)
			}
			else {
				console.log("Insufficient quantity!");
				start();
			}
		}
		
			)
		}
		
		)
  });
}

