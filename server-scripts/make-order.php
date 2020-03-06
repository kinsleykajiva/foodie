<?php 


if(isset($_POST['user_id'])){
	$items = $_POST['items'];
	$con = mysqli_connect('localhost','topollo_travsim_com_','T3&uc7f1','topollo_travsim_com_');
	
		
	$res = mysqli_query($con , "INSERT INTO order () VALUES () ");
	$data = [];
	while ($row = mysqli_fetch_assoc($res)) {
		$data [] = $row;
	}
	

	print json_encode(['status': "ok" ,"data":$data]);
	exit;
}
print json_encode(['status': "error" ,"data":$data]);
	exit;


