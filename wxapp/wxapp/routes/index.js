var express = require('express');
var router = express.Router();
var request=require('request');
var wxappconf=require('../conf/app');
//var url=require('url');
//var util=require('util');

/* GET home page. */
router.get('/', function(req, res, next) {
  

var appid=wxappconf.appconfig.appid;
var secret=wxappconf.appconfig.secret;
var code=req.query.code;
var session3rd='';
//将code发送到微信官方接口

var code2session='https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code';

var options={
  headers:{"Connection":"close"},
  url:code2session.replace(/APPID/, appid).replace(/SECRET/, secret).replace(/JSCODE/, code),
  
};
console.log(code2session.replace(/APPID/, appid).replace(/SECRET/, secret).replace(/JSCODE/, code))
function callback(error,response,data){
  if(!error&&response.statusCode==200){
    console.log('接口数据',JSON.parse(data).openid);
    session3rd=JSON.parse(data).openid+JSON.parse(data).session_key;
   //res.json(data);

  var response={
    "code":session3rd,
  };
  res.end(JSON.stringify(response));

  }
}
request(options,callback);





 // res.end(JSON.stringify(response));
  //var get=url.parse(req.url,true).query;
  //console.log(response.code);
  
  //res.render('index', { title: get.code });
 // res.send(get);
});

module.exports = router;
