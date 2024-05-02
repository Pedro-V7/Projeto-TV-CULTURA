<%@page import ="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eclusão de produtos </title>
    </head>
    <body>
        <%
        //recebe o código digitado no formulario
        int cod;
        cod=Integer.parseInt(request.getParameter("codigo"));
        
         try{
           //conecta com o banco
           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
          

           String url="jdbc:mysql://localhost:3307/bancojsp";
           String user = "root";
           String password="";
           conecta=DriverManager.getConnection(url,user,password);
           
           
           String sql=("DELETE FROM produto WHERE codigo=?");
           
           st=conecta.prepareStatement(sql);
           
           st.setInt(1,cod);
           
           int resultado = st.executeUpdate();
           
           if(resultado == 0){
                out.print("Este produto não existe não cabeça de manga");
            }
            else{
                out.print("O produto: " + cod + "Foi jogar no vasco");
            }
            }
            catch(Exception erro){
                String mensagemErro = erro.getMessage();
                out.print("se ferrou otário");
            }
        %>
    </body>
</html>
