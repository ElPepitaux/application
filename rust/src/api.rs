#[derive(Clone)]
pub struct Todo {
    pub title: String,
    pub description: String,
    pub priority: String,
    pub day: String,
    pub time: String,
    pub status: String,
}

pub static mut TODOS: Vec<Todo> = Vec::new();

pub fn add(title: String, description: String, priority: String, day: String, time: String, status: String) {
    let todo = Todo {
        title,
        description,
        priority,
        day,
        time,
        status,
    };

    unsafe {
        TODOS.push(todo);
    }
}

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

pub fn remove_todo(title: String) {
    unsafe {
        TODOS.retain(|todo| todo.title != title);
    }
}

pub fn get_todos() -> Vec<Todo> {
    unsafe {
        TODOS.clone()
    }
}

