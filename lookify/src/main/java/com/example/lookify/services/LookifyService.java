package com.example.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.lookify.models.Lookify;
import com.example.lookify.repositories.LookifyRepository;


import org.springframework.data.domain.Sort;



@Service
public class LookifyService {
	private final LookifyRepository lookifyRepository;
	
	public LookifyService(LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}

	public List<Lookify> allLookifies() {
		return lookifyRepository.findAll();
	}
	
	public Lookify create(Lookify lookify) {
		return lookifyRepository.save(lookify);
	}
	
	public List<Lookify> findByArtist(String artist){
		return lookifyRepository.findByArtist(artist);

	}
	
	public Lookify findLookifyById(Long id) {
		Optional<Lookify> optionalLookify = lookifyRepository.findById(id);
		if (optionalLookify.isPresent()) {
			return optionalLookify.get();
		} else {
			return null;
		}

	}
	
	public void deleteLookifyById(Long id) {
		lookifyRepository.deleteById(id);
	}
	
	public List<Lookify> findTopTen(){
		List<Lookify> sortedList = lookifyRepository.findAll(Sort.by("rating").descending());
	    return sortedList;
		 
	}
	
	public List<Lookify> search(String artistName){
		 List<Lookify> allList = lookifyRepository.findAll(Sort.by("artistName"));
		 if(allList.size() < 1) {
			 return null;
		 }
	     return allList;
		
	}


}
