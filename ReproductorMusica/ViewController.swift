//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Jesus Rodriguez Barrera on 20/03/16.
//  Copyright © 2016 Aplicapp. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var reproductor: AVAudioPlayer!
    var nombreCancion: String! = ""
    var extensionCancion: String! = ""
    
    @IBOutlet weak var tituloCancion: UILabel!
    @IBOutlet weak var portada: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tituloCancion.text = ""
    }
    
    @IBAction func play() {
        if tituloCancion.text! != ""{
            if !reproductor.playing{
                reproductor.play()
            }
        }
    }
    
    @IBAction func pausar() {
        if tituloCancion.text! != ""{
            if reproductor.playing{
                reproductor.pause()
            }
        }
    }

    @IBAction func detener() {
        if tituloCancion.text! != ""{
            if reproductor.playing{
                reproductor.stop()
                reproductor.currentTime = 0.0
            }
        }
    }
    
    @IBAction func volumen(sender: UISlider) {
        reproductor.volume = sender.value
    }
    
    @IBAction func aleatorio() {
        var numeroCancion = Int(arc4random()) % 6
        if numeroCancion == 0{
            numeroCancion = 1
        }
        reproduceCancion(numeroCancion)
    }
    
    @IBAction func cancionSeleccionada(sender: UIButton) {
        
        if sender.restorationIdentifier! == "Selena"{
            reproduceCancion(1)
        }else{
            if sender.restorationIdentifier! == "Adele"{
                reproduceCancion(2)
            }else{
                if sender.restorationIdentifier! == "Florida"{
                    reproduceCancion(3)
                }else{
                    if sender.restorationIdentifier! == "Nicky"{
                        reproduceCancion(4)
                    }else{
                        if sender.restorationIdentifier! == "Kelly"{
                            reproduceCancion(5)
                        }
                    }
                }
            }
        }
        let cancionURL = NSBundle.mainBundle().URLForResource(nombreCancion, withExtension: extensionCancion)
        
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: cancionURL!)
            reproductor.play()
        }catch{
            print("Error al cargar el archivo de la canción.")
        }
    }
    
    func reproduceCancion(numeroCancion: Int){
        
        switch numeroCancion{
        case 1:
            nombreCancion = "HandsToMySelf"
            extensionCancion = "mp3"
            self.tituloCancion.text = "Hands to myself - Selena Gomez"
            self.portada.image = UIImage(named: "HandsToMySelf")
        case 2:
            nombreCancion = "Hello"
            extensionCancion = "mp3"
            self.tituloCancion.text = "Hello - Adele"
            self.portada.image = UIImage(named: "Hello_cover")
        case 3:
            nombreCancion = "MyHouse"
            extensionCancion = "mp3"
            self.tituloCancion.text = "My house - Florida"
            self.portada.image = UIImage(named: "MyHouse_cover")
        case 4:
            nombreCancion = "HastaElAmanecer"
            extensionCancion = "mp3"
            self.tituloCancion.text = "Hasta el amanecer - Nicky Jam"
            self.portada.image = UIImage(named: "HastaElAmanecer_cover")
        case 5:
            nombreCancion = "PieceByPiece"
            extensionCancion = "mp3"
            self.tituloCancion.text = "Piece by piece - Kelly Clarkson"
            self.portada.image = UIImage(named: "PieceByPiece_cover")
        default:
            print("default")
        }
        
        let cancionURL = NSBundle.mainBundle().URLForResource(nombreCancion, withExtension: extensionCancion)
        
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: cancionURL!)
            reproductor.play()
        }catch{
            print("Error al cargar el archivo de la canción.")
        }
    }
    
    
}

