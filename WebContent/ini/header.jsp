<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Library Management System</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
        <script src="../assets/vendor/bootstrap/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="">Library Management System</a>
                </div>

                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li>
                            <a class="dropdown-toggle" href="Books.jsp">Books</a>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Classification <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="MainClassification.jsp">Main Classification</a></li>
                                <li><a href="SubClassification.jsp">Sub Classification</a></li>

                            </ul>
                    </ul>


<!--
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a>
                        </li>
                    </ul>
-->               
                    
                    
                </div>
            </div>
        </nav>
    </body>
</html>
