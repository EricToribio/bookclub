package com.bookclub.bookclub.service;

import java.util.Optional;

import com.bookclub.bookclub.models.LoginUser;
import com.bookclub.bookclub.models.User;
import com.bookclub.bookclub.repositories.UserRepository;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;

    public User getUserById(Long id) {
		Optional<User> optionalUser=userRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else return null;
	}
    
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
        if(potentialUser.isPresent()){
            result.rejectValue("email","UserExists", "Please Login in, Email already exist");
            return null;
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
            return null;
        }
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepo.save(newUser);
        // TO-DO: Additional validations!
       
    }
    public User login(LoginUser newLoginObject,BindingResult result) {
		
		String emailEntered=newLoginObject.getEmail();
		String passwordEntered=newLoginObject.getPassword();
		
		Optional<User> isUser=userRepo.findByEmail(emailEntered);	
		if (!isUser.isPresent()) {
		System.out.println(!isUser.isPresent());
			System.out.println("Rejecting email");
			result.rejectValue("email", "None", "Invalid Email!");
			return null;
			}
		if(!BCrypt.checkpw(passwordEntered, isUser.get().getPassword())) {
			System.out.println("Rejecting password");
		    result.rejectValue("password", "password", "Invalid Password!");
		    return null;
		}

		else {
			User loginUser=isUser.get();
				return loginUser;
		
		}
	}
   
}
