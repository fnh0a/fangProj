package com.hou.erp.dao;

import java.util.List;
import java.util.Map;

import com.hou.erp.pojo.Page;
import com.hou.erp.pojo.User;
import com.hou.erp.pojo.WorkInfo;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    WorkInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WorkInfo workInfo);

    int updateByPrimaryKey(WorkInfo workInfo);
    List<WorkInfo> selectAllInfo();
     List<WorkInfo> selectAllInfo(Page page);
    int insertWorker(WorkInfo workInfo);
    List<WorkInfo> selectInfoByMonth(Map<String, Object> map);
     int total(); 
     int totalselect(WorkInfo workInfo);
}