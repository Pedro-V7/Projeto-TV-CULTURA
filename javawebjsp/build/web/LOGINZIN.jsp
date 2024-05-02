<%@page import ="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            //conecta na outra página
           String usuario;
           String senha;
           usuario = request.getParameter("usuario");
           senha = request.getParameter("senha");
           
           
           
        //fazendo a conexão com o banco de dados
           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
          

           String url="jdbc:mysql://localhost:3307/bancojsp";
           String user = "root";
           String password="";
           conecta=DriverManager.getConnection(url,user,password);
           

           String sql =("SELECT * FROM login WHERE usuario=? AND senha=? ");
           st = conecta.prepareStatement(sql);
 
           st.setString(1, usuario);
           st.setString(2, senha);
           
           ResultSet consulta = st.executeQuery(); //executa o comando SELECT 
           

          if (!consulta.next()){
                String cert = "ERRO.html";
                response.sendRedirect(cert);
            }
            else{
                String certo = "index.html";
                response.sendRedirect(certo);
            }
 

            
        %>
    </body>
</html>
