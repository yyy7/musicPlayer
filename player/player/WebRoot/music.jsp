<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.1.1.js" ></script>
	    <script type="text/javascript" src="js/jquery-ui.js" ></script>
	    <link rel="stylesheet" href="css/jquery-ui.css" />
	    <link rel="stylesheet" href="css/music.css" />
	</head>
	<body>
		<div id="main">
		<div id="blues">蓝调<img src="img/勾号.png"/></div>	
		<div id="jay">周董<img src="img/勾号.png"/></div>
		<div id="rap">说唱<img src="img/勾号.png"/></div>
		<div id="hiphap">hiphap<img src="img/勾号.png"/></div>
		<div id="folk">民谣<img src="img/勾号.png"/></div>
		<div id="rock">摇滚<img src="img/勾号.png"/></div>
		<a id="next">下一步</a>
		</div>
		<div id="show">
		 	我们已根据您的爱好推荐。。。
		</div>
	</body>
</html>
<script>
	$(function(){ 
		var array = [];
       $("#main").children("div").each(function(){
		   $(this).click(function(){
		   	$(this).children("img").show();	   
		   	array.push($(this).text());
		   	console.log(array);		   	
			
		});
	  });
	  $("#show").dialog({
		   title:"程序猿收到啦 ",
		   buttons:{
		   	"开启听歌之旅":function(){
		   	    document.location="listen.jsp?likes="+escape(array);	   		
		   	},
		   },
		   hide:true,
		   autoOpen:false,
		   draggable:true,
		   rasizable:true,
		   closeText:"关闭",
		  
		});
		
	$("#next").click(function(){
		 $("#show").dialog("open");
	});
	
		
	});
	
</script>

