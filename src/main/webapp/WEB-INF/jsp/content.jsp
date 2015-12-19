<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="/static/atlassian-aui-adg-dist-50245526295e/aui/css/aui.min.css" media="all">
  <style type="text/css">
    body {
      background: #FFFFFF;
      word-wrap: break-word;
    }
  </style>
  
  <script src="/static/jquery-2.1.4.min.js" type="text/javascript"></script>
  <script src="${scriptUrl}" type="text/javascript"></script>
  <script src="/static/atlassian-aui-adg-dist-50245526295e/aui/js/aui.min.js" type="text/javascript"></script>
</head>
<body>
  <section class="ac-content">
    <div class="aui-group">
      <div>
        <form class="aui">
          <div class="field-group">
            <label>URL</label>
            <div id="location" class="textarea long-field"></div>
          </div>
          <c:forEach items="${parameters}" var="p">
            <div class="field-group">
              <label><c:out value="${p.key}" /></label>
              <div class="textarea long-field">${empty p.value ? '&nbsp' : p.value}</div>
            </div>
          </c:forEach>
        </form>
      </div>
    </div>
  </section>
  <script>
    $(function() {
      $('#location').text(window.location);
      var i = setInterval(
        function() {
          if (window.AP) {
            clearInterval(i);
          }
        },
        100
      );
    });
  </script>
</body>
</html>