package com.repair.query.dao;


import java.util.List;
import java.util.Map;

import com.repair.common.pojo.DatePlanPri;
import com.repair.common.pojo.DictFirstUnit;
import com.repair.common.pojo.JCFixrec;
import com.repair.common.pojo.JCZXFixRec;
import com.repair.common.pojo.JtPreDict;
import com.repair.common.util.PageModel;

public interface JcFixRecDao {
	/**
	 * 按条件统计工人指定时间段内检修小辅修机车工作时长
	 * @param startDate
	 * @param endDate
	 * @param jcNum
	 * @param fixEmp
	 * @return
	 */
	public Map<Integer, PageModel<Object[]>> getTotalDuration (String startDate,String endDate,String jcNum,String fixEmp);
	
	/**
	 * 按条件统计工人指定时间段内检修中修机车工作时长
	 */
	public Map<Integer, PageModel<Object[]>> getZxDuration (String startDate,String endDate,String jcNum,String fixEmp);
	
	/**
	 * 按条件查询工人指定时间段内检修机车详细项目
	 */
	public PageModel<JCZXFixRec> zxItemTime(String startDate,String endDate,String jcNum,String fixEmp);

	/**
	 * 按条件查询工人指定时间段内检修机车详细项目
	 */
	public PageModel<JCFixrec> itemTime(String startDate,String endDate,String jcNum,String fixEmp);

	/**
	 * 查询工人检修报活记件数
	 */
	public Map<Object, PageModel<Object[]>> repCount(String startDate,String endDate,String jcNum,String dealFixEmp,Long type,Long roleid,Long bzid);
	
	/**
	 * 查询工人检修报活记件数
	 */
	public Map<Object, PageModel<Object[]>> reportCount(String startDate,String endDate,String jcNum,String dealFixEmp,Long type,Long roleid,Long bzid);
	
	/**
	 * 查询工人详细检修活项目
	 */
	public PageModel<JtPreDict> repItem(String startDate,String endDate,String jcNum,String dealFixEmp,Long type);
	
	/**
	 * 查询工人详细检修报活项目
	 */
	public PageModel<JtPreDict> reportItem(String startDate,String endDate,String jcNum,String dealFixEmp,Long type);
	/**
	 * 从记录表中获取以及部件
	 * 0:小辅修 1：中修
	 * @param rjhmId
	 * @return
	 */
	public List<DictFirstUnit> listFirstUnitsOfJCFixRec(Integer rjhmId,int type);
	
	public List<JCFixrec> listLeftWorkRecord(Integer rjhmId);

	public List<JCZXFixRec> listZXLeftWorkRecord(Integer rjhmId);
	
	/**
	 * 查询所有的在修机车
	 * @return
	 */
	public List<DatePlanPri> findFixDatePlanPri();
	
	/**
	 * 根据日计划查询日计划下的报活信息
	 * @param rjhmId
	 * @return
	 */
	public List<JtPreDict> findJtPreDictByRjhmId(Integer rjhmId);
	
	/**
	 * 修改报活分值信息
	 * @param preDictId
	 * @param score
	 */
	public void updateJtPreDictScore(Integer preDictId,Integer score);
	
	/**
	 * 根据日计划ID查询日计划信息
	 * @param rjhmId
	 * @return
	 */
	public DatePlanPri findDatePlanPriById(Integer rjhmId);
}
