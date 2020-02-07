<?php
function home()
{
    $_GET['action'] = 'home';
    require "view/home.php";
}
?>