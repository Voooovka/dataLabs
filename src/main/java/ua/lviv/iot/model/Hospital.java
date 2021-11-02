package ua.lviv.iot.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "hospital")
@NoArgsConstructor
@Getter
@Setter
@ToString(of = "id")
@EqualsAndHashCode(of = "id")
public class Hospital {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;
}
