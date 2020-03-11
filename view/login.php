<?php
ob_start();
$titre = "RentASnow - Login";
?>
<div>
    <form method="post">
        <label for "userlogin">Login</label>
        <input type="text" name="userlogin">
        <label for "userpassword">Password</label>
        <input type="password" name="userpassword">
        <input type="submit" name="Submit" >
    </form>
</div>
<?php
$contenu = ob_get_clean();
require "gabarit.php";
?>