<%--
  Created by IntelliJ IDEA.
  User: lss
  Date: 16/7/25
  Time: 下午3:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../commen.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>乐+生活 后台模板管理系统</title>
    <link href="${resourceUrl}/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${resourceUrl}/css/commonCss.css"/>
    <style>
        .thumbnail {
            width: 160px;
            height: 160px;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
        }
    </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${resourceUrl}/js/jquery-2.0.3.min.js"></script>
</head>

<body>
<div id="topIframe">
    <%@include file="../common/top.jsp" %>
</div>
<div id="content">
    <div id="leftIframe">
        <%@include file="../common/left.jsp" %>
    </div>
    <div class="m-right">
        <div class="main">
            <div class="container-fluid">
                <hr>
                <form class="form-horizontal">

                    <div>
                        <label class="col-sm-2 control-label" style="font-size: large"></label>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="font-size: large">
                                <div class="form-group">
                                    <c:forEach items="${manageUserList}" var="managementUser">
                                        <div class="">
                                            <input type="hidden" name="managementUserList"
                                                   value="${managementUser.name}"/>
                                        </div>
                                    </c:forEach>

                                    <tr>
                                        <td>
                                            <div class="col-sm-10"><input type="text"
                                                                          class="form-control"
                                                                          id="userName" name="name">
                                            </div>
                                        </td>
                                        <td><label for="userName">账户</label></td>
                                    </tr>
                                </div>
                                <div class="form-group">
                                    <tr>
                                        <td>
                                            <div class="col-sm-10"><input type="password"
                                                                          class="form-control"
                                                                          id="userPassWord"
                                                                          name="password"></div>
                                        </td>
                                        <td><label for="userPassWord">密码</label></td>
                                    </tr>
                                </div>
                                <div class="form-group">
                                    <tr>
                                        <td>
                                            <div class="col-sm-10"><input type="password"
                                                                          class="form-control"
                                                                          id="userPassWord2"
                                                                          name="password"></div>
                                        </td>
                                        <td><label for="userPassWord2">确认密码</label></td>
                                    </tr>
                                </div>
                            </label>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-4">
                                    <button type="button" class="btn btn-primary"
                                            onclick="submitUser()">
                                        提交
                                    </button>
                                    <button type="button" class="btn btn-default"
                                            onclick="goBack()">返回
                                    </button>
                                </div>
                            </div>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="bottomIframe">
    <%@include file="../common/bottom.jsp" %>
</div>
<script src="${resourceUrl}/js/bootstrap.min.js"></script>
<script>

    function submitUser() {
        var userName = $("#userName").val();
        var userPassWord = $("#userPassWord").val();
        var userPassWord2 = $("#userPassWord2").val();
        var managementUserList=new Array();
        $('input[name="managementUserList"]').each(function () {
            managementUserList.push($(this).val());//向数组中添加元素
        });

        var userName_array = new Array();
        $('input[name="userNames"]').each(function () {
            userName_array.push($(this).val());//向数组中添加元素
        });
        function isCon(arr, val) {
            for (var i = 0; i < arr.length; i++) {
                if (arr[i] == val)
                    return true;
            }
            return false;
        }
            if (userPassWord == userPassWord2) {
                if(!isCon(managementUserList,userName)){
                    location.href = "/manage/addUser?userName=" + userName + '&&' + 'userPassword=' + userPassWord;}
                else{
                    alert("用户名重复");
                }
            } else {
                alert("两次密码输入不一致");
            }


    }
    function goBack() {
        location.href = "/manage/managementUserList"
    }
</script>
</body>
</html>

