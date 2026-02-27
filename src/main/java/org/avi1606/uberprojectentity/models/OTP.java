package org.avi1606.uberprojectentity.models;

import jakarta.persistence.Entity;
import lombok.*;

import java.util.Random;

@Entity
@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class OTP extends BaseModel {

    private String code;

    private String sentNumber;

    public OTP make(String sentNumber) {
        Random random = new Random();

        Integer code = random.nextInt(9000) +1000;

        return OTP.builder().code(code.toString()).sentNumber(sentNumber).build();
    }
}
