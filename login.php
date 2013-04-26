<?php
require_once "db.php";

//Checks if there is a login cookie

 if(isset($_COOKIE['ID_my_site']))


 //if there is, it logs you in and directes you to the members page

 { 
 	$username = $_COOKIE['ID_my_site']; 

 	$password = $_COOKIE['Key_my_site'];

 	$check = mysql_query("SELECT * FROM Loginusers WHERE username = '$username'")or die(mysql_error());

 	while($info = mysql_fetch_array( $check )) 	
 		{
 		if ($password != $info['password']) 
 			{
 			 			}
 		else
 			{
 			header("Location:search.php");
 			}
 		}
 }


//if the login form is submitted then.. 

session_start();
unset($_SESSION['username']);

if (isset($_POST['username']) && isset($_POST['password'])) {
    $user = mysql_real_escape_string($_POST['username']);
	$pass = mysql_real_escape_string($_POST['password']);
	
	if($user == '' OR $pass == '') {

 		$_SESSION['empty'] = 'You did not fill in the required fields';
 		header("Location:login.php");
        return;
    }
	
	else {
	/// Checking if the user exists in the database and throwing a message when the results is zero/////
	$sql = "SELECT username, password FROM Loginusers WHERE username = '$user'";
	$result = mysql_query($sql);
	$numrow = mysql_num_rows($result);
	var_dump($numrow);
	if ($numrow == 0) {
	unset($_SESSION['username']);
	$_SESSION['error'] = 'User does not exist in our database';
    header('Location:login.php');
    return;
    } 
    if ($numrow == 1) {
    while ($userrow = mysql_fetch_array($result)){
   
   // Checking if the username and password are correct combination
    if ($pass != $userrow['password']) {
        $_SESSION['incpass'] = 'Incorrect Password. Please try again.';
    header('Location:login.php');
    return;
    }	
    //// Check ends here for the username pass word combination
    
    // If the password and user name is correct - set the cookie then direct the user to the search.php	
 	else {
        $hour = time() + 3600; 
        setcookie('ID_my_site', $user, $hour); 
        setcookie('Key_my_site', $pass, $hour);	 
        header("Location:search.php");
        return;
 			}
 	} // End of While Loop
	} // End of the if loop for checking if the sql row is non zero
    } // End of else loop for the non null values for the fields of username and password
} // End of the if loop for form submission - Checking the Post array

?>

<html>
  <head>
    <title>HRWC | Login </title>
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
    </div>

<?php 
    ////// Session Messages 
     
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
    
      if ( isset($_SESSION['logincreated']) ) {
    echo '<div class="row">
    <div class="span4">
      <div class="alert alert-success">
        <a class="close">&times;</a>'.$_SESSION['logincreated']."      
        </div>
    </div>
    </div>\n";
    unset($_SESSION['logincreated']);
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

 if ( isset($_SESSION['incpass']) ) {
    echo '<div class="row">
    <div class="span4">
      <div class="alert alert-error">
        <a class="close">&times;</a>'.$_SESSION['incpass']."      
        </div>
    </div>
    </div>\n";
    unset($_SESSION['incpass']);
}      
?>

<div class="row">
<h3>Login</h3>
    <form action="<?php echo $_SERVER['PHP_SELF']?>" class="form-horizontal well" method="post">
    <fieldset>
        <legend>Login using your username and password</legend>
<p>Username:
<input type="text" class="input-xlarge" name="username"></p>
<p>Password:
<input type="password" class="input-xlarge" name="password"></p>
<p><button type="submit" input type="submit" class="btn btn-primary" value="Login">Login</button>
 <a href="newuser.php">Create Account</a></p>
</fieldset>
</form>
</div>
</body>
</html>

            