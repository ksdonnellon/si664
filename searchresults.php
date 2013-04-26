<?php
/// Checking if the Cookie is available for this screen

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
?>


<html>
  <head>
    <title>HRWC | Search </title>
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
            <li class="active"><a href="search.php">Search</a></li>
            <li><a href="addsite.php">Add New Site</a></li>
            <li><a href="logout.php">Logout</a></li>
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
        <li><a href = "search.php">Search</a><span class="divider">/</span></li>
        <li class="active">Search Results</li>
      </ul>
    </div>
<div class="row">
<h3>Search Results</h3>
    
</div>

<?php
require_once "db.php";
session_start();

// Post Action - What happens when the User clicks save button 

$zip = mysql_real_escape_string($_GET['zip']);

echo ("<p>Displaying Search Results for $zip</p>");

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

$searchquery = mysql_query("SELECT id, site_name, parcel_no, FROM Siteinfo WHERE zip = $zip");
echo '<section id="tables"><table class="table table-bordered table-striped table-hover"><tbody>'."\n";
    echo "<tr><td>";
    echo "<b>Site ID</b></td><td>";
    echo "<b>Site Name</b></td><td>";
    echo "<b>Actions</b></td><tr>";

// Query for fetching the worksheet name based on the 

/// Displaying the Heading of the Worksheet Dynamically from the id passed using the URL
while ($row = mysql_fetch_row($searchquery)){
    
////////////// Displaying all the worksheets that are already present for the site
    
    $sitewsheets = mysql_query("SELECT id, site_id, community_name, worksheettype_id,score FROM Siteworksheets WHERE site_id ='$row[0]'");
    while ( $row1 = mysql_fetch_row($sitewsheets) ) {
        echo "<tr><td>";
        //echo(htmlentities($row1[0]));
        //echo("</td><td>");
        //echo(htmlentities($row1[1]));
       //echo("</td><td>\n");
        echo(htmlentities($row1[2]));
        echo("</td><td>\n");
        //echo(htmlentities($row1[3]));
        //echo("</td><td>\n");
        echo(htmlentities($row1[4]));
        echo("</td><td>\n");
        echo('<a href="addworksheet.php?swsid='.htmlentities($row1[0]).'&wstypeid='.htmlentities($row1[3]).'&siteuid='.htmlentities($row1[1]).'">Enter Details</a> / ');
        echo('<a href="viewworksheet.php?swsid='.htmlentities($row1[0]).'&wstypeid='.htmlentities($row1[3]).'&siteuid='.htmlentities($row1[1]).'">View Worksheet</a>');
        echo("</td></tr>\n");
}
echo '</tbody></table></section>';
        echo "<h1>$titlerow[0] Worksheet</h1>";
}
?>

</body>
</html>
