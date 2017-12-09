package seguidorDeSeries_dominio.seguidorDeSeries_dominio

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

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

	new(){} //para que funcione bien el repo
}