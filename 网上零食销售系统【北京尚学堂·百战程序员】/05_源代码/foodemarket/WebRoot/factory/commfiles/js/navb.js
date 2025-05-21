// 导航栏配置文件
var outlookbar=new outlook();
var t;

 

t=outlookbar.addtitle('个人信息','个人信息',1)
outlookbar.additem('基本资料管理',t,'pupdatesysusers.jsp')
outlookbar.additem('修改登录密码',t,'updatepwd.jsp')



t=outlookbar.addtitle('交易信息','交易信息',1)
outlookbar.additem('查看订单',t,'ordersb.jsp')
outlookbar.additem('历史订单',t,'ordersbls.jsp')
outlookbar.additem('购物车',t,'proscar.jsp')



