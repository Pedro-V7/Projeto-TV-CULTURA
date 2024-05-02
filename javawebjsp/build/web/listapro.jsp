<%@page import ="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            
            try{
            
            //fazendo a conexão com o banco de dados
           Connection conecta;
           PreparedStatement st;
           Class.forName("com.mysql.cj.jdbc.Driver");
          

           String url="jdbc:mysql://localhost:3307/bancojsp";
           String user = "root";
           String password="";
           conecta=DriverManager.getConnection(url,user,password);
           
 

            //os dados da tabela produtos do banco de dados
            
            String sql =("SELECT * FROM produto");
            st = conecta.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            //ResultSet serve para guardar aquilo que é trazido do banco de dados
            %>
            
            <table border="1">
                <tr>
                    <th>
                        Código
                    </th>
                    <th>
                        Nome
                    </th>
                    <th>
                        Marca
                    </th>
                    <th>
                        Preco
                    </th>
                    <th>
                        Arrasta pra cima
                    </th>
                </tr>
                <%
                while (rs.next()){
                %>
                
                <tr>
                <td>
                    <%=rs.getString("codigo")%>
                </td>
                <td>
                    <%=rs.getString("nome")%>
                </td>
                <td>
                    <%=rs.getString("marca")%>
                </td>
                <td>
                    <%=rs.getString("preco")%>
                </td>
                
                <td>
                    <a href="excpro.jsp?codigo=<%=rs.getString("codigo") %>">Excluir</a>
                    
                </td>
                </tr>
                <%
                   }
                %>
            </table>
                <%
                    }
                    catch(Exception E){
                            out.print("mensagem de erro" + E);
                            }
                    %>
    </body>
</html>
