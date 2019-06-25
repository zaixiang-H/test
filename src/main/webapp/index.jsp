<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
</head>
<style type="text/css">
    body{
        text-align: center;
    }
    .all{
        width:40%;
        margin: 20px 100px;
        text-align: center;
        height: 300px;
        float: left;

    }
    table{
        width: 80%;
        margin: 20px auto;
        font-size: 14px;

        overflow: auto;
    }
    #tab02{
        width: 80%;
        margin: 20px auto;
        font-size: 14px;


    }
    table th,table td{
        border-bottom: 1px #000 solid;
        line-height: 23px;
    }
    #edit_comm{
        width: 500px;
        margin: 20px auto;
        border-left: 3px solid #000;
        display: none;
    }
    #add_comm{
        width: 500px;
        margin: 20px auto;
        border-left: 3px solid #000;
    }
    #all_comm{
        height:600px;

    }
    .edit_stu{
        width:200px;
        height: 30px;
        background: #fff;
        font-family: "微软雅黑 Light", "Arial Black";
        font-size: 18px;
        border: none;
        border-bottom: 1px solid #000;
        margin: 20px 10px;

    }
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(function(){
        $("#cancel").click(function(){
            $("#add_comm").fadeIn();
            $("#edit_comm").fadeOut();
        })

        $("input").addClass("edit_stu");
    })

    function refush(){
        window.location.href="all"; rel="external nofollow"; rel="external nofollow" ;
    }

    function add_reg(){
        var name = $("#add_edit_name").val();
        var javaScore = $("#add_edit_java").val();
        var htmlScore = $("#add_edit_html").val();
        var cssScore=$("#add_edit_css").val();
        var nameNot = name!=null&&name!='';
        var javaScoreNot = javaScore!=null && javaScore != '';
        var htmlScoreNot = htmlScore!=null && htmlScore !='';
        var cssScoreNot = cssScore !=null && cssScore != '';

        if(nameNot&&javaScoreNot&&htmlScoreNot&&cssScoreNot)
            return true;
        else
            return false;
    }

    function delete_stu(id){
        var result = confirm("是否删除？");
        if(result)
            window.location.href="deleteById?id=";rel="external nofollow" +id;

    }
    function edit_stu(id){

        var name = $("#name"+id).text();
        var java = $("#java"+id).text();
        var html = $("#html"+id).text();
        var css = $("#css"+id).text();
        $("#edit_id").val( id);
        $("#edit_name").val(name);
        $("#edit_java").val(java);
        $("#edit_html").val(html);
        $("#edit_css").val(css);
        $("#add_comm").fadeOut();
        $("#edit_comm").fadeIn();
    }
</script>

<body>
${msg }
<h1 align="center">学生管理</h1>

<div id="all_comm" class="all" >

    <h2>所有学生</h2>
    <table id="items" >
        <tr>
            <td>id</td>
            <td>名称</td>
            <td>java分数</td>
            <td>html分数</td>
            <td>css分数</td>
            <td>操作</td>
        </tr>

        <c:forEach items="${students }" var="student" >
            <tr>
                <td id="id${student.id }">${student.id }</td>
                <td id="name${student.id }">${student.name }</td>
                <td id="java${student.id}">${student.javaScore }</td>
                <td id="html${student.id }">${student.htmlScore }</td>
                <td id="css${student.id}">${student.cssScore }</td>
                <td ><a onclick="delete_stu(${student.id})">删除</a>|<a onclick="edit_stu(${student.id})">编辑</a></td>
            </tr>
        </c:forEach>

    </table>
    <table id="tab02">
        <h2>前三名</h2>
        <tr>
            <td>排名</td>
            <td>id</td>
            <td>姓名</td>
            <td>总分数</td>
        </tr>
        <c:forEach items="${tops }" var="student" varStatus="i">
            <tr>
                <td>第${i.index+1 }名</td>
                <td id="id${student.id }t">${student.id }</td>
                <td>${student.name }</td>
                <td id="name${student.id }t">${student.totalScore }</td>
            </tr>
        </c:forEach>
    </table>
    如不显示请：<a onclick="refush()" >点此刷新</a>
</div>

<div id="add_comm" class="all">
    <h2>查找学生</h2>
    <form action="queryByName" method="post" >
        <input type="text" placeholder="学生姓名" name="name" >
        <input type="submit" value="查找学生" >
    </form>
    <h2 id="edit_title">添加学生</h2>
    <form action="add" method="post" >
        <input type="text" placeholder="学生姓名" name="name" />
        <input type="text" placeholder="java成绩" name="javaScore" />
        <input type="text" placeholder="html成绩" name="htmlScore" />
        <input type="text" placeholder="css成绩" name="cssScore" />
        <input type="submit" value="确定添加" />
    </form>
</div>

<div id="edit_comm" class="all">
    <h2 id="edit_title2">编辑学生</h2>
    <form action="update" method="post">
        <input type="text" placeholder="要修改的id为" id="edit_id" name="id" value="要修改的id为" readonly="readonly"/><br>
        <input type="text" placeholder="学生姓名" id="edit_name" name="name" />
        <input type="text" placeholder="java成绩" id="edit_java" name="javaScore" >
        <input type="text" placeholder="html成绩" id="edit_html" name="htmlScore" />
        <input type="text" placeholder="css成绩" id="edit_css" name="cssScore" />
        <input type="submit" value="确定修改" />
        <input type="button" value="取消修改" id="cancel" class="edit_stu"/>
    </form>
</div>
</body>
</html>

