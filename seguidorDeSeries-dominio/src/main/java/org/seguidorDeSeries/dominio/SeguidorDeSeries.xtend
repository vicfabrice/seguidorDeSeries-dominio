package org.seguidorDeSeries.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.seguidorDeSeries.repo.RepoSeries
import org.uqbar.commons.applicationContext.ApplicationContext
import java.util.List

@Observable
@Accessors
class SeguidorDeSeries {
	
	List<Serie> series
	
	new(){
		series = newArrayList
	}
	
	def void agregarNuevaSerie(Serie serie){
		series.add(serie)
	}
	
	def getSeries(){
		repoSeries.allInstances
	}

	protected def RepoSeries getRepoSeries() {
		ApplicationContext.instance.getSingleton(typeof(Serie)) as RepoSeries
	}
	
}