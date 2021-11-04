package com.codingdojo.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;


import com.codingdojo.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
    
    //User findByType_user( int type_user );
    
   
	
	Optional<User> findById( Long id );
    
    
}
