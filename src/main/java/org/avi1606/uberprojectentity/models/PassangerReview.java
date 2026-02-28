package org.avi1606.uberprojectentity.models;


import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
public class PassangerReview extends Review{

    private String passengerName;
}
