<?php
//设置服务器端返回数据的格式
header('Content-Type:application/json');
//获得客户端上传的帖子数据
$uid=$_REQUEST['uid'];
$theme=$_REQUEST['theme'];
$title=$_REQUEST['title'];
$content=$_REQUEST['content'];
$ptime=$_REQUEST['ptime'];
//连接数据库
$conn=mysqli_connect('127.0.0.1','root','','loldata',3306);
//设置数据库编码格式
$sql='set names UTF8';
mysqli_query($conn,$sql);

//上传数据到数据库
//查询该用户id下的帖子数量
$sql="select count(*) from pub where uid='$uid'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$sum=intval($row['count(*)']);
//给帖子一个id
$num=$sum+1;
$mid="$uid#$num";
//上传数据
$sql="INSERT INTO pub VALUES($mid,$uid,null,$title,null,$content,null,$theme) ";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
var_dump($row);