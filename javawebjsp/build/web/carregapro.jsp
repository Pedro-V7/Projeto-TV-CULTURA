<%@page import ="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produto</title>
    </head>
    <body>
        <% 
        int c ;
        c=Integer.parseInt(request.getParameter("codigo"));
        
        Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
          

           String url="jdbc:mysql://localhost:3307/bancojsp";
           String user = "root";
           String password="";
           conecta=DriverManager.getConnection(url,user,password);
           
           
           //BUSCAR OS PRODUTOS PELO CÓDIGO 
           
           String sql="SELECT * FROM produto WHERE  codigo = ?";
           st= conecta.prepareStatement(sql);
           st.setInt(1,c);
           
           ResultSet resultado = st.executeQuery();
           

           if(!resultado.next()){
                out.print("não achei esse produto");
            }
            else{  
        %>
        
        <form method="get" action="alterar_produto.jsp">
            <p>
                <label for="codigo"> Codigo: </label>
                <input type="number" name="codigo" id="codigo" value="<%=resultado.getString("codigo")%>">
            </p>
            <p>
                <label for="nome"> nome do produto: </label>
                <input type="text" name="nome" id="nome" value="<%=resultado.getString("nome")%>">
            </p>
            <p>
                <label for="Marca"> Marca do produto: </label>
                <input type="text" name="marca" id="marca" value="<%=resultado.getString("marca")%>">
            </p>
            <p>
                <label for="preco"> preço do produto: </label>
                <input type="number" name="preco" id="preco" value="<%=resultado.getString("preco")%>">
            </p>
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        </form>
            <%
                }
            %>
    </body>
</html>
