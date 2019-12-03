package controller;

import entity.Userinfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.UserServiceImpl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    /*用cookie做登录*/
    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String flag, HttpServletRequest req, HttpServletResponse resp){
        Userinfo ui =usi.selectByUsername(username);
        if(ui==null){
            return "none";
        }else{
            if(DigestUtils.md5Hex(password.getBytes()).equals(ui.getPassword())){
                //if(flag.equals("yes")){
                    ui.setPassword(password);
                  //  req.getSession().setAttribute("in",ui);

                    Cookie name = new Cookie("username",username);
                    Cookie pwd = new Cookie("password",password);
                    name.setMaxAge(10000);
                    pwd.setMaxAge(10000);
                    resp.addCookie(name);
                    resp.addCookie(pwd);

                if(flag.equals("yes")){
                    Cookie cookie = new Cookie("flag","no");
                    cookie.setMaxAge(10000);
                    resp.addCookie(cookie);
                }else{
                    Cookie cookie = new Cookie("flag","yes");
                    cookie.setMaxAge(10000);
                    resp.addCookie(cookie);
                }

                    /*Cookie[] co = req.getCookies();
                    if(co.length>0){
                        for (Cookie c:co) {
                            if(c.getName().equals("username")||c.getName().equals("password")){
                                c.setValue(null);
                                c.setMaxAge(0);
                                resp.addCookie(c);
                            }
                        }
                    }*/

                /*}else{
                   // req.getSession().removeAttribute("in");
                    *//*Cookie[] co = req.getCookies();
                    if(co.length>0){
                        for (Cookie c:co) {
                            if(c.getName().equals("username")||c.getName().equals("password")){
                                c.setValue(null);
                                c.setMaxAge(0);
                                resp.addCookie(c);
                            }
                        }
                    }*//*

                   Cookie name = new Cookie(username,username);
                   name.setMaxAge(10000);
                   resp.addCookie(name);
                }*/
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