const pool=require('./dbconnect');
module.exports={
    //通过连接池进行后续的CRUD操作
    query:function(sqlString,params){
        return new Promise((resolve,reject)=>{
            pool.getConnection(function(err,connection){
                if(err){
                    reject(err);
                }else{
                    connection.query(sqlString,params,(err,rows)=>{
                        if(err){
                            reject(err);
                        }else{
                            resolve(rows);
                        }
                        connection.release();
                    });
                }
            });
        })
    }
}