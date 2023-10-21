package sa.osama_alharbi.sbar.ws.model;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class MsgModel {
    private String username;
    private String msg;
    private LocalDateTime dateTime;
}
