<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.itbaizhan.util.PageManager"%>
<%@page import="com.itbaizhan.dao.CommDAO"%>
<%@page import="com.itbaizhan.util.Info"%>
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/foodemarket/admin/commfiles/css/common.css" /> 
	<link rel="stylesheet" type="text/css" href="/foodemarket/admin/commfiles/css/style.css" /> 
	<script type="text/javascript" src="/foodemarket/js/popup.js"></script>
  </head>
  <%
 CommDAO dao = new CommDAO();
 
 
 String fs = request.getParameter("fs")==null?"":request.getParameter("fs");
 if(!fs.equals(""))
 {
  String sql = "select a.uname,b.uname as shop,group_concat(c.proname,'-',c.price,'-',c.discount,'-',a.pid,'-',a.num ) as ddinfo from proscar a,sysuser b,pros c where a.pid=c.id and c.proshop=b.uname and a.uname='"+Info.getUser(request).get("uname")+"' group by a.uname,shop ";
  for(HashMap m:dao.select(sql))
  {
  HashMap ext = new HashMap();
  ext.put("uname",Info.getUser(request).get("uname"));
  ext.put("savetime",Info.getDateStr());
  ext.put("prosinfo",m.get("ddinfo").toString());
  ext.put("toshop",m.get("shop").toString());
  ext.put("status","待受理");
  ext.put("fkstatus","未付款");
  new CommDAO().insert(request,response,"prosorder",ext,false,false);
  }
  dao.commOper("delete  from proscar where uname='"+Info.getUser(request).get("uname")+"'");
  %>
  
  <script type="text/javascript">
  alert("订单已发送");
  </script>
  
  <%
 }
 
 String c = request.getParameter("c")==null?"":request.getParameter("c");
 if(!c.equals(""))
 {
   dao.commOper("delete * from proscar where uname='"+Info.getUser(request).get("uname")+"'");
 }
   String key = request.getParameter("key")==null?"":request.getParameter("key");
    
   
  String did = request.getParameter("did")==null?"":request.getParameter("did");
  
  if(!did.equals(""))
  {
  dao.commOper("delete from proscar where id="+did);
  }
  
  String url = "proscar.jsp?1=1";
  String sql = "select *,b.id as cid from pros a,proscar b  where  a.id=b.pid and b.uname='"+Info.getUser(request).get("uname")+"' ";
   
  if(!key.equals(""))
  {
  url+="&key="+key;
  sql+=" and a.proname like '%"+key+"%' ";
  } 
  
  sql+="  order by a.proshop desc";
  System.out.println(sql);
  PageManager pageManager = PageManager.getPage(url, 100, request);
  pageManager.doList(sql);
  PageManager bean = (PageManager) request.getAttribute("page");
  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
   %>
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post" action="/foodemarket/admin/proscar.jsp" >
  	<table id="mainbody" border="0" width="100%" cellspacing="1"
					class="tableform">
			<tr>
     				 <td width=5% height="31" align="center" style="font-size: 12px">相关信息&nbsp;:</td>
	    <td width=14% style="font-size: 12px" align="left"><input name="key" size="35" value="<%=key %>" type="text"></td>
				 
					<td width=20% style="font-size: 12px" align="right">
					<input type="submit" class="btn3_mouseup" value="查询"> 
					
					&nbsp;
					
					</td>
			</tr>
			</table>
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td colspan="8"  background="/foodemarket/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">信息列表</td>
        </tr>
        <tr align="center">
       <td  class="itemtitle" >图片</td>
       <td  class="itemtitle" >商铺</td>
        <td  class="itemtitle" >商品名称</td>
        
          <td  class="itemtitle" >数量</td>
          <td class="itemtitle"> 单价</td>
          <td class="itemtitle"> 打折</td>
          <td class="itemtitle"> 合计金额</td>
          <td class="itemtitle">操作</td>
  </tr>
        
         <%
 int ztotal = 0;
  for(HashMap map:nlist)
  {
  int total = 0;
  System.out.println(map.get("num")+"-"+map.get("price"));
  String price = map.get("price").toString().indexOf(".")>-1?map.get("price").toString().substring(0,map.get("price").toString().indexOf(".")):map.get("price").toString();
  total = Integer.parseInt(map.get("num").toString())*Integer.parseInt(price) ;
  
  if(!map.get("discount").equals(""))
  {
  total = (Integer.parseInt(map.get("discount").toString())*total)/10;
  }
  ztotal+=total;
    %>
        <tr align="center">
        <td  class=" " > <img src="../upfile/<%=map.get("filename").equals("")?"&nbsp;":map.get("filename") %>" height="50" /> </td>
        
        <td  class=" " > <%=map.get("proshop").equals("")?"&nbsp;":map.get("proshop") %></td>
        
        <td  class=" " > <%=map.get("proname").equals("")?"&nbsp;":map.get("proname") %></td>
         
          <td align="center"><span class=" "><%=map.get("num").equals("")?"&nbsp;":map.get("num") %></span></td>
          <td align="center"> <%=map.get("price").equals("")?"&nbsp;":map.get("price") %>  </td>
          <td align="center"> <%=map.get("discount").equals("")?"不打折":map.get("discount") %>  </td>
          <td align="center"> <%=total %>  </td>
          
          <td align="center"><a href="javascript:update('<%=map.get("id")%>')">修改数量</a>
          <script type="text/javascript">
          
          
          function update(no)
          {
          pop('/foodemarket/admin/num.jsp?id='+no,'修改数量',300,85);
          }
          </script>
          &nbsp;|&nbsp;
          <a href="/foodemarket/admin/proscar.jsp?did=<%=map.get("id")%>">移出购物车</a>          </td>
  </tr>
        <%} %>
        
        <tr align="center">
          <td height="55" colspan="13" align="center"> 
          
          金额合计 :         <%=ztotal %> <label>
          &nbsp;&nbsp;&nbsp;
          <input type="button" onClick="f1.action='proscar.jsp?c=c'" name="button" style="height: 21px" id="button" value="清空购物车">
          &nbsp;&nbsp;&nbsp;
          <input type="submit" onClick="f1.action='proscar.jsp?fs=fs&f=f'" name="button2" style="height: 21px"  id="button2" value="确认发送订单">
          <br />
          ( 注 : 如果购物车中的商品涉及多个商家，将以多个订单的形式发送给各个商家)</label></td>
    </tr>
      </table>
  </form>
</body>
</html>

<script type="text/javascript">
<!--

          function add()
          {
          pop('/foodemarket/admin/addproscar.jsp','添加商品信息',600,387);
          }
//-->
</script>

<%
if(request.getAttribute("suc")!=null)
{
 %>
 <script type="text/javascript">
<!--
alert("添加成功")
//-->
</script>
<%}%>