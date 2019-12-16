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
            margin-top: 50px;
        }

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

        h2{
            font-size: 30px;
            font-weight: bold;
            color: #0B0B0E;
            float: right;
            position: absolute;
            right: 50%;
            margin-top: -40px;
        }
    </style>
</head>
<body>
<h2>商品上架和下架</h2>
<hr/>
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
                for(var i=0;i<data.length;i++) {
                    if (data[i].status == 0 && data[i].pNum>0) {
                        var ul = "<ul class='order_lists'>" +
                            "                <li class=\"list_chk\">\n" +
                            "                    <p class=\"checkbox_2\">" + data[i].pType + "</p>\n" +
                            "                </li>\n" +
                            "                <li class=\"list_con\">\n" +
                            "                    <p class=\"list_text\"><a href=\"javascript:;\">" + data[i].pName + "</a></p>\n" +
                            "                </li>" +
                            "                <li class=\"list_price\">" +
                            "                    <p class=\"price\">" + data[i].price + "</p>" +
                            "                </li>" +
                            "                <li class='list_op'>" +
                            "                    <p class='del' status='" + data[i].status + "'>已上架 &nbsp &nbsp <input type='button' class='downBtn' value='下架' pid='"+data[i].pId+"'/></p>" +
                            "                </li>" +
                            "            </ul>";
                        $(".order_content").append(ul);
                    }else if(data[i].status == 1){
                        var ul = "<ul class='order_lists'>" +
                            "                <li class=\"list_chk\">\n" +
                            "                    <p class=\"checkbox_2\">" + data[i].pType + "</p>\n" +
                            "                </li>\n" +
                            "                <li class=\"list_con\">\n" +
                            "                    <p class=\"list_text\"><a href=\"javascript:;\">" + data[i].pName + "</a></p>\n" +
                            "                </li>" +
                            "                <li class=\"list_price\">" +
                            "                    <p class=\"price\">" + data[i].price + "</p>" +
                            "                </li>" +
                            "                <li class='list_op'>" +
                            "                    <p class='del' status='" + data[i].status + "'>已下架 &nbsp &nbsp <input type='button' class='upBtn' value='上架' pid='"+data[i].pId+"'/></p>" +
                            "                </li>" +
                            "            </ul>";
                        $(".order_content").append(ul);
                    }
                }
                $(".order_content").on("click","input",function () {
                    var dom=$(this);
                    var pid=$(this).attr("pid");
                    $.ajax({
                        url:"UpdateStatus",
                        type:"post",
                        data:{
                            "pid":pid
                        },
                        success:function (data) {
                            if(data=="up"){
                                dom.parent().html("已上架&nbsp&nbsp<input type='button' class='upBtn' value='下架' pid='"+pid+"'/>");
                                // dom.parent().append("");
                            }else if(data=="down"){
                                dom.parent().html("已下架&nbsp&nbsp<input type='button' class='upBtn' value='上架' pid='"+pid+"'/>");
                            }else{
                                dom.parent().text("未成功");
                            }
                        }
                    })
                })
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
