//
//  AgregarAlumnoViewController.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/11/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

protocol AgregarAlumnoViewControllerDelegate: NSObjectProtocol {
    
    func agregarAlumnoViewController(_ sender:AgregarAlumnoViewController,
                                     terminoCrear alumno: Alumno,
                                     enElCurso curso:String)
    
}

class AgregarAlumnoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Lifecycle
    @IBOutlet weak var alumnoImageView: UIImageView!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var pagoSwitch: UISwitch!
    @IBOutlet weak var cursoSegmentedControl: UISegmentedControl!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    weak var delegate: AgregarAlumnoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundTapGesture = UITapGestureRecognizer()
        backgroundTapGesture.addTarget(self, action: #selector(backgroundTapGestureRegocnizerHandler(_:)))
        backgroundTapGesture.numberOfTapsRequired = 1
        backgroundTapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(backgroundTapGesture)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinoVC = segue.destination as? RedViewController {
            destinoVC.alumno = Alumno(nombre: "Pepito", pago: true, nota: 20)
        }
    }
    
    // MARK: - Actions
    @IBAction func backgroundTapGestureRegocnizerHandler(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let alertVC = UIAlertController(title: "Seleccionar Imagen",
                                        message: "Seleccione un medio para obtener la imagen",
                                        preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Camara", style: .default) { action in
            self.showImagePicker(type: .camera)
        }
        let libraryButton = UIAlertAction(title: "Libreria", style: .default) { action in
            self.showImagePicker(type: .photoLibrary)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(cameraButton)
        alertVC.addAction(libraryButton)
        alertVC.addAction(cancelButton)
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertVC.popoverPresentationController?.sourceView = alumnoImageView
//            alertVC.popoverPresentationController?.barButtonItem = self.navigationItem.leftBarButtonItem
        }
        present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        let nombre = nombreTextField.text ?? ""
        if nombre != "" {
            let alertVC = UIAlertController(title: "Advertencia",
                                            message: "¿Está seguro que desea cancelar?",
                                            preferredStyle: .alert)
            let yesButton = UIAlertAction(title: "SI", style: .destructive) { (_) in
                // Ocultamos la pantalla
                self.dismiss(animated: true, completion: nil)
            }
            let noButton = UIAlertAction(title: "NO", style: .cancel, handler: nil)
            alertVC.addAction(noButton)
            alertVC.addAction(yesButton)
            present(alertVC, animated: true, completion: nil)
            
        } else {
            // Ocultamos la pantalla
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func guardarButtonTapped(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        guard let nombre = nombreTextField.text
            , nombre != "" else {
                
                let alertVC = UIAlertController(title: "Error",
                                                message: "Debe indicar un nombre",
                                                preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                alertVC.addAction(okButton)
                present(alertVC, animated: true, completion: nil)
                return
        }
        
        let curso = cursoSegmentedControl.selectedSegmentIndex == 0 ? "iOS" : "Android"
        let nuevoAlumno = Alumno(nombre: nombre, pago: pagoSwitch.isOn, nota: 20)
        nuevoAlumno.image = alumnoImageView.image
        delegate?.agregarAlumnoViewController(self, terminoCrear: nuevoAlumno, enElCurso: curso)
    }
    
    @IBAction func oneTabBarButtonItem(_ sender: Any) {
        redView.isHidden = false
        blueView.isHidden = true
    }
    
    @IBAction func twoTabBarButtonItem(_ sender: Any) {
        redView.isHidden = true
        blueView.isHidden = false
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        alumnoImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    private func showImagePicker(type: UIImagePickerController.SourceType) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.allowsEditing = false
        imagePickerVC.sourceType = type
        if type == .camera {
            imagePickerVC.cameraCaptureMode = .photo
            imagePickerVC.cameraFlashMode = .auto
            imagePickerVC.cameraDevice = .front
        }
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true, completion: nil)
    }
}
