package ua.lviv.iot.model;

import lombok.*;
import ua.lviv.iot.model.composite_key.CallRescueVehicleId;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "call_has_rescue_vehicle")
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
public class CallHasRescueVehicle {

    @EmbeddedId
    private CallRescueVehicleId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("callId")
    private ClusterProgram call;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("rescueVehicleNumber")
    private RescueVehicle rescue_vehicle;

    @Column(name = "departure_time", nullable = false)
    private LocalDateTime departureTime;

    @Column(name = "return_time", nullable = false)
    private LocalDateTime returnTime;

    @Override
    public String toString() {
        return "RescueVehicle{" +
                "number=" + rescue_vehicle.getNumber() +
                '}';
    }
}
