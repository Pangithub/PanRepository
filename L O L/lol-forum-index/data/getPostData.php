<?php
//���÷������˷������ݵĸ�ʽ
header('Content-Type:application/json');
//��ÿͻ��˷��͵����ڷ��ʵ�ҳ��
$index=$_REQUEST['index'];
//Ҫ������ͻ��˵Ķ���
$output=[
  'totalPosts'=>0,//��������
  'totalPages'=>0,//��ҳ��
  'pageCount'=>5,//ÿҳ������
  'currPosts'=>0,//��ǰҳ��������
  'data'=>[],//���Ӽ���
];
//���ӷ�����
$conn=mysqli_connect('127.0.0.1','root','','loldata',3306);
//�������ݿ�����ʽ
$sql='set names UTF8';
mysqli_query($conn,$sql);

//��ѯ��������
$sql="select count(*) from pub";
$result=mysqli_query($conn,$sql);//�˽������ֻ��һ��һ�е�����
$row=mysqli_fetch_assoc($result);
$output['totalPosts']=intval($row['count(*)']);
//��ȡ��ҳ��
$output['totalPages']=ceil($output['totalPosts']/$output['pageCount']);
//��ȡ��ǰ������
$start=($index-1)*$output['pageCount'];//�ӵڼ�����ʼ��ѯ
$count=$output['pageCount'];//��ѯ������
$sql="select * from pub limit $start,$count";
$result=mysqli_query($conn,$sql);//����һ�������
while(($item=mysqli_fetch_assoc($result))){
   $output['data'][]=$item;//��ӵ�ǰҳ����������
}
//Ϊÿ��������ӿͻ�����Ҫ������
for($i=0;$i<count($output['data']);$i++){
  $uid=$output['data'][$i]['uid'];

  /*$sql="select uphoto from userInfo where uid=$uid";
  $output['data'][$i]['uphoto']=$row;//Ϊÿ�������������ͷ��*/
  
  $sql="select uname from userInfo where uid=$uid";
  $result=mysqli_query($conn,$sql);
  $row=mysqli_fetch_assoc($result);
  $output['data'][$i]['uname']=$row;//Ϊÿ�����������������

  /*$output['data'][$i]['utitle']=[];//Ϊÿ�������������ͷ����Ϣ����
  $sql="select count(*) from title_list where uid=$uid";//��ѯ����ͷ������
  $result=mysqli_query($conn,$sql);
  $row=mysqli_fetch_assoc($result);
  for($j=0;$j<$row['count(*)'];$j++){
	$output['data'][$i]['utitle'][$j]=[];//���ÿ��ͷ�εľ�����Ϣ����

    $sql="select tname from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['tname']=$row;//Ϊÿ��ͷ�ξ�����Ϣ�������ͷ������
	
	$sql="select tname from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['tname']=$row;//Ϊÿ��ͷ�ξ�����Ϣ�������ͷ������

    $sql="select turl from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['turl']=$row;//Ϊÿ��ͷ�ξ�����Ϣ�������ͼƬ��ַ

    $sql="select thorizon from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['thorizon']=$row;//Ϊÿ��ͷ�ξ�����Ϣ�������ͼƬˮƽƫ����

    $sql="select tvertical from title_detail where tid in (select tid from title_list where uid=$uid)";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $output['data'][$i]['utitle'][$j]['tvertical']=$row;//Ϊÿ��ͷ�ξ�����Ϣ�������ͼƬˮƽƫ����
  }*/
  

  /*$output['data'][$i]['msgpic']=[];//Ϊÿ���������ͼƬ����
  $mid=$output['data'][$i]['mid'];
  $sql="select * from msgpic where mid='$mid'";
  $result=mysqli_query($conn,$sql);//����һ��ͼƬ��ַ�����
  while(!($src=mysqli_fetch_assoc($result))){
    $output['data']['msgpic'][]=$src;
  };*/
  
  /*$sql="select uphoto from userInfo uid in(select fuid from msgfollow where ftime in (select MAX(ftime) from msgfollow where mid=$mid))";
  $output['data'][$i]['lrphoto']=$row;//Ϊÿ������������ظ���ͷ��*/

  $sql="select uname from userInfo uid in(select fuid from msgfollow where ftime in (select MAX(ftime) from msgfollow where mid=$mid))";
  $output['data'][$i]['lrname']=$row;//Ϊÿ������������ظ������� 
}
echo json_encode($output);