package ua.lviv.iot.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.*;

@Entity
@Table(name = "cluster_program")
@NoArgsConstructor
@Getter
@Setter
@ToString(of = "id")
@EqualsAndHashCode(of = "id")
public class ClusterProgram {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "time_of_event")
    private String timeOfEvent;

    @OneToMany(mappedBy = "cluster_program", fetch = FetchType.EAGER)
    private Set<Subject> subjects;







    @ManyToOne
    @JoinColumn(name = "reporter_phone_number", nullable = false)
    private Reporter reporter;

    @ManyToOne
    @JoinColumn(name = "call_address_id", nullable = false)
    private Lecturer callAddress;

    @OneToMany(mappedBy = "cluster_program", fetch = FetchType.EAGER)
    private Set<CallHasRescuer> rescuers;

    @OneToMany(mappedBy = "cluster_program", fetch = FetchType.EAGER)
    private Set<CallHasRescueVehicle> rescueVehicles;
}
