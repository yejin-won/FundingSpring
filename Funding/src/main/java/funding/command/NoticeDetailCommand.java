package funding.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import funding.dao.FDaoC;
import funding.dto.FDtoNotice;

public class NoticeDetailCommand implements FCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String notice_num = request.getParameter("notice_num");
		FDaoC dao = sqlSession.getMapper(FDaoC.class);
		FDtoNotice dto = dao.notice_detail(notice_num);
		
		request.setAttribute("notice", dto);
	}

}
