<?php
//设置服务器端返回数据的格式
header('Content-Type:application/json');
//获得客户端发送的正在访问的页码
$index=$_REQUEST['index'];
//要输出给客户端的对象
$output=[
  'totalPosts'=>0,//帖子总数
  'totalPages'=>0,//总页数
  'pageCount'=>5,//每页帖子数
  'currPosts'=>0,//当前页的帖子数
  'data'=>[],//帖子集合
];
//连接服务器
$conn=mysqli_connect('127.0.0.1','root','','loldata',3306);
//设置数据库编码格式
$sql='set names UTF8';
mysqli_query($conn,$sql);

//查询帖子总数
$sql="select count(*) from pub";
$result=mysqli_query($conn,$sql);//此结果集中只有一行一列的数据
$row=mysqli_fetch_assoc($result);
$output['totalPosts']=intval($row['count(*)']);
//获取总页数
$output['totalPages']=ceil($output['totalPosts']/$output['pageCount']);
//获取当前帖子数
$start=($index-1)*$output['pageCount'];//从第几条开始查询
$count=$output['pageCount'];//查询的条数
$sql="select * from pub limit $start,$count";
$result=mysqli_query($conn,$sql);//返回一个结果集
while(($item=mysqli_fetch_assoc($result))){
   $output['data'][]=$item;//添加当前页的所有帖子
}
//为每条帖子添加客户端需要的数据
for($i=0;$i<count($output['data']);$i++){
  $uid=$output['data'][$i]['uid'];

  /*$sql="select uphoto from userInfo where uid=$uid";
  $output['data'][$i]['uphoto']=$row;//为每条帖子添加作者头像*/
  
  $sql="select uname from userInfo where uid=$uid";
  $result=mysqli_query($conn,$sql);
  $row=mysqli_fetch_assoc($result);
  $output['data'][$i]['uname']=$row;//为每条帖子添加作者名字

  /*$output['data'][$i]['utitle']=[];//为每条帖子添加作者头衔信息集合
  $sql="select count(*) from title_list where uid=$uid";//查询作者头衔数量
  $result=mysqli_query($conn,$sql);
  $row=mysqli_fetch_assoc($result);
  for($j=0;$j<$row['count(*)'];$j++){
	$output['data'][$i]['utitle'][$j]=[];//添加每个头衔的具体信息集合

    $sql="select tname from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['tname']=$row;//为每个头衔具体信息集合添加头衔名称
	
	$sql="select tname from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['tname']=$row;//为每个头衔具体信息集合添加头衔名称

    $sql="select turl from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['turl']=$row;//为每个头衔具体信息集合添加图片地址

    $sql="select thorizon from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['thorizon']=$row;//为每个头衔具体信息集合添加图片水平偏移量

    $sql="select tvertical from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['tvertical']=$row;//为每个头衔具体信息集合添加图片水平偏移量
  }*/
  

  /*$output['data'][$i]['msgpic']=[];//为每条帖子添加图片集合
  $mid=$output['data'][$i]['mid'];
  $sql="select * from msgpic where mid='$mid'";
  $result=mysqli_query($conn,$sql);//返回一个图片地址结果集
  while(!($src=mysqli_fetch_assoc($result))){
    $output['data']['msgpic'][]=$src;
  };*/
  
  /*$sql="select uphoto from userInfo uid in(select fuid from msgfollow where ftime in (select MAX(ftime) from msgfollow where mid=$mid))";
  $output['data'][$i]['lrphoto']=$row;//为每条帖子添加最后回复人头像*/

  $sql="select uname from userInfo uid in(select fuid from msgfollow where ftime in (select MAX(ftime) from msgfollow where mid=$mid))";
  $output['data'][$i]['lrname']=$row;//为每条帖子添加最后回复人名字 
}
echo json_encode($output);