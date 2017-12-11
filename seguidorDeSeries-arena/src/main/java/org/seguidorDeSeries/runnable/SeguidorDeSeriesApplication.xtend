package org.seguidorDeSeries.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.seguidorDeSeries.repo.SeguidorDeSeriesBootstrap
import org.seguidorDeSeries.ui.SeguidorDeSeriesWindow

class SeguidorDeSeriesApplication extends Application {
	
	new(SeguidorDeSeriesBootstrap seguidorDeSeriesBootstrap) {
		super(seguidorDeSeriesBootstrap)
	}
	
	static def void main(String[] args) {
		new SeguidorDeSeriesApplication(new SeguidorDeSeriesBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new SeguidorDeSeriesWindow(this)

	}
	
	
}