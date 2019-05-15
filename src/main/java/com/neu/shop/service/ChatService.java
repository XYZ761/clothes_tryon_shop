package com.neu.shop.service;

import com.neu.shop.pojo.Chat;
import com.neu.shop.pojo.ChatExample;

import java.util.List;

/**
 * Created by 王晓帆 on 2019/4/5.
 */
public interface ChatService {
    public void insertChatSelective(Chat chat);

    public List<Chat> selectChatByExample(ChatExample chatExample);
}
