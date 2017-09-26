package com.sht.users.action;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.sht.users.po.CustomUsers;
import com.sht.users.po.UGoods;
import com.sht.users.service.UGoodsServiceI;
/**
 * 
 * 用户对商品的操作
 * @author yyfjsn
 *
 */

@Controller
public class UGoodsAction extends UBaseAction<UGoods,UGoodsServiceI>{
	 
	 int PageNum = 6; //分页显示，每一页的数据数量
	 
	 int Page = 0;//分页显示，总页数 
	
	 /**
	  * 通过id 获取发布的商品信息
	  * 
	  * @throws Exception
	  */
	 public void getGoodsById() throws Exception{
		 
		 String PageToStr = getRequestParam("PageTo");
		 
		 eject(PageToStr==null, "指定的跳转页不存在");
		 
		 int PageTo = Integer.parseInt(PageToStr);
		 
		 CustomUsers customUsers  = getSessionAttr(FILED_ONLINE_USER);
		 
		 List<UGoods> Goodlist = null;
		 
		 String pageStar = (PageTo-1)*PageNum + "";
		 
		 String pageEnd = (PageTo-1)*PageNum+PageNum + "";
		 
		 logger.info("getGoods");
		 try {
			 Goodlist  = service.getGoodsById(customUsers.getId(),pageStar,pageEnd);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			//po.setMsg(e.getMessage());
			
		}finally{
			
			writeJSON(Goodlist);
		}
		 
	 }
	 
	 /**
	  * 通过id 获取商品总数
	  * 
	  * @throws Exception
	  */
	 
	 public void getGoodsCountById() throws Exception{
		 CustomUsers customUsers  = getSessionAttr(FILED_ONLINE_USER);
		 
		 int Goodscount = 0;//获取商品数据条数
		
		 try {
			 
			 Goodscount  = service.getGoodsCountById(customUsers.getId());
			 
			 Page = (Goodscount+PageNum-1)/PageNum;
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
		}finally{
			
			writeJSON(Page);
		}
	 }
	 
	 /**
	  * 根据title查找商品
	 * @throws Exception 
	  * 
	  */
	 public void searchUGoodsBytitle() throws Exception{
 
		 String PageToStr = getRequestParam("PageTo");
		 
		 eject(PageToStr==null, "指定的跳转页不存在");
		 
		 String title = getRequestParam("title");
		 
		 int PageTo = Integer.parseInt(PageToStr);
		 
		 CustomUsers customUsers  = getSessionAttr(FILED_ONLINE_USER);
		 
		 List<UGoods> Goodlist = null;
		 
		 String pageStar = (PageTo-1)*PageNum + "";
		 
		 String pageEnd = (PageTo-1)*PageNum+PageNum + "";
		 
		 logger.info("getGoods");
		 try {
			 Goodlist  = service.searchUGoodsBytitle(title,pageStar,pageEnd);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			//po.setMsg(e.getMessage());
			
		}finally{
			
			writeJSON(Goodlist);
		}
	 }
}