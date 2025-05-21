<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.itbaizhan.dao.CommDAO"%>
<%@page import="com.itbaizhan.util.Info"%>
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="/foodemarket/admin/commfiles/css/common.css" /> 
	<link rel="stylesheet" type="text/css" href="/foodemarket/admin/commfiles/css/style.css" /> 
	
  </head>
  <%
  
  
    List<HashMap> list = new CommDAO().select("select * from splb where pid='-1' order by id");
    
    HashMap ext = new HashMap();
  ext.put("utype","管理员");
  ext.put("proshop",Info.getUser(request).get("uname").toString());
  String extbei = "";
  for(HashMap mmm:list)
  {
  extbei+=mmm.get("lbname")+"-"+(request.getParameter(mmm.get("lbname").toString())==null?" ":request.getParameter(mmm.get("lbname").toString()))+"@";
  }
  if(extbei.length()>0)extbei=extbei.substring(0,extbei.length()-1);
  ext.put("extbei",extbei);
  ext.put("savetime",Info.getDateStr());
  ext.put("cjnum","0");
  new CommDAO().insert(request,response,"pros",ext,true,false);
  
  
  
   %>
  <body>
  <form name="f1" method="post" action="addpros.jsp?f=f"  >
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytab" id="table1">
        <tr align="center">
          <td colspan="3"  background="/foodemarket/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3">添加商品</td>
        </tr>
        <tr align="center">
          <td width="18%" align="center"> 商品名称</td>
        <td width="62%" align="left"><span class="style1">
      <input name="proname" id="proname"  type="text" size="20"  maxlength="20" /> &nbsp;</span></td>
        <td width="20%" rowspan="4" align="center">
        
        <%=Info.getImgUpInfo2(95) %>        </td>
      </tr>
        <tr align="center">
          <td align="center"> 价格</td>
          <td align="left"><span class="style1">
            <input name="price" id="price"  type="text" size="20" maxlength="20"  />
          </span> </td>
        </tr>
        <tr align="center">
          <td align="center"> 折扣</td>
          <td align="left"><span class="style1">
            <select name="discount" >
            <option value="">不打折</option>
            <option value="9">9折</option>
            <option value="8">8折</option>
            <option value="7">7折</option>
            <option value="6">6折</option>
            <option value="5">5折</option>
            <option value="4">4折</option>
            <option value="3">3折</option>
            <option value="2">2折</option>
            <option value="1">1折</option>
            </select>
            
          </span> </td>
        </tr>
         <tr align="center">
          <td align="center"> 上架状态</td>
          <td align="left"><label>
            <input name="status" type="radio" id="status" value="上架" checked>
            上架
            <input type="radio" name="status" id="status" value="下架">
            下架
          </label></td>
      </tr>
        
        
        
        
        <%
       
        for(HashMap mm:list){
         List<HashMap> slist = new CommDAO().select("select * from splb where pid='"+mm.get("id")+"'");
         %>
         <tr align="center">
          <td align="center"><%=mm.get("lbname") %></td>
          <td colspan="2" align="left"><span class="style1">
            <select name="<%=mm.get("lbname") %>" id="<%=mm.get("lbname") %>" >
            
            <option value="">不详</option>
                            <%
                      for(HashMap mmm:slist){
                       %>
                            <option value="<%=mmm.get("lbname") %>"><%=mmm.get("lbname") %></option>
                            <%} %>
            
            </select>
          </span> </td>
        </tr>
        <%} %>
        
        
        
        
        
         <tr align="center">
          <td align="center"> 商品简介</td>
          <td colspan="2" align="left"><span class="style1">
            <textarea name="bei" cols="60" rows="3" id="bei"></textarea>
          </span> </td>
        </tr>
       
        <tr align="center">
          <td height="30" colspan="3" align="center">
            <label>
              <input type="submit" name="button" id="button" value="提交信息">
            </label> &nbsp;&nbsp;
            <input  type="reset" name="button2" id="button2" value="重新填写">                   </td>
        </tr>
      </table>
  </form> 
</body>
</html>
<script type="text/javascript" src="/foodemarket/admin/commfiles/js/ajax.js"></script>
 