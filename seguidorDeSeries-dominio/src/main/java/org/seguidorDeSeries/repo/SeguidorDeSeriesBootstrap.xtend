package org.seguidorDeSeries.repo

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.Serie
import org.uqbar.commons.applicationContext.ApplicationContext
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.EstadoSerie

class SeguidorDeSeriesBootstrap extends CollectionBasedBootstrap {
	
	new(){
		ApplicationContext.instance.configureSingleton(typeof(Serie), new RepoSeries)
	}
	
	override run(){
		val repoSeries = ApplicationContext.instance.getSingleton(typeof(Serie)) as RepoSeries
	
	
	repoSeries => [
		create("The Fosters", 5, EstadoSerie.PENDIENTE)
		create("Friends", 100, EstadoSerie.PENDIENTE)
		create("X Files", 12, EstadoSerie.MIRANDO)
		create("Verano del 98", 3, EstadoSerie.VISTA)
		]
		
		val serie1 = repoSeries.allInstances.get(0)
		val serie2 = repoSeries.allInstances.get(1)
		val serie3 = repoSeries.allInstances.get(2)
		val serie4 = repoSeries.allInstances.get(3)
	}
}
