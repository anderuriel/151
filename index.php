<?php
if (isset($_GET['action']))
{
    $action = $_GET['action'];
    switch ($action)
    {
        default:
            require "view/home.php";
            break;
    }
}
else
{
    require "view/home.php";
}
?>