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
import org.uqbar.arena.widgets.TextBox
import java.awt.Color

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
		
		val panelHor = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]
		
		new TextBox(panel) => [
			width = 80
      		value <=> "serieABuscar"
		]

		val searchMainPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		val buttonPanel1 = new Panel(mainPanel) => [
			layout = new ColumnLayout(1)
		]

		//this.crearBotones1(buttonPanel1)

		this.crearTablaDeSeries(panel)
		this.createGridActions(panel)
		this.crearDetallesDeSerieSeleccionada(searchMainPanel)
		//this.createResultsGrid(mainPanel)
		
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
	}
	
	// ** Creacion de buscador
// ********************************************************

	override protected addActions(Panel panel) {
		new Button(panel) => [
			val hayCriterio = new NotNullObservable("serieABuscar")
			bindEnabled(hayCriterio)
			caption = "Buscar"
			onClick[|modelObject.buscarSerie]
			setAsDefault
			disableOnError
		]

		new Button(panel) => [
			caption = "Limpiar"
			onClick([|modelObject.clear])
		]
	}
		// ** Detalle de serie seleccionada
		// ********************************************************
		def crearDetallesDeSerieSeleccionada(Panel panel){
			
			val panelDetalle = new Panel(panel) => [
			layout = new VerticalLayout
			]
			new Label(panelDetalle) => [
    			background = Color.ORANGE
    			value <=> "serieSeleccionada.nombreSerie"
			]
			
			new Label(panelDetalle) => [
    			background = Color.ORANGE
    			value <=> "serieSeleccionada.cantTemporadas"
			]
			
			new Label(panelDetalle) => [
    			background = Color.ORANGE
    			value <=> "serieSeleccionada.estadoStr"
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

	def void createGridActions(Panel panel) {
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		val elementoSeleccionado = new NotNullObservable("serieSeleccionada")
		
		val actionsPanel = new Panel(panel).layout = new HorizontalLayout
		
		new Button(panel) => [
			caption = "Pendiente"
			onClick([|modelObject.cambiarEstadoDeSerieSeleccionada(EstadoSerie.PENDIENTE)])
			bindEnabled(elementoSeleccionado)
		]
		
		new Button(panel) => [
			caption = "Mirando"
			onClick([|modelObject.cambiarEstadoDeSerieSeleccionada(EstadoSerie.MIRANDO)])
			bindEnabled(elementoSeleccionado)
		]

		new Button(panel) => [
			caption = "Vista"
			onClick([|modelObject.cambiarEstadoDeSerieSeleccionada(EstadoSerie.VISTA)])
			bindEnabled(elementoSeleccionado)
		]
	}
	
	
}