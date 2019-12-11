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
    <title>商品上下架</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/resetcar.css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/carts.css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/search.css">

    <style>
        label{
            background: url("<%=basePath%>images/mark1.png") no-repeat -1px -1px;
        }
        body{
            z-index: 10;
        }
    </style>
</head>
<body>
<section class="cartMain">

    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk">商品类型</li>
            <li class="list_con">商品名称</li>
            <li class="list_price">单价</li>
            <li class="list_op">状态</li>
        </ul>
    </div>

    <div class="cartBox">
        <div class="shop_info">
        </div>
        <div class="order_content">
        </div>
    </div>
</section>

<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"selectAllShopByP_type",
            type:"post",
            data:{
                "p_type":getQueryString("p_type")
            },
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    var ul="<ul class='order_lists'>" +
                        "                <li class=\"list_chk\">\n" +
                        "                    <p for=\"checkbox_2\">"+data[i].pType+"</p>\n" +
                        "                </li>\n" +
                        "                <li class=\"list_con\">\n" +
                        "                    <div class=\"list_text\"><a href=\"javascript:;\">"+data[i].pName+"</a></div>\n" +
                        "                </li>" +
                        "                <li class=\"list_price\">" +
                        "                    <p class=\"price\">"+data[i].price+"</p>" +
                        "                </li>" +
                        "                <li class='list_op'>" +
                        "                    <p class='del'><a href='javascript:;' class='upBtn' pid='"+data[i].status+"'>商品上架</a></p>" +
                        "                    <p class='del'><a href='javascript:;' class='downBtn' pid='"+data[i].status+"'>商品下架</a></p>" +
                        "                </li>" +
                        "            </ul>";
                    $(".order_content").append(ul);
                }
            }
        })
    });
    function getQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)
            return  decodeURI(r[2]);
        return null;
    }
</script>
</body>
</html>
