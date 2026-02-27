package org.avi1606.uberprojectentity.models;

import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Colour extends BaseModel {

    @Column(nullable = false,unique = true)
    private String name;
}
