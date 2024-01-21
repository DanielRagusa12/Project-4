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



public class AddShipmentServlet extends HttpServlet
{

    private String message;
    private Connection connect;
    private PreparedStatement preparedStatement;
    private PreparedStatement bLStatement;
    private int mysqlReturnValue;
    private int updateReturnValue;


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String snum = request.getParameter("Shipment_param1");
        String pnum = request.getParameter("Shipment_param2");
        String jnum = request.getParameter("Shipment_param3");
        String quantity = request.getParameter("Shipment_param4");
        if (quantity == null || quantity == "") {
            quantity = "0";
        }
        int numWorkersInt = Integer.parseInt(quantity);
        
        message = null;

        System.out.println("snum: " + snum);
        System.out.println("pnum: " + pnum);
        System.out.println("jnum: " + jnum);
        System.out.println("quantity: " + quantity);

    


        try {

            Properties props = new Properties();
            FileInputStream in = null;
            MysqlDataSource dataSource = null;

            in = new FileInputStream("C:\\tomcat10\\webapps\\Project4\\WEB-INF\\lib\\data-entry.properties");
            props.load(in);

            dataSource = new MysqlDataSource();
            dataSource.setURL(props.getProperty("MYSQL_DB_URL"));
            dataSource.setUser(props.getProperty("MYSQL_DB_USERNAME"));
    	    dataSource.setPassword(props.getProperty("MYSQL_DB_PASSWORD"));


            connect = dataSource.getConnection();



            String sqlStatement = "insert into shipments values (?, ?, ?, ?)";
            preparedStatement = connect.prepareStatement(sqlStatement);
            preparedStatement.setString(1, snum);
            preparedStatement.setString(2, pnum);
            preparedStatement.setString(3, jnum);
            preparedStatement.setInt(4, numWorkersInt);
            System.out.println("mysqlStatement: " + preparedStatement);
            mysqlReturnValue = preparedStatement.executeUpdate();

            


            String returnRecord = "New Shipment record: (" + snum + ", " + pnum + ", " + jnum + ", " + numWorkersInt + ") - successfully entered into the database.";


            message = "<div style=\"background-color:green\" id=\"result\">";
            
            


            String BLCommand = "update suppliers set status = status + 5  where snum = ?";
            bLStatement = connect.prepareStatement(BLCommand);
            bLStatement.setString(1, snum);

            if (mysqlReturnValue != 0 && numWorkersInt >= 100)
            {
                updateReturnValue = bLStatement.executeUpdate();
                if (updateReturnValue != 0)
                {
                    message += "<h2>" + returnRecord + "</br>Business logic triggered." + "</h2>";
                }

            }
            else if (mysqlReturnValue != 0 && numWorkersInt < 100)
            {
                message += "<h2>" + returnRecord + "</br>Business logic not triggered." + "</h2>";
            }





            message += "</div>";



            // message = "<table id=\"result\">";
            // message += "<tr>";
            // message += "<th>" + "Rows affected: " + mysqlReturnValue + "</th>";
            // message += "</tr>";
            // message += "</table>";
            


            




            bLStatement.close();
            preparedStatement.close();





        }

        catch (SQLException e) {
            // message = "<table id=\"result\">";
            // message += "<tr>";
            // message += "<th>" + "Error: " + e + "</th>";
            // message += "</tr>";
            // message += "</table>";

            message = "<div style=\"background-color:red\" id=\"result\">";
            message += "<h2>" + "Error Executing the SQL statement:</h2>";
            
            message += "<div style=\"background-color:white\">";
            message += "<h2>" + e + "</h2>";

           
            message += "</div>";

        }

        


        System.out.println(message);


        HttpSession session = request.getSession();
        session.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/dataEntryHome.jsp");
        dispatcher.forward(request, response);


        





    }








    
}

