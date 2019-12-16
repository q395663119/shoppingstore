package serviceimpl;

import entity.Orderinfo;
import mapper.OrderdetailMapper;
import mapper.OrderinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderinfoService;

import java.util.List;

@Service
public class OrderinfoServicImpl implements OrderinfoService {
    @Autowired
    OrderinfoMapper oim;

    public int deleteByPrimaryKey(Integer oId) {
        return oim.deleteByPrimaryKey(oId);
    }

    public int insert(Orderinfo record) {
        return oim.insert(record);
    }

    public int insertSelective(Orderinfo record) {
        return oim.insertSelective(record);
    }

    public Orderinfo selectByPrimaryKey(Integer oId) {
        return oim.selectByPrimaryKey(oId);
    }

    public int updateByPrimaryKeySelective(Orderinfo record) {
        return oim.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Orderinfo record) {
        return oim.updateByPrimaryKey(record);
    }
}
