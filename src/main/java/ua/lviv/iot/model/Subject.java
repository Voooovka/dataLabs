package ua.lviv.iot.model;

import lombok.*;
import ua.lviv.iot.model.enums.Position;

import javax.persistence.*;

@Entity
@Table(name = "subject")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "reporter_phone_number", nullable = false)
    private ClusterProgram clusterProgram;
}
