package com.yyy.player.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.yyy.player.dom.HIbernateDom;
import com.yyy.player.model.TPlayer;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class PlayerAction {
	private String likes ;
    public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	HttpServletResponse response =ServletActionContext.getResponse();
	private void setresponse(){
		response.setHeader("Access-Control-Allow-Origin", "*");
     	response.setHeader("Access-Control-Allow-Methods", "GET,POST");
     	response.setHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
     	response.setHeader("Access-Control-Allow-Credentials", "true");
     	response.setCharacterEncoding("UTF-8");
	}
    public String query() {
      this.setresponse(); 	
      int i;
      String[] array = likes.split(",");
      response.setCharacterEncoding("UTF-8");
      JSONArray jsonArray = new JSONArray();
      PrintWriter out=null;
      for(i=0;i<array.length;i++)
      {
    	  System.out.println(array[i]);
    	  List<TPlayer> list = new ArrayList<TPlayer>();
    	  list =new HIbernateDom().querybyType(array[i]);
    	  
    	  for(TPlayer player:list)
  		  {   
    		JSONObject json = new JSONObject();
    		player.setImg("img/"+player.getImg());
    		player.setLink("audio/"+player.getLink());
    		json.put("name", player.getName());
    		json.put("img",player.getImg());  		
    		json.put("singer",player.getSinger());
    		json.put("link",player.getLink());
    		jsonArray.add(json);
          }
    	  
      }
     
	try {
	    out = response.getWriter();
		out.write(jsonArray.toString());
		System.out.println(jsonArray);
		out.flush();
		
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}  
	finally{
		out.close();
	}
      
	  return "success";

	}
	
}
