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
           //conecta com a outra página
           int codigo;
           String nome;
           String marca;
           double preco;
           codigo = Integer.parseInt(request.getParameter("codigo"));
           nome = request.getParameter("nome");
           marca = request.getParameter("marca");
           preco = Double.parseDouble(request.getParameter("preco"));
           
           
           try{
           //conecta com o banco
           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
          

           String url="jdbc:mysql://localhost:3307/bancojsp";
           String user = "root";
           String password="";
           conecta=DriverManager.getConnection(url,user,password);
           
           //INSERE OS DADOS NA TABELA PRODUTO
           //
           
           String sql="INSERT INTO produto VALUES (?,?,?,?)";
           st= conecta.prepareStatement(sql);
           st.setInt(1,codigo);
           st.setString(2, nome);
           st.setString(3, marca);
           st.setDouble(4, preco);
           st.executeUpdate(); //executa o comando INSERT
           out.print("<p><strong>Produto cadastrado com sucesso</strong></p>");
            }
            catch(Exception x ){
            String erro = x.getMessage();
            if(erro.contains("Duplicate entry")){
            out.print("<p style='color:blue; font-size:30px;'>Este produto ja foi cadastrado cabeça </p>");
            }
            else{
            out.print("<p style='color:blue; font-size:30px;'>mensagem de erro: </p>"+ x.getMessage());
            }
            }
           
        
        %>
    </body>
</html>
