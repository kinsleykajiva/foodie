<?php 


if(isset($_GET['user_id'])){
	$con = mysqli_connect('localhost','topollo_travsim_com_','T3&uc7f1','topollo_travsim_com_');
	
		
	$res = mysqli_query($con , "SELECT * FROM fooddishes  LIMIT 1");
	$data = [];
	while ($row = mysqli_fetch_assoc($res)) {
		$data [] = $row;
	}
	

	print json_encode(['status': "ok" ,"data":$data]);
	exit;
}
print json_encode(['status': "error" ,"data":$data]);
	exit;


