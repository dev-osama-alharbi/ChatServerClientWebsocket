package sa.osama_alharbi.sbar.ws.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import sa.osama_alharbi.sbar.ws.model.MsgModel;
import sa.osama_alharbi.sbar.ws.service.NotificationService;

import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
public class WebsocketController {

    private final NotificationService notificationService;

    @MessageMapping("/chat")
    @SendTo("/topic/chat")
    public MsgModel newMsg(MsgModel msgModel){
        msgModel.setDateTime(LocalDateTime.now());
        System.out.println(msgModel.getUsername());
        notificationService.sendToAll(msgModel.getMsg());
        return msgModel;
    }
}
