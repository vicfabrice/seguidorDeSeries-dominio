package org.seguidorDeSeries.repo

import org.uqbar.commons.model.CollectionBasedRepo
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.Serie
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.EstadoSerie
import org.uqbar.commons.model.annotations.TransactionalAndObservable

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
	
	def serieConNombrre(String nombre) {
		allInstances.findFirst[c | c.getNombreSerie == nombre]
	}
	
	
}