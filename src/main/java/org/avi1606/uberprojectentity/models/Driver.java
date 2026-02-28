package org.avi1606.uberprojectentity.models;


import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;


@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Driver extends BaseModel {

    private String name;

    @Column(nullable = false, unique = true)
    private String licenseNumber;

    @Column(unique = true)
    private String aadharCardNumber;

    @OneToOne(mappedBy = "driver",cascade = CascadeType.ALL)
    private Car car;

    @Enumerated(value = EnumType.STRING)
    private DriverApprovalStatus driverApprovalStatus;

    @OneToOne
    private ExactLocation lastKnownLocation;

    @OneToOne
    private ExactLocation home;

    private String activeCity;

    private boolean isAvailable;

    @DecimalMax(value = "0.00" , message = "Rating must be greater than or equals to 0.00" )
    @DecimalMax(value = "5.00" , message = "Rating must be less than or equals to 5.00" )
    private Double rating;


    @OneToMany(mappedBy = "driver")
    private List<Booking> bookings = new ArrayList<>();
}
