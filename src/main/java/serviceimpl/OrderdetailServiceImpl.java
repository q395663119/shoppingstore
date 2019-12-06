package serviceimpl;

import entity.Orderdetail;
import mapper.OrderdetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderdetailService;

@Service
public class OrderdetailServiceImpl implements OrderdetailService {
    @Autowired
    OrderdetailMapper odm;

    public int deleteByPrimaryKey(Integer odId) {
        return odm.deleteByPrimaryKey(odId);
    }

    public int insert(Orderdetail record) {
        return odm.insert(record);
    }

    public int insertSelective(Orderdetail record) {
        return odm.insertSelective(record);
    }

    public Orderdetail selectByPrimaryKey(Integer odId) {
        return odm.selectByPrimaryKey(odId);
    }

    public int updateByPrimaryKeySelective(Orderdetail record) {
        return odm.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Orderdetail record) {
        return odm.updateByPrimaryKey(record);
    }
}
