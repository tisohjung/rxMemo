//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by minho on 2021/03/28.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    var viewModel: MemoDetailViewModel!

    @IBOutlet var listTableView: UITableView!
    @IBOutlet var deleteButton: UIBarButtonItem!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var shareButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)

        viewModel.contents
            .bind(to: listTableView.rx.items) {
                tableView, row, value in
                switch row {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
                    cell.textLabel?.text = value
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell")!
                    cell.textLabel?.text = value
                    return cell
                default:
                    fatalError()
                }
            }
            .disposed(by: rx.disposeBag)

//        var backButton = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: nil, action: nil)
//        viewModel.title
//            .drive(backButton.rx.title)
//            .disposed(by: rx.disposeBag)
//        backButton.rx.action = viewModel.popAction
//        navigationItem.hidesBackButton = true
//        navigationItem.leftBarButtonItem = backButton
    }
}
