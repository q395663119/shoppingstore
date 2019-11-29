package controller;

import entity.Userinfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class LoginAndRegisterController {
    @Autowired
    UserServiceImpl usi;

    @RequestMapping("/update")
    public String update(@RequestParam String username, @RequestParam String password,@RequestParam String password2){
        Userinfo ui = usi.selectByUsername(username);
        if(ui==null){
            return "none";
        }else{
           if(DigestUtils.md5Hex(password2.getBytes()).equals(DigestUtils.md5Hex(password.getBytes()))){
               ui.setPassword(DigestUtils.md5Hex(password.getBytes()));
               usi.updateByPrimaryKeySelective(ui);
                   return "true";
           }else{
                return "error";
            }
        }
    }

    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String flag, HttpServletRequest req){
        Userinfo ui =usi.selectByUsername(username);
        if(ui==null){
            return "none";
        }else{
            if(DigestUtils.md5Hex(password.getBytes()).equals(ui.getPassword())){
                if(flag.equals("yes")){
                    ui.setPassword(password);
                    req.getSession().setAttribute("in",ui);
                }else{
                    req.getSession().removeAttribute("in");
                }
                return "true";
            }else{
                return "error";
            }

        }
    }

    @RequestMapping("/register")
    public String register(@RequestParam String username, @RequestParam String password, @RequestParam String email) {
        /**/
        if (usi.selectByUsername(username) != null) {
            return "existed";
        } else {
            Userinfo ui = new Userinfo();
            ui.setUsername(username);
            ui.setPassword(DigestUtils.md5Hex(password.getBytes()));
            ui.setEmail(email);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ui.setRegisterTime(sdf.format(date));
            int line = usi.insert(ui);
            if (line > 0) {
                return "yes";
            } else {
                return "no";
            }
        }
    }

}