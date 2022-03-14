//
//  AddSFSymbolToText.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 10/03/2022.
//

import UIKit

struct AddSFSymbolToText {
    static func makeText(text: String, symbol: String, tintColor: UIColor) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: symbol)?.withTintColor(tintColor)
        let fullString = NSMutableAttributedString(string: " ")
        fullString.append(NSAttributedString(string: "\(text)  "))
        fullString.append(NSAttributedString(attachment: imageAttachment))

        return fullString
    }
}
