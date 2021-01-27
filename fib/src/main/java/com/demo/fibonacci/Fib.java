package com.demo.fibonacci;

/**
 * This class was automatically generated by the data modeler tool.
 */

public class Fib implements java.io.Serializable {

	static final long serialVersionUID = 3227839877551590262L;

	private int sequence;
	private long value;

	public Fib() {
	}

	public Fib(int sequence) {
		super();
		this.sequence = sequence;
		this.value = -1;
	}

	public String toString() {
		return "Fib(" + this.sequence + "/" + this.value + ")";
	}

	public int getSequence() {
		return this.sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public long getValue() {
		return this.value;
	}

	public void setValue(long value) {
		this.value = value;
	}

	public Fib(int sequence, long value) {
		this.sequence = sequence;
		this.value = value;
	}

}