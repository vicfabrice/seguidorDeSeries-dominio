package org.seguidorDeSeries.ui

import org.seguidorDeSeries.model.SeguidorDeSeriesAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import org.seguidorDeSeries.dominio.Serie
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Column
import org.seguidorDeSeries.dominio.EstadoSerie
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class SeguidorDeSeriesWindow extends SimpleWindow<SeguidorDeSeriesAppModel>{
	
	//val elementoSeleccionado = new NotNullObservable("serieSeleccionada")
	
	new(WindowOwner owner) {
		super(owner, new SeguidorDeSeriesAppModel)
		modelObject.actualizar
	}
	
// ********************************************************
// ** Creacion de paneles
// ********************************************************

override protected createFormPanel(Panel mainPanel) {

		mainPanel.layout = new HorizontalLayout
		
		val panel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]
		
		title = "Seguidor de Series ;)"

		val searchMainPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		val buttonPanel1 = new Panel(searchMainPanel) => [
			layout = new ColumnLayout(1)
		]

		//this.crearBotones1(buttonPanel1)

		this.crearTablaDeSeries(panel)
		//this.crearDetallesDeSerieSeleccionada(mainPanel)
		this.createResultsGrid(mainPanel)
		
}

//// defijo como crear la tabla

	def crearTablaDeSeries(Panel panel) {
		val table = new Table<Serie>(panel, typeof(Serie)) => [
			items <=> "series"
			value <=> "serieSeleccionada"
			
		]
		describirSeries(table)
	}

	def describirSeries(Table<Serie>table) {
		new Column(table) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("nombreSerie")
			]

		new Column(table) => [
			title = "Temporadas"
			fixedSize = 100
			bindContentsToProperty("cantTemporadas")
		]

		new Column(table) => [
			title = "Estado"
			fixedSize = 100
			bindContentsToProperty("estado").transformer = [EstadoSerie e|e.getName()]
		]
		
		// para tag 2
		/*new Column(table) => [
			title = "Info peli"
			fixedSize = 200
			bindContentsToProperty("aclaracion")
		]*/
	}
	

// ** Creacion de buscador
// ********************************************************

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Buscar"
			onClick([|modelObject.buscarSerie("")])
			setAsDefault
			disableOnError
		]

		new Button(actionsPanel) => [
			caption = "Limpiar"
			onClick([|modelObject.clear])
		]
	}
	
	// Resultados de la búsqueda
	
	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Serie>(mainPanel, typeof(Serie)) => [
			items <=> "resultadoBusqueda"
			value <=> "serieSeleccionada"
			numberVisibleRows = 8
		]
		this.describeResultsGrid(table)
	}
	
	def void describeResultsGrid(Table<Serie> table) {
		new Column<Serie>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombreSerie")
		]

		new Column<Serie>(table) => [
			title = "Temporadas"
			fixedSize = 100
			alignRight
			bindContentsToProperty("cantTemporadas")
		]

		new Column<Serie>(table) => [
			title = "Estado"
			fixedSize = 200
			bindContentsToProperty("estado").transformer = [EstadoSerie e|e.getName()]
		]

	}

	def void createGridActions(Panel mainPanel) {
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		val elementoSeleccionado = new NotNullObservable("serieSeleccionada")
		
		val actionsPanel = new Panel(mainPanel).layout = new HorizontalLayout
		
		new Button(actionsPanel) => [
			caption = "Pendiente"
			onClick([|modelObject.cambiarEstadoDeSerieSeleccionada(EstadoSerie.PENDIENTE)])
			bindEnabled(elementoSeleccionado)
		]
		
		new Button(actionsPanel) => [
			caption = "Mirando"
			onClick([|modelObject.cambiarEstadoDeSerieSeleccionada(EstadoSerie.MIRANDO)])
			bindEnabled(elementoSeleccionado)
		]

		new Button(actionsPanel) => [
			caption = "Borrar"
			onClick([|modelObject.cambiarEstadoDeSerieSeleccionada(EstadoSerie.VISTA)])
			bindEnabled(elementoSeleccionado)
		]
	}
	
	
}