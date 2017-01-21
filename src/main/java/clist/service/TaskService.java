package clist.service;

import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import clist.dao.TaskRepository;
import clist.model.Task;

@Service
@Transactional
public class TaskService {

	private final TaskRepository taskRepository;
/*	private List<String> categories;*/

	public TaskService(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
/*		this.categories = new LinkedList<>();
		this.categories.add("MAIN CATEGORY");*/
	}

	public Iterable<Task> findAll() {
		return taskRepository.findAll();
	}

	public Task findTask(int id) {
		return taskRepository.findOne(id);
	}

	public void save(Task task) {
		taskRepository.save(task);
	}
	
/*	public void saveNewCategory(String categoryName) {
		categories.add(categoryName);
	}*/

	public void delete(int id) {
		taskRepository.delete(id);
	}

	public String statistics() {
		int numberOfTasks = (int) taskRepository.count();
		int numberOfTasksDone = 0;
		for (Task currentTask : taskRepository.findAll()) {
			if (currentTask.isFinished()) {
				numberOfTasksDone++;
			}
		}
		return "Current Number of Tasks: " + numberOfTasks + "Number of Tasks Done: " + numberOfTasksDone + "\n"
				+ "Number of Tasks To Do: " + (numberOfTasks - numberOfTasksDone);
	}
	
}
