<?php
require "controler/controler.php";
if (isset($_GET['action']))
{
    $action = $_GET['action'];
    switch ($action)
    {
        case 'home';
            home();
            break;
        case 'login';
            login($_POST);
            break;
        default:
            home();
            break;
    }
}
else
{
    require "view/home.php";
}
?>