package com.codingdojo.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="places")
public class Place {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
 
	private String address;
    
    
    private String description;
	
    private int cost;

    private String pool_size;
 
    
    @Column(updatable=false)
    private Date created_at;
    private Date updated_at;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "reviews", 
        joinColumns = @JoinColumn(name = "place_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id") )    
    private List<User> users;
    
    
    public Place() {
    }
	
    @PrePersist
    protected void onCreate(){
        this.created_at = new Date();
    }
    
	@PreUpdate
    protected void onUpdate(){
        this.updated_at = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getPool_size() {
		return pool_size;
	}

	public void setPool_size(String pool_size) {
		this.pool_size = pool_size;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	
	
	
}
