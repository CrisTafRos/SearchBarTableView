//
//  ViewController.swift
//  SearchBarTableView
//
//  Created by SSiOS on 9/12/19.
//  Copyright © 2019 SSiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var listaPaises: UITableView!
    
    @IBOutlet weak var buscador: UISearchBar!
    
    let arregloPaises = ["Afganistán", "Albania", "Alemania", "Algeria", "Andorra", "Angola", "Anguilla", "Antartida", "Antillas Holandesas", "Antigua y Barbuda", "Arabia Saudita", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Bélgica", "Belice", "Benín", "Bermuda", "Bhutan", "Bolivia", "Bosnia y Herzegovina", "Botswana", "Brasil", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Camboya", "Camerún", "Canadá",  "Chad", "Chile", "China", "Chipre", "Colombia", "Comoros", "Congo", "Congo, República Democrática del", "Corea, República Democrática de", "Corea, República de", "Costa de Marfil", "Costa Rica", "Croacia (Hrvatska)", "Cuba", "Dinamarca", "Djibouti", "Dominica", "Ecuador", "Egipto", "El Salvador", "Emiratos Árabes Unidos", "Eritrea", "Eslovaquia (República Eslovaca)", "Eslovenia", "España", "Estados Unidos", "Estonia", "Etiopía", "Federación Rusa", "Fiji", "Filipinas", "Finlandia", "Francia", "Francia Metropolitana", "Gabón", "Gambia", "Georgia", "Ghana", "Gibraltar", "Granada", "Grecia", "Groenlandia", "Guam", "Guatemala", "Guinea", "Guinea Ecuatorial", "Guinea-Bissau", "Guyana", "Guyana Francesa", "Haiti",  "Honduras", "Hong Kong", "Hungría", "India", "Indonesia", "Irán, República Islámica de", "Iraq", "Irlanda", "Isla Bouvet", "Isla Norfolk", "Islas Caimán", "Islas Cocos (Keeling)", "Islas Cook", "Islas de Navidad", "Islas Falkland (Malvinas)", "Islas Faroe", "Islas Guadalupe", "Islas Heard y Mc Donald", "Islas Maldivas", "Islas Marianas del Norte", "Islas Marshall", "Islas Pitcairn", "Islas Salomón", "Islas Vírgenes (Británicas)", "Islas Vírgenes (Estadounidenses)", "Islas Wallis y Futuna", "Islandia", "Israel", "Italia", "Jamaica", "Japón", "Jordania", "Kazajistán", "Kenia", "Kiribati", "Kuwait", "Kirguizstán", "Laos, República Democrática de", "Latvia", "Lebanon", "Lesoto", "Liberia", "Libia", "Liechtenstein", "Lituania", "Luxemburgo", "Macau", "Madagascar", "Malawi", "Malasia", "Mali", "Malta", "Martinica", "Mauritania", "Mauricio", "Marruecos", "Mayotte", "México", "Micronesia, Estados Federados de", "Moldova, República de", "Mónaco", "Mongolia", "Montserrat", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Nicaragua", "Niger", "Nigeria", "Niue", "Noruega", "Nueva Caledonia", "Nueva Zelanda",  "Omán", "Países Bajos",  "Pakistán", "Palau", "Panamá", "Papua Nueva Guinea", "Paraguay", "Perú", "Polinesia Francesa", "Polonia", "Portugal", "Puerto Rico", "Qatar", "Reino Unido", "República Árabe de Siria", "República Checa", "República Dominicana", "República de África Central", "República de Macedonia del Norte", "Reunión", "Rumania", "Ruanda", "Sahara del Oeste", "San Kitts y Nevis", "San Marino", "San Pierre y Miquelon", "San Vicente y las Granadinas", "Santa Helena", "Santa Lucía", "Santo Tomé y Príncipe", "Samoa", "Samoa Americana", "San Marino", "Santa Sede (Estado de Ciudad del Vaticano)", "Senegal", "Seychelles", "Sierra Leona", "Singapur", "Somalía", "Sri Lanka", "Suazilandia", "Sudáfrica", "Sudán", "Surinam", "Suecia", "Suiza", "Taiwán, Provincia de China", "Tajikistan", "Tanzania, República Unificada de", "Territorio Británico del Océano Índico", "Tailandia", "Territorios del Sur de Francia", "Timor Este", "Togo", "Tokelau", "Tonga", "Trinidad y Tobago", "Tunéz", "Turkmenistán", "Turquía", "Tuvalú", "Ucrania", "Uganda", "Uruguay", "Uzbekistán", "Vanuatu", "Venezuela", "Vietnam", "Wakanda", "Yemen", "Yibuti", "Zambia", "Zimbabwe"]
    var paisBuscado = [String]()
    var buscando: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if buscando {
            return paisBuscado.count
        } else {
            return arregloPaises.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if buscando {
            cell?.textLabel?.text = paisBuscado[indexPath.row]
        } else {
            cell?.textLabel?.text = arregloPaises[indexPath.row]
        }
        return cell!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        paisBuscado = arregloPaises.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        buscando = true
        listaPaises.reloadData()
    }
    
    //{ (parámetros) -> tipo_de_retorno in declaraciones }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        buscando = false
        buscador.text = ""
        listaPaises.reloadData()
    }
    
}

