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
		<link rel="stylesheet" href="css/listen.css" />
	</head>
	
	<body>
		<div id="header">
			<span id="header_span1">歌曲推荐</span>
			<span id="header_span2">根据你的音乐口味生成</span>
		</div>
		<div id="main">
			<div id="main_play">列表播放 ≡</div>
			<hr />
		</div>
		<div id="footer">
			<div id="music">
				<img src="img/jay.jpg" width="30px" height="30px" id="img"/>			
				<span id="footer_mname">稻香</span>
				<span id="footer_msinger">周杰伦</span>
				<div id="divaudio">
				<audio controls id="audio" >      
                <source src="audio/安和桥.mp3" type="audio/mp3">
				</audio>
				</div>
			</div>
		</div>
	</body>
</html>
<script>
$(function(){
        var array = location.search.substring(1);
        array=unescape(array).substr(6);
        alert(array+"开始ajax操作");
    	 $.ajax({
          type:"post",
          url:"query_action.action",
          data:{"likes":array},
          dataType:"json",
    //      traditional: true,
          async:false,
          success:function(datas){
            showmusic(datas);               
          },
          error:function(msg,textStatus, errorThrown){
             alert("获取服务器资源失败!"+msg.responseText);
          }
         });
        function showmusic(datas){
         var showmusic = "<ul id='ulmusic'>";
         $.each(datas, function () {
            var json = this;       
			showmusic+="<li>";
			showmusic+="<div>";			
            showmusic+="<img width='35px' height='35px' src="+json.img+">";
            showmusic+="<span class='spanname'>"+json.name+"</span>";
            showmusic+="<span class='spansinger'>"+json.singer+"</span>";
            showmusic+="<a class='listenlink' name="+json.link+">"+"立即试听"+"</a>";
			showmusic+="</div>";
			showmusic+="</li>";
			showmusic+="<hr/>";
			});
		  showmusic+="</ul>";
		  $("#main").append(showmusic);
		  $("ul").css('list-style','none');
		  $("ul li").css('padding-left','6px');
		  $(".spanname").css({'padding-top':'90px','padding-right':'3px'});
		  $(".spansinger").css({'position':'absolute','right':'20%'}); 
		  $(".listenlink").css({'position':'absolute','right':'18%','padding-top':'20px'});
		  
		  listen();
          }; 
          function listen(){
             $(".listenlink").each(function(){
              $(this).click(function(){
                var link=$(this).attr('name');
                var img= $(this).prev().prev().prev().attr('src');
		        var name= $(this).prev().prev().text();
		        var singer= $(this).prev().text();
		        $("#footer_mname").text(name);
		        $("#footer_msinger").text(singer);
		        $("#img").attr('src',img);
		        var audio = $("#audio")[0];  
                audio.pause(); 
                audio.src=link;
                audio.play();
		      });            
             });
             $("a").hover(function(){
		      	  $("a").css('cursor','pointer');
		      });
          };
                
    });

</script>