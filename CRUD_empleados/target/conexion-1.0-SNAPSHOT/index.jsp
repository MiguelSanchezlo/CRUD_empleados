
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <%
          Connection con = null;  
          Statement st = null;
          ResultSet rs = null;
        %>
        <div class="container">
            <div class="row">
                <h1>Empleado</h1>
                <div class="col-md">
                    <table class="table table-dark table-striped table-hover">
                        <thead>
                            <tr>
                                <th scope="col" colspan="3">Empleados</th>   
                                <th scope="col" colspan="6">
                                    <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th> 
                            </tr>
                                                             
                            <tr>
                                <th scope="col">Codigo</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Correo</th>  
                                <th scope="col">Aciones</th>  
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/empleadobd?user=root&password=");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM tblusuario;");
                                while (rs.next()){
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>  
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&correo=<%= rs.getString(3)%>"><i class="fa fa-pencil-square" aria-hidden="true"></i></a>
                                    <a href="borrar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&correo=<%= rs.getString(3)%>"<i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                </td>
                            </tr>  
                            <%
                            }
                            }
                            catch (Exception e){
                                out.print(" error de sql: " + e);
                            }
                            %>
                        </tbody>
                    </table>
                </div> 
            </div> 
        </div>
    </body>
</html>