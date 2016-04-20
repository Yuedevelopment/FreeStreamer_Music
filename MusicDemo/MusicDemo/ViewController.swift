//
//  ViewController.swift
//  MusicDemo
//
//  Created by Tangguo on 16/2/15.
//  Copyright © 2016年 Tangguo. All rights reserved.
//

import UIKit

//((FSAudioStreamError, String!) -> Void)!
//(([NSObject : AnyObject]!) -> Void)!
//((FSAudioStreamState) -> Void)!

class ViewController: UIViewController {
    
    var audioStream:FSAudioStream!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // http://42.159.232.122:9001/msgfile/2016/2/15/55cf124089ab58003e50d6f6/201611151411790-file_mp3.mp4
        let url = NSURL(string: "https://dn-heyue.qbox.me/TEMP_MP3_1.mp3")
        
        audioStream = FSAudioStream(url: url)
        
        audioStream.volume = 1
        
        audioStream.play()
        
        audioStream.onCompletion = { () ->Void in
            
            print("播放完成!")
            
        }
        
        audioStream.onFailure = { (streamError,erroyStr) ->Void in
            
            print("streamError=\(streamError),erroyStr=\(erroyStr)")
        }
        
        audioStream.onMetaDataAvailable = { (dic) ->Void in
            
            print("onMetaDataAvailable=\(dic)")
        }
        
        
        audioStream.onStateChange = { (streamState) ->Void in
            print("onStateChange=\(streamState)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

