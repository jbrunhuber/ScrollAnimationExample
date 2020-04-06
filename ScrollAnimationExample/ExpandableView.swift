//
//  ExpandableView.swift
//  ScrollAnimationExample
//
//  Created by Joshua Brunhuber on 06.04.20.
//  Copyright © 2020 Joshua Brunhuber. All rights reserved.
//

import Foundation
import UIKit

final class ExpandableView: UIView {
    var expanded = true

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Expandable View"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private let expandButton: UIButton = {
        let expandButton = UIButton()
        expandButton.setTitleColor(.systemBlue, for: .normal)
        expandButton.setTitle("Toggle", for: .normal)
        expandButton.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        return expandButton
    }()

    let textView: UITextView = {
        let textView = UITextView()
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    var height: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)

        layout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        layout()
    }

    private func layout() {
        addSubview(titleLabel)
        addSubview(expandButton)
        addSubview(textView)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
        ])

        NSLayoutConstraint.activate([
            expandButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            expandButton.topAnchor.constraint(equalTo: topAnchor),
        ])

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        height = textView.heightAnchor.constraint(equalToConstant: 0)
        height?.isActive = false

        textView.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
    }

    @IBAction func toggle() {
        layoutIfNeeded()
        UIView.animate(withDuration: 0.6, animations: { [weak self] in

            guard let self = self else {
                return
            }

            if self.expanded {
                NSLayoutConstraint.activate([self.height].compactMap { $0 })
            } else {
                NSLayoutConstraint.deactivate([self.height].compactMap { $0 })
            }
            self.layoutIfNeeded()
            })
        expanded.toggle()
    }
}
