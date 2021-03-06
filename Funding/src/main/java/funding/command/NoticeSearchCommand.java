package funding.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import funding.dao.FDaoC;
import funding.dto.FDtoNotice;

public class NoticeSearchCommand implements FCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model)  {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String search = request.getParameter("notice_search");
		FDaoC dao = sqlSession.getMapper(FDaoC.class);
		ArrayList<FDtoNotice> list = dao.notice_search(search);
		
		request.setAttribute("notice", list);
	}

}
