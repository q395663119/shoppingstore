package serviceimpl;

import entity.Productinfo;
import mapper.ProductinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ProductinfoService;

import java.util.List;

@Service
public class ProductinfoServiceImpl implements ProductinfoService {
    @Autowired
    ProductinfoMapper pfm;

    public List<String> selectAllP_type() {
        return pfm.selectAllP_type();
    }

    public int deleteByPrimaryKey(Integer pId) {
        return pfm.deleteByPrimaryKey(pId);
    }

    public int insert(Productinfo record) {
        return pfm.insert(record);
    }

    public int insertSelective(Productinfo record) {
        return pfm.insertSelective(record);
    }

    public Productinfo selectByPrimaryKey(Integer pId) {
        return pfm.selectByPrimaryKey(pId);
    }

    public int updateByPrimaryKeySelective(Productinfo record) {
        return pfm.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Productinfo record) {
        return pfm.updateByPrimaryKey(record);
    }
}
