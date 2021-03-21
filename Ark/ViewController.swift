//
//  ViewController.swift
//  Ark
//
//  Created by sangchan.lee on 2021/03/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    private var vm : BehaviorSubject<ViewModel>? = .init(value: .init(title: "created"))
    lazy var disposeBag : DisposeBag = DisposeBag()
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vm?.asObservable().subscribe { [unowned self] (vm) in
            self.label.text = vm.title
        }.disposed(by: disposeBag)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm?.onNext(.init(title: "Hello World Again!"))
    }
    
    deinit {
        print("deinit ViewController")
    }
}

