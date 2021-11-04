package com.codingdojo.controllers;




import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.models.User;
import com.codingdojo.services.UserService;


@Controller
public class UserController {

    private final UserService userService;
  
    
    public UserController (UserService userService) {
        this.userService = userService;
       
    }
    
    //render index
    @RequestMapping( value="/", method=RequestMethod.GET )
    public String index(@ModelAttribute("user") User user) {
        return "index.jsp";
    }
    
    //render register page
    @RequestMapping( value="/registration", method=RequestMethod.GET )
    public String registerForm(@ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
    
    //render login page
    @RequestMapping( value="/login", method=RequestMethod.GET )
    public String login() {
        return "redirect:/registration";
    }
    
    //Create User
	@RequestMapping( value = "/registration", method = RequestMethod.POST )
	public String registerUser( @RequestParam(value="first_name") String first_name,
								@RequestParam(value="last_name") String last_name,
								@RequestParam(value="email") String email,
								@RequestParam(value="password") String password,
								@RequestParam(value="passwordConfirmation") String passwordConfirmation,
								@RequestParam(value="type_user") int type_user,
								RedirectAttributes redirectAttributes,
								HttpSession session) {
		
		//get email from form and validate
		User currentUser = userService.findByEmail( email );
		
		
		if( currentUser != null ) {
			redirectAttributes.addFlashAttribute("errorMessage", "That user email already exists!");
			return "redirect:/registration";
		}
		else {
			if( ! password.equals( passwordConfirmation ) ) {
				redirectAttributes.addFlashAttribute("errorMessage", "Password and password confirmation do not match");
				return "redirect:/login";
				
				
			}
			//if validation is correct create newUser
			else {
				//get values from form
				User newUser = new User( first_name, last_name, email, password, type_user );
				System.out.println(  first_name + " " + last_name + " " + email + " " + password + " " + type_user );
				//save newUser
				userService.registerUser( newUser );
				System.out.println(  first_name + " " + last_name + " " + email + " " + password + " " + type_user );
				
				//if user is a host redirect to dashboard
				if( newUser.getType_user() == 0 ) {
					System.out.println( "000000000000" );
					session.setAttribute( "type_user", type_user );
					session.setAttribute( "firstName", first_name );
					session.setAttribute( "lastName", last_name );
					return "redirect:/host/dashboard";
				}
				else {
					session.setAttribute( "type_user", type_user );
					session.setAttribute( "firstName", first_name );
					session.setAttribute( "lastName", last_name );
					return "redirect:/search";
				}
			}
		}
	}
    
	//Validate login user
	@RequestMapping( value = "/login", method = RequestMethod.POST )
	public String login( @RequestParam(value="email") String email,
						 @RequestParam(value="password") String password, Model model,
						 RedirectAttributes redirectAttributes,
						 HttpSession session) {
		
        boolean authentication = userService.authenticateUser(email, password);
        
        if( authentication ) {
        	User currentUser = userService.findByEmail(email);
        	session.setAttribute( "userId", currentUser.getId() );
			session.setAttribute( "type_user", currentUser.getType_user() );
			
			if( currentUser.getType_user() == 0 ) {
				System.out.println( "000000000000" );
				return "redirect:/host/dashboard";
			}
			else {
	        	return "redirect:/search";
			}
   
        }
        else {
        	model.addAttribute( "error", "Invalid Credentials. Please try again" );
        	return "registrationPage.jsp";
        }
	}
	
	
	//Render homePage of Host //little problen with first last name in session
	@RequestMapping( value = "/host/dashboard", method = RequestMethod.GET )
	public String hostDashboard( HttpSession session, Model model ) {
		System.out.println("33333333333333");
		String firstName = (String) session.getAttribute("first_name");
		String lastName = (String) session.getAttribute("last_name");
		Long userID = ( Long ) session.getAttribute("userId");
		
		System.out.println("333333333333");
		System.out.println("11111111111111111111");
		if( userID != null) {
			model.addAttribute("firstName", firstName );
			model.addAttribute("lastName", lastName );
			return "hostDashboard.jsp";
		}
		else {
			return "redirect:/login";
		}
	}
	
	//working with user id
	@RequestMapping( value = "/search", method = RequestMethod.GET )
	public String guestPage( HttpSession session, Model model ) {
		System.out.println("0000000000000");
		Long userID = ( Long ) session.getAttribute("userId");
		User currentUser = userService.findUserById( userID );
		System.out.println("222222222222");

		
		System.out.println("11111111111111111111");
		if( userID != null) {
			model.addAttribute("user", currentUser );
			return "search.jsp";
		}
		else {
			return "redirect:/login";
		}
	}
	
    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
//    	Long userID = ( Long ) session.getAttribute("userId");
//		User currentUser = userService.findUserById( userID );
//		if( userID != null) {
//			model.addAttribute("user", currentUser );
//		}
    	
        session.invalidate();
        return "redirect:/login";
    }

}
