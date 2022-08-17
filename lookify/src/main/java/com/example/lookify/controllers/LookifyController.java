package com.example.lookify.controllers;

import java.util.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.lookify.models.Lookify;
import com.example.lookify.services.LookifyService;


@Controller
@RequestMapping("/lookify")
public class LookifyController {
	private final LookifyService lookifyService;
	public LookifyController(LookifyService lookifyService) {
		this.lookifyService = lookifyService;
	}
	
	@RequestMapping("")
	public String displayHome() {
		return "home.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String displayDashboard(@ModelAttribute("list") Lookify list,
			Model model) {
		List<Lookify> mylist = lookifyService.allLookifies();
		model.addAttribute("lists", mylist);		
		return "dashboard.jsp";
	}
	
	@RequestMapping("/form")
	public String displaycreate(@ModelAttribute("list") Lookify list) {	
		return "create.jsp";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("list") Lookify list,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes,
			Model model
			) {
		 if (bindingResult.hasErrors()) {
			 	List<Lookify> mylist = lookifyService.allLookifies();
				 model.addAttribute("mylist", mylist);
			     return "create.jsp";
		} else {
			lookifyService.create(list);
			redirectAttributes.addFlashAttribute("success", "Book added !");
			return "redirect:/lookify/form";
	}
	   
	}
	
	@RequestMapping("/{id}/view")
    public String display(@PathVariable("id") Long id, Model model) {
        Lookify lookify = lookifyService.findLookifyById(id);
        model.addAttribute("mylist", lookify);
        return "view.jsp";
    }
	
	@RequestMapping(value="/{id}/delete", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
		lookifyService.deleteLookifyById(id);
        return "redirect:/lookify/dashboard";
    
}
	
	@RequestMapping("/search/topten")
	public String displayTopTen(Model model
			) {
        List<Lookify> lookifyList = lookifyService.findTopTen().subList(0, 10);
        model.addAttribute("lookifyList", lookifyList);
        return "topten.jsp";
    
}
	
	@RequestMapping("/search")
	public String displaySearchResult(Model model,
			@RequestParam(name ="name") String artist,
			HttpSession session
			) {
		List<Lookify> list = lookifyService.findByArtist(artist);
        model.addAttribute("lookifyList", list);
        session.setAttribute("artistName", artist);
        return "filter.jsp";
}
	
}
