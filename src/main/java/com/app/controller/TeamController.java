package com.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.MemberDTO;
import com.app.dto.PlayerDTO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;
import com.app.service.MemberService;
import com.app.service.PlayerService;
import com.app.service.ScrapingService;
import com.app.service.TeamService;

@Controller
public class TeamController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ScrapingService scrapService;
	@Autowired
	private PlayerService playerService;
	@Autowired
	private TeamService teamService;

	@RequestMapping("/schedule")
	public String schedule(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();

		MemberDTO user = memberService.mypage(userid);
		session.setAttribute("login", user);

		model.addAttribute("user", user);
		model.addAttribute("ScoreBoard", scrapService.cachedScrapeScore());

		List<ScheduleDTO> allScheduleList = scrapService.cacheScheduleData(); // 일정 가져오기
		List<TeamDTO> teamDataList = scrapService.cachedRankData(); // 순위 및 정보 가져오기
		// 나의 팀 가져오기
		int myTeam = dto.getTeam_code();
		String selectedTeam = teamService.team_name(myTeam);

		model.addAttribute("myTeam", selectedTeam);
		// 응원팀에 해당하는 일정만 필터링하기
		List<ScheduleDTO> filterScheduleList = new ArrayList<ScheduleDTO>();
		for (ScheduleDTO schedule : allScheduleList) {
			if (schedule.getTeam1().equals(selectedTeam) || schedule.getTeam2().equals(selectedTeam)) {
				filterScheduleList.add(schedule);
			}
		}
		model.addAttribute("filterScheduleList", filterScheduleList);

		return "/team/schedule";
	}

	@RequestMapping("/highlight")
	public String highlight(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		model.addAttribute("user", dto);
		model.addAttribute("highlight", scrapService.cachedHighlight());
		scrapService.cachedHighlight();

		int myTeam = dto.getTeam_code();
		String selectedTeam = null; // 나중에 수정하기
		switch (myTeam) {
		case 1:
			selectedTeam = "SSG";
			break;
		case 2:
			selectedTeam = "키움";
			break;
		case 3:
			selectedTeam = "LG";
			break;
		case 4:
			selectedTeam = "KT";
			break;
		case 5:
			selectedTeam = "KIA";
			break;
		case 6:
			selectedTeam = "NC";
			break;
		case 7:
			selectedTeam = "삼성";
			break;
		case 8:
			selectedTeam = "롯데";
			break;
		case 9:
			selectedTeam = "두산";
			break;
		case 10:
			selectedTeam = "한화";
			break;
		default:
			break;
		}

		model.addAttribute("myTeam", selectedTeam);

		return "/team/highlight";
	}

	@RequestMapping("/rank")
	public String rank(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");

		int myTeam = dto.getTeam_code();
		String selectedTeam = teamService.team_name(myTeam);

		model.addAttribute("myTeam", selectedTeam);

		List<TeamDTO> teamDataList = scrapService.cachedRankData();
		TeamDTO filterTeamData = new TeamDTO();
		for (TeamDTO team : teamDataList) {
			if (team.getTitle().equals(selectedTeam)) {
				filterTeamData = team;
			}
		}

		model.addAttribute("filterTeamData", filterTeamData);
		return "/team/rank";
	}

	@RequestMapping("/players")
	public String players(HttpSession session, Model model,
			@RequestParam(value = "position", required = false, defaultValue = "null") String pos) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		int myTeam = dto.getTeam_code();
		String selectedTeam = teamService.team_name(myTeam);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("team", selectedTeam);
		map.put("pos", pos);
		List<PlayerDTO> list = playerService.find_LGplayer(map);
		model.addAttribute("list", list);
		return "/team/players";
	}

	@GetMapping("/playerInfo")
	public String playerInfo(String player, Model model, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		int myTeam = mdto.getTeam_code();
		String selectedTeam = teamService.team_name(myTeam);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("team", selectedTeam);
		map.put("player", player);
		PlayerDTO dto = playerService.find_player(map);
		model.addAttribute("dto", dto);

		return "/team/playerInfo";
	}
}