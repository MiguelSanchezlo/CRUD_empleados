<%-- 
    Document   : crear
    Created on : Feb 15, 2024, 6:22:57 PM
    Author     : nemet
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Crear Empleados</title>
    </head>
    <body>
        <div class="container">
            <form action="crear.jsp" method="post">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" class="form-label">Correo Electronico</label>
                    <input type="text" class="form-control" id="correo" name="correo" placeholder="Correo Electronico" required="required">
                </div>
                <button type="submit" name="enviar" class="btn btn-primary">Guardar<i class="fa fa-floopy-o" aria-hidden="true"></i></button>
            </form>
        </div>
        <%
            if(request.getParameter("enviar") != null){
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                try{
                    Connection con = null;
                    Statement st = null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    con = DriverManager.getConnection("jdbc:mysql://localhost/empleadobd?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("insert into tblusuario (nombre_usuario, correoElectronico) values('" + nombre + "','" + correo + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>

    </body>
</html>
