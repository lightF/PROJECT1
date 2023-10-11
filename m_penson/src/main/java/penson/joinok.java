package penson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class joinok extends HttpServlet {
	private static final long serialVersionUID = 1L;
	dbconfig db = null;
	PreparedStatement ps = null;
	
    public joinok() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String mid = request.getParameter("mid");
        String mname = request.getParameter("mname");
        String mpass = request.getParameter("mpassword");
        String memail = request.getParameter("memail");
        String mtel = request.getParameter("mtel");

        PrintWriter pw = response.getWriter(); //스크립트 출력
        if (mid == null || mid.equals("") || mname == null || mname.equals("") || mpass == null || mpass.equals("") || memail == null || memail.equals("") || mtel == null || mtel.equals("")) {
            pw.write("<script>"
                    + "alert('올바른 정보가 전달되지 않으셨습니다.');"
                    + "history.go(-1);"
                    + "</script>");
        }
        else {
            Connection con = null;
            try {
                this.db = new dbconfig();
                con = this.db.dbinfo();
                //람다식 형태의 코드로 작성
                String sql = "insert into member_person values ("
                        + "'0', ?, ?, ?, ?, ?, now())";
                this.ps = con.prepareStatement(sql);
                this.ps.setString(1, mid);
                this.ps.setString(2, mname);
                this.ps.setString(3, mpass);
                this.ps.setString(4, memail);
                this.ps.setString(5, mtel);

                int call = this.ps.executeUpdate();
                String msg = "";
                if(call > 0) {
                    msg = "정상적으로 회원가입이 완료되었습니다.";
                    this.ps.close();
                    con.close();

                }
                else {
                    msg = "회원가입이 원활하게 진행되지 않았습니다.";
                }
                pw.write("<script>"
                    + "alert('"+msg+"');"
                    + "location.href='./index.jsp';"
                    + "</script>");
            }
            catch(Exception e) {
                System.out.println("Database 정보 오류!!");
                pw.write("<script>"
                        + "alert('Database 정보 오류!!');"
                        + "history.go(-1);"
                        + "</script>");
            }
            finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (Exception e) {}
                }
            }
        }
    }
}