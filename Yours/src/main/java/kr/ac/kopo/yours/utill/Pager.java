package kr.ac.kopo.yours.utill;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 5;
	private int groupPage = 5;
	private float total;
	
	private String id;
	
	private int category1;
	private int category2;
	private int category3;
	private int category4;
	private int category5;
	
	
	
	public int getCategory1() {
		return category1;
	}

	public void setCategory1(int category1) {
		this.category1 = category1;
	}

	public int getCategory2() {
		return category2;
	}

	public void setCategory2(int category2) {
		this.category2 = category2;
	}

	public int getCategory3() {
		return category3;
	}

	public void setCategory3(int category3) {
		this.category3 = category3;
	}

	public int getCategory4() {
		return category4;
	}

	public void setCategory4(int category4) {
		this.category4 = category4;
	}

	public int getCategory5() {
		return category5;
	}

	public void setCategory5(int category5) {
		this.category5 = category5;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		int startPage = ((page - 1) / groupPage) * groupPage + 1;
		
		for(int index = startPage; index < (startPage + groupPage) && index <= getLast(); index++)
			list.add(index);
		
		if(list.isEmpty())
			list.add(1);
		
		return list;
	}
	
	public int getNext() {
		int next = (((page - 1) / groupPage) * groupPage) + 1;
		int last = getLast();
		
		return next > last ? last : next;
	}
	
	public int getLast() {
		int last = (int) Math.ceil(total/perPage);
		
		return last < 1 ? 1 : last;
	}

	public int getPrev() {
		return page <= groupPage ? 1 : (((page -1) / groupPage) - 1) * groupPage + 1;
	}
	
	public int getOffset() {
		return (page -1) * perPage;
	}
	
	public int getPerPage() {
		return perPage;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public int getGroupPage() {
		return groupPage;
	}
	
	public void setGroupPage(int groupPage) {
		this.groupPage = groupPage;
	}
	
	public float getTotal() {
		return total;
	}
	
	public void setTotal(float total) {
		this.total = total;
	}
}
