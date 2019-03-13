const express=require('express');
const bookq  =require('../controllers/bookq');
const router =express.Router();

router.get('/query',function(req,res,next){
    
    const bookid = req.query.bookid;
  
    if(bookid === undefined || !bookid){
        res.json({
            result: -1,
            errmsg: '缺少bookid字段，请检查后重试'
        });
        return;
    }
    console.log('到达routes');
    bookq.querybookbyid(req,res,next);
    console.log('完成routes');
});

module.exports = router;