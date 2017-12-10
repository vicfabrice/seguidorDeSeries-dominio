package org.seguidorDeSeries.model

import org.uqbar.commons.applicationContext.ApplicationContext
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import seguidorDeSeries_dominio.seguidorDeSeries_dominio.EstadoSerie

@Accessors
@TransactionalAndObservable
class SerieModel extends ApplicationContext {
	
	String nombreSerie
	Integer cantTemporadas
	EstadoSerie estado
	
	new(){}
	
	
}