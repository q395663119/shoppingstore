<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>管理登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/css/login.css" type="text/css" media="all">
    <style>
        #msg{
            color: white;
        }


    </style>



</head>

<body>
<h1>管理登录</h1>
<div class="container w3layouts agileits">
    <div class="login w3layouts agileits">
        <h2>登 录</h2>

        <input type="text"      id="adName"  placeholder="用户名" >
        <input type="password"  id="adPassword" placeholder="密码"   >
        <div class="send-button w3layouts agileits">
            <input type="button" value="登 录" id="btnLogin">
            <div id="msg"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<div class="footer w3layouts agileits">
    <p>Copyright &copy; More Templates</p>
</div>

<input type="hidden" value="<%=basePath%>" id="hidd">

<script type="text/javascript">
    $(function () {
        /*进行管理员登录请求，登录成功跳转到管理员页面*/
        $("#btnLogin").click(function () {
            if($("#adName").val()!=''&&$("#adPassword").val()!=''){
                $.ajax({
                    url:"adminlogin",
                    type:"post",
                    data:{
                        "adName":$("#adName").val(),
                        "adPassword":$("#adPassword").val()
                    },
                    success:function (data) {
                        if(data=="none"){
                            $("#msg").html("用户不存在！")
                        }else if(data=="true"){
                           // $("#msg").html("登录成功！")
                            window.location.href="<%=basePath%>resource/admin/adminBack.jsp";
                        }else{
                            $("#msg").html("用户或密码错误！！")
                        }
                    }
                })
            }else{
                $("#msg").html("账号和密码不能为空！")
            }
        })
    });
    function getCookie(name){
        var strcookie = document.cookie;//获取cookie字符串
        var arrcookie = strcookie.split("; ");//分割
        //遍历匹配
        for ( var i = 0; i < arrcookie.length; i++) {
            var arr = arrcookie[i].split("=");
            if (arr[0] == name){
                return arr[1];
            }
        }
        return "";
    }
</script>
</body>
</html>
