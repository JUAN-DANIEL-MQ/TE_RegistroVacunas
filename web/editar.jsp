<%@page import="com.emergentes.modelo.Registro"%> 
<%
  Registro req = (Registro)request.getAttribute("miobjreg");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Edicion</title>
        <style>
            body{
                background: lightgray;
            }
            
            table{border-collapse: collapse;}
            th, tr, td{
                width: 150px;
                height: 45px;
                vertical-align: middle;
                text-align: center;
            }
            th {
                color: #fff;
                background-color: #252525;
            }
            tr:nth-child(odd) {
                background-color: #eee;
            }
            .boton{
                font-size: 20px;
                padding: 10px;
                font-family: Verdana, Helvetica;
                font-weight: bold;
                color: white;
                background: #638cb5;
                border:0px;
                width: 200px;
                height: 80px;
            }
            .uno{
                background-color: yellow;
                border: 1px solid #000;
            }
        </style>
    </head>
    <body>
        <h1 style="color:red" >Registro de Personas Vacunadas!</h1>
        <form action="MainServlet" method="POST">
            <table>
                <tr>
                    <td class="uno">Id</td>
                    <td><input type="text" name="id" value="<%= req.getId() %>" size="2" readonly/></td>
                </tr>
                <tr>
                    <td class="uno">Nombres</td>
                    <td><input type="text" name="nombre" value="<%= req.getNombre() %>" /></td>
                </tr>
                <tr>
                    <td class="uno">Peso(kg)</td>
                    <td><input type="number" name="peso" value="<%= req.getPeso() %>" size="3" /></td>
                </tr>
                <tr>
                    <td class="uno">Talla(m)</td>
                    <td><input type="text" name="talla" value="<%= req.getTalla() %>" size="3" /></td>
                </tr>
                <tr>
                    <td class="uno">Vacuna</td>
                    <td><input type="text" name="vacuna" value="<%= req.getVacuna() %>" size="3" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Registrar" class="boton"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
