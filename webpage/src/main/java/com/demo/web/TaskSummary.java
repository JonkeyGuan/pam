package com.demo.web;

public class TaskSummary {

    private Task_summary[] task_summary;

    public Task_summary[] getTask_summary() {
        return task_summary;
    }

    public void setTask_summary(Task_summary[] task_summary) {
        this.task_summary = task_summary;
    }

    @Override
    public String toString() {
        return "TaskSummary [task_summary = " + task_summary + "]";
    }
}
