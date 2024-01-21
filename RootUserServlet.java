import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;
import javax.swing.text.html.StyleSheet;

import com.mysql.cj.jdbc.MysqlDataSource;

import java.sql.*;





public class RootUserServlet extends HttpServlet {

    private Connection connect;

    public Statement statement;

    private PreparedStatement bLStatement;

    private int mysqlReturnValue;
    private int updateValue;


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String sqlStatement = request.getParameter("sqlStatement");
        sqlStatement = sqlStatement.replace("\n", "").replace("\r", " ");
        String message = "";
        String quantity = "";

    


        try {

            Properties props = new Properties();
            FileInputStream in = null;
            MysqlDataSource dataSource = null;

            in = new FileInputStream("C:\\tomcat10\\webapps\\Project4\\WEB-INF\\lib\\root.properties");
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

            if (sqlStatement.toLowerCase().startsWith("select")) {

                

                statement = connect.createStatement();
                statement.executeQuery(sqlStatement);

                ResultSet rs = statement.getResultSet();
                ResultSetMetaData rsmd = rs.getMetaData();
                
                // turn result set into html table
                message = "<table id=\"result\">";
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
                message += "</table>";

                rs.close();





            }
            // insert into shipments values ('S1','P4','J2',350)

            else {

                message = "<table id=\"result\">";


                statement = connect.createStatement();
                mysqlReturnValue = statement.executeUpdate(sqlStatement);
                System.out.println("Statement executed successfully here. " + mysqlReturnValue + " row(s) affected.");
                message += "<tr>";
                message += "<th>" + "Statement executed successfully. " + mysqlReturnValue + " row(s) affected." + "</th>";
                message += "</tr>";
                

                


                if (sqlStatement.toLowerCase().startsWith("insert"))
                {
                    System.out.print("inside insert statement");

                    String[] splitStatement = sqlStatement.split(" ");
                    String tableName = splitStatement[2];

                    if (tableName.equals("shipments"))
                    {
                        System.out.print("inside shipments table");

                        if (mysqlReturnValue != 0)
                        {
                            message += "<tr>";
                            message += "<th>" + "Business Logic Detected! - Updating Supplier Status</br>";
                            String BLCommand = "update suppliers set status = status + 5 where snum in (select snum from shipments where quantity >= 100);";
                            bLStatement = connect.prepareStatement(BLCommand);
                            updateValue = bLStatement.executeUpdate();

                            message += "Business Logic updated " + updateValue + " supplier status marks." + "</th>";
                            message += "</tr>";


                        }

                    
                        
                    }

            

                    else
                    {
                        message += "<tr>";
                        message += "<th> Business Logic Not Triggered! </th>";
                        message += "</tr>";

                    }

                    
                }



                if (sqlStatement.toLowerCase().startsWith("update"))
                {
                    System.out.print("inside update statement");

                    String[] splitStatement = sqlStatement.split(" ");
                    String tableName = splitStatement[1];

                    System.out.print("table name: " + tableName);

                    if (tableName.equals("shipments"))
                    {
                        System.out.print("inside shipments table");

                        if (mysqlReturnValue != 0)
                        {
                            message += "<tr>";
                            message += "<th>" + "Business Logic Detected! - Updating Supplier Status</br>";
                            String BLCommand = "update suppliers set status = status + 5 where snum in (select snum from shipments where quantity >= 100);";
                            bLStatement = connect.prepareStatement(BLCommand);
                            updateValue = bLStatement.executeUpdate();

                            message += "Business Logic updated " + updateValue + " supplier status marks." + "</th>";
                            message += "</tr>";


                        }

                    
                        
                    }

            

                    else
                    {
                        message += "<tr>";
                        message += "<th> Business Logic Not Triggered! </th>";
                        message += "</tr>";

                    }

                    
                }


                


                }

                
                
                
                

                


                
            







            


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
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/rootHome.jsp");
        dispatcher.forward(request, response);


        System.out.println("This is the message: " + message);





    }












}



    































