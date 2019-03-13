const $sqlQuery = require('./sqlCRUD').book;
const _ =require('./query');

const books ={
    getBookInfo:function(bookid){
        console.log('到达dao');
        return _.query($sqlQuery.queryById,[bookid]);
        
    }
}

module.exports = books;