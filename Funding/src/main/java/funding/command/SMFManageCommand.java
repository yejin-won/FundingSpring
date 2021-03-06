package funding.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import funding.dao.FDaoS;
import funding.dto.FDtoFunding;

public class SMFManageCommand implements FCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model)  {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		FDaoS daoS = sqlSession.getMapper(FDaoS.class);
		ArrayList<FDtoFunding> list = daoS.Mfunding_list(id);
		
		request.setAttribute("Mfunding", list);
		
	}

}
