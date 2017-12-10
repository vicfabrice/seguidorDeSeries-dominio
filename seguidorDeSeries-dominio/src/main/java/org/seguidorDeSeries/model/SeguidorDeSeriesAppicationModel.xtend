package org.seguidorDeSeries.model

import org.uqbar.commons.applicationContext.ApplicationContext
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.SeguidorDeSeries
import org.seguidorDeSeries.repo.RepoSeries
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.Serie
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class SeguidorDeSeriesAppicationModel extends ApplicationContext{
	
	SeguidorDeSeries seguidor
	RepoSeries series
	Serie serieSeleccionada
	
	new(){
		seguidor = new SeguidorDeSeries()
	}
	
	def RepoSeries getRepoSeries(){
		series = ApplicationContext.instance.getSingleton(typeof(Serie))
	}
	
	/*
	 * Metodos para UI?
	 */
	 
	 def actualizar() {
	 	ObservableUtils.firePropertyChanged(this, "serieSeleccionada.estado",this.serieSeleccionada.getEstado())
	 	 }
}