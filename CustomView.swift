//
//  CustomView.swift
//  Test
//
//  Created by bear on 2019/11/25.
//  Copyright © 2019 kakaot. All rights reserved.
//

import UIKit

extension UIView {
    func loadView(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    var contentView: UIView? {
        return subviews.first
    }
}

@IBDesignable
class CustomView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        guard let view = loadView(nibName: "CustomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
