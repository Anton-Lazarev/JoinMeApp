package com.dataart.coreservice.model

import org.springframework.data.annotation.CreatedDate
import org.springframework.data.annotation.LastModifiedDate
import java.time.Instant
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.OneToMany
import javax.persistence.Table

@Table(name = "photos")
@Entity
data class Photo(

    @Column(nullable = false)
    var link: String,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    var user: User,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "event_id", referencedColumnName = "id", nullable = false)
    var event: Event,
) {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long = 0

    @OneToMany(mappedBy = "photo", cascade = [CascadeType.ALL])
    var likePhotos: MutableList<LikePhoto> = mutableListOf()

    @CreatedDate
    @Column(nullable = false)
    var createdDt: Instant = Instant.now()

    @LastModifiedDate
    var updatedDt: Instant = Instant.now()
}
