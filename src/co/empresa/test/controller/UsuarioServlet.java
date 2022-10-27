package co.empresa.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.empresa.test.dao.UsuarioDao;
import co.empresa.test.modelo.Usuario;

@WebServlet("/")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioDao usuarioDao;
      
    public UsuarioServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		this.usuarioDao = new UsuarioDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/new": 
				showNewForm(request, response);
				break;			
			case "/insert":
				insertarUsuario(request, response);
				break;
			case "/delete":
				eliminarUsuario(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				actualizarUsuario(request, response);
				break;
			default:
				listUsuario(request,response);
				break;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException , IOException{
		
		RequestDispatcher dispacher = request.getRequestDispatcher("usuario.jsp");
		dispacher.forward(request, response);		
	}
	
	private void insertarUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String pais = request.getParameter("pais");
		
		Usuario usuario = new Usuario(nombre,email,pais);
		
		usuarioDao.insert(usuario);
		
		response.sendRedirect("list");
		
	}
		
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException , IOException{
			
		int id = Integer.parseInt(request.getParameter("id"));
		
		Usuario usuarioActual = usuarioDao.select(id);
		
		request.setAttribute("usuario", usuarioActual);
		
		RequestDispatcher dispacher = request.getRequestDispatcher("usuario.jsp");
		dispacher.forward(request, response);		
	}
	
	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		
		int id = Integer.parseInt(request.getParameter("id"));
	
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String pais = request.getParameter("pais");
		
		Usuario usuario = new Usuario(id, nombre, email, pais);
		
		usuarioDao.update(usuario);
		
		response.sendRedirect("list");
		
	}
	
	private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		
		int id = Integer.parseInt(request.getParameter("id"));			
		usuarioDao.delete(id);		
		response.sendRedirect("list");		
	}
	
	private void listUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		
		
		List<Usuario> listUsuarios = usuarioDao.selectAll();
		
		request.setAttribute("listUsuario", listUsuarios);
		
		RequestDispatcher dispacher = request.getRequestDispatcher("usuariolist.jsp");
		dispacher.forward(request, response);
	}

}
