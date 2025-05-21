<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.itbaizhan.dao.CommDAO"%>
<%@page import="com.itbaizhan.util.Info"%>
<%@page import="com.itbaizhan.util.PageManager"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0041)http://www.xingguangerwai01.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>网上零食销售系统</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>

<LINK rel=stylesheet 
type=text/css href="/foodemarket/foodemarket_files/css.css">

<META name=GENERATOR content="MSHTML 8.00.6001.19258"></HEAD>
<BODY>
 
 <jsp:include page="top.jsp"></jsp:include>
 <TABLE border=0 cellSpacing=0 cellPadding=0 width=990 align=center>
  <TBODY>
    <TR>
      <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
          <TR >
            <TD  background=foodemarket_files/all.jpg><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
                <TR>
                  <TD width=20 height="28" ><DIV align=center><IMG src="foodemarket_files/icon01.jpg" 
                        width=9 height=26></DIV></TD>
                  <TD class=green_title01>商铺一览</TD>
                  <TD width=50><DIV align=center></DIV></TD>
                </TR>
              </TBODY>
            </TABLE></TD>
          </TR>
          <TR>
            <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
                <TR>
                  <TD height=5></TD>
                </TR>
                <TR>
                  <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                    <TBODY>
                      <TR>
                        <%
                     PageManager pageManager = PageManager.getPage("smore.jsp?1=1", 9, request);
					  pageManager.doList("select * from sysuser where utype='卖家' order by id desc");
					  PageManager bean = (PageManager) request.getAttribute("page");
					  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
                    int jj=0;
                    for(HashMap m:nlist)
                    {
                    jj++;
                     %>
                        <TD vAlign=top width=33%><TABLE border=0 cellSpacing=0 cellPadding=0 
width="100%">
                          <TBODY>
                            <TR>
                              <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                  <TR>
                                    <TD vAlign=top><TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                      <TBODY>
                                        <TR>
                                          <TD vAlign=top  ><TABLE id=standard2 border=0 cellSpacing=1 
                                cellPadding=0 width="100%" bgColor=#dddddd>
                                            <TBODY>
                                              <TR>
                                                <TD height=24 colspan="2" 
                                align=left vAlign=center bgColor=#f7f7f7><DIV align=center style=" color:orange"><strong>
                                
                                <a href="sindex.jsp?id=<%=m.get("id") %>"><%=m.get("tname") %></a>
                                
                                
                                </strong></DIV>
                                                                  <DIV align=center></DIV></TD>
                                              </TR>
                                              <TR>
                                                <TD 
                                width="33%" rowspan="3" align=center vAlign=center bgColor=#ffffff><img src="upfile/<%=m.get("filename") %>" width="93" height="93" /> </TD>
                                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;店主 : <%=m.get("uname") %> </TD>
                                              </TR>
                                              <TR>
                                                <TD width="67%" height="52" style="padding:2px" 
                                align=left vAlign=top bgColor=#ffffff>&nbsp; <%=Info.subStr(m.get("bei").toString(),52)  %>&nbsp;</TD>
                                              </TR>
                                              
                                              <TR>
                                                <TD width="67%" height="26" 
                                align=left vAlign=center bgColor=#ffffff>&nbsp;加盟时间 : <%=m.get("savetime") %></TD>
                                              </TR>
                                            </TBODY>
                                          </TABLE></TD>
                                        </TR>
                                      </TBODY>
                                    </TABLE></TD>
                                  </TR>
                                </TBODY>
                              </TABLE></TD>
                            </TR>
                          </TBODY>
                        </TABLE></TD>
                        <%
                      if(jj%3!=0){
                       %>
                        <TD width=10></TD>
                        <%}else{ %>
                      </tr>
                      <tr>
                        <td height="3"></td>
                      </tr>
                      <tr>
                        <%} %>
                        <%} %>
                        
                        
                        
                      </TR>
                      
                      <tr>
                      <td align="center" colspan="6" height="35" valign="middle">${page.info }</td>
                      </tr>
                      
                    </TBODY>
                  </TABLE></TD>
                </TR>
              </TBODY>
            </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<jsp:include page="foot.jsp"></jsp:include>
      
      
</BODY></HTML>

