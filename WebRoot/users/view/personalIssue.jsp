<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="../css/personalInfo.css"/>
    <link rel="stylesheet" href="../css/personalIssue.css"/>
</head>
<body>
<jsp:include page="../../goods/view/commonTitle.jsp" flush="false" />
<!-- <div id="header">
    <h1>SHT二手交易</h1>
    <ul>
        <a href="index.jsp">
            <li>首页</li>
        </a>
        <a href="#">
            <li>发布闲置</li>
        </a>
        <a href="#">
            <li>个人中心</li>
        </a>
    </ul>
    <a id="a_header_left" href="#">登录</a>&nbsp;|&nbsp;
    <a href="#">注册</a>
</div> -->

<div id="body">
    <div class="body_left">
    <div class="body_left_img">
    	<img  onmouseover="showedit();" onmouseout="hidenedit();" src="" title="" id="personalImg">
    
    	<p onmouseover="showedit();">编辑资料</p>	
    </div>

        <p>${onlineUser.username}</p>
        <ul >
            <li><img src="${baseUrl}/users/img/heart.png"></li>
            <li><img src="${baseUrl}/users/img/heart.png"></li>
            <li><img src="${baseUrl}/users/img/heart.png"></li>
            <li><img src="${baseUrl}/users/img/heart.png"></li>
            <li><img src="${baseUrl}/users/img/vip.png"></li>

        </ul>
        <ul >
            <a href="${baseUrl}/users/view/personalInfo.jsp"><li>我的信息</li></a>
            <a href="${baseUrl}/users/view/personalIssue_right_showGoods.jsp" target="userinfoiframe"><li>我的发布</li></a>
            <a href="${baseUrl}/users/view/personalIssue_right_showBuyed.jsp" target="userinfoiframe"><li>我的购买</li></a>
            <a href=""><li>地址管理</li></a>
            <a href=""><li>密码找回</li></a>
            <a href=""><li>充值</li></a>
        </ul>
    </div> 
    <div id="show_issueGoods">
    <iframe name="userinfoiframe"  src="./personalIssue_right_showGoods.jsp" width="980px" height="1560px" scrolling="no" frameborder=no></iframe>
				
    </div>

    <div class="clearFloat"></div>
</div>

<input type="hidden" value="${onlineUser.headimg}" id="headimg"/>

</body>
  	<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../js/personalInfo.js"></script>
   <script type="text/javascript">
   //显示头像
   $(function(){
	  	 var headimg = $("#headimg").val();
	  	 if(headimg!=""&&headimg!=null){
	  		 $("#personalImg").attr({
	  			 "src":"http://localhost/sht/common/users_getUsersHeadImg.action?size=160&headimg="+headimg,
	  			 "title":""
	  		 });
	  	 }else{
	  		$("#personalImg").attr({
	  			 "src":"../img/default_img.png",
	  			 "title":"编辑资料"
	  		 });
	  	 }
	  	 
	   });
   </script>
</html>