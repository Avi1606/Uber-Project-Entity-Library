package org.avi1606.uberprojectentity.models;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class NameLocation extends BaseModel {

    @OneToOne
    private ExactLocation exactLocation;

    private String name;

    private String zipcode;

    private String city;

    private String country;

    private String State;
}
