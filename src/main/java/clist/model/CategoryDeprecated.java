package clist.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class CategoryDeprecated implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int categoryId;
	private String categoryName;
	
	private Map<String, Iterable<Task>> categoriesMap;
	
/*	public Category() {
		this.categoriesMap = new LinkedHashMap<>();
		this.categoryName = "CATEGORY " + categoryId;
		categoriesMap.put(categoryName, new LinkedList<Task>());
	}
	
	public Category(int categoryId, String categoryName) {
		this();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}*/

	public Collection<Iterable<Task>> getValues() {
		return this.categoriesMap.values();
	}
	
	public Iterable<Task> getCategoryBy(String categoryName){
		return this.categoriesMap.get(categoryName);
	}

}
