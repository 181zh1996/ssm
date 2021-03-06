package com.itheima.mapper;

import com.itheima.domain.Condition;
import com.itheima.domain.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    List<User> findAll();

    User findOne(User user);

    void delById(Integer id);

    void addUser(User user);

    User findById(int i);

    void updateUser(User user);

    int findTotalCount(Condition condition);

    List<User> findByPage(Condition condition);


    User findPicById(Integer id);
}
