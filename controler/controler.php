<?php
/**
 * PROJECT NAME : 151
 * FILE NAME : controler.php
 * AUTHOR : Ander.URIEL-GLARIA
 * DATE : 26.02.2020
 * TIME : 15:31
 */
session_start();
require "model/user_manager.php";
function home()
{
    $_GET['action'] = 'home';
    require "view/home.php";
}

function login($formdata)
{
    if (!isset($_SESSION['login']))
    {
        $_GET['action'] = 'login';
        if (isset($formdata["userlogin"]))
        {
            if(verifylogin($formdata))
            {
                $_SESSION['user'] = $formdata['userlogin'];
            }
        }
        else
        {
            require "view/login.php";
        }
    }
    else
    {
        $_GET['action'] = 'home';
        require "view/home.php";
    }
}
?>