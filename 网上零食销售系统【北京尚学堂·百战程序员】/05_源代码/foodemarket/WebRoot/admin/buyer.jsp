<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.itbaizhan.util.PageManager"%>
<%@page import="com.itbaizhan.dao.CommDAO"%>
 
 
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
   String username = request.getParameter("username")==null?"":request.getParameter("username");
  String truename = request.getParameter("truename")==null?"":request.getParameter("truename");
  String did = request.getParameter("did")==null?"":request.getParameter("did");
  
  if(!did.equals(""))
  {
  dao.commOper("delete from sysuser where id="+did);
  }
  
  String url = "buyer.jsp?1=1";
  String sql = "select * from Sysuser  where utype='买家' ";
  
  if(!username.equals(""))
  {
  url+="&username="+username;
  sql+=" and uname like '%"+username+"%' ";
  }
  if(!truename.equals("")){
  url+="&truename="+truename;
  sql+=" and tname like '%"+truename+"%' ";
  }
  sql+=" order by id desc";
  System.out.println(sql);
  PageManager pageManager = PageManager.getPage(url, 10, request);
  pageManager.doList(sql);
  PageManager bean = (PageManager) request.getAttribute("page");
  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
   %>
  <body>
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<form name="f1" method="post" action="/foodemarket/admin/buyer.jsp" >
  	<table id="mainbody" border="0" width="100%" cellspacing="1"
					class="tableform">
			<tr>
     				 <td width=10% height="31" align="center" style="font-size: 12px">用户名&nbsp;:</td>
	    <td width=14% style="font-size: 12px" align="left"><input name="username" value="<%=username %>" type="text"></td>
					<td width=10% align="center" style="font-size: 12px">姓名&nbsp;:</td>
					<td width=46% style="font-size: 12px" align="left"><input value="<%=truename %>"  name="truename" type="text"></td>
					<td width=20% style="font-size: 12px" align="right"><input type="submit" class="btn3_mouseup" value="查询">&nbsp;&nbsp;</td>
			</tr>
			</table>
  	
  	
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
<tr align="center">
          <td colspan="9"  background="/foodemarket/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">信息列表</td>
        </tr>
        <tr align="center">
          <td  class="itemtitle" > 用户名</td>
          <td class="itemtitle"> 密码</td>
          <td class="itemtitle"> 姓名</td>
          <td class="itemtitle"> 性别 </td>
          <td class="itemtitle">年龄</td>
          <td class="itemtitle">电话</td>
           <td class="itemtitle">QQ</td>
            <td class="itemtitle">说明</td>
          <td class="itemtitle">操作</td>
  </tr>
        
         <%
 
  for(HashMap map:nlist)
  {
    %>
        <tr align="center">
          <td align="center"> <%=map.get("uname").equals("")?"&nbsp;":map.get("uname") %> </td>
          <td align="center"> <%=map.get("upass").equals("")?"&nbsp;":map.get("upass") %>  </td>
          <td align="center">  <%=map.get("tname").equals("")?"&nbsp;":map.get("tname") %> </td>
          <td align="center">  <%=map.get("sex").equals("")?"&nbsp;":map.get("sex") %> </td>
          <td align="center"> <%=map.get("age").equals("")?"&nbsp;":map.get("age") %> </td>
          <td align="center"> <%=map.get("tel").equals("")?"&nbsp;":map.get("tel") %> </td>
          <td align="center"> <%=map.get("qq").equals("")?"&nbsp;":map.get("qq") %> </td>
          <td align="center"> <%=map.get("bei").equals("")?"&nbsp;":map.get("bei") %> </td>
          <td align="center">
          
          <a href="javascript:update('<%=map.get("id")%>')">修改</a>
          <script type="text/javascript">
          function update(no)
          {
          pop('/foodemarket/admin/updatesysusers.jsp?id='+no,'修改会员信息',530,275);
          }
          </script>
          &nbsp;|&nbsp;
          <a href="/foodemarket/admin/buyer.jsp?did=<%=map.get("id")%>">删除</a>
          
          
          
          </td>
  </tr>
        <%} %>
        
        <tr align="center">
          <td align="right" colspan="13"><%=bean.getInfo() %></td>
        </tr>
      </table>
      </form>
</body>
</html>
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