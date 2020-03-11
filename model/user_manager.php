<?php
/**
 * Author   : nicolas.glassey@cpnv.ch
 * Project  : 151_2019_ForStudents
 * Created  : 05.02.2019 - 18:40
 *
 * Last update :    [01.12.2018 author]
 *                  [add $logName in function setFullPath]
 * Git source  :    [link]
 */
function verifylogin($formdata)
{
    require "DB_connector.php";

    $username = $formdata['userlogin'];
    $userpswd = $formdata['userpassword'];
    $query =  "SELECT userEmailAddress, userPsw FROM users WHERE userEmailAddress LIKE '$username' AND userPsw LIKE '$userpswd' ;";
    $results=executeQuery($query);
    foreach ( $results as $item)
    {
        $DBusername = $item[0];
        $DBuserpswd = $item[1];
    }

        if($username == $DBusername && $userpswd == $DBuserpswd)
        {
            return true;
            require "index.php";
        }
}