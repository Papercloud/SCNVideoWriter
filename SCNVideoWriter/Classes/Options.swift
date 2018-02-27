//
//  Options.swift
//  Pods-SCNVideoWriter_Example
//
//  Created by Tomoya Hirano on 2017/08/20.
//

import UIKit
import SceneKit
import AVFoundation

extension SCNVideoWriter {
  public struct Options {
    public var timeScale: Int32
    public var renderSize: CGSize
    public var videoSize: CGSize
    public var fps: Int
    public var outputUrl: URL
    public var fileType: String
    public var codec: String
    public var deleteFileIfExists: Bool
    
    public static var `default`: Options {
      return Options(timeScale: 600,
                     renderSize: CGSize(width: 640, height: 640),
                     videoSize: CGSize(width: 720, height: 1280),
                     fps: 30,
                     outputUrl: URL(fileURLWithPath: NSTemporaryDirectory() + "output.mp4"),
                     fileType: AVFileType.m4v.rawValue,
                     codec: AVVideoCodecH264,
                     deleteFileIfExists: true)
    }
    
    public static func defaults(with screenSize: CGSize) -> Options {
        var options = Options.default
        options.renderSize = screenSize
        return options
    }
    
    public var assetWriterInputSettings: [String : Any] {
      return [
        AVVideoCodecKey: codec,
        AVVideoWidthKey: videoSize.width,
        AVVideoHeightKey: videoSize.height
      ]
    }
    public var sourcePixelBufferAttributes: [String : Any] {
      return [
        kCVPixelBufferPixelFormatTypeKey as String: NSNumber(value: kCVPixelFormatType_32ARGB),
        kCVPixelBufferWidthKey as String: videoSize.width,
        kCVPixelBufferHeightKey as String: videoSize.height,
      ]
    }
  }
}


