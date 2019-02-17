package com.itheima.domain;

import java.io.Serializable;
import java.util.List;

public class PageBean<U> implements Serializable {
    private int totalCount; //总记录数
    private int totalPage; //总页数= 总记录数 % 每页显示条数 == 0 ？ 总记录数/每页显示条数 ：总记录数/每页显示条数+1
    private List list;//每页的数据 List集合
    private int rows;//每页显示条数
    private int currentPage;//当前页码



    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", rows=" + rows +
                ", currentPage=" + currentPage +
                '}';
    }
}