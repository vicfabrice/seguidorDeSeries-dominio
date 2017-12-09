package seguidorDeSeries_dominio.seguidorDeSeries_dominio;

//Uso un Enum de Java porque el de Xtend no funciona 
//https://bugs.eclipse.org/bugs/show_bug.cgi?id=403783

public enum EstadoSerie {
	PENDIENTE{
		@Override
		public String getName(){
			return "Pendiente";
				}
			},
		MIRANDO {
			@Override
			public String getName(){
					return "Mirando";
				}
			},
		VISTA {
			@Override
			public String getName(){
					return "Vista";
				}
			},
		NOTSELECTED {
			@Override
			public String getName(){
					return "";
				}
			};

		public abstract String getName();

}
