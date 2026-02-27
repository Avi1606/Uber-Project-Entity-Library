package org.avi1606.uberprojectentity.models;

import com.fasterxml.jackson.annotation.JsonAnySetter;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class Car extends BaseModel {

    private String plateNumber;

    private String Brand;

    private String Model;

    @Enumerated(value = EnumType.STRING)
    private carType cartype;

    @OneToOne
    private Driver driver;

    @ManyToOne
    private Colour colour;
}
