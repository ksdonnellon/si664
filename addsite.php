<html>
  <head>
    <title>HRWC | Add a New Site </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
  </head> 
<?php
require_once "db.php";
session_start();

if ( isset($_POST['sitename']) && isset($_POST['parcelno']) && isset($_POST['acreage'])  
     && isset($_POST['city']) && isset($_POST['state']) && isset($_POST['zip'])) {
   $s = mysql_real_escape_string($_POST['sitename']);
   $p = mysql_real_escape_string($_POST['parcelno']);
   $a = mysql_real_escape_string ($_POST['acreage']);
   $ad = mysql_real_escape_string ($_POST['address']);
   $c = mysql_real_escape_string ($_POST['city']);
   $st = mysql_real_escape_string ($_POST['state']);
   $z = mysql_real_escape_string ($_POST['zip']); 
   $sql = "INSERT INTO Siteinfo (site_name, parcel_no, acreage, address, city, state, zip) 
              VALUES ('$s', '$p', '$a','$ad','$c','$st','$z')";
   mysql_query($sql);
   $_SESSION['success'] = 'Site Added';
   $_SESSION['sitekey'] = $s;
   header( 'Location: sitereview.php') ;
   return;
}
?>
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
            <li  class="active"><a href="addsite.php">Add New Site</a></li>
            <li><a href="#">Link</a></li>
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
        <li class="active"><a href="addsite.php">Add New Site</a> <span class="divider">/</span></li>
 <!--Need URL-->       
        <li class="#">Query</li>
      </ul>
    </div>
<div class="row">
<h3>Add a New Site</h3>
</div>
<form class="form-horizontal well">
<form method="post">
   <fieldset>
    <legend>Site Information</legend>
<p>Site Name:
<input type="text" class="input-xlarge" name="sitename"></p>
<p>Parcel Number:
<input type="text" class="input-xlarge" name="parcelno"></p>
<p>Acreage:
<input type="text" class="input-xlarge" name="acreage"></p>
<p>Address:
<input type="text" class="input-xlarge" name="address"></p>
<p>City:
<input type="text" class="input-xlarge" name="city"></p>
<p>State:
<input type="text" class="input-xlarge" name="state"></p>
<p>Zip:
<input type="text" class="input-xlarge" name="zip"></p>
<p><button type="submit" input type="submit" class="btn btn-primary" value="Save">Submit</button>
<button class="btn" a href="index.php">Cancel</a></button></p>
</fieldset>
</form>
</body>
</html>
