package serviceimpl;

import entity.Userinfo;
import mapper.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserinfoMapper uim;

    public Userinfo selectByUsername(String username) {
        return uim.selectByUsername(username);
    }

    public String selectEmailByUsername(String username) {
        return uim.selectEmailByUsername(username);
    }

    public int selectUidByUsername(String username) {
        return uim.selectUidByUsername(username);
    }

    public int deleteByPrimaryKey(Integer uId) {
        return uim.deleteByPrimaryKey(uId);
    }

    public int insert(Userinfo record) {
        return uim.insert(record);
    }

    public int insertSelective(Userinfo record) {
        return uim.insertSelective(record);
    }

    public Userinfo selectByPrimaryKey(Integer uId) {
        return uim.selectByPrimaryKey(uId);
    }

    public int updateByPrimaryKeySelective(Userinfo record) {
        return uim.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Userinfo record) {
        return uim.updateByPrimaryKey(record);
    }
}
