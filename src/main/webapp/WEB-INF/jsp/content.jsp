<%@ page session="false" %>
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
  <link rel="stylesheet" href="${cssUrl}" media="all">

  <script src="/static/jquery-2.1.4.min.js" type="text/javascript"></script>
  <script src="${scriptUrl}" type="text/javascript"></script>
  <script src="/static/atlassian-aui-adg-dist-50245526295e/aui/js/aui.min.js" type="text/javascript"></script>
</head>
<body>
  <section class="ac-content">
    <div class="aui-group">
      <div>
        <button id="action" type="button">Action!</button>
      </div>
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
            $('#action').click(function() {
              AP.require('dialog', function(dialog) {
                dialog.create({
                  key: 'notify-zendesk-dialog',
                  chrome: true
                });
              });
            });

            AP.require(["jira"], function(jira) {
              // When the configuration is saved, this method is called. Return the values for your input elements.
              jira.WorkflowConfiguration.onSave(function() {
                var config = {
                  "key": "val"
                };
                return JSON.stringify(config);
              });

              // Validate any appropriate input and return true/false
              jira.WorkflowConfiguration.onSaveValidation(function() {
                return true;
              });
            });
          }
        },
        100
      );
    });
  </script>
</body>
</html>