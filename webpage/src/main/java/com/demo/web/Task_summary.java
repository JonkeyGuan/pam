package com.demo.web;

public class Task_summary {

    private String task_id;
    private String task_name;
    private String task_subject;
    private String task_description;
    private String task_status;
    private String task_priority;
    private String task_is_skipable;
    private String task_actual_owner;
    private Object task_created_by;
    private Task_created_on task_created_on;
    private Task_activation_time task_activation_time;
    private Object task_expiration_time;
    private String task_proc_inst_id;
    private String task_proc_def_id;
    private String task_container_id;
    private String task_parent_id;
    private String correlation_key;
    private String process_type;

    @Override
    public String toString() {
	return "Task_summary [task_id=" + task_id + ", task_name=" + task_name + ", task_subject=" + task_subject + ", task_description=" + task_description + ", task_status="
		+ task_status + ", task_priority=" + task_priority + ", task_is_skipable=" + task_is_skipable + ", task_actual_owner=" + task_actual_owner + ", task_created_by="
		+ task_created_by + ", task_created_on=" + task_created_on + ", task_activation_time=" + task_activation_time + ", task_expiration_time=" + task_expiration_time
		+ ", task_proc_inst_id=" + task_proc_inst_id + ", task_proc_def_id=" + task_proc_def_id + ", task_container_id=" + task_container_id + ", task_parent_id="
		+ task_parent_id + ", correlation_key=" + correlation_key + ", process_type=" + process_type + "]";
    }

    public String getTask_id() {
	return task_id;
    }

    public void setTask_id(String task_id) {
	this.task_id = task_id;
    }

    public String getTask_name() {
	return task_name;
    }

    public void setTask_name(String task_name) {
	this.task_name = task_name;
    }

    public String getTask_subject() {
	return task_subject;
    }

    public void setTask_subject(String task_subject) {
	this.task_subject = task_subject;
    }

    public String getTask_description() {
	return task_description;
    }

    public void setTask_description(String task_description) {
	this.task_description = task_description;
    }

    public String getTask_status() {
	return task_status;
    }

    public void setTask_status(String task_status) {
	this.task_status = task_status;
    }

    public String getTask_priority() {
	return task_priority;
    }

    public void setTask_priority(String task_priority) {
	this.task_priority = task_priority;
    }

    public String getTask_is_skipable() {
	return task_is_skipable;
    }

    public void setTask_is_skipable(String task_is_skipable) {
	this.task_is_skipable = task_is_skipable;
    }

    public String getTask_actual_owner() {
	return task_actual_owner;
    }

    public void setTask_actual_owner(String task_actual_owner) {
	this.task_actual_owner = task_actual_owner;
    }

    public Object getTask_created_by() {
	return task_created_by;
    }

    public void setTask_created_by(Object task_created_by) {
	this.task_created_by = task_created_by;
    }

    public Task_created_on getTask_created_on() {
	return task_created_on;
    }

    public void setTask_created_on(Task_created_on task_created_on) {
	this.task_created_on = task_created_on;
    }

    public Task_activation_time getTask_activation_time() {
	return task_activation_time;
    }

    public void setTask_activation_time(Task_activation_time task_activation_time) {
	this.task_activation_time = task_activation_time;
    }

    public Object getTask_expiration_time() {
	return task_expiration_time;
    }

    public void setTask_expiration_time(Object task_expiration_time) {
	this.task_expiration_time = task_expiration_time;
    }

    public String getTask_proc_inst_id() {
	return task_proc_inst_id;
    }

    public void setTask_proc_inst_id(String task_proc_inst_id) {
	this.task_proc_inst_id = task_proc_inst_id;
    }

    public String getTask_proc_def_id() {
	return task_proc_def_id;
    }

    public void setTask_proc_def_id(String task_proc_def_id) {
	this.task_proc_def_id = task_proc_def_id;
    }

    public String getTask_container_id() {
	return task_container_id;
    }

    public void setTask_container_id(String task_container_id) {
	this.task_container_id = task_container_id;
    }

    public String getTask_parent_id() {
	return task_parent_id;
    }

    public void setTask_parent_id(String task_parent_id) {
	this.task_parent_id = task_parent_id;
    }

    public String getCorrelation_key() {
	return correlation_key;
    }

    public void setCorrelation_key(String correlation_key) {
	this.correlation_key = correlation_key;
    }

    public String getProcess_type() {
	return process_type;
    }

    public void setProcess_type(String process_type) {
	this.process_type = process_type;
    }

}
