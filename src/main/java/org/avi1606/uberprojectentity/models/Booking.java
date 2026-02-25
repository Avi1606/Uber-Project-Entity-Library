package org.avi1606.uberprojectentity.models;


import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import lombok.*;

import java.sql.Timestamp;

@Entity
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Booking extends BaseModel{

    @Enumerated(EnumType.STRING)
    private BookingStatus bookingStatus;

    private Timestamp pickupTime;

    private Timestamp dropOffTime;

    private Integer totalDistance;

    @ManyToOne
    private Driver driver;

    @ManyToOne
    private Passenger passenger;
}
