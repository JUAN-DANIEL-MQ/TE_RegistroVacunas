package com.emergentes.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.ArrayList;
import com.emergentes.modelo.Registro;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String opcion = request.getParameter("op");
        Registro objvac = new Registro();
        int id, pos;
        HttpSession ses = request.getSession();
        List<Registro> lista = (List<Registro>)ses.getAttribute("vaculist");
        
        switch(opcion) {
            case "nuevo":
                request.setAttribute("miobjreg", objvac);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                //Obtener la posicion del elemento en la coleccion
                pos = buscarPorIndice(request, id);
                //ONTENER EL OBJETO
                objvac = lista.get(pos);
                //ENVIARLOS PARA LA EDICION
                request.setAttribute("miobjreg", objvac);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                
                break;
            case "eliminar":
                //Obtener la posicion del elemento en la coleccion
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                
                if (pos >= 0) {
                    lista.remove(pos);
                }
                request.setAttribute("vaculist", lista);
                response.sendRedirect("index.jsp");
                
                break;
            default:
                request.setAttribute("vaculist", lista);
                response.sendRedirect("index.jsp");
        }
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Registro> lista = (ArrayList<Registro>) ses.getAttribute("vaculist");
        Registro objvac = new Registro();
        
        objvac.setId(id);
        objvac.setNombre(request.getParameter("nombre"));
        objvac.setPeso(Integer.parseInt(request.getParameter("peso")));
        objvac.setTalla(request.getParameter("talla"));
        objvac.setVacuna(request.getParameter("vacuna"));
        System.out.println("El Id es: "+ id);
        
        if (id == 0) {
            int idNuevo = obtenerId(request);
            objvac.setId(idNuevo);
            
            lista.add(objvac);
            System.out.println(objvac.toString());
        }else{
            //edicion
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objvac);
            System.out.println(objvac.toString());
        }
        System.out.println("Enviando al index");
        request.setAttribute("listaper", lista);
        response.sendRedirect("index.jsp");
    }
    
    public int buscarPorIndice (HttpServletRequest request,int id){
       
        HttpSession ses = request.getSession();
        List<Registro> lista = (List<Registro>)ses.getAttribute("vaculist");
        int pos = -1;
        if (lista != null) {
            for (Registro ele: lista) {
                ++pos;
                if (ele.getId() == id ) {
                    break;
                }
            }
        }
        
        return pos;
     }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Registro> lista = (ArrayList<Registro>) ses.getAttribute("vaculist");
        //Conteo Id desde 0
        int idn = 0;
        for (Registro ele : lista) {
            idn = ele.getId();
        }
         
        return idn + 1;
    }

}
