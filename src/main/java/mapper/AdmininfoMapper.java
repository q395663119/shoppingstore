package mapper;

import entity.Admininfo;
import entity.Delivery;

import java.util.List;

public interface AdmininfoMapper {
    List<Delivery> selectAllOrder();

    Admininfo selectByadName(String adName);

    int deleteByPrimaryKey(Integer adId);

    int insert(Admininfo record);

    int insertSelective(Admininfo record);

    Admininfo selectByPrimaryKey(Integer adId);

    int updateByPrimaryKeySelective(Admininfo record);

    int updateByPrimaryKey(Admininfo record);
}