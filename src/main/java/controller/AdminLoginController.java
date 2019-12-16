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
        Admininfo ai = asi.selectByadName(adName);
        if(ai==null){
            return "none";
        }else{
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
