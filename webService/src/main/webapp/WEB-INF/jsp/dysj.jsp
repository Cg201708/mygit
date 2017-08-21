<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Amaze UI Admin index Examples</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="assets/css/admin.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/app.js"></script>
<style type="text/css">
  td,th{
    text-align:center; 
  }
</style>
    <style type="text/css">
        .pageDetail {
            display: none;
        }

        .show {
            display: table-row;
        }
    </style>
    <script>
        $(function () {
            $('#list').click(function () {
                $('.pageDetail').toggleClass('show');
            });
        });

    </script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->

</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="assets/i/logo.png"></div>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
      <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>
<div class="am-cf admin-main">
  <div class="nav-navicon admin-main admin-sidebar">
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：${user.username }</div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em>抵押登记</h3>
      <ul>
        <li>收件</li>
        <li>受理</li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 
  </div>
  <div class=" admin-content" align="center">
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">查询</h4>
        <span data-am-modal-close
            class="am-close">&times;</span></div>
      <div class="am-popup-bd">
        <form action="${pageContext.request.contextPath}/list" method="post">
          <div class="am-form-group">
            <div class="zuo">不动产证号：</div>
            <div class="you">
              <input type="text" class="bdczh" id="bdczh" placeholder="请输入不动产证号" name="bdczh" value="${queryParam.bdczh}">
            </div>
          </div>

          <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="submit" class="chaxun1">查询</button>
              </p>
            </div>
          </div>
      </form>
          <div class="am-form-group am-cf">
            <div class="you">
            <c:if test="${page!=null}">
              <table border="1" style="width:100%;margin:auto">
              <thead>
                <tr>
                  <th colspan="5"></th>
                  <th><input type="checkbox" class="check"/></th>
                  <th>受理编号</th>
                  <th>不动产证号</th>
                  <th>登记类型</th>
                  <th>发证机构</th>
                </tr>
                </thead>
                <c:forEach items="${pageInfo.list}" var="test">
                <tr>
                  <td><input type="checkbox" class="check"/></td>
                  <td>${test.slbh }</td>
                  <td>${test.bdczh }</td>
                  <td>${test.djlx }</td>
                  <td>${test.fzjg }</td>
                </tr>
                </c:forEach>
              </table>
              <table class="gridtable" style="width:100%;text-align: center;">
                <tr>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <td>
                            <a href="${pageContext.request.contextPath}/list?page=${pageInfo.prePage}&rows=${pageInfo.pageSize}&countryname=${queryParam.countryname}&countrycode=${queryParam.countrycode}">前一页</a>
                        </td>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                        <c:if test="${nav == pageInfo.pageNum}">
                            <td style="font-weight: bold;">${nav}</td>
                        </c:if>
                        <c:if test="${nav != pageInfo.pageNum}">
                            <td>
                                <a href="${pageContext.request.contextPath}/list?page=${nav}&rows=${pageInfo.pageSize}&countryname=${queryParam.countryname}&countrycode=${queryParam.countrycode}">${nav}</a>
                            </td>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <td>
                            <a href="${pageContext.request.contextPath}/list?page=${pageInfo.nextPage}&rows=${pageInfo.pageSize}&countryname=${queryParam.countryname}&countrycode=${queryParam.countrycode}">下一页</a>
                        </td>
                    </c:if>
                </tr>
            </table>
        </c:if>
            </div>
          </div>

          <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="button" class="am-btn am-btn-success am-radius">确定</button>
              </p>
            </div>
          </div>
      </div>
    </div>
        
    <div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">
          抵押登记
        </ul>
        <dl class="am-icon-home" style="float: right;">
          当前位置： 首页 > <a href="#">收件</a>
        </dl>
        <dl>
          <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#my-popup'}">查询</button>
        </dl>
        <!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束--> 
        
      </div>
      <form class="am-form am-g">
        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
          <thead>
            <tr class="am-success">
              <td width="100px">受理编号</td>
              <td>${pageInfo.hasPreviousPage }</td>
              <td width="100px">不动产证号</td>
              <td><input type="text" id="bdczh" name="bdczh"/></td>
            </tr>
          </thead>
          <tbody>
            <tr class="am-success">
              <td width="100px">受理编号</td>
              <td><input type="text" /></td>
              <td width="100px">不动产证号</td>
              <td><input type="text" /></td>
            </tr>    
            <tr class="am-success">
              <td width="100px">受理编号</td>
              <td><input type="text" /></td>
              <td width="100px">不动产证号</td>
              <td><input type="text" /></td>
            </tr>
            <tr class="am-success">
              <td width="100px">受理编号</td>
              <td><input type="text" /></td>
              <td width="100px">不动产证号</td>
              <td><input type="text" /></td>
            </tr>  
          </tbody>
        </table>       

        
        </p>
      </form>

      <div class="foods">
        <dl>
          <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
        </dl>
      </div>
    </div>
  </div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script> 
<!--<![endif]-->

</body>
</html>