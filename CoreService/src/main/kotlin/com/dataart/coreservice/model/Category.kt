package com.dataart.coreservice.model

import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToMany
import javax.persistence.Table

@Table(name = "categories")
@Entity
data class Category(

    @Column(nullable = false)
    var name: String,
) {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long = 0

    // зависимая сторона
    @ManyToMany(mappedBy = "categories", cascade = [CascadeType.ALL])
    var events: MutableList<Event> = mutableListOf()
}
