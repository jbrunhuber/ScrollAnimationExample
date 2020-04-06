//
//  ViewController.swift
//  ScrollAnimationExample
//
//  Created by Joshua Brunhuber on 06.04.20.
//  Copyright © 2020 Joshua Brunhuber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let container: UIStackView = {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    private let expandableView: ExpandableView = {
        let expandableView = ExpandableView()
        expandableView.translatesAutoresizingMaskIntoConstraints = false
        return expandableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        scrollView.addSubview(container)

        let firstView = makeTestView()
        let secondView = makeTestView()

        container.addArrangedSubview(firstView)
        container.addArrangedSubview(secondView)
        container.addArrangedSubview(expandableView)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        firstView.testLayouted()
        secondView.testLayouted()
    }

    func makeTestView() -> UIView {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIView {
    func testLayouted() {
        heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
