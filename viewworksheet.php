<html>
  <head>
    <title>HRWC | View Worksheet </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
  </head>
<body>
<div class="row-fluid">
    <div class="span12 headerbg"> 
        <div class="row-fluid">
            <div class="span7">
                <img src="img/logo.png">
            </div>
            <div class="span5">
                <div class="navbar">
                    <div class="navbar-inner"> 
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                <div class="nav-collapse">
          <ul class="nav">
            <li><a href="addsite.php">Home</a></li>
            <li><a href="addsite.php">Add New Site</a></li>
            <!--Need URL -->
            <li><a href="#">Query</a></li>
            <!--Need URL-->
            <li><a href="#">Log Out</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div>
    </div><!-- /navbar-inner -->
  </div><!-- /navbar -->
            </div>
                </div>
            </div>
        </div>
        </div>
    </div>
<ul class="breadcrumb">
<!--Should Home be login page? -->
        <li>Home<span class="divider">/</span></li>
        <li><a href="addsite.php">Add New Site</a> <span class="divider">/</span></li>     
        <li><a href="sitereview.php">Site Details <span class="divider">/</span></li>
        <li><a href="addworksheet.php">Add Worksheet</a><span class="divider">/</span></li>
        <li class="active"><a href="viewworksheet.php">View Worksheet</a></li>
      </ul>
    </div>
<?php
require_once "db.php";
session_start();

// Post Action - What happens when the User clicks save button 

$siteuid = mysql_real_escape_string($_GET['siteuid']);

// The site worksheet id for saving into the databse - Siteanswers table
$swsid = mysql_real_escape_string($_GET['swsid']);
$wstypeid = mysql_real_escape_string($_GET['wstypeid']);

///// ERROR VARIABLES FOR THE SESSIONS - should be used in case of session variables

if ( isset($_SESSION['error']) ) {
    echo '<p style="color:red">'.$_SESSION['error']."</p>\n";
    unset($_SESSION['error']);
}
if ( isset($_SESSION['success']) ) {
    echo '<p style="color:green">'.$_SESSION['success']."</p>\n";
    unset($_SESSION['success']);
}



// Query for extracting all the questions for the specific worksheet ordered by the question order. This will return the question 
// descriptions and ordered by the question order column in the table

$questions = mysql_query("SELECT id, question_desc FROM Worksheetquesmap WHERE worksheettype_id = '$wstypeid' ORDER BY question_order ASC");

// Query for fetching the worksheet name based on the 

$title = mysql_query ("SELECT worksheet_name FROM Worksheettypes WHERE id = '$wstypeid'");

/// Displaying the Heading of the Worksheet Dynamically from the id passed using the URL
while ($titlerow = mysql_fetch_row($title)){
        echo "<h1>$titlerow[0] Worksheet</h1>";
}

// FORM STARTS HERE for rendering the form options////////////

// Rendering the question descriptions on the html page
while ( $row = mysql_fetch_row($questions)) {
    echo "<h4>";
    echo($row[1]);
    echo "</h4>";
    echo "<p>";
    $answers = mysql_query ("SELECT Siteanswers.options_id, Quesansmap.options_desc
FROM Siteanswers
JOIN Quesansmap
ON Siteanswers.options_id=Quesansmap.id
WHERE Siteanswers.siteworksheet_id = '$swsid' AND Quesansmap.question_id = '$row[0]'");
    echo "<ul>";
    while ( $row1 = mysql_fetch_row($answers) ) {
    // Displaying the options for the 
    echo ("<li>$row1[1]</li>");
    }
    echo "</ul>";
}
echo "<p><input type = 'submit' Value = 'Submit'>";
echo "<a href='sitereview.php'>Cancel</a></p>";
?>