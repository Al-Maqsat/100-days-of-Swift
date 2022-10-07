//
//  ActionViewController.swift
//  Extension
//
//  Created by Maksat Baiserke on 26.09.2022.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ActionViewController: UIViewController {
    @IBOutlet var script: UITextView!
    var saved: String = ""
    var pageTitle = ""
    var pageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        let defaults = UserDefaults.standard
        if let savedData = defaults.object(forKey: "scrpitText") as? Data {
            if let decodedText = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? String{
                script.text = decodedText
            }
        }
            
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(scripts))
        
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = inputItem.attachments?.first {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String){ [weak self] (dict, error) in
                    guard let itemDictionary = dict as? NSDictionary else {return}
                    guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else {return}
                    print(javaScriptValues)
                    
                    self?.pageTitle =  javaScriptValues["title"] as? String ?? ""
                    self?.pageURL = javaScriptValues["URL"] as? String ?? ""
                    
                    DispatchQueue.main.async {
                        self?.title = self?.pageTitle
                    }
                }
            }
        }
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        saved = script.text
        save()
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]
        
        extensionContext?.completeRequest(returningItems: [item])
    }

    @objc func adjustForKeyboard(notification: Notification){
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

            let keyboardScreenEndFrame = keyboardValue.cgRectValue
            let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

            if notification.name == UIResponder.keyboardWillHideNotification {
                script.contentInset = .zero
            } else {
                script.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
            }

            script.scrollIndicatorInsets = script.contentInset

            let selectedRange = script.selectedRange
            script.scrollRangeToVisible(selectedRange)
    }
    
    @objc func scripts(){
        let ac = UIAlertController(title: "All available Scripts", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Script 1", style: .default))
        ac.addAction(UIAlertAction(title: "Script 2", style: .default))
        ac.addAction(UIAlertAction(title: "Script 3", style: .default))
        ac.addAction(UIAlertAction(title: "Script 4", style: .default))
        ac.addAction(UIAlertAction(title: "Script 5", style: .default))
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        present(ac, animated: true)
    }
    
    func save(){
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: saved, requiringSecureCoding: false){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "scriptText")
        }
    }
}
