#[derive(Clone)]
pub struct Todo {
    pub title: String,
    pub description: String,
    pub priority: String,
    pub time: String,
    pub status: String,
}

pub static mut TODOS: Vec<Todo> = Vec::new();

pub fn add(title: String, description: String, priority: String, time: String, status: String) {
    let todo = Todo {
        title,
        description,
        priority,
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
            println!("Time: {}", todo.time);
            println!("Status: {}", todo.status);
        }
    }
}

pub fn get_todos() -> Vec<Todo> {
    unsafe {
        TODOS.clone()
    }
}

