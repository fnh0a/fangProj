package com.hou.erp.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hou.erp.dao.IUserDao;
import com.hou.erp.pojo.Page;
import com.hou.erp.pojo.WorkInfo;
import com.hou.erp.service.IUserService;

@Service("userService")  
public class UserServiceImpl implements IUserService {  
    @Resource  
    private IUserDao userDao;

	public WorkInfo getDataById(int id) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(id); 
	}

	@Override
	public List<WorkInfo> getInfoList() {
		// TODO Auto-generated method stub
		return this.userDao.selectAllInfo(); 
	}

	@Override
	public int insertWorker(WorkInfo workInfo) {
		// TODO Auto-generated method stub
		return this.userDao.insertWorker(workInfo);
	}

	@Override
	public int deleteData(int id) {
		// TODO Auto-generated method stub
		return this.userDao.deleteByPrimaryKey(id);
	}

	@Override
	public int updateWorker(WorkInfo workInfo) {
		// TODO Auto-generated method stub
		return this.userDao.updateByPrimaryKey(workInfo);
	}

	@Override
	public List<WorkInfo> getInfoListByMonth(WorkInfo workInfo,Page page) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("time", workInfo.getTime());
		map.put("workername", workInfo.getWorkername());
		map.put("tableNo", workInfo.getTableNo());
		map.put("start", page.getStart());
		map.put("count", page.getCount());
		return this.userDao.selectInfoByMonth(map); 
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return this.userDao.total();
	}

	@Override
	public List<WorkInfo> getInfoList(Page page) {
		// TODO Auto-generated method stub
		return this.userDao.selectAllInfo(page);
	}

	@Override
	public int totalselect(WorkInfo workInfo) {
		// TODO Auto-generated method stub
		return this.userDao.totalselect(workInfo);
	}  
	
  
}  
