package serviceimpl;

import entity.Admininfo;
import entity.Delivery;
import mapper.AdmininfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdmininfoService;

import java.util.List;

@Service
public class AdmininfoServiceImpl implements AdmininfoService {
    @Autowired
    AdmininfoMapper am;

    public List<Delivery> selectAllOrder() {
        return am.selectAllOrder();
    }

    public Admininfo selectByadName(String adName) {
        return am.selectByadName(adName);
    }

    public int deleteByPrimaryKey(Integer adId) {
        return am.deleteByPrimaryKey(adId);
    }

    public int insert(Admininfo record) {
        return am.insert(record);
    }

    public int insertSelective(Admininfo record) {
        return am.insertSelective(record);
    }

    public Admininfo selectByPrimaryKey(Integer adId) {
        return am.selectByPrimaryKey(adId);
    }

    public int updateByPrimaryKeySelective(Admininfo record) {
        return am.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Admininfo record) {
        return am.updateByPrimaryKey(record);
    }
}
