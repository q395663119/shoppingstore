<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>商城菜单-导航分页</title>
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/css/example.css">
    <script src="<%=basePath%>resource/js/sHover.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
</head>
<body id="body">
<div id="part3" class="part">
    <div class="container">
        <div id="item1" class="sHoverItem">
            <img id="img1" src="resource/images/1.jpg">
            <span id="intro1" class="sIntro">
					<h2>Flowers</h2>
					<p>Flowers are so inconsistent! But I was too young to know how to love her</p>
					<button>立即购买</button>
                    <button>加入购物车</button>
				</span>
        </div>

    </div><!-- /container -->
</div><!-- /part3 -->

<script>
    window.onload=function(){

        $.ajax({
            url:"selectAllProductsByP_type",
            type:"post",
            data:{
                "p_type":getQueryString("p_type")
            },
            success:function(data){
                alert(data);
                console.log(data);
            }
        });

        var b=new sHover('head','headIntro');

        var a=new sHover("sHoverItem","sIntro");
        a.set({
            slideSpeed:5,
            opacityChange:true,
            opacity:80
        });


        var example1Btn=document.getElementById('example1Btn');
        var part1arrow=document.getElementById('part1arrow');
        var example1=document.getElementById('example1');


        var example2=new sHover('example2','intro2');
        example2.set({
            slideSpeed:7,
            opacity:80,
            opacityChange:true
        });
        var example2prev=new sHover('example2prev','intro2prev');
        example2prev.set({
        });

    }
    function scrollToBottom(a){
        if(windowHeight()){
            clearInterval(a.scrollTimer);
            var scrollSpeed=100;
            a.scrollTimer=setInterval(function(){
                document.documentElement.scrollTop+=scrollSpeed;
                document.body.scrollTop+=scrollSpeed;
                if((document.documentElement.scrollTop>=(document.documentElement.scrollHeight-windowHeight()))||(document.body.scrollTop>=(document.documentElement.scrollHeight-windowHeight()))){
                    clearInterval(a.scrollTimer);
                }
            },13);
        }else{
            //a.setAttribute('href', 'http://www.baidu.com');
        }
    }
    function windowHeight(){
        if(document.documentElement){
            return document.documentElement.clientHeight;
        }else{
            return document.body.clientHeight;
        }
    }
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
