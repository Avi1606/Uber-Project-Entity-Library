package org.avi1606.uberprojectentity.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
@Entity
public class DBConsole extends BaseModel{

    @Column(unique = true,nullable = false)
    private String name;

    private String value;
}
