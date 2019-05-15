package com.neu.shop.service;

import com.neu.shop.pojo.Comment;
import com.neu.shop.pojo.CommentExample;

import java.util.List;

/**
 * Created by 王晓帆 on 2019/4/13.
 */
public interface CommentService {
    public void insertSelective(Comment comment);

    public List<Comment> selectByExample(CommentExample commentExample);
}
