package controller;

import entity.Orderinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.OrderdetailServiceImpl;
import serviceimpl.OrderinfoServicImpl;

import java.util.List;

@RestController
public class OrderinfoAndOrderdetaController {
    @Autowired
    OrderinfoServicImpl osi;

    @Autowired
    OrderdetailServiceImpl odsi;

    @RequestMapping("selectAllOrder")
    public  Orderinfo selectAllOrder(@RequestParam Integer oId){
        return osi.selectByPrimaryKey(oId);
    }
}
