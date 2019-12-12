package controller;

import entity.Admininfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.AdmininfoServiceImpl;

@RestController
public class AdminLoginController {
    @Autowired
    AdmininfoServiceImpl asi;

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
}
