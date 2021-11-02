package ua.lviv.iot.model;

import lombok.*;

import javax.persistence.*;

@Entity(name = "rescue_vehicle")
@Table(name = "rescue_vehicle")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "number")
public class RescueVehicle {

    @Id
    @Column(name = "number", nullable = false)
    private String number;

    @Column(name = "characteristics", nullable = false)
    private String characteristics;
}
