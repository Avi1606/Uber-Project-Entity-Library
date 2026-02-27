package org.avi1606.uberprojectentity.models;

import jakarta.persistence.Entity;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class ExactLocation extends BaseModel {

    private double latitude;

    private double longitude;
}
