package controller;

import entity.Productinfo;
import entity.WebInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.ProductinfoServiceImpl;
import serviceimpl.WebInfoServiceImpl;

import java.util.List;

@RestController
public class NavigatorAndShowProductsController {
    @Autowired
    ProductinfoServiceImpl psi;
    @Autowired
    WebInfoServiceImpl wsi;
/*查询所有的商品类型*/
    @RequestMapping("/selectAllP_type")
    public List<String> selectAllP_type(){
        return psi.selectAllP_type();
    }

    /*查询某个类型的所有商品*/
    @RequestMapping("selectAllProductsByP_type")
    public List<Productinfo> selectAllProductsByP_type(@RequestParam String p_type,@RequestParam Integer page){
        return psi.selectAllProductsByP_type(p_type,page);
    }

    /*根据’selectAll‘此sql语句查询当前网站每月的访问量*/
    @RequestMapping("getWebData")
    public List<WebInfo> selectAll(){
        return wsi.selectAll();
    }

    @RequestMapping("selectAllShopByP_type")
    public List<Productinfo> selectAllShopByP_type(@RequestParam String p_type){
        /*根据sql语句按照p_type查询当前所有类型商品的信息*/
        return psi.selectAllShopByP_type(p_type);
    }

    @RequestMapping("UpdateStatus")
    public String UpStatus(@RequestParam Integer pid){
        /*根据sql语句按pid查询productinfo表中status的值
        * 如果status的值位0，表示商品已上架，点击按钮可以把值改为1，表示未上架*/
        Productinfo pi = psi.selectByPrimaryKey(pid);
        if(pi.getStatus()==0){
            pi.setStatus(1);
            psi.updateByPrimaryKey(pi);
            return "down";
        }else if(pi.getStatus()==1){
            pi.setStatus(0);
            psi.updateByPrimaryKey(pi);
            return "up";
        }else{
            return "no";
        }
    }

    @RequestMapping("showshop")
    public List<Productinfo> showshop(@RequestParam Integer pid){
        /*根据sql语句按照pid查询当前商品的详细信息*/
        return psi.showshop(pid);
    }
}
