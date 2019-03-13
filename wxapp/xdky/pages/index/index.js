//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    au:'',
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  textclick: function() {
    var that=this;
    /*
    this.setData({
      motto: 'click'
    });
    */
    wx.request({
      url: 'http://127.0.0.1:3000/api/book/query',
      data:{
        bookid:'1000000004',
      },
      success:function(result){
        console.log(result.data.data[0].author);//解析map结构数据
        that.setData({
          motto: '作家是 '+ result.data.data[0].author,
        });
        
      }
    })
    //console.log(au);
    this.setData({
      motto: '作家是'
    });
  },
  onLoad: function () {
    
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  }

  
})
