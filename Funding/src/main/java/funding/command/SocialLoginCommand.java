package funding.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import funding.dao.FDaoC;

public class SocialLoginCommand implements FCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		String input_id = request.getParameter("email");
		HttpSession session = request.getSession();
		FDaoC dao = sqlSession.getMapper(FDaoC.class);
		Boolean res = dao.checkEmail(input_id);
		
		
		
		if(res) {
			request.setAttribute("viewpage", "main.do?sort=all");
			session.setAttribute("email", input_id);
			session.setAttribute("customer_id", input_id);
			session.setAttribute("id", input_id);

		}else {
			request.setAttribute("viewpage", "../../pages/SignUp.jsp");
			request.setAttribute("error", "연동된 ID가 없습니다. 회원가입을 먼저 진행해주세요");
		}

		
	}

}
