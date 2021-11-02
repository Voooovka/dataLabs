package ua.lviv.iot.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "injury")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
public class Injury {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "diagnosis", nullable = false)
    private String diagnosis;

    @ManyToOne
    @JoinColumn(name = "hospital_id", nullable = false)
    private Hospital hospital;
}
