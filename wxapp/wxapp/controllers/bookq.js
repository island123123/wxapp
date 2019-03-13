const Book =require('../dao/book');
const moment=require('moment');

module.exports={
    //根据bookid获得书籍全部信息
    querybookbyid:function(req,res,next){

        //console.log('到达cotrollers');

        const bookid=req.query.bookid;
        
        if(!bookid){
            res.json({
                result:-1,
                errmsg:'缺少bookid',
            });
            return;
        }

        console.log('到达cotrollers');

        Book.getBookInfo(bookid).then(function(resData){
            res.json({
                result:0,
                data:resData.map(function(item){
                    return {
                        author: item.bkauthor || '',
                        category: item.bkclass || '',
                        cover_url: item.bkcover || '',
                        file_url: item.bkfile || '',
                        book_id: item.bkid || '',
                        book_name: item.bkname || '',
                        book_price: item.bkprice || 0,
                        book_publisher: item.bkpublisher || ''
                    }
                })
            });
        });

        console.log('完成controllers');

    },
}