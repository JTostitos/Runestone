//
//  EditorTextView.swift
//  
//
//  Created by Simon Støvring on 29/11/2020.
//

import UIKit

open class EditorTextView: UITextView {
    public var language: Language? {
        get {
            return highlightTextStorage.language
        }
        set {
            highlightTextStorage.language = newValue
        }
    }

    private let highlightTextStorage = HighlightTextStorage()

    public init(frame: CGRect) {
        let textContainer = Self.createTextContainer(textStorage: highlightTextStorage)
        super.init(frame: frame, textContainer: textContainer)
    }

    public init() {
        let textContainer = Self.createTextContainer(textStorage: highlightTextStorage)
        super.init(frame: .zero, textContainer: textContainer)
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension EditorTextView {
    private static func createTextContainer(textStorage: NSTextStorage) -> NSTextContainer {
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer()
        layoutManager.addTextContainer(textContainer)
        return textContainer
    }
}