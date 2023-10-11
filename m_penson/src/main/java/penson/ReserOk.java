package penson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReserOk extends HttpServlet {
    private static final long serialVersionUID = 1L;
    dbconfig db = null;
    PreparedStatement ps = null;

    public ReserOk() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String mname = request.getParameter("pnm");
        String mchoice = request.getParameter("r_select");
        String date_choice = request.getParameter("date_select");
        String mpurchase = request.getParameter("pmoney");
        String mreser_name = request.getParameter("pname");
        String mreser_id = (String) request.getSession().getAttribute("userid");
        String mphone_num = request.getParameter("ptel");
        String checkin_personnel = request.getParameter("per_select");
        String email = request.getParameter("pemail");

        PrintWriter pw = response.getWriter();
        if (mname == null || mname.equals("") || mchoice == null || mchoice.equals("") || date_choice == null || date_choice.equals("") || mpurchase == null || mpurchase.equals("") || mreser_name == null || mreser_name.equals("") || mreser_id == null || mreser_id.equals("") || mphone_num == null || mphone_num.equals("") || checkin_personnel == null || checkin_personnel.equals("") || email == null || email.equals("")) {
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
                String sql = "insert into penson_room values ("
                        + "'0', ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
                this.ps = con.prepareStatement(sql);
                this.ps.setString(1, mname);
                this.ps.setString(2, mchoice);
                this.ps.setString(3, date_choice);
                this.ps.setString(4, mpurchase);
                this.ps.setString(5, mreser_name);
                this.ps.setString(6, mreser_id);
                this.ps.setString(7, mphone_num);
                this.ps.setString(8, checkin_personnel);
                this.ps.setString(9, email);

                int call = this.ps.executeUpdate();
                String msg = "";
                if(call > 0) {
                    msg = "정상적으로 예약이 완료되었습니다.";
                    this.ps.close();
                    con.close();

                }
                else {
                    msg = "예약이 원활하게 진행되지 않았습니다.";
                }
                pw.write("<script>"
                    + "alert('"+msg+"');"
                    + "location.href='./index.jsp';"
                    + "</script>");
                this.ps.close();
                pw.close();
            }
            catch(Exception e) {
                System.out.println("Database 정보 오류!!");
                pw.write("<script>"
                        + "alert('Database 정보 오류!!');"
                        + "history.go(-1);"
                        + "</script>");
            }
        }
    }
}