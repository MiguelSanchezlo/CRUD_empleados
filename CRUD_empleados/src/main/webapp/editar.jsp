<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <title>Editar Empleados</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
        %>
        <div class="container">
            <form action="editar.jsp" method="post">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required" value="<%=nombre%>">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="form-label">Correo Electronico</label>
                    <input type="text" class="form-control" id="correo" name="correo" placeholder="Correo Electronico" required="required" value="<%=correo%>">
                </div>
                
                <a href="index.jsp"><i class="btn btn-danger" aria-hidden="true">Cancelar</i></a>
                <button type="submit" name="enviar" class="btn btn-primary">Editar<i class="fa fa-floopy-o" aria-hidden="true"></i></button>
                <input type="hidden" name="id" value="<%=id%>">
            </form>
        </div>
        <%
            if(request.getParameter("enviar") != null){
                nombre = request.getParameter("nombre");
                correo = request.getParameter("correo");
                try{
                    Connection con = null;
                    Statement st = null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    con = DriverManager.getConnection("jdbc:mysql://localhost/empleadobd?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("update tblusuario set nombre_usuario = '" + nombre + "',correoElectronico = '" + correo + "' where id= '" + id +"'" );
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>

    </body>
</html>
