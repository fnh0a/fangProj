package com.hou.erp.service;

import java.util.List;

import com.hou.erp.pojo.Page;
import com.hou.erp.pojo.WorkInfo;

public interface  IUserService {
	public WorkInfo getDataById(int id);   
	public List<WorkInfo> getInfoList();   
	public List<WorkInfo> getInfoListByMonth(WorkInfo workInfo,	Page page);   
	public int insertWorker(WorkInfo workInfo);
	public int deleteData(int id);   
	public int updateWorker(WorkInfo workInfo);
	public int total();
	public List<WorkInfo> getInfoList(Page page);
	public int totalselect(WorkInfo workInfo);
}
