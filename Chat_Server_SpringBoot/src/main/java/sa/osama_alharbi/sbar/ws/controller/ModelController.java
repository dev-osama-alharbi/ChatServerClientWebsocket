package sa.osama_alharbi.sbar.ws.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sa.osama_alharbi.sbar.ws.model.MsgModel;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/models")
public class ModelController {

    @GetMapping("/msg")
    public MsgModel msgModel(){
        return MsgModel
                .builder()
                .username("osama")
                .msg("msg")
                .dateTime(LocalDateTime.now())
                .build();
    }
}
