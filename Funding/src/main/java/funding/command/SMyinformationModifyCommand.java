package funding.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import funding.dao.FDaoC;
import funding.dao.FDaoS;

public class SMyinformationModifyCommand implements FCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("customer_pw");
		String phone = request.getParameter("phone");
		
		FDaoS dao = sqlSession.getMapper(FDaoS.class);
		FDaoC daoc = sqlSession.getMapper(FDaoC.class);
		dao.update_infor(id, pw, phone);
		daoc.update_infor(id, pw, phone);
	}

}
