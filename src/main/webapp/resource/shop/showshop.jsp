<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <title>商品详情</title>
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
        .order_lists .list_chk{
            position: relative;
            width: 50px;
        }
        .order_lists .list_chk p{
            margin: 20px 0 0 24px;
        }

        .order_lists .list_con{
            width: 342px;
        }
        .order_lists .list_con .list_text{
            margin: 20px 0 0 10px;
            line-height: 18px;
            width: 200px;
            float: right;
        }
        .order_lists .list_con .list_text a{
            color: #3c3c3c;
        }
        .order_lists .list_con .list_text a:hover{
            color: #ff873e;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<section class="cartMain">

    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk">类型</li>
            <li class="list_con">品牌</li>
            <li class="list_price">产品</li>
            <li class="list_op">单价</li>
        </ul>
    </div>
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
            url:"showshop",
            type:"post",
            data:{
                "pid":getQueryString("pid")
            },
           success:function (data) {
                for(var i=0;i<data.length;i++){
                    var ul = "<ul class='order_lists'>" +
                        "                <li class=\"list_chk\">\n" +
                        "                    <p>"+data[i].pType+"</p>\n" +
                        "                </li>\n" +
                        "                <li class=\"list_con\">\n" +
                        "                    <p class=\"list_text\">"+data[i].brand+"</p>\n" +
                        "                </li>" +
                        "                <li class=\"list_price\">" +
                        "                    <p class=\"price\">"+data[i].pName+"</p>" +
                        "                </li>" +
                        "                <li class='list_op'>" +
                        "                    <p class='del'>"+data[i].price+"</p>" +
                        "                </li>" +
                        "            </ul>";
                    $(".order_content").append(ul);
                }
            }
        })
    })
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
