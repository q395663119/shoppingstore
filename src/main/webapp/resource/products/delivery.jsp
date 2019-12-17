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
    <title>订单管理</title>
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

    <style type="text/css">
        .order_lists .list_chk{
            position: relative;
            width: 50px;
        }
        .order_lists .list_chk p{
            margin: 30px 0 0 30px;
        }

        .order_lists .list_con{
            width: 342px;
        }
        .order_lists .list_con .list_text{
            margin: 20px 0 0 20px;
            line-height: 30px;
            width: 200px;
            float: right;
        }
    </style>
</head>
<body>
<section class="cartMain">

    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk">用户ID</li>
            <li class="list_con">商品编号</li>
            <li class="list_info">商品名字</li>
            <li class="list_price">商品数量</li>
            <li class="list_amount">下单时间</li>
            <li class="list_sum">下单编号</li>
            <li class="list_op">订单状态</li>
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
        /*根据三个表相同子弹查询所有的订单，根据订单表的status的值判断订单的状态(发货/未发货)*/
        $.ajax({
            url:"selectAllOrder",
            type:"post",
            success:function (data) {
                for(var i=0;i<data.length;i++) {
                    if (data[i].status == 0) {
                        var ul = "<ul class='order_lists'>" +
                            "                <li class=\"list_chk\">\n" +
                            "                    <p for=\"checkbox_2\">" + data[i].userid + "</p>\n" +
                            "                </li>\n" +
                            "                <li class=\"list_con\">\n" +
                            "                    <p class=\"list_text\">" + data[i].pCode + "</div>\n" +
                            "                </li>" +
                            "                <li class=\"list_info\">" +
                            "                    <p>" + data[i].pName + "</p>" +
                            "                </li>" +
                            "                <li class=\"list_price\">" +
                            "                    <p class=\"price\">" + data[i].odNum + "</p>" +
                            "                </li>" +
                            "                <li class=\"list_amount\">" +
                            "                    <p class=\"amount_box\">" + data[i].ordertime + "</p>" +
                            "                </li>" +
                            "                <li class='list_sum'>" +
                            "                    <p class='sum_price'>" + data[i].pid + "</p>" +
                            "                </li>" +
                            "                <li class='list_op'>" +
                            "                    <p class='del' status='" + data[i].status + "'>未发货&nbsp&nbsp<input type='button' value='订单发货' oId='"+data[i].oId+"'/></p>" +
                            "                </li>" +
                            "            </ul>";
                        $(".order_content").append(ul);
                    }else if(data[i].status==1){
                        var ul = "<ul class='order_lists'>" +
                            "                <li class=\"list_chk\">\n" +
                            "                    <p for=\"checkbox_2\">" + data[i].userid + "</p>\n" +
                            "                </li>\n" +
                            "                <li class=\"list_con\">\n" +
                            "                    <p class=\"list_text\">" + data[i].pCode + "</div>\n" +
                            "                </li>" +
                            "                <li class=\"list_info\">" +
                            "                    <p>" + data[i].pName + "</p>" +
                            "                </li>" +
                            "                <li class=\"list_price\">" +
                            "                    <p class=\"price\">" + data[i].odNum + "</p>" +
                            "                </li>" +
                            "                <li class=\"list_amount\">" +
                            "                    <p class=\"amount_box\">" + data[i].ordertime + "</p>" +
                            "                </li>" +
                            "                <li class='list_sum'>" +
                            "                    <p class='sum_price'>" + data[i].pid + "</p>" +
                            "                </li>" +
                            "                <li class='list_op'>" +
                            "                    <p class='del' status='" + data[i].status + "'>已发货&nbsp&nbsp<input type='button' value='取消发货' oId='\"+data[i].oId+\"'</p>" +
                            "                </li>" +
                            "            </ul>";
                        $(".order_content").append(ul);
                    }
                }

                /*点击该按钮，根据oid查询orderinfo表，修改表中status的值，改变订单的状态值*/
                $(".order_content").on("click","input",function () {
                    var dom=$(this);
                    var oId=$(this).attr("oId");
                    $.ajax({
                        url:"ChangeOrders",
                        type:"post",
                        data:{
                            "oId":oId
                        },
                        success:function (data) {
                            if(data=="up"){
                                dom.parent().html("已发货&nbsp&nbsp<input type='button' value='取消发货' oId='"+oId+"'/>");
                            }else if(data=="down"){
                                dom.parent().html("未发货&nbsp&nbsp<input type='button' value='订单发货' oId='"+oId+"'/>");
                            }else{
                                dom.parent().text("未成功");
                            }
                        }
                    })
                })

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
