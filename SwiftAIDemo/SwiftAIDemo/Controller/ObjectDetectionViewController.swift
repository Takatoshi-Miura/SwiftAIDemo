//
//  ObjectDetectionViewController.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit
import AVKit
import Vision

class ObjectDetectionViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    // MARK: - UI,Variable
    
    @IBOutlet weak var objectLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCameraView()
    }
    
    /// カメラ映像を表示
    private func addCameraView() {
        // デバイスにビデオを指定
        let captureDevice = AVCaptureDevice.default(for: .video)
        let input = try? AVCaptureDeviceInput(device: captureDevice!)
        let capureSession = AVCaptureSession()
        
        // セッションを開始
        capureSession.addInput(input!)
        capureSession.startRunning()
        
        // ビデオのプレビューをビューに表示
        let previewLayer = AVCaptureVideoPreviewLayer(session: capureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        capureSession.addOutput(dataOutput)
    }
    
    // MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let pixelBuffer:CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
        let model = try? VNCoreMLModel(for: YOLOv3Tiny(model: <#T##MLModel#>).model)
        
        let request = VNCoreMLRequest(model: model!, completionHandler: { (finishReq, err) in
            let results = finishReq.results as? [VNClassificationObservation]
            
            //確率の高い最初の予測のみ取得
            let firstObservation = results?.first
            
            // 識別結果と確率を表示
            DispatchQueue.main.async {
                self.objectLabel.text = firstObservation!.identifier
                self.percentLabel.text = String(firstObservation!.confidence * 100) + "%"
            }
        })
        
        // ピクセルバッファと上記のリクエストを指定して実行する。
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
}
