var mysql = require('mysql');

config = {
   host: 'localhost',
   user: 'root',
   password: '',
   database: 'webblog',
   multipleStatements: true
}
var connection =mysql.createConnection(config); //added the line
connection.connect(function(err){
  if (err){
    console.log('error connecting:' + err.stack);
  }
  console.log('connected successfully to DB.');
});

module.exports ={
     connection : mysql.createConnection(config) 
} 