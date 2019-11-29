<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>修改密码</title>
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="<%=basePath%>resource/css/login.css" type="text/css" media="all">
    <style>
        #msg3{
            color: white;
        }


    </style>
</head>
<body>
    <input type="text" id="username3" placeholder="用户名"/><br/>
    <input type="password" id="password3" placeholder="输入新密码"/><br/>
    <input type="password" id="password4" placeholder="输入新密码"/><br/>
    <input type="button" value="完成" id="btnUpdate"><br/>
    <div id="msg3"></div><br/>

    <script type="text/javascript">
        $(function(){
            $("#btnUpdate").click(function(){
                if($("#username3").val()!=''&&$("#password3").val()!=''&&$("#password4").val()!='') {
                    $.ajax({
                        url: "update",
                        type: "post",
                        data: {
                            "username": $("#username3").val(),
                            "password": $("#password3").val(),
                            "password2": $("#password4").val(),
                        },
                        success: function (data) {
                            if (data == "none") {
                                $("#msg3").html("用户不存在");
                            } else if (data == "true") {
                                $("#msg3").html("密码修改成功");
                            }else {
                                $("#msg3").html("两次密码不一致");
                            }
                        }
                    })
                }else{
                    $("#msg3").html("用户账号或密码不能为空");
                }
            })
        })
    </script>
</body>
</html>
