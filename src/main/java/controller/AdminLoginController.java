package controller;

import entity.Admininfo;
import entity.Delivery;
import entity.Orderinfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.AdmininfoServiceImpl;
import serviceimpl.OrderinfoServicImpl;

import java.util.List;

@RestController
public class AdminLoginController {
    @Autowired
    AdmininfoServiceImpl asi;

    @Autowired
    OrderinfoServicImpl osi;

    @RequestMapping("adminlogin")
    public String selectByadName(@RequestParam String adName,@RequestParam String adPassword){
        /*根据sql语句查询admin表中是否存在此管理员账号*/
        Admininfo ai = asi.selectByadName(adName);
        if(ai==null){
            return "none";
        }else{
            /*如果有把输入的密码进行加密与数据库里的密码进行比较，相同返回true*/
            if(DigestUtils.md5Hex(adPassword.getBytes()).equals(ai.getAdPassword())){
                ai.setAdPassword(adPassword);
                return "true";
            }else{
                return "error";
            }
        }
    }

    @RequestMapping("selectAllOrder")
    public List<Delivery> selectAllOrder(){
        return asi.selectAllOrder();
    }

    @RequestMapping("ChangeOrders")
    public String ChangeOrders(@RequestParam Integer oId){
        /*根据sql语句按照oid查询status的值
        * 如果值位0，表示未发货，把status的值改为1，表示已发货*/
        Orderinfo oi = osi.selectByPrimaryKey(oId);
        if(oi.getStatus()==0){
            oi.setStatus(1);
            osi.updateByPrimaryKey(oi);
            return "up";
        }else if(oi.getStatus()==1){
            oi.setStatus(0);
            osi.updateByPrimaryKey(oi);
            return "down";
        }else{
            return "no";
        }
    }
}
