<!doctype html>


<%
    String sqlStatement = (String) session.getAttribute("sqlStatement");
    if (sqlStatement == null) {
        sqlStatement = "";
    }
    String message = (String) session.getAttribute("message");
    if (message == null) {
        message = " ";
    }

%>










<html>


    <head>
        <title>Client-Level User Page</title>
        
        
        <style>
            h1 {
                color: #000000;
                font-family: "Arial";
                font-size: 30px;
                font-weight: bold;
                text-align: center;
            }
            h2 {
                color: #000000;
                font-family: "Arial";
                font-size: 20px;
                font-weight: bold;
                text-align: center;
            }
            p.main {
                color: #000000;
                font-family: "Arial";
                font-size: 18px;
                font-weight: normal;
                text-align: center;
            }
            p.highlight {
                color: #000000;
                font-family: "Arial";
                font-size: 14px;
                font-weight: bold;
                text-align: center;
            }
            table {
                border: 1px solid black;
                border-collapse: collapse;
                width: 20%;
                padding: 5px;
                text-align: left;


            }
            th {
                border: 1px solid black;
                border-collapse: collapse;
                width: 100%;
                padding: 5px;
                text-align: center;
                background-color: #000000;
                color: #ffffff;
            }
            td {
                border: 1px solid black;
                border-collapse: collapse;
                width: 100%;
                padding: 5px;
                text-align: left;
            }
            input[type=submit] {
                background-color: #000000;
                border: none;
                color: #991c1c;
                padding: 5px 10px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
            }
            input[type=reset] {
                background-color: #000000;
                border: none;
                color: #ffffff;
                padding: 5px 10px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
                align-self: center;
            }
            input[type=button] {
                background-color: #000000;
                border: none;
                color: #ffffff;
                padding: 5px 10px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
                text-align: center;
                
            }
            textarea {
                width: 50%;
                height: 100%;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                font-size: 16px;
                resize: none;
            }
            .outerDiv {
                width: 100%;
                height: 100%;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                font-size: 16px;
                resize: none;
            }

            h3 {
                color: #000000;
                font-family: "Arial";
                font-size: 14px;
                font-weight: normal;
                text-align: center;
            }
            h4 {
                color: #ffffff;
                font-family: "Arial";
                font-size: 14px;
                font-weight: normal;
                text-align: center;
            }

            body {
                background-color: #85505062;
            }

            .highlight {
                color: #ff0000;
                font-family: "Arial";
                font-size: 14px;
                font-weight: bold;
                text-align: center;
            }

            h4 {
                color: #000000;
                font-family: "Arial";
                font-size: 14px;
                font-weight: normal;
                text-align: center;
                font-weight: bold;
            }
            

            

            

        </style>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script type="text/javascript">
            function eraseText()    {
                $("#cmd").html("");
            }
        </script>
        <script type="text/javascript">
            function eraseResult()    {
                $("#result").remove();
                
                

                

            }
        </script>


    </head>    



    <body>
        <h1>Welcome to the spring 2023 Project 4 Enterprise System</h1>
    
        <h2> A servlet/JSP-based Multi-tiered Enterprise Appplication Using A Tomcat Container and MySQL Database</h1>
        
        </br>
            <p class="main">You are connected to the Project 4 Enterprise System database as a <span class="highlight">CLIENT</span>-level user.</p>
            </br>
        <h3>
            <form action="ClientUserApp" method="post">
                <textarea id="cmd" name="sqlStatement" cols=60 rows=8></textarea>
                <br>
                <input type="submit" value="Execute SQL Command"> &nbsp; &nbsp; &nbsp;
                <input type="reset" value="Reset Form" onclick="javascript:eraseText();"/> &nbsp; &nbsp; &nbsp;
                <input type="button" value="Clear Results" onclick="javascript:eraseResult();"/>
            </form>
            
        </h3>
            <p class="main"> <br/> All execution results will appear below: </p>
            <br>
            <center>
                <p>
                    <h4>Database Results:</h4><br>
                    <!-- <table id="result1" name="currentResult"> -->
                        <%=message%>
                    <!-- </table> -->
                </p>

            </hr>
            </center>
    </body>


</html>







