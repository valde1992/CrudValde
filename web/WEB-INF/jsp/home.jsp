<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout.jsp"></jsp:include>
        <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header modal-danger">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-exclamation-triangle"></i> Eliminar cliente</h4>
                </div>
                <div class="modal-body">
                    �Est� seguro que desea eliminar este cliente?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button id="btnDel" type="button" class="btn btn-danger">Eliminar</button>
                </div>
            </div>
          </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <div class="col-xs-offset-1 col-xs-10 ">
            <table class="table table-responsive table-striped table-hover table-condensed">
                <thead>
                    <h3>Clientes</h3>
                </thead>
                <tbody>
                    <tr>
                        <th>
                            Nombre
                        </th>
                        <th>
                            Apellido
                        </th>
                        <th>
                            Edad
                        </th>
                        <th>
                            Nacionalidad
                        </th>
                        <th>
                            Activo
                        </th>
                        <th>
                            Acciones
                        </th>
                    </tr>
                    <c:forEach var="cliente" items="${resultado}">
                        <tr>
                            <td>
                                ${cliente.nombre}
                            </td>
                            <td>
                                ${cliente.apellido}
                            </td>
                            <td>
                                ${cliente.fecha_nac}
                            </td>
                            <td>
                                ${cliente.nacionalidad.nacionalidad}
                            </td>
                            <td>
                                <c:if test="${cliente.activo == 1}">
                                    <span class="glyphicon glyphicon-ok-circle"></span>
                                </c:if>
                                <c:if test="${cliente.activo == 0}">
                                    <span class="glyphicon glyphicon-remove-circle"></span>
                                </c:if>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <a class="btn btn-default" href="/CrudValde/ver?id=${cliente.id}"><span class="glyphicon glyphicon-eye-open"></span> Ver</a>
                                    <c:if test="${sessionScope.roles.contains('editar_clientes')}">
                                        <a class="btn btn-primary" href="/CrudValde/editar?id=${cliente.id}"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                                    </c:if>    
                                    <c:if test="${sessionScope.roles.contains('editar_clientes')}">
                                        <c:if test="${cliente.activo == 1}">
                                            <a class="btn btn-info" href="/CrudValde/activar?id=${cliente.id}&activo=${cliente.activo}"><span class="glyphicon glyphicon-remove"></span> Desactivar</a>
                                        </c:if>
                                        <c:if test="${cliente.activo == 0}">
                                            <a class="btn btn-info" href="/CrudValde/activar?id=${cliente.id}&activo=${cliente.activo}"><span class="glyphicon glyphicon-ok"></span> Activar</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.roles.contains('baja_clientes')}">
                                        <button type="button" class="btn btn-danger" id="${cliente.id}" onclick="eliminar(${cliente.id})"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
                                    </c:if>
                                </div>                                    
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${info != null}">
                <div class="alert alert-info" role="alert">
                <strong>${info}</strong></div>
            </c:if>
            <c:remove var="info" scope="session" />
            <hr>
            <c:if test="${sessionScope.roles.contains('alta_clientes')}">
                <a class="btn btn-success pull-right" href="/CrudValde/nuevo"><span class="glyphicon glyphicon-plus"></span> Nuevo cliente</a>
            </c:if>
        </div>
    </body>
</html>