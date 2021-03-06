package funding.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import funding.dao.FDaoC;

public class FundingUnlikeCommand implements FCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String like_customer  = request.getParameter("customer_id");
		
//		String like_At  = request.getParameter("customer_id");
		int like_funding  = Integer.parseInt(request.getParameter("funding_num")) ;
		
		request.setAttribute("viewpage", "redirect:/fundingContent_view?fid=" + request.getParameter("funding_num"));
		FDaoC dao = sqlSession.getMapper(FDaoC.class);

		
		dao.unlike(like_customer, like_funding);
	}

}
