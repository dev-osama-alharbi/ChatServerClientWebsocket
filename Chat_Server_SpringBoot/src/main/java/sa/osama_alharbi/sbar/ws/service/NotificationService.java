package sa.osama_alharbi.sbar.ws.service;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import sa.osama_alharbi.sbar.ws.model.MsgModel;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class NotificationService {
    private final SimpMessagingTemplate simpMessagingTemplate;

    public void sendToAll(String msg){
        simpMessagingTemplate.convertAndSend("/topic/notification",notification(msg));
    }

    private MsgModel notification(String msg){
        return MsgModel
                .builder()
                .username("server")
                .msg(msg)
                .dateTime(LocalDateTime.now())
                .build();
    }
}
