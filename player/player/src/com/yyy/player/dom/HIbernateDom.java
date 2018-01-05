package com.yyy.player.dom;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.yyy.player.factory.HibernateSessionFactory;
import com.yyy.player.model.TPlayer;


public class HIbernateDom {
     public List<TPlayer> querybyType(String type) {
    	List<TPlayer> list=null;
 		try{
 		Session session=HibernateSessionFactory.getSession();
 		Query query  =session.createQuery("from TPlayer where  type=?");
 		query.setString(0, type);
 		list =query.list();	
 		System.out.println(list.size());
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 		finally{
 			HibernateSessionFactory.closeSession();
 		}
 		return list;
	}
}
