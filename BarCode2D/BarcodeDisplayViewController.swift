//
//  BarcodeDisplayViewController.swift
//  BarCode2D
//
//  Created by Jakkawad Chaiplee on 5/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes_Swift

class BarcodeDisplayViewController: UIViewController {
    @IBOutlet weak var imageDisplayed: UIImageView!
    
    var contents: String = "http://www.zai360.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = contents
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let gen = RSUnifiedCodeGenerator.shared
        gen.fillColor = UIColor.white
        gen.strokeColor = UIColor.black
        print ("generating image with barcode: " + contents)
        if let image = gen.generateCode(contents, machineReadableCodeObjectType: AVMetadataObjectTypeQRCode) {
            self.imageDisplayed.layer.borderWidth = 1
            self.imageDisplayed.image = RSAbstractCodeGenerator.resizeImage(image, targetSize: self.imageDisplayed.bounds.size, contentMode: UIViewContentMode.bottomRight)
        }
    }
}

