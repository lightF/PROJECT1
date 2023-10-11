package penson;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class m_loginok extends HttpServlet {
	private static final long serialVersionUID = 1L;
	dbconfig db = null;
	PreparedStatement ps = null;

    public m_loginok() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");

        Connection con = null;
        try {
            this.db = new dbconfig();
            con = this.db.dbinfo();

            String sql = "SELECT * FROM member_person WHERE mid=? AND mpass=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, uid);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userid", rs.getString("mid"));
                session.setAttribute("username", rs.getString("mname"));
                session.setAttribute("usertel", rs.getString("mtel"));
                session.setAttribute("useremail", rs.getString("memail"));

                response.sendRedirect("./index.jsp");
            }
        } catch (Exception e) {
            System.out.println("Database 정보 오류!!");
        }
    }
}
