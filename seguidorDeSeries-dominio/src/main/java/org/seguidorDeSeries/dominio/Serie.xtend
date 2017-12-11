package org.seguidorDeSeries.dominio

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.seguidorDeSeries.dominio.EstadoSerie


@Observable
@Accessors
class Serie extends Entity {
	
	String nombreSerie
	Integer cantTemporadas
	EstadoSerie estado
	
	new(String nombreSerie, Integer cantTemporadas, EstadoSerie estado){
		this.nombreSerie = nombreSerie
		this.cantTemporadas = cantTemporadas
		this.estado = estado
	}

	new(){}
	
	def getEstado() {
		this.estado
	}
	
	def cambiarEstado(EstadoSerie newEstado) {
		estado = newEstado
	}
	
	def getnombreSerie() {
		this.nombreSerie
	}
	
	//para que funcione bien el repo
}