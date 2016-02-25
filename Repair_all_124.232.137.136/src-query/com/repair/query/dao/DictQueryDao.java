package com.repair.query.dao;

import java.util.List;
import java.util.Map;

import com.repair.common.pojo.DatePlanPri;
import com.repair.common.pojo.DictFirstUnit;
import com.repair.common.pojo.DictGuDao;
import com.repair.common.pojo.DictJcFixSeq;
import com.repair.common.pojo.DictJcStype;
import com.repair.common.pojo.DictJcType;
import com.repair.common.pojo.DictProTeam;
import com.repair.common.pojo.DlJcJyMxb;
import com.repair.common.pojo.JCFixrec;
import com.repair.common.pojo.JCFlowRec;
import com.repair.common.pojo.JCQZFixRec;
import com.repair.common.pojo.JCSignature;
import com.repair.common.pojo.JCZXFixItem;
import com.repair.common.pojo.JCZXFixRec;
import com.repair.common.pojo.JtPreDict;
import com.repair.common.pojo.JtRunKiloRec;
import com.repair.common.pojo.NrJcJyzb;
import com.repair.common.pojo.PJDynamicInfo;
import com.repair.common.pojo.PJStaticInfo;
import com.repair.common.pojo.SignedForFinish;
import com.repair.common.util.PageModel;

/**
 * 
 * 字典信息查询
 * @author shenfu
 *
 */
public interface DictQueryDao {
	
	/**
	 * 查询所有的修程修次
	 * @return
	 */
	List<DictJcFixSeq> findAllDictJcFixSeqs();
	
	/**
	 * 查找所有的机车类别
	 */
	List<DictJcType> findAllDictJcType();
	
	/**
	 * 查询所有的股道
	 * @return
	 */
	List<DictGuDao> findAllGuDao();
	
	/**
	 * 查询所有检修班组
	 * @return
	 */
	List<DictProTeam> findAllProTeam();
	
	/**
	 * 查询对应检修班组
	 * @param jctype
	 * @param workflag
	 * @return
	 */
	List<DictProTeam>  findAllProTeam(String jctype, Integer workflag);
	
	/**
	 * 查找中修对应班组
	 * @param jctype
	 * @param workflag
	 * @return
	 */
	public List<DictProTeam> findAllZxProTeam(String jctype, Integer workflag);
	
	/**
	 * 查询所有的机车部件
	 * @return
	 */
	List<DictFirstUnit> findAllFirstUnit();
	
	/**
	 * 查找所有在机务段股道的机车
	 * @return
	 */
	List<DatePlanPri> findGDJCInDailyPlan(String time);
	
	/**
	 * 根据日计划查询所有的流程记录
	 * @param rjhmId
	 * @return
	 */
	List<JCFlowRec> findJCFlowRecByDatePlan(Integer rjhmId);
	
	/**
	 * 根据ID查找日计划实体
	 * @param rjhmId
	 * @return
	 */
	DatePlanPri findDatePlanPriById(Integer rjhmId);
	
	/**
	 * 根据类别ID查询机车型号
	 * @param typeId
	 * @return
	 */
	List<DictJcStype> findStypeByTypeId(Integer typeId);
	
	/**
	 * 查找机车走行
	 * @return
	 */
	List<JtRunKiloRec> findJtRunKiloRec(String stypeId);
	
	/**
	 * 
	 * 查询机车日计划
	 * @param map
	 * @return
	 */
	List<DatePlanPri> findDatePlanPri(Map<String,String> map);
	
	/**
	 * 校辅修检修记录
	 * @return
	 */
	List<JCFixrec> findJCFixrec(Integer datePlanPri,String unit);
	
	PageModel<JCFixrec> findJCFixrecLimited(Integer datePlanPri,String unit);
	
	/**
	 * 统计记录条数
	 */
	public Long countJCZXFixRec(Integer datePlanPri,Integer fristUnit);
	
	/**
	 * 中修检修记录
	 * @return
	 */
	List<JCZXFixRec> findJCZXFixRec(Integer datePlanPri,Integer fristUnit);
	
	/**
	 * 根据机车查询一条日计划
	 * @param xcxc
	 * @param jcStype
	 * @param jcNum
	 * @return
	 */
	DatePlanPri findDatePlanPriByJC(String xcxc,String jcStype,String jcNum);
	
	/**
	 * 秋整检修记录
	 * @param datePlanPri
	 * @return
	 */
	List<JCQZFixRec> findJCQZFixRec(Integer datePlanPri);
	
	/**
	 * 临修检修记录
	 * @param datePlanPri
	 * @return
	 */
	List<JtPreDict> findJtPreDict(Integer datePlanPri);
	
	/**
	 * 报活记录
	 * @param datePlanPri
	 * @return
	 */
	List<JtPreDict> findJtPreDictPre(Integer datePlanPri);
	
	/**
	 * 根据班组、专业查询报活记录
	 * @param datePlanPri
	 * @param type
	 * @return
	 */
	List<JtPreDict> findJtPreDictByFlag(Integer datePlanPri, Object flag);
	
	/**
	 * 根据班组、专业查询报活记录
	 * @param datePlanPri
	 * @param type
	 * @return
	 */
	List<JtPreDict> findJtPreDictByFlag(Integer datePlanPri, Object flag, int type);
	
	/**
	 * 根据日计划，查找签名
	 * @param datePlanPri
	 * @return
	 */
	SignedForFinish findSignedForFinishByPlan(Integer datePlanPri);
	
	/**
	 * 根据机车型号查找对应的部件
	 * @param jcStype
	 * @return
	 */
	List<DictFirstUnit> findDictFirstUnitByType(String jcStype);
	
	/**
	 * 临修检修记录
	 * @param datePlanPri
	 * @return
	 */
	List<JtPreDict> findAllJtPreDict(Integer datePlanPri);
	
	/**
	 * 获取竣工记录
	 */
	public SignedForFinish getJCjungong(int rjhmId);
	
	/**
	 * 获取交车项目记录
	 */
	public List<DlJcJyMxb> getDlJcJyMxb(int rjhmId);
	
	/**
	 * 交车签到记录
	 */
	public List<NrJcJyzb> getNrJcJyzb(int rjhmId);
	
	/**
	 * 获得签名记录
	 */
	public List<JCSignature> getJCSignature(int rjhmId);
	
	/**
	 * 查找小辅修检修记录
	 * @param datePlanPri
	 * @return
	 */
	List<JCFixrec> findJCFixrec(Integer datePlanPri);
	
	/**
	 * 查找中修检修记录
	 * @param datePlanPri
	 * @return
	 */
	List<JCZXFixRec> findJCZXFixRec(Integer datePlanPri);
	
	PageModel<JCZXFixRec> findJCZXFixRecLimited(Integer datePlanPri);

	/**
	 * 根据班组查询检修记录
	 * @param rjhmId
	 * @param teamId
	 * @return
	 */
	public List<JCFixrec> findRecByProTeam(Integer rjhmId,Long teamId);
	
	/**
	 * 根据班组查询检修记录
	 * @param rjhmId
	 * @param teamId
	 * @return
	 */
	public List<JCZXFixRec> findZxRecByProTeam(Integer rjhmId,Long teamId,Integer nodeId);

	/**
	 * 根据机车部件查找对应的检修记录
	 * @param rjhmId
	 * @param unit
	 * @return
	 */
	public List<JCQZFixRec> findJCQZFixrecByUnit(Integer rjhmId,String unit );
	
	/**
	 * 根据班组查找秋整检修记录
	 * @param rjhmId
	 * @param unit
	 * @return
	 */
	public List<JCQZFixRec> findJCQZFixrecByTeam(Integer rjhmId,Long teamId );
	
	/**
	 * 查找机车检修历史记录
	 * @param jcNum
	 * @return
	 */
	public List<DatePlanPri> findJCHistory(String jcNum);
	
	/**
	 * 转移机车股道和台位
	 */
	public void updateJCGDAndTW(int rjhmId,String gdh,String twh);
	
	/**
	 * 查询修程修次
	 */
	public String findXcxc(String xcxc);
	
	public List<JCZXFixItem> findZXItem(Integer nodeid, String xcxc, String jcsType, Long bzid, Integer firstUnitId);
	
	/**
	 * 根据机车类型查询配件静态信息
	 * @param jcType
	 * @param bzId 班组ID  null 表示全部
	 * @return
	 */
	public List<PJStaticInfo> findPJStaticInfo(String jcType,Long bzId);
	
	/**
	 * 根据静态ID信息查询动态配件信息
	 * @param pjsid
	 * @return
	 */
	public List<PJDynamicInfo> findPJDynamicInfoBySID(Long pjsid);
	
    /**
     * 查询小辅修试验情况
     * @param rjhmId
     * @param type 0:工人  1：工长 2：质检员 3:技术员4：交车工长 5：验收员
     * @return
     */
	public Long findExpSituation(Integer rjhmId,int type);
}
