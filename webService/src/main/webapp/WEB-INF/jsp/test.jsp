<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head> 
	<%@page isELIgnored="false" %>
    <title>查询结果</title>
    <style type="text/css">
        body{
            margin: 0px;
            padding: 0px;
        }
        table{
            width: 100%;
            height: 400px;
            border: #000 1px solid;
        }
        tr td{
            height: 40px;
            text-align: center;
            border: #000 1px solid;
        }

    </style>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript">
function post(){
document.getElementById("formid").submit();
}
</script>
<script>
    function ck(){
    var tbodyObj = document.getElementById('tbodyID');
        $("table :checkbox").each(function(key,value){
            if($(value).prop('checked')){
                document.getElementById("slbh").value=tbodyObj.rows[key].cells[1].innerHTML;
                document.getElementById("bdczh1").value=tbodyObj.rows[key].cells[2].innerHTML; 
                document.getElementById("djlx").value=tbodyObj.rows[key].cells[3].innerHTML;
                document.getElementById("fzjg").value=tbodyObj.rows[key].cells[4].innerHTML;
            }
        })
    }
</script>
<script type="text/javascript">
function chaxun(){
	var bdczh=$("#bdczh").val();
	var pageNow=$("#pageNow").val();
	 $.ajax({
			type : "post",
			url : "dysJ/queryAll",
			data : "&bdczh="+bdczh+"&pageNow="+pageNow,
			dataType: "json",
			async : false,
			cache : false,
			success : function(data) {
				alert("1111111111111111111111");
				//var t = document.getElementById("show");
				var js = eval(data);
				$("#tbodyID  tr:not(:first)").remove();				
				for ( var o in data) {
					$("#tbodyID").append(
							"<tr><td></td><td>" + data[o].slbh + "</td><td>" + data[o].bdczh+ "</td><td>" + data[o].djlx + "</td><td>" + data[o].fzjg + "</td><tr>");
				}
			  }
		});
}
</script>
<script type="text/javascript">
	function test(){
		document.getElementById("formid").submit();
	}
</script>
</head>
<body>
    <div style="width:100px; height: 30px; margin: 10px auto;line-height: 30px;">
        <strong><font style="size:36px;">查询结果</font></strong>
        <form action="${pageContext.request.contextPath}/dysJ/queryAll.do" method="post" id="formid">
		<input type="text" id="bdczh" name="bdczh"/>
		<input type="text" id="pageNow" name="pageNow"/>
        <input type="button" id="button1" name="提交" value="提交" onclick="test()"/>
        </form>
    </div>
    <table border = "1" id='tbodyID' class="tbodyID">
        <tr>
        	<th width="70px" height="70px">选择</th>
            <th width="70px" height="70px">受理编号</th>
            <th width="90px" height="70px">不动产证号</th>
            <th width="120px" height="70px">登记类型</th>
            <th width="200px" height="70px">发证机构</th>
        </tr>
        <%--循环遍历所有得到的记录并输出--%>
		 <c:forEach items="${recordList}" var="record">
        <tr>
            <td width="70px"><input type="checkbox" /></td>
            <td width="90px">${record.slbh}</td>
            <td width="120px">${record.bdczh}</td>
            <td width="200px">${record.djlx}</td>
            <td width="250px">${record.fzjg}</td>
        </tr>
        </c:forEach>
        <tr>
            <td colspan="6">
            <!-- 分页功能 start -->
            <div align="center">
                <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
                ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=1">首页</a>
                <c:choose>
                    <c:when test="${page.pageNow - 1 > 0}">
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=${page.pageNow - 1}">上一页</a>
                    </c:when>
                    <c:when test="${page.pageNow - 1 <= 0}">
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=1">上一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=${page.pageNow}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=${page.pageNow + 1}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=${page.totalPageCount}">下一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=${page.pageNow}">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/dysJ/queryAll?pageNow=${page.totalPageCount}">尾页</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <!-- 分页功能 End -->
            </td>
        </tr>
    </table>
	<div><input type=button value='选择' onclick='ck()'>
	    <input type="text" name="slbh" id="slbh"/>
        <input type="text" name="bdczh1" id="bdczh1"/>
        <input type="text" name="fzjg" id="fzjg"/>
		<input type="text" name="djlx" id="djlx"/>
	
	</div>
</body>
</html>