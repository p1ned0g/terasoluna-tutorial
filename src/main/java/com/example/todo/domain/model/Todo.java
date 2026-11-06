package com.example.todo.domain.model;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "todo")
public class Todo  implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "todo_id")
    private String todoId;
    @Column(name = "todo_title")
    private String todoTitle;
    @Column(name = "finished")
    private boolean finished;
    @Column(name = "created_at")
    private LocalDate createdAt;

    public String getTodoId() {
        return todoId;
    }
    public void setTodoId(String todoId) {
        this.todoId = todoId;
    }
    public String getTodoTitle() {
        return todoTitle;
    }
    public void setTodoTitle(String todoTitle) {
        this.todoTitle = todoTitle;
    }
    public boolean isFinished() {
        return finished;
    }
    public void setFinished(boolean finished) {
        this.finished = finished;
    }
    public LocalDate getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }
}
