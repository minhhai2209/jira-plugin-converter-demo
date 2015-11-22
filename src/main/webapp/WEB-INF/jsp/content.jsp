<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!--   <script src="/jquery-2.1.4.min.js" type="text/javascript"></script> -->
  <script src="${scriptUrl}" type="text/javascript"></script>
  
  <link rel="stylesheet" href="//aui-cdn.atlassian.com/aui-adg/5.9.0/css/aui.css" media="all">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <script src="//aui-cdn.atlassian.com/aui-adg/5.9.0/js/aui.js"></script>

  <style type="text/css">
    body {
      background: #FFFFFF;
    }
    header {
      padding: 20px;
    }
  </style>
</head>
<body class="ac-content">
Showing content from:
<div id="location"></div>
<div>
    <form class="aui">
      <c:forEach items="${parameters}" var="p">
        <div class="field-group">
          <label><c:out value="${p.key}" /></label>
          <input disabled class="text long-field" type="text"   value="${p.value}" />
        </div>
      </c:forEach>
    </form>
  </div>
<script>
  $(function() {
    $('#location').text(window.location);
    var i = setInterval(
      function() {
        if (window.AP) {
          clearInterval(i);
          
          setTimeout(
            function() {
              AP.require("messages", function(messages) {
                //create a message
                var message = messages.info('Message triggered by plugin', 'This is message triggered by addon using AP.messages');
              });
              
//               AP.require('dialog', function(dialog){
//                 dialog.create({
//                   key: 'hw-general-page-0',
//                   width: '500px',
//                   height: '200px',
//                   chrome: true
//                 });
//               });
            }, 
            100
          );
        }
      },
      100
    );
  });
</script>
</body>
</html>