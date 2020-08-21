//
//  ViewController.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/4/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit
import SafariServices

class Grupo {
    var titulo: String = ""
    var personas: [Alumno] = []
    
    init(titulo: String, personas:[Alumno]) {
        self.titulo = titulo
        self.personas = personas
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AgregarAlumnoViewControllerDelegate {
    
    // MARK: - Constantes
    let cellId = "PersonaCell"
    let showDetailSegueId = "ViewControllerShowAlumnoDetalleViewController"
    
    // MARK: - Propiedades
    @IBOutlet weak var personasTableView: UITableView!
    var alumnos:[Grupo] = []
    var alumnoSelected: Alumno?
    var timer: Timer?
    
    // MARK: - Ciclo de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        let cursoIOS = Grupo(titulo: "iOS",
                             personas: [Alumno(nombre: "Lesly Ormeño", pago: true, nota: 18),
                                        Alumno(nombre: "Jonathan Gamba", pago: false, nota: 20),
                                        Alumno(nombre: "Javier Rosas", pago: true, nota: 15)])
        let cursoAndroid = Grupo(titulo: "Android",
                                 personas: [Alumno(nombre: "Jhony Pacheco", pago: true, nota: 13),
                                            Alumno(nombre: "Pablo Perez", pago: false, nota: 15)])
        alumnos.append(cursoIOS)
        alumnos.append(cursoAndroid)
        
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        timer?.invalidate()
        timer = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // LOAD FROM WEB SERVICE
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Listado alumnos ya se ve")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Listado alumnos no se ve")
    }
    
    // MARK: - Navegación
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "AlumnoCellShowAlumnoDetalleViewController" {
        //    let destinoVC = segue.destination as! AlumnoDetalleViewController
        //}
        if let destinoVC = segue.destination as? AlumnoDetalleViewController,
            let cell = sender as? AlumnoTableViewCell,
            let indexPath = personasTableView.indexPath(for: cell) {
            
            let grupo = alumnos[indexPath.section]
            destinoVC.alumno = grupo.personas[indexPath.row]
        }
        if let navController = segue.destination as? UINavigationController,
            let destinoVC = navController.topViewController as? AgregarAlumnoViewController {
            destinoVC.delegate = self
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let id = String(describing: AgregarAlumnoViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let agregarVC = storyboard.instantiateViewController(withIdentifier: id) as! AgregarAlumnoViewController
        agregarVC.delegate = self
        
        let navController = UINavigationController(rootViewController: agregarVC)
        navController.modalPresentationStyle = .popover
        navController.popoverPresentationController?.barButtonItem = sender
        agregarVC.preferredContentSize = CGSize(width: 400, height: 700)
        present(navController, animated: true, completion: nil)
    
    }

    @IBAction func goWebBarButtonItemTapped(_ sender: Any) {
        let urlString = "https://www.academiamoviles.com"
        let url = URL(string: urlString)!
        let safariVC = SFSafariViewController(url: url)
        
        present(safariVC, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let grupo = alumnos[section]
        return grupo.personas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = AlumnoTableViewCell.identificador
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        guard let alumnoCell = cell as? AlumnoTableViewCell else {
            return cell
        }
        
        let curso = alumnos[indexPath.section]
        let alumno = curso.personas[indexPath.row]
        alumnoCell.nombreLabel.text = alumno.nombre
        alumnoCell.notaPagoView.setup(by: alumno)
        return alumnoCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let curso = alumnos[section]
        return curso.titulo
    }
    
    // MARK: - AgregarAlumnoViewControllerDelegate
    func agregarAlumnoViewController(_ sender: AgregarAlumnoViewController,
                                     terminoCrear alumno: Alumno,
                                     enElCurso curso: String) {
        let grupoSeleccionado = alumnos.first { (grupo) -> Bool in
            return grupo.titulo == curso
        }
        if grupoSeleccionado != nil {
            grupoSeleccionado?.personas.append(alumno)
        }
        personasTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

