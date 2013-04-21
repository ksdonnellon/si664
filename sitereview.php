<html>
  <head>
    <title>HRWC | Site Details </title>
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
            <li><a href="#">Home</a></li>
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
        <li a href="addsite.php">Add New Site</a> <span class="divider">/</span></li>     
        <li class="active" a href="sitereview.php">Site Details</li>
      </ul>
    </div>
<?php
require_once "db.php";
session_start();


// Post Action for the adding new worksheet

if ( isset($_POST['siteid']) && isset($_POST['worksheettype']) && isset($_POST['wsname'])) {
   $s = mysql_real_escape_string($_POST['siteid']);
   $p = mysql_real_escape_string($_POST['worksheettype']);
   $a = mysql_real_escape_string ($_POST['wsname']); 
   $sql = "INSERT INTO Siteworksheets (community_name, site_id, worksheettype_id) 
              VALUES ('$a', '$s', '$p')";
   mysql_query($sql);
   $_SESSION['wssuccess'] = 'Worksheet Added';
   //$_SESSION['siteUID'] = $s;
   // $_SESSION['sitekey'] = $s;
   header( 'Location: sitereview.php') ;
   return;
}

// Error validation for the worksheets 

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

if ( isset($_SESSION['wsupdate']) ) {
    echo '<div class="row">
    <div class="span4">
    <div class="alert alert-success">
        <a class="close">&times;</a>'.$_SESSION['wsupdate']."</div>
    </div>
    </div>\n";
    unset($_SESSION['wsupdate']);
}

if ( isset($_SESSION['wssuccess']) ) {
    echo '<div class="row">
    <div class="span4">
    <div class="alert alert-success">
        <a class="close">&times;</a>'.$_SESSION['wssuccess']."</div>
    </div>
    </div>\n";
    unset($_SESSION['wssuccess']);
}
echo ('<h3> Site Details </h3>'."\n");
$site_key = $_SESSION['sitekey'];
//echo ("<p>$site_key</p>");
$result = mysql_query("SELECT id, site_name FROM Siteinfo WHERE site_name = '$site_key'");
$wsheets = mysql_query("SELECT * FROM Worksheettypes");
while ( $row = mysql_fetch_row($result) ) {
    echo("<h4> Site Name:<br>");
    // Displaying the details of the site
    echo(htmlentities($row[1]));
    echo("</h4>");
    echo("<p> Site ID: ");
    echo(htmlentities($row[0]));
    echo("</p>");
    
    
    
////////////// Displaying all the worksheets that are already present for the site
    
    echo("<h4>Worksheets Added for the Site</h4>");
    //echo '<section id="tables"><table class="table table-bordered table-striped table-hover"><tbody>'."\n";
    $sitewsheets = mysql_query("SELECT id, site_id, community_name, worksheettype_id,score FROM Siteworksheets WHERE site_id ='$row[0]'");
    while ( $row1 = mysql_fetch_row($sitewsheets) ) {
        echo "<tr><td>";
        echo(htmlentities($row1[0]));
        echo("</td><td>");
        echo(htmlentities($row1[1]));
        echo("</td><td>\n");
        echo(htmlentities($row1[2]));
        echo("</td><td>\n");
        echo(htmlentities($row1[3]));
        echo("</td><td>\n");
        echo(htmlentities($row1[4]));
        echo("</td><td>\n");
        echo('<a href="addworksheet.php?swsid='.htmlentities($row1[0]).'&wstypeid='.htmlentities($row1[3]).'&siteuid='.htmlentities($row1[1]).'">Enter Details</a> / ');
        echo('<a href="viewworksheet.php?swsid='.htmlentities($row1[0]).'&wstypeid='.htmlentities($row1[3]).'&siteuid='.htmlentities($row1[1]).'">View Worksheet</a>');
        echo("</td></tr>\n");
}
echo '</tbody></table></section>';

// Adding new worksheets by selecting the type of worksheet and the 
echo("<h4> Add Worksheets:</h4>");
echo ("<p> Select the type of worksheet you want to add and also enter an alphabet/unique identifier in the name field. The name is automatically generated, e.g. WetlandA, WetlandB etc.</p>");
echo("<div class='row'>");
echo ("<form class='form-horizontal' method='post'>");
echo("<fieldset>");
echo("<div class='control-group'>");
echo("<div class='controls'>");
echo("<select name ='worksheettype'>");
echo ("<option value=''>Select the worksheet type</option>");
// fetching the worksheet types from the database
while ( $row2 = mysql_fetch_row($wsheets)){
echo ("<option value='$row2[0]'>$row2[1]</option>");
}
echo("</select>");
echo("</div></div>");
echo ("<p>Worksheet Name:  <input type='text' name='wsname'></p>");
echo("<p><button type='submit' input type='submit' class='btn btn-primary' value='Add'>Add</button></p>");
echo("<input type='hidden' name='siteid' value='$row[0]'>");

echo("</form></div>");
///////////////////////////////////////////////////////////////////////////////////////////
}
?>   