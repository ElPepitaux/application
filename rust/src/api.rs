// This is the api for the todo app

// This is the Todo struct
#[derive(Clone)]
pub struct Todo {
    pub title: String,
    pub description: String,
    pub priority: String,
    pub day: String,
    pub time: String,
    pub status: String,
}

// This is the vector that will hold all the todos
pub static mut TODOS: Vec<Todo> = Vec::new();

// This is the add function
// It takes in a title, description, priority, day, time, and status
// It then creates a Todo struct and pushes it to the TODOS vector
pub fn add(title: String, description: String, priority: String, day: String, time: String, status: String) {

    let todo = Todo {
        title,
        description,
        priority,
        day,
        time,
        status,
    };
    // This is unsafe because I am using a static variable
    unsafe {
        TODOS.push(todo);
    }
}

// This is the display function
// It iterates through the TODOS vector and prints out each todo
pub fn display() {
    unsafe {
        for todo in TODOS.iter() {
            println!("Title: {}", todo.title);
            println!("Description: {}", todo.description);
            println!("Priority: {}", todo.priority);
            println!("Day: {}", todo.day);
            println!("Time: {}", todo.time);
            println!("Status: {}", todo.status);
        }
    }
}

// This is the update function
// It takes in a title and a new title
// It then iterates through the TODOS vector and updates the title

pub fn update_status(title: String, status: String) {
    unsafe {
        for todo in TODOS.iter_mut() {
            if todo.title == title {
                todo.status = status.clone();
            }
        }
    }
}

// This is the remove function
// It takes in a title
// It then iterates through the TODOS vector and removes the todo with the title
pub fn remove_todo(title: String) {
    // This is unsafe because I am using a static variable
    unsafe {
        TODOS.retain(|todo| todo.title != title);
    }
}

// This is the get_todos function
// It returns the TODOS vector
pub fn get_todos() -> Vec<Todo> {
    unsafe {
        TODOS.clone()
    }
}

