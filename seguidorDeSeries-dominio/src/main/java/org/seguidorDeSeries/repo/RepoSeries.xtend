package org.seguidorDeSeries.repo

import org.uqbar.commons.model.CollectionBasedRepo

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.seguidorDeSeries.dominio.Serie
import org.seguidorDeSeries.dominio.EstadoSerie

@TransactionalAndObservable
class RepoSeries extends CollectionBasedRepo<Serie> {
	
	def void create(String nombreSerie, Integer cantTemporadas, EstadoSerie estado){
		this.create(new Serie(nombreSerie, cantTemporadas, estado))
	}
	
	override protected getCriterio(Serie example) {
		null
	}
	
	override createExample() {
		new Serie
	}
	
	override getEntityType() {
		typeof(Serie)
	}
	
	def getSeries(){
		allInstances
	}
	def serieConNombre(String nombre) {
		allInstances.findFirst[c | c.getnombreSerie() == nombre]
	}
	
	
}