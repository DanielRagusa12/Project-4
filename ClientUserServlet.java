/* Name: Daniel Ragusa
Course: CNT 4714 – Spring 2023 – Project Four
Assignment title: A Three-Tier Distributed Web-Based Application
Date: April 23, 2023
*/









import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Scanner;

import javax.swing.JOptionPane;
import javax.swing.text.html.StyleSheet;

import com.mysql.cj.jdbc.MysqlDataSource;

import java.sql.*;





public class ClientUserServlet extends HttpServlet {

    private Connection connect;

    public Statement statement;


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String sqlStatement = request.getParameter("sqlStatement");
        String message = "";

    


        try {

            Properties props = new Properties();
            FileInputStream in = null;
            MysqlDataSource dataSource = null;

            in = new FileInputStream("C:\\tomcat10\\webapps\\Project4\\WEB-INF\\lib\\client.properties");
            props.load(in);

            dataSource = new MysqlDataSource();
            dataSource.setURL(props.getProperty("MYSQL_DB_URL"));
            dataSource.setUser(props.getProperty("MYSQL_DB_USERNAME"));
    	    dataSource.setPassword(props.getProperty("MYSQL_DB_PASSWORD"));


            connect = dataSource.getConnection();

            // response.sendRedirect("http://localhost:8080/Project4/rootHome.jsp");
                            
            // System.out.println("Database connected");
            // StatusLabel.setText("CONNECTED TO: " + dataSource.getURL());

            // check to see if sql command is query
            message = "<table id=\"result\">";

            if (sqlStatement.toLowerCase().startsWith("select")) {

                

                statement = connect.createStatement();
                statement.executeQuery(sqlStatement);

                ResultSet rs = statement.getResultSet();
                ResultSetMetaData rsmd = rs.getMetaData();
                
                // turn result set into html table
                
                message += "<tr>";
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    message += "<th>" + rsmd.getColumnName(i) + "</th>";
                }
                message += "</tr>";
                while (rs.next()) {
                    message += "<tr>";
                    for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                        message += "<td>" + rs.getString(i) + "</td>";
                    }
                    message += "</tr>";
                }
                

                rs.close();





            }

            else
            {
                statement = connect.createStatement();
                statement.executeUpdate(sqlStatement);
                
            }

            


            message += "</table>";







            


        }

        catch (SQLException e) {
            message = "<table id=\"result\">";
            message += "<tr>";
            message += "<th>" + "Error: " + e + "</th>";
            message += "</tr>";
            message += "</table>";
        }


        HttpSession session = request.getSession();
        session.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/clientHome.jsp");
        dispatcher.forward(request, response);


        System.out.println("This is the message: " + message);





    }












}



    































