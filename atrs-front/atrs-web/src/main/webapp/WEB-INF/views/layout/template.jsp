<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <tilesx:useAttribute id="csslist" name="css" classname="java.util.List" />
  <c:forEach var="item" items="${csslist}">
    <link rel="stylesheet" type="text/css" href="${contentUrl}/resources/css/${item }.css" />
  </c:forEach>
  <title>
    <tiles:insertAttribute name="title" />
  </title>
</head>

<body>
  <div id="container">

    <div id="main">
      <%-- ここからヘッダ --%>
      <div id="header">
        <div id="header-logo">
          <a href="#" onclick="atrs.moveTo('/')">
            <img alt="" src="${contentUrl}/resources/image/logo.jpg">
          </a>
        </div>
        <div id="header-content">
          <div id="header-login">
            <tiles:insertAttribute name="header-login" />
          </div>
          <div id="header-menu">
            <tiles:insertAttribute name="header-menu" />
          </div>
        </div> 
      </div>
      <%-- ヘッダここまで --%>

      <%-- ここからメイン --%>
      <div id="content">
        <tiles:insertAttribute name="content" />
      </div>
      <%-- メインここまで --%>

      <%-- フッタここから --%>
      <div id="footer">
        <tiles:insertAttribute name="footer" />
      </div>
      <%-- フッタここまで --%>
    </div>

  </div>
</body>

<script type="text/javascript">
  if (!atrs) var atrs = {};
  atrs.baseUrl = "${f:js(pageContext.request.contextPath)}";
</script>
<tilesx:useAttribute id="jslist" name="javascript" classname="java.util.List" />
<c:forEach var="item" items="${jslist}">
  <script type="text/javascript" src="${contentUrl}/resources/js/${item}.js" >
  </script>
</c:forEach>

</html>