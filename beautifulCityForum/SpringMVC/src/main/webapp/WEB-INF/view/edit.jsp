<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="com.forum.login.LoginBean" scope="session"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	boolean b=userBean==null||userBean.getUserId()==null||userBean.getUserId().length()==0;
	if(userBean.getBlockForbidden()==1){
		response.sendRedirect(""+basePath+"forum/1");
	}
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>编辑帖子</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/editCss.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath %>utf8-jsp/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath %>utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/editJs.js" ></script>
</head>
<body>
    <div id="TopBanner">
        <img src="<%=basePath %>indexImage/banner_3.jpg" alt="美丽乡村">
        <ul id="BannerLeft">
            <li><a href="<%=basePath %>forum/1"><i class="fa fa-envira"></i> 美丽乡村交流社区</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-edit"></i> 编辑帖子</a></li>
        </ul>
        <ul id="BannerRight">
            <li><a href="#" class="personalHref" >你好<br><%=userBean.getUsername() %></a></li>
            <li><a href="<%=basePath %>forum/1">首页</a></li>
            <li><a href="#" class="personalHref" >我的</a></li>
            <li><a href="<%=basePath %>mail">消息 <span class="badge unread" style="color:#38AA02; background-color:white;">10</span></a></li>
            <li><a href="<%=basePath %>exit">退出</a></li>
            <li><a href='#' class="personalHref"><img src="#" alt="用户头像" onerror="javascript:this.src='<%=basePath %>indexImage/indexImg.jpg'" alt="用户头像"></a></li>
        </ul>
        <div id="bannerBottom">
        Beautiful Country Forum
        </div>
        <div id="bannerSearch">
         <div class="input-group">
            <span class="input-group-addon" id="searchBtn" ><i class="glyphicon glyphicon-search"></i></span>
            <input type="text" class="form-control" id="searchContent"  name="searchContent" placeholder="搜索你想要的内容">
            <input type="hidden" id="searchClass" name="searchClass" value='按主题搜索'>
           <div class="input-group-btn themeDiv_1">
                        <button type="button" class="btn btn-default
                        dropdown-toggle" data-toggle="dropdown" id="themeButton_1">按主题搜索
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right" id="themeSelect_1">
                            <li>
                                <a href="javascript:void(0)">按主题搜索</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">按用户搜索</a>
                            </li>
                        </ul>
            </div><!-- /btn-group -->
        </div>
        </div>
    </div>
    <div id="editBody">
        <div id="editBodyTop">
            ::发布/编辑::
        </div>
        <div id="editBodyCenter">
            <form action="<%=basePath %>pageContent" method="post" accept-charset="utf-8">
            <div id="postQuickTheme">
                <div class="input-group">
                    <input type="text" class="form-control" name="theme" id="theme" placeholder="你能输入80个字符">
                    <input type="hidden" name="themeClass" id="themeClass" >
                    <input type="hidden" name="postContent" id="postContent">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default
                        dropdown-toggle" data-toggle="dropdown" id="themeButton">主题分类
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right" id="themeSelect">
                            <li>
                                <a href="javascript:void(0)">新闻推荐</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">旅游推荐</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">活动推荐</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">吐槽灌水</a>
                            </li>
                        </ul>
                    </div><!-- /btn-group -->
                </div><!-- /input-group -->
            </div>
            <script id="editor" type="text/plain" ></script>
            <div id="editBodyBottom">
                <input type="submit" class="btn btn-primary" value="发表新帖(Ctrl+Enter)">
            </div>
        </form>
        </div>
    </div>
</body>
<script>
	var b="<%=b%>";
   	var userId_1="<%=userBean.getUserId()%>";
   	var basePath="<%=basePath %>";
   	if(b!="true"){
   		$(".personalHref").attr("href","<%=basePath %>personal/"+userId_1);
		$(".personalHref img").attr("src","<%=basePath %>personalIcon/"+userId_1+".jpg");
   	}
   	var unReadNum="<%=userBean.getUnreadNews()%>";
	if(unReadNum=='0'){
		$(".unread").hide();	
	}else{
		$(".unread").show();
		$(".unread").text(unReadNum);
	}
</script>
</html>