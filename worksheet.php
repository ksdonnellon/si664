<html>
  <head>
    <title>HRWC | Wetlands Worksheet </title>
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
            <li><a href="#">Link</a></li>
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
        <li class="active" a href="addworksheet.php">Add Site Worksheet</li>
      </ul>
    </div>
<?php
require_once "db.php";
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
echo'<div class="row">
<h3>Add a New Site</h3>
    <form class="form-horizontal well">
        <form method="post">
   <fieldset>';
   
$questions = mysql_query("SELECT id, question_desc FROM Worksheetquesmap WHERE worksheettype_id = '2'");
// $option = mysql_query ("SELECT options_desc FROM Quesansmap WHERE question_id = '8'");
$ques_option = mysql_query("SELECT Worksheetquesmap.id, Quesansmap.options_desc, Quesansmap.id
FROM Worksheetquesmap
JOIN Quesansmap
ON Worksheetquesmap.worksheettype_id = '2' AND Worksheetquesmap.id =Quesansmap.question_id");
// echo "<form method = "post">";
while ( $row = mysql_fetch_row($questions) ) {
    echo "<p><b>";
    echo($row[1]);
    echo "</b>";
    echo "<ul>";
    while ( $row1 = mysql_fetch_row($ques_option) ) {
    if ($row1[0] == $row[0]) {
    echo "<li>";
    echo ($row1[1]);
    echo ($row1[2]);
    echo "</li>";
    }
    }
    echo "</ul>";
    echo("</p>\n");
}
?>

</body>
</html>
<!--<p>Add A New Track</p>
<form method="post">
<p>Title:
<input type="text" name="title"></p>
<p>Plays:
<input type="text" name="plays"></p>
<p>Rating:
<input type="text" name="rating"></p>
<p><input type="submit" value="Add New"/>
<a href="index.php">Cancel</a></p>
</form>
<a href="add.php">Add New</a> -->