package edu.unsw.comp9321;

import java.util.*;

import org.w3c.dom.Node;

import java.io.Serializable;

/*
 * This keeps a track of the person's chosen itinerary
 */
public class JourneyBean implements Serializable { 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Vector<String> places;
	private Vector<Node> node;
	private String string;
	public JourneyBean() { 
		places = new Vector<String>(); 
		node = new Vector<Node>(); 
	} 
	
	public String getString() { 
		return string; 
	} 
	public void setString(String string) {
		this.string = string;
	}
	public Vector<String> getPlaces() { 
		return places; 
	} 
	public void setPlaces(Vector<String> places) {
		this.places = places;
	}
	public void setNode(Vector<Node> node) {
		this.node = node;
	}
	public Vector<Node> getNode() { 
		return node; 
	} 
	
	
	
	public String toString() { return "JourneyBean to "; }
}