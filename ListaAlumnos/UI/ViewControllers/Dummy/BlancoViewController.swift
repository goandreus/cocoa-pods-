//
//  BlancoViewController.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/6/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

class BlancoViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - Ciclo de Vida
    override class func awakeFromNib() {
        super.awakeFromNib()
        // SOLO SI VENGO DE UN STORYBOARD
        // AQUI AUN TODOS LOS ELEMENTOS UI SON NIL
        print("2. Hola vengo de un storyboard")
    }
    
    override func viewDidLoad() { // ON CREATE EN ANDROID
        super.viewDidLoad()
        titleLabel.backgroundColor = .systemGray
        print("3. Ya tenemos cargados los elemtosUI (IBOutlet) y podemos actualizarlos")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("4. Estamos por aparecer")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("4.1 Los constraints estan por ejecutarse")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("4.2 se ejecutaron los constraints!")
    }
    
    override func viewDidAppear(_ animated: Bool) { // ON RESUME EN ANDROID
        super.viewDidAppear(animated)
        print("5. Tocame que soy realidad")
        
        titleLabelTopConstraint.constant = 200
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Ciclo de muerte
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6. estoy por desaparecer")
    }
    
    override func viewDidDisappear(_ animated: Bool) { // ON PAUSE EN ANDROID
        super.viewDidDisappear(animated)
        print("7. ya no me ves")
    }
    
    deinit {
        print("8. adios me uno a Hades")
    }
    
    
    // MARK: - Actions
    @IBAction func reloadButtonTapped(_ sender: Any) {
        // Obtener o crear un ViewController por codigo
        let identifier = String(describing: IndigoViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        let indigoVC = viewController as! IndigoViewController
        navigationController?.pushViewController(indigoVC, animated: true)
    }
    
    @IBAction func irARojoButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
