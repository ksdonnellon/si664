<?php
require_once "db.php";

// Checking the Cookie Exists for the user login information

if(isset($_COOKIE['ID_my_site'])) 

 { 

 	$username = $_COOKIE['ID_my_site']; 

 	$pass = $_COOKIE['Key_my_site']; 

 	 	$check = mysql_query("SELECT * FROM Loginusers WHERE username = '$username'")or die(mysql_error()); 

 	while($info = mysql_fetch_array($check)) 	 

 		{ 

 //if the cookie has the wrong password, they are taken to the login page 

 		if ($pass != $info['password']) {
 		 		header("Location: login.php"); 
 			} 

 //otherwise they are shown the admin area	 
 	else 
			{   
 //echo "<a href=logout.php>Logout</a>"; 
 			} 

 		} 

 		} 

 else 
 //if the cookie does not exist, they are taken to the login screen 
 {			 
 header("Location: login.php"); 
 } 

/// End of Cookies Checker


session_start();

// Post Action - What happens when the User clicks save button 

$siteuid = mysql_real_escape_string($_GET['siteuid']);

// The site worksheet id for saving into the databse - Siteanswers table
$swsid = mysql_real_escape_string($_GET['swsid']);
$wstypeid = mysql_real_escape_string($_GET['wstypeid']);

if (isset($_POST['wsoptions'])) {
    $sm = array();
    // Loop for getting the values from the POST array and saving into a different array
   for ($q=0; $q < count($_POST['wsoptions']); $q++){ 
   $sm[$q] = mysql_real_escape_string($_POST['wsoptions'][$q]);
   // echo $sm[$q]. ", ";
   $sql = "INSERT INTO Siteanswers (site_id, siteworksheet_id, options_id) 
              VALUES ('$siteuid','$swsid','$sm[$q]')";
   mysql_query($sql);
   }
     
   /////////////// LOOP ENDS///////////////////////////
   
   // $_SESSION['wsupdate'] = 'Worksheet Updated';
   header( "Location: sitereview.php?sitekey=$siteuid") ;
   return;
}
?>
<html>
  <head>
    <title>HRWC | Add Site Worksheet </title>
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
            <li><a href="search.php">Search</a></li>
            <li><a href="addsite.php">Add New Site</a></li>
            <!--Need URL -->
            <li><a href="logout.php">Logout</a></li>
            <!--Need URL-->
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
        <li><a href="addsite.php">Add New Site</a> <span class="divider">/</span></li>     
        <li><a href="sitereview.php">Site Details</a><span class="divider">/</span></li>
        <li class="active">Add Worksheet</li>
      </ul>
    </div>
    </body>
    </html>


<?php
///// ERROR VARIABLES FOR THE SESSIONS - should be used in case of session variables
session_start();
if ( isset($_SESSION['error']) ) {
    echo '<div class="row">
    <div class="span4">
      <div class="alert alert-error">
        <a class="close">&times;</a>'.$_SESSION['error']."      
        </div>
    </div>
    </div>\n";
    unset($_SESSION['error']);
}
if ( isset($_SESSION['success']) ) {
    echo '<div class="row">
    <div class="span4">
    <div class="alert alert-success">
        <a class="close">&times;</a>'.$_SESSION['success']."</div>
    </div>
    </div>\n";
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

echo "<form method = 'post'>";

// Rendering the question descriptions on the html page
while ( $row = mysql_fetch_row($questions)) {
    echo "<h4>";
    echo($row[1]);
    echo "</h4>";
    echo "<p>";
    $ques_ans = mysql_query ("SELECT id,options_desc,question_id,input_type
FROM Quesansmap
WHERE question_id ='$row[0]'");
    while ( $row1 = mysql_fetch_row($ques_ans) ) {
    // Checking if the input type is checkbox and rendering the checkbox based on the input type value
    if ( $row1[3] == "cb"){
    echo ("<input type = 'checkbox' name ='wsoptions[]' value ='$row1[0]' >$row1[1]<br>");
    }
    // Checking if the input type if checkbox and rendering the textbox based on the input type value
    if ( $row1[3] == "tb"){
    echo ("$row1[1]<input type = 'text' name ='others'><br>");
    }
    // WORST LINE EVER echo("</p>\n");
    }
}
echo "<button type='submit' input type='submit' class='btn btn-primary' value='Save'>Submit</button>";
echo "<button class='btn' a href='sitereview.php'>Cancel</a></button></p>";
echo "</form>";
?>