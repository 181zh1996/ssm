package com.itheima.controller;

import com.itheima.domain.Condition;
import com.itheima.domain.PageBean;
import com.itheima.domain.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    private String[] allowType={"image/jpeg","image/png"};

    @Autowired
    private UserService service;

    /*@RequestMapping("/findAll")
    public String findAll(Model model){
        List<User> list = service.findAll();
        model.addAttribute("users",list);
        return "list";
    }*/

    /**
     * 跳转到登录界面
     * @return
     */
    @RequestMapping("/wait")
    public String waitlogin(){
        return "login";
    }



    /**
     * 跳转到添加界面
     * @return
     */
    @RequestMapping("/waitAdd")
    public String waitAdd(){
        return "add";
    }

    /**
     * 登录方法
     * @param username
     * @param password
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpSession session, String username, String password, Model model){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        User u = service.findOne(user);
        if (u==null){
            model.addAttribute("msg","用户名或密码错误");
            return "login";
        }
        session.setAttribute("user",u);
        model.addAttribute("user",u);
        return "index";
    }

    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        session.removeAttribute("user");
        return "index";
    }

    /**
     * 通过id删除用户
     * @param id
     * @return
     */
    @RequestMapping("/delById")
    public String delById(Integer id){
        service.delById(id);
        return "redirect:/user/findAll";
    }

    /**
     * 添加用户
     * @param request
     * @param picName
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping("/addUser")
    public String addUser(HttpServletRequest request,MultipartFile picName,User user) throws Exception {

        if (!Arrays.asList(allowType).contains(picName.getContentType())){
            throw  new RuntimeException("图片格式错误");
        }
        String path = request.getSession().getServletContext().getRealPath("/pics");
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        String uuid= UUID.randomUUID().toString().replace("-","");
        String filename = picName.getOriginalFilename();
        filename=uuid+"_"+filename;
        picName.transferTo(new File(path,filename));

        user.setPic(filename);
        service.addUser(user);

        return "redirect:/user/findAll";
    }

    /**
     * 退出登录
     * @return
     */
    @RequestMapping("/waitIndex")
    public String waitList(){
        return "index";
    }

    /**
     * 选中删除
     * @param uid
     * @return
     */
    @RequestMapping("/delByIds")
    public String delByIds(Integer[] uid){
        for (int i : uid) {
            System.out.println("选择的ID是"+i);
            service.delById(i);
        }
        return "redirect:/user/findAll";
    }

    /**
     * 根据ID找到用户，回显数据到修改界面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/findById")
    public String findById(String id,Model model){
        User user = service.findById(Integer.parseInt(id));
        model.addAttribute("user",user);
        return "update";
    }
    @RequestMapping("/waitUpdPic")
    public String waitUpdPic(Integer id,Model model){
        User u = service.findById(id);
        model.addAttribute("user",u);
        return "updatepic";
    }
    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/update")
    public String updateUser(User user){
            service.updateUser(user);
            return "redirect:/user/findAll";
    }

    /**
     * 模糊查询+分页显示
     * @param currentPage
     * @param name
     * @param address
     * @param sex
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String limitpage(Integer currentPage,String name,String address,String sex,Model model){
        Condition condition = new Condition();
        condition.setName(name);
        condition.setAddress(address);
        condition.setSex(sex);
       PageBean<User> pb= service.limit(currentPage,condition);
        model.addAttribute("pb",pb);
        model.addAttribute("condition",condition);
        return "list";
    }

    /**
     * 展示用户头像
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/findPicName")
    public String findPicById(User user,Model model){
        Integer id = user.getId();
        System.out.println(id);
        User u  = service.findPicById(id);


        model.addAttribute("picName",u);
        return "pic";
    }


}


