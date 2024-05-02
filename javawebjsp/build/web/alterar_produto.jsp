<%@page import ="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>alterar produtos</title>
    </head>
    <body>
       <%
       int codigo;
       String nome, marca;
       double preco;
       codigo=Integer.parseInt(request.getParameter("codigo"));
       nome=request.getParameter("nome");
       marca=request.getParameter("marca");
       preco=Double.parseDouble(request.getParameter("preco"));
       

           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
          

           String url="jdbc:mysql://localhost:3307/bancojsp";
           String user = "root";
           String password="";
           conecta=DriverManager.getConnection(url,user,password);
           
           
           //BUSCAR OS PRODUTOS PELO CÓDIGO 
           
           String sql="UPDATE produto SET nome=?, marca=?, preco=? WHERE codigo=?";
           st= conecta.prepareStatement(sql);
           st.setString(1,nome);
           st.setString(2,marca);
           st.setDouble(3,preco);
           st.setInt(4,codigo);
           

           st.executeUpdate();
           out.print("os dados do produto" + codigo + " foram alterados confia");
           
           
       %>
    </body>
</html>
