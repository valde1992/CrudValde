<%-- 
    Document   : login
    Created on : 29/09/2016, 22:30:51
    Author     : fer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout.jsp"></jsp:include>
        <div class="row">
                <div class="well col-xs-offset-1 col-xs-6">
                        Debe ingresar para poder ver el listado y realizar operaciones.
                </div>
        </div>
        <div class="row">
            <div class="col-xs-offset-1 col-xs-4">
                    <c:if test="${error != null}">
                        <div class="alert alert-danger alert-dismissable" role="alert">
                        <button type="button" class="close" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong><span class="glyphicon glyphicon-alert"></span> ${error}</strong></div>
                    </c:if>
            </div>
        </div>
        <c:remove var="error" scope="session" />
        <div class="row">
            <div class="col-xs-offset-1 col-xs-4">
                    <c:if test="${info != null}">
                        <div class="alert alert-info alert-dismissable" role="alert">
                        <button type="button" class="close" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>${info}</strong></div>
                    </c:if>
            </div>
        </div>
        <c:remove var="info" scope="session" />
    </body>
</html>
