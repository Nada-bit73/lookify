package com.example.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.lookify.models.Lookify;

import org.springframework.data.domain.Sort;


@Repository
public interface LookifyRepository extends CrudRepository<Lookify, Long>{

		List<Lookify> findAll();
		List<Lookify> findAll(Sort sort);
		List<Lookify> findByArtist(String artist);

}
