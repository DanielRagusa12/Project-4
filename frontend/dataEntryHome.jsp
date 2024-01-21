<!doctype html>


<%
    String message = (String) session.getAttribute("message");
    if (message == null) {
        message = " ";
    }


    String Suppliers_param1 = (String) session.getAttribute("Suppliers_param1");
    if (Suppliers_param1 == null) {
        Suppliers_param1 = "";
    }
    String Suppliers_param2 = (String) session.getAttribute("Suppliers_param2");
    if (Suppliers_param2 == null) {
        Suppliers_param2 = "";
    }
    String Suppliers_param3 = (String) session.getAttribute("Suppliers_param3");
    if (Suppliers_param3 == null) {
        Suppliers_param3 = "";
    }
    String Suppliers_param4 = (String) session.getAttribute("Suppliers_param4");
    if (Suppliers_param4 == null) {
        Suppliers_param4 = "";
    }


    String Parts_param1 = (String) session.getAttribute("Parts_param1");
    if (Parts_param1 == null) {
        Parts_param1 = "";
    }
    String Parts_param2 = (String) session.getAttribute("Parts_param2");
    if (Parts_param2 == null) {
        Parts_param2 = "";
    }
    String Parts_param3 = (String) session.getAttribute("Parts_param3");
    if (Parts_param3 == null) {
        Parts_param3 = "";
    }
    String Parts_param4 = (String) session.getAttribute("Parts_param4");
    if (Parts_param4 == null) {
        Parts_param4 = "";
    }
    String Parts_param5 = (String) session.getAttribute("Parts_param5");
    if (Parts_param5 == null) {
        Parts_param5 = "";
    }


    String Jobs_param1 = (String) session.getAttribute("Jobs_param1");
    if (Jobs_param1 == null) {
        Jobs_param1 = "";
    }
    String Jobs_param2 = (String) session.getAttribute("Jobs_param2");
    if (Jobs_param2 == null) {
        Jobs_param2 = "";
    }
    String Jobs_param3 = (String) session.getAttribute("Jobs_param3");
    if (Jobs_param3 == null) {
        Jobs_param3 = "";
    }
    String Jobs_param4 = (String) session.getAttribute("Jobs_param4");
    if (Jobs_param4 == null) {
        Jobs_param4 = "";
    }


    String Shipment_param1 = (String) session.getAttribute("Shipment_param1");
    if (Shipment_param1 == null) {
        Shipment_param1 = "";
    }
    String Shipment_param2 = (String) session.getAttribute("Shipment_param2");
    if (Shipment_param2 == null) {
        Shipment_param2 = "";
    }
    String Shipment_param3 = (String) session.getAttribute("Shipment_param3");
    if (Shipment_param3 == null) {
        Shipment_param3 = "";
    }
    String Shipment_param4 = (String) session.getAttribute("Shipment_param4");
    if (Shipment_param4 == null) {
        Shipment_param4 = "";
    }
    
    
    

%>



<html>
  <head>
    <title>Four Side by Side Text Areas</title>
    <style>
      label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
      }
      
      textarea {
        display: block;
        width: 100%;
        max-width: 300px;
        height: 20px;
        margin-right: 10px;
        padding: 5px;
        font-size: 16px;
        border: 1px solid #000000;
        resize: none;
        width: 50%;
      }
      
      .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        width: 50%;
      }

      /* .box {
        width: 100%;
        max-width: 300px;
        margin-bottom: 20px;
        position: relative;
        display: inline-block;
      } */
      
      

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

        

        .main {
            text-align: center;
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            color: #ffffff;
        }

        body {
            background-color: #00000081;
        }

        label {
            text-align: left;
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            color: #000000;
        }

        .clear-btn {
        display: inline-block;
        margin-top: 20px;
        margin-left: 10px;
        padding: 10px;
        background-color: #9b1818;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      .submit-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 10px;
        background-color: #00ba13;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }


      p.highlight {
        text-align: center;
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        color: #ffffff;
        font-size: large;
      }

      p {
        text-align: left;
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        color: #ffffff;
      }

      

      table {
                border: 1px solid rgb(255, 255, 255);
                border-collapse: collapse;
                width: 20%;
                padding: 5px;
                text-align: left;
                color: #ffffff;


            }

      h4 {
        text-align: center;
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        color: #000000;
        font-size: x-large;
        font-weight: bold;
      }


      .errorSpan {
        color: rgb(255, 255, 255);
      }

      .highlight {
                color: #ff0000;
                font-family: "Arial";
                font-size: 14px;
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

        p {
                color: #000000;
                font-family: "Arial";
                font-size: 18px;
                font-weight: normal;
                text-align: left;
            }


      

      

      

      
        
        
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">
        function eraseResult()    {
          $('textarea').val('');
          $("#result").remove();
          
            
        }
    </script>





  </head>

  <body>
    
    <h1>Welcome to the spring 2023 Project 4 Enterprise System</h1>
    
        <h2> A servlet/JSP-based Multi-tiered Enterprise Appplication Using A Tomcat Container and MySQL Database</h1>
        <p class="main">You are connected to the Project 4 Enterprise System database as a <span class="highlight">DATA-ENTRY</span>-level user.</p>
        </br>
            
            
            
          
    <!-- <div class="container"> -->
    <!-- FORM 1 -------------------------------------------------------------- -->
    
    <form action="AddSuppliersApp" method="post">
        <hr>  
        <p>Suppliers Record Insert</p>
        <div class="container">
   
        <div> 
          <label for="text-area-1">snum</label>
          <textarea id="text-area-1" name="Suppliers_param1"></textarea>
        </div>
        <div>
          <label for="text-area-2">sname</label>
          <textarea id="text-area-1" name="Suppliers_param2"></textarea>
        </div>
        <div>
          <label for="text-area-3">status</label>
          <textarea id="text-area-1" name="Suppliers_param3"></textarea>
        </div>
        <div>
          <label for="text-area-4">city</label>
          <textarea id="" name="Suppliers_param4"></textarea>
        </div>
        </div>
      
      <button class="submit-btn" type="submit">Submit</button>
      <input class="clear-btn" type="button" value="Clear Results" onclick="javascript:eraseResult();"/>
      <!-- <hr> -->
    </form>

    <!-- FORM 2 -------------------------------------------------------------- -->

    <form action="AddPartsApp" method="post">
        <hr>  
        <p>Parts Record Insert</p>
        <div class="container">
   
        <div> 
          <label for="text-area-1">pnum</label>
          <textarea id="text-area-1" name="Parts_param1"></textarea>
        </div>
        <div>
          <label for="text-area-2">pname</label>
          <textarea id="text-area-1" name="Parts_param2"></textarea>
        </div>
        <div>
          <label for="text-area-3">color</label>
          <textarea id="text-area-1" name="Parts_param3"></textarea>
        </div>
        <div>
          <label for="text-area-3">weight</label>
          <textarea id="text-area-1" name="Parts_param4"></textarea>
        </div>
        <div>
          <label for="text-area-4">city</label>
          <textarea id="" name="Parts_param5"></textarea>
        </div>
        </div>
      
      <button class="submit-btn" type="submit">Submit</button>
      <input class="clear-btn" type="button" value="Clear Results" onclick="javascript:eraseResult();"/>
      <!-- <hr> -->
    </form>



    <!-- FORM 3 -------------------------------------------------------------- -->
    <form action="AddJobsApp" method="post">
      <hr>  
      <p>Jobs Record Insert</p>
      <div class="container">
 
      <div> 
        <label for="text-area-1">jnum</label>
        <textarea id="text-area-1" name="Jobs_param1"></textarea>
      </div>
      <div>
        <label for="text-area-2">jname</label>
        <textarea id="text-area-1" name="Jobs_param2"></textarea>
      </div>
      <div>
        <label for="text-area-3">numworkers</label>
        <textarea id="text-area-1" name="Jobs_param3"></textarea>
      </div>
      <div>
        <label for="text-area-3">city</label>
        <textarea id="text-area-1" name="Jobs_param4"></textarea>
      </div>
      
      </div>
    
    <button class="submit-btn" type="submit">Submit</button>
    <input class="clear-btn" type="button" value="Clear Results" onclick="javascript:eraseResult();"/>
    <!-- <hr> -->
  </form>


  <!-- FORM 4 -------------------------------------------------------------- -->

  <form action="AddShipmentApp" method="post">
    <hr>  
    <p>Shipment Record Insert</p>
    <div class="container">

    <div> 
      <label for="text-area-1">snum</label>
      <textarea id="text-area-1" name="Shipment_param1"></textarea>
    </div>
    <div>
      <label for="text-area-2">pnum</label>
      <textarea id="text-area-1" name="Shipment_param2"></textarea>
    </div>
    <div>
      <label for="text-area-3">jnum</label>
      <textarea id="text-area-1" name="Shipment_param3"></textarea>
    </div>
    <div>
      <label for="text-area-3">quantity</label>
      <textarea id="text-area-1" name="Shipment_param4"></textarea>
    </div>
    
    </div>
  
  <button class="submit-btn" type="submit">Submit</button>
  <input class="clear-btn" type="button" value="Clear Results" onclick="javascript:eraseResult();"/>
  <hr>
</form>









  <!-- </div> -->





    <center>
      <p>
          <h4>Database Results:</h4><br>
          
              <%=message%>
          
      </p>

  </hr>
  </center>
    
  </body>
</html>



