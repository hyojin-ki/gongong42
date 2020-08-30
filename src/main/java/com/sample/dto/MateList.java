package com.sample.dto;

import java.util.List;
import java.util.Map;

import com.sample.web.view.Performance;

public class MateList {

	private Performance performance;
	private int totalCnt;
	private int Rseats;
	private int Sseats;
	private int Aseats;
	
	public MateList() { }

	public Performance getPerformance() {
		return performance;
	}

	public void setPerformance(Performance performance) {
		this.performance = performance;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}


	

	public int getRseats() {
		return Rseats;
	}

	public void setRseats(int rseats) {
		Rseats = rseats;
	}

	public int getSseats() {
		return Sseats;
	}

	public void setSseats(int sseats) {
		Sseats = sseats;
	}

	public int getAseats() {
		return Aseats;
	}

	public void setAseats(int aseats) {
		Aseats = aseats;
	}

	@Override
	public String toString() {
		return "MateList [performance=" + performance + ", totalCnt=" + totalCnt + ", Rseats=" + Rseats + ", Sseats="
				+ Sseats + ", Aseats=" + Aseats + "]";
	}



	
	
}
