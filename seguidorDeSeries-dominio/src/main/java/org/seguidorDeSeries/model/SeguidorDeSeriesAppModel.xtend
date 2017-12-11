package org.seguidorDeSeries.model

import org.uqbar.commons.applicationContext.ApplicationContext
import org.seguidorDeSeries.dominio.SeguidorDeSeries
import org.seguidorDeSeries.dominio.EstadoSerie
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.seguidorDeSeries.repo.RepoSeries
import org.seguidorDeSeries.dominio.Serie
import java.util.List
import org.uqbar.commons.model.utils.ObservableUtils
import java.util.ArrayList
import java.io.Serializable

@Accessors
@TransactionalAndObservable
class SeguidorDeSeriesAppModel extends ApplicationContext implements Serializable{
	SeguidorDeSeries seguidor
	RepoSeries repoSeries
	Serie serieSeleccionada
	List<Serie> series
	List<Serie> resultadoBusqueda
	SerieModel serie
	
	new(){
		seguidor = new SeguidorDeSeries()
	}
	
	def RepoSeries getRepoSeries(){
		// series = ApplicationContext.instance.getSingleton(typeof(Serie))
		repoSeries = ApplicationContext.instance.getSingleton(typeof(Serie))
	}
	
	def void buscarSerie(String nombreSerie){ 
		resultadoBusqueda = new ArrayList 
		resultadoBusqueda.add(repoSeries.serieConNombre("nombreSerie"))
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
	 	ObservableUtils.firePropertyChanged(this, "series",this.series)
	 	 }
}