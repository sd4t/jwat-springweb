package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.UserService;

@Controller

public class SigninController {
	
	@GetMapping("/signin")
	public String index() {
		return "signin";
	}
	
	@Autowired
	UserService userService;
	
	@PostMapping("/signin")
	public String postSignin(@RequestParam String email, @RequestParam String password, ModelMap modelMap) {
		if(userService.checkLogin(email, password)) {
			modelMap.addAttribute("result", "true");
			modelMap.addAttribute("idUser",email);
			return "redirect:/";
		} else {
			modelMap.addAttribute("email", email);
			modelMap.addAttribute("result", "false");
			return "signin";
		}
	}
}
