<%@page import="java.util.ArrayList" %>
<%@page import="com.emergentes.modelo.Registro" %>
<%
   if (session.getAttribute("vaculist")== null) {
           ArrayList<Registro> lis = new ArrayList<Registro>();
           session.setAttribute("vaculist", lis);
    }
    ArrayList<Registro> lista = (ArrayList<Registro>)session.getAttribute("vaculist");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Registros</title>
        <style>
            body{
                background: lightgray;
            }
            #container {
                background: lightskyblue;
                width: 50%;
                height: 100%;
                padding: 5px;
            }
            table{border-collapse: collapse;}
            th, tr, td{
                border: 1px solid #000;
                width: 150px;
                height: 45px;
                vertical-align: middle;
                text-align: center;
            }
            th {
                color: #fff;
                background-color: #252525;
            }
            tr:nth-child(odd) td{
                background-color: #eee;
            }
            .boton{
                font-size: 15px;
                padding: 5px;
                font-family: Verdana, Helvetica;
                font-weight: bold;
                color: white;
                background: #638cb5;
                border:0px;
                width: 200px;
                height: 80px;
            }
        </style>
            
    </head>
    <body>
        <div id="container">
            <h2 style="color:blue">PRIMER PARCIAL TEM-742</h2>
            <p style="color:blue"><strong style="color:red">NOMBRE:</strong> Juan Daniel Mamani quispe </p>
            <p style="color:blue"><strong style="color:red">CARNET:</strong> 13606050 LP </p>
        </div>
        <h1 style="color:green">Listado de Personas Vacunadas!</h1>
        <a href="MainServlet?op=nuevo" class="boton">Nuevo Registro</a>
        <table border = "1">
            <tr>
                <th>Id</th>
                <th>Nombre y Apellido</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                <th></th>
                <th></th>
                
            </tr>
            <%
                if (lista != null) {
                   for (Registro item: lista) {
                  
            %>
            <tr>
                <td> <%= item.getId() %> </td>
                <td> <%= item.getNombre() %> </td>
                <td> <%= item.getPeso()%> </td>
                <td> <%= item.getTalla() %> </td>
                <td> <%= item.getVacuna() %> </td>
                <td> <a href="MainServlet?op=editar&id=<%= item.getId()%>" class="boton"> Editar</a> </td>
                <td> <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                        onclick="return(confirm('Esta que desea Eliminar el registro??'))" class="boton">Eliminar</a> </td>   
            </tr>
            <%
              }
            }
            %>
            
        </table>
        
    </body>
</html>
