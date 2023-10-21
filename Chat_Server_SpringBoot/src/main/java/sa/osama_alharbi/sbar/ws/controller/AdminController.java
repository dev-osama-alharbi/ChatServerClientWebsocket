package sa.osama_alharbi.sbar.ws.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import sa.osama_alharbi.sbar.ws.model.MsgModel;
import sa.osama_alharbi.sbar.ws.service.NotificationService;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    public final NotificationService notificationService;

    @PostMapping("/notification")
    public boolean notification(@RequestParam("msg") String msg){
        notificationService.sendToAll(msg);
        return true;
    }
}
