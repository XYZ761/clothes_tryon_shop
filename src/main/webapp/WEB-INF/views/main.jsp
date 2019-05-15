<%--
  Created by IntelliJ IDEA.
  User: 王晓帆
  Date: 2019/4/18
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>服装试穿销售系统</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <!-- 	<script>
            $(document).ready(function(){
                $(".list-group-item").hover(function(){
                    $(this).children("div.sort-detail").show();
                },function(){
                    $(this).children("div.sort-detail").hide();
                });
            })
        </script> -->
    <script>
        /*$(document).ready(function () {
            $(".data-item-li").children("div").addClass("to-big");
        });*/
    </script>
</head>
<body>
<div id="main" class="container">
    <!-- <div id="header">
        <ul id="header_left">
            <li id="login"><a href="">登录</a></li>
            <li id="register"><a href="">注册</a></li>
        </ul>
        <ul>
            <li><a href="">购物车</a></li>
            <li><a href="">收藏夹</a></li>
            <li><a href="">客服</a></li>
        </ul>
    </div>
    <div>

    </div> -->
    <div id="header">
        <%@ include file="header.jsp" %>
        <%--<%
            String userId = (String) session.getAttribute("userId");
            //out.println(userId);
            String username = (String) session.getAttribute("username");
            if (username == null) {
        %>
        <div class="row">
            <div class="col-md-4" role="navigation">
                <!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->

                <ul class="nav nav-pills">

                    <li><a href="./login.jsp" style="color: #F22E00">请登录</a></li>


                    <li><a href="./register.jsp">注册</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <ul class="nav nav-pills pull-right">
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-comment"></span> 消息
                    </a></li>
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
                        购物车
                    </a></li>
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-star"></span> 收藏夹
                    </a></li>
                </ul>
            </div>
        </div>
        <div id="header-nav">
            <nav class="navbar navbar-default" id="header-nav-middle">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.jsp"><!-- <img alt="Brand" style="display: inline-block;" src="./image/tao.jpg" width="20" height="20"> --><span class="logo-word">淘身边</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse"
                         id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a class="a-color" href="./index.jsp">首页</a></li>
                            <li><a class="a-color" href="./login.jsp">发布闲置</a></li>
                            <li class="dropdown"><a class="a-color" href="./login.jsp"
                                                    class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                    aria-haspopup="true" aria-expanded="false">我的闲置 <span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="login.jsp">出售中</a></li>
                                    <li><a href="login.jsp">交易中</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./login.jsp">新消息</a></li>
                                </ul></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="./searchResult.jsp">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword">
                            </div>
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search" aria-label="搜索"></span>
                            </button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <%
        } else {
        %>
        <div class="row">
            <div class="col-md-4" role="navigation">
                <!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->

                <ul class="nav nav-pills">
                    <li class="info-a"><a href="./info.jsp"
                                          style="color: #F22E00"><%=username%><span class="glyphicon glyphicon-triangle-bottom" style="font-size: 5px;margin-left: 7px;" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="./info.jsp">账户管理</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="./login.jsp" class="login-out">退出登录</a></li>

                        </ul></li>
                    <li><a href="register.jsp">注册</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <ul class="nav nav-pills pull-right">
                    <li><a href="./chat.jsp"> <span
                            class="glyphicon glyphicon-comment"></span> 消息
                    </a></li>
                    <li><a href="./shopcart.jsp"> <span
                            class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
                        购物车
                    </a></li>
                    <li><a href="./favorite.jsp"> <span
                            class="glyphicon glyphicon-star"></span> 收藏夹
                    </a></li>
                </ul>
            </div>
        </div>
        <div id="header-nav">
            <nav class="navbar navbar-default" id="&lt;%&ndash;header-nav-middle&ndash;%&gt;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.jsp"><span class="logo-word">淘身边</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse"
                         &lt;%&ndash;id="bs-example-navbar-collapse-1"&ndash;%&gt;>
                        <ul class="nav navbar-nav">
                            <li><a class="a-color" href="./index.jsp">首页</a></li>
                            <li><a class="a-color" href="./release.jsp">发布闲置</a></li>
                            <li class="dropdown"><a class="a-color" href="./info.jsp"
                                                    class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                    aria-haspopup="true" aria-expanded="false">我的闲置 <span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="info.jsp">出售中</a></li>
                                    <li><a href="info.jsp">交易中</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./chat.jsp">新消息</a></li>
                                </ul></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="./searchResult.jsp">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword">
                            </div>
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search" aria-label="搜索"></span>
                            </button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <%
            }
        %>--%>
        <!-- 旋转图 -->
        <div class="header-bottom">
            <div class="sort">
                <div class="sort-channel">
                    <ul class="sort-channel-list list-group">
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=女装">女装</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=上衣">上衣</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=T恤">T恤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=衬衫">衬衫</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=内衣">内衣</a><a
                                            href="${pageContext.request.contextPath}/category?cate=外套">外套</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=裤子">裤子</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=运动裤">运动裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=牛仔裤">牛仔裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=紧身裤">紧身裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=七分裤">七分裤</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=裙子">裙子</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=连衣裙">连衣裙</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=半裙">半裙</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=睡裙">睡裙</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=连体裙">连体裙</a>
                                    </dd>
                                </dl>

                            </div>
                        </li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/category?cate=男装">男装</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=上衣">上衣</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=衬衫">衬衫</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=外套">外套</a>
                                        <a href="${pageContext.request.contextPath}/category?cate=T恤">T恤</a>
                                        <a href="${pageContext.request.contextPath}/category?cate=牛仔">牛仔</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=裤子">裤子</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=运动裤">运动裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=七分裤">七分裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=牛仔裤">牛仔裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=卡其裤">卡其裤</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=内衣">内衣</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=内衣">内衣</a><a
                                            href="${pageContext.request.contextPath}/category?cate=袜子">袜子</a>
                                        <a href="${pageContext.request.contextPath}/category?cate=内裤">内裤</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/category?cate=童装">童装</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=上衣">上衣</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=衬衫">衬衫</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=T恤">T恤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=外套">外套</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=裤子">裤子</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=紧身裤">紧身裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=运动裤">运动裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=七分裤">七分裤</a>
                                    </dd>
                                </dl>

                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/category?cate=婴儿装">婴儿装</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=新生儿">新生儿</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=长袖连体装">长袖连体装</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=内衣"> 内衣</a> <a
                                            href="${pageContext.request.contextPath}/category?cate= 短袖连体装"> 短袖连体装</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=网眼连体装">网眼连体装</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=幼儿">幼儿</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=短袖T恤">短袖T恤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=长袖T恤">长袖T恤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=紧身裤">紧身裤</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=松紧短裤">松紧短裤</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/category?cate=鞋类">鞋类</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=男鞋">男鞋</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=休闲鞋">休闲鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=跑步鞋">跑步鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=篮球鞋">篮球鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=拖鞋">拖鞋</a>

                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=女鞋">女鞋</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=休闲鞋">休闲鞋</a><a
                                            href="${pageContext.request.contextPath}/category?cate=跑步鞋">跑步鞋</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=篮球鞋">篮球鞋</a>
                                        <a
                                                href="${pageContext.request.contextPath}/category?cate=拖鞋">拖鞋</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=儿童鞋">儿童鞋</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=大童">大童</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=小童">小童</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=婴幼儿">婴幼儿</a>
                                    </dd>
                                </dl>

                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/category?cate=鞋袜">鞋袜</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=男袜">男袜</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=长袜">长袜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=短袜">短袜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=运动袜">运动袜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=船袜">船袜</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=女袜">女袜</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=长袜">长袜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=短袜">短袜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=运动袜">运动袜</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=船袜">船袜</a>
                                    </dd>
                                </dl>

                            </div>
                        </li>
                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/category?cate=内衣">内衣</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=男装">男装</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=睡衣">睡衣</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=内裤">内裤</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/category?cate=女装">女装</a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/category?cate=睡衣">睡衣</a> <a
                                            href="${pageContext.request.contextPath}/category?cate=内裤">内裤</a>
                                    </dd>
                                </dl>

                            </div>
                        </li>
                        <li class="list-group-item"><a
                                href="${pageContext.request.contextPath}/category?cate=其他">其他</a>

                        </li>
                    </ul>
                </div>
                <!-- <div class="sort-detail">
                    <dl class="dl-horizontal">
                        <dt>手机</dt>
                        <dd>
                            <a href="${pageContext.request.contextPath}/category?cate=手机壳">手机壳</a>
                            <a href="${pageContext.request.contextPath}/category?cate=充电器">充电器</a>
                            <a href="">电池</a>
                            <a href="${pageContext.request.contextPath}/category?cate=耳机">耳机</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>相机</dt>
                        <dd>
                            <a href="">镜头</a>
                            <a href="">单反</a>
                            <a href="">胶片</a>
                            <a href="">摄像</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>电脑</dt>
                        <dd></dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>MP3</dt>
                        <dd></dd>
                    </dl>
                </div> -->
            </div>
            <div id="mycarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/image/011.jpg" alt="">
                    </div>

                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/022.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/033.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/044.jpg" alt="">
                    </div>
                </div>

                <ol class="carousel-indicators">
                    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#mycarousel" data-slide-to="1"></li>
                    <li data-target="#mycarousel" data-slide-to="2"></li>
                    <li data-target="#mycarousel" data-slide-to="3"></li>
                </ol>

                <a class="left carousel-control" href="#mycarousel" role="button"
                   data-slide="prev" style="display: none;"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a> <a class="right carousel-control" href="#mycarousel" role="button"
                        data-slide="next" style="display: none;"> <span
                    class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>
            <div class="clear-float"></div>
        </div>
    </div>
    <div class="content">

        <c:if test="${!empty digGoods}">
            <div class="module">
                <div class="hd">
                    <h2>女装</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${digGoods}" var="goods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${goods.goodsid}"><img
                                                src="/shopimage/${goods.imagePaths[0].path}" alt=""
                                                width="200" height="200"/>
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${goods.goodsid}">${goods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${goods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${goods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${goods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!goods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${goods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty houseGoods}">
            <div class="module">
                <div class="hd">
                    <h2>男装</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${houseGoods}" var="housegoods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${housegoods.goodsid}">
                                            <img
                                                    src="/shopimage/${housegoods.imagePaths[0].path}" alt=""
                                                    width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${housegoods.goodsid}">${housegoods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${housegoods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${housegoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${housegoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!housegoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${housegoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty colGoods}">
            <div class="module">
                <div class="hd">
                    <h2>童装</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${colGoods}" var="colgoods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${colgoods.goodsid}">
                                            <img
                                                    src="/shopimage/${colgoods.imagePaths[0].path}" alt=""
                                                    width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${colgoods.goodsid}">${colgoods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${colgoods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${colgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${colgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!colgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${colgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty bookGoods}">
            <div class="module">
                <div class="hd">
                    <h2>婴儿装</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${bookGoods}" var="bookgoods">
                                <li class="data-item-li">
                                    <div class="to-big">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${bookgoods.goodsid}">
                                            <img
                                                    src="/shopimage/${bookgoods.imagePaths[0].path}" alt=""
                                                    width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${bookgoods.goodsid}">${bookgoods.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${bookgoods.price}</b>
                                    </div>
                                    <div>
                                        <c:if test="${bookgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart btn btn-default"
                                                    data-id="${bookgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <c:if test="${!bookgoods.fav}">
                                            <button
                                                    class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                    data-id="${bookgoods.goodsid}"
                                                    style="display: none;"></button>
                                        </c:if>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>


