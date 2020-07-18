//
//  MainViewController.swift
//  ExpensesApp
//
//  Created by Dakosia on 7/15/20.
//  Copyright © 2020 Dakosia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    enum Constants {
        static let tableIdentifier = "ExpensesCell"
        static let buttonCornerRadius: CGFloat = 6
    }
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var outcomeButton: UIButton!
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Configuring views
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        incomeButton.layer.cornerRadius = Constants.buttonCornerRadius
        outcomeButton.layer.cornerRadius = Constants.buttonCornerRadius
        
        if let amount = UserDefaults.standard.value(forKey: "UserTotalAmount") as? Double {
            self.amountLabel.text = amount.description + ""
        }
    }
    
    // MARK: - Button actions
    @IBAction func editActionPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Введите Ваш баланс", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Введите"
            textField.font = UIFont.systemFont(ofSize: 20)
            textField.keyboardType = .numberPad
        }
        let okAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            let textField = alert.textFields?[0]
            if let text = textField?.text, let amount = Double(text) {
                UserDefaults.standard.set(amount, forKey: "UserTotalAmount")
                self.amountLabel.text = text
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func outcomeButtonPressed(_ sender: Any) {
        
    }
    @IBAction func incomeButtonPressed(_ sender: Any) {
        
    }
    
}

// MARK: - UITableView Delegate & DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.tableIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "15.01.2020"
//    }
}

