<?php
require_once "db.php";
session_start();


if ( isset($_POST['username']) && isset($_POST['password']) && isset($_POST['confpassword'])) {
   $s = mysql_real_escape_string($_POST['username']);
   $p = mysql_real_escape_string($_POST['password']);
   $a = mysql_real_escape_string ($_POST['confpassword']); 
   $userlist = mysql_query("SELECT username FROM Loginusers WHERE username = '$s'");
    $num = mysql_num_rows($userlist);
    // var_dump($num);
    
    // Checking if the user filled all th details else throwing an error
    
    if($s == '' OR $p == '' OR $a == '') {

 		$_SESSION['empty'] = 'You did not fill in the required fields';
 		header("Location:newuser.php");
        return;
    }
    
    /// Checking for existing usernames and if it returns a row with the username then there is no //////
    
    if ($num != 0){
     $_SESSION['userexists'] = 'Username already exists. Please try with a different user name';
   header("Location:newuser.php");
   return;
    }
    
   if ($num == 0){
   
   /// Checking for matching passwords and non null values of all the fields//////
   
   if ($p == $a AND $s != '' AND $p != '' AND $a != ''){
   $sql = "INSERT INTO Loginusers (username, password) 
              VALUES ('$s', '$p')";
   mysql_query($sql);
   $_SESSION['logincreated'] = 'New User Added. Please login using your new credentials';
   header("Location:login.php");
   return;
   }
  
   // Checking for passwords not matching
   
    if ($p != $a){
   mysql_query($sql);
   $_SESSION['passmatch'] = 'Passwords do not match. Please try again';
   header("Location:newuser.php");
   return;
   }
   }
}
?>
<html>
  <head>
    <title>HRWC | Add a New User </title>
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
            </div>
                </div>
            </div>
        </div>
       
<ul class="breadcrumb">
<!--Should Home be login page? -->
        <li class="active">Add a New User</li>
      </ul>
    </div>
    
<?php
if ( isset($_SESSION['userexists']) ) {
    echo '<div class="row">
    <div class="span4">
      <div class="alert alert-error">
        <a class="close">&times;</a>'.$_SESSION['userexists']."      
        </div>
    </div>
    </div>\n";
    unset($_SESSION['userexists']);
}

if ( isset($_SESSION['passmatch']) ) {
    echo '<div class="row">
    <div class="span4">
      <div class="alert alert-error">
        <a class="close">&times;</a>'.$_SESSION['passmatch']."      
        </div>
    </div>
    </div>\n";
    unset($_SESSION['passmatch']);
}

if ( isset($_SESSION['empty']) ) {
    echo '<div class="row">
    <div class="span4">
      <div class="alert alert-error">
        <a class="close">&times;</a>'.$_SESSION['empty']."      
        </div>
    </div>
    </div>\n";
    unset($_SESSION['empty']);
}

?>
<div class="row">
<h3>Register</h3>
    <form class="form-horizontal well" method="post">
    <fieldset>
        <legend>New User</legend>
<p>Username
<input type="text" class="input-xlarge" name="username"></p>
<p>Password:
<input type="password" class="input-xlarge" name="password"></p>
<p>Confirm Password:
<input type="password" class="input-xlarge" name="confpassword"></p>
<p><button type="submit" input type="submit" class="btn btn-primary" value="Save">Register</button>
 <a href="login.php">Cancel</a></p>
</fieldset>
</form>
</div>
</body>
</html>
