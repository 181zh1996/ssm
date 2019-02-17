package com.itheima.service;

import com.itheima.domain.Condition;
import com.itheima.domain.PageBean;
import com.itheima.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
  List<User>  findAll();

    User findOne(User user);

    void delById(Integer id);

    void addUser(User user);

    User findById(int i);

  void updateUser(User user);





  PageBean<User> limit(Integer currentPage, Condition condition);

  User  findPicById(Integer id);
}

