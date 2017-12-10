package org.seguidorDeSeries.model

import org.uqbar.commons.applicationContext.ApplicationContext
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.SeguidorDeSeries
import org.seguidorDeSeries.repo.RepoSeries
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.Serie
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.utils.ObservableUtils
import java.util.List
import java.io.Serializable
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.EstadoSerie

@Accessors
@TransactionalAndObservable
class SeguidorDeSeriesAppicationModel extends ApplicationContext implements Serializable{
	
	SeguidorDeSeries seguidor
	RepoSeries repoSeries
	Serie serieSeleccionada
	List<Serie> series
	
	new(){
		seguidor = new SeguidorDeSeries()
	}
	
	def RepoSeries getRepoSeries(){
		// series = ApplicationContext.instance.getSingleton(typeof(Serie))
		repoSeries = ApplicationContext.instance.getSingleton(typeof(Serie))
	}
	
	def Serie buscarSerie(String nombreSerie){
		serieSeleccionada = repoSeries.serieConNombre("nombreSerie")
		
	}
	
	def void clear() {

		serieSeleccionada = null
	}
	
	def void cambiarEstadoDeSerieSeleccionada(EstadoSerie estado) {
		getRepoSeries().serieConNombre(serieSeleccionada.nombreSerie)
		serieSeleccionada.cambiarEstado(estado)
	}
	
	/*
	 * Metodos para UI?
	 */
	 
	 def Boolean haySerieSeleccionada(){
	 	serieSeleccionada !== null
	 }
	 
	 def actualizar() {
	 	var repoSeries = ApplicationContext.instance.getSingleton(typeof(Serie)) as RepoSeries
	 	series = repoSeries.getSeries()
	 	ObservableUtils.firePropertyChanged(this, "estado",this.serieSeleccionada.getEstado())
	 	 }
	 	 
}