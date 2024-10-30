<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borar en JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/empleadobd?user=root&password=");
                st = con.createStatement();
                st.executeUpdate("delete from tblusuario  where id='"+request.getParameter("id") +"';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
