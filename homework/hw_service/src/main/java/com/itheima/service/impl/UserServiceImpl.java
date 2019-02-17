package com.itheima.service.impl;

import com.itheima.domain.Condition;
import com.itheima.domain.PageBean;
import com.itheima.domain.User;
import com.itheima.mapper.UserMapper;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl  implements UserService{
    @Autowired
    private UserMapper mapper;



    public List<User> findAll() {
        return mapper.findAll();
    }

    public User findOne(User user) {
        return mapper.findOne(user);
    }

    public void delById(Integer id) {
        mapper.delById(id);
    }

    public void addUser(User user) {
        mapper.addUser(user);
    }

    public User findById(int i) {
        return mapper.findById(i);
    }

    public void updateUser(User user) {
        mapper.updateUser(user);
    }



    public PageBean<User> limit(Integer currentPage, Condition condition) {
        if (currentPage == null){
            currentPage=1;
        }
        PageBean<User> pb= new PageBean<User>();
        pb.setCurrentPage(currentPage);
        int rows =5;
        pb.setRows(rows);
        int totalCount =  mapper.findTotalCount(condition);
        pb.setTotalCount(totalCount);

        int start = (currentPage- 1)  * rows;
       condition.setRows(rows);
       condition.setStart(start);
        List<User> list = mapper.findByPage(condition);
        pb.setList(list);
        int totalPage = (totalCount % rows) == 0 ?  totalCount/rows : totalCount/rows+1;
        pb.setTotalPage(totalPage);

        return pb;
    }

    public User findPicById(Integer id) {
        return mapper.findPicById(id);
    }


}
