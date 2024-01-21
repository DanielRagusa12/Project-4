/* Name: Daniel Ragusa
Course: CNT 4714 – Spring 2023 – Project Four
Assignment title: A Three-Tier Distributed Web-Based Application
Date: April 23, 2023
*/








import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.Scanner;

import javax.swing.JOptionPane;





public class authenticationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // setup filereader for credentials.txt
        FileReader fr = new FileReader("C:\\tomcat10\\webapps\\Project4\\WEB-INF\\lib\\credentials.txt");

        // set up buffered reader
        BufferedReader br = new BufferedReader(fr);

        // set up scanner
        Scanner scan = new Scanner(br);

        boolean userCredentialsOK = false;

        try
        {
            // read each line of the file and split username and password by comma
            while(scan.hasNextLine())
            {
                String line = scan.nextLine();
                String[] credentials = line.split(",");

                // check if username and password match
                if(username.equals(credentials[0]) && password.equals(credentials[1]))
                {
                    userCredentialsOK = true;
                    break;
                }
            }
        }

        catch (Exception e)
        {
            System.out.println("Error: " + e);
        }

        finally
        {
            scan.close();
        }


        if(userCredentialsOK)
        {
            // System.out.println("User credentials are OK");
            if (username.equals("root"))
            {
                response.sendRedirect("rootHome.jsp");
            }
            else if (username.equals("client"))
            {
                response.sendRedirect("clientHome.jsp");

            }
            else if (username.equals("data-entry"))
            {
                response.sendRedirect("dataEntryHome.jsp");
            }
            

        }

        else
        {
            response.sendRedirect("errorpage.html");

        }

        
        
    }
}
    

