function invokeScript(divid) {
	var scriptObj = divid.getElementsByTagName("SCRIPT");
	var len = scriptObj.length;
	for (var i = 0; i < len; i++) {
		var scriptText = scriptObj[i].text;
		var scriptFile = scriptObj[i].src
		var scriptTag = document.createElement("SCRIPT");
		if ((scriptFile != null) && (scriptFile != "")) {
			scriptTag.src = scriptFile;
		}
		scriptTag.text = scriptText;
		if (!document.getElementsByTagName("HEAD")[0]) {
			document.createElement("HEAD").appendChild(scriptTag)
		}
		else {
			document.getElementsByTagName("HEAD")[0].appendChild(scriptTag);
		}
	}
}

function nuevaConexion() {
	var xmlhttp = false;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	}
	catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function EnviarCarrito(url, capa, valores) {
    var contenido = document.getElementById(capa);
    
    if (!contenido) {
        console.error(`El elemento con id "${capa}" no fue encontrado en el DOM.`);
        return;
    }
    
    var conexion = nuevaConexion();
    conexion.open("POST", url, true);
    conexion.onreadystatechange = function () {
        if (conexion.readyState == 4 && conexion.status == 200) {
            contenido.innerHTML = conexion.responseText;
            invokeScript(document.getElementById(capa));
        } else if (conexion.readyState == 4) {
            console.error('Error en la solicitud: ' + conexion.status, conexion.responseText);
        }
    }

    // Verificar si valores contiene datos válidos
    if (!valores || typeof valores !== 'object' || (Array.isArray(valores) && valores.length === 0) || (!Array.isArray(valores) && Object.keys(valores).length === 0)) {
        console.error('No se pueden enviar datos JSON vacíos o no válidos. Valores:', valores);
        return;
    }

    console.log('Datos enviados al servidor:', JSON.stringify(valores));

    // Establecer encabezado y enviar JSON
    conexion.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
    conexion.send(JSON.stringify(valores));
}

