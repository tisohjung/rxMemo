//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by minho on 2021/03/28.
//

import NSObject_Rx
import RxCocoa
import RxSwift
import UIKit

class MemoListViewController: UIViewController, ViewModelBindableType {
    var viewModel: MemoListViewModel!

    @IBOutlet var listTableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)

        viewModel.memoList
            .bind(to: listTableView.rx.items(cellIdentifier: "cell")) {
                _, memo, cell in
                cell.textLabel?.text = memo.content
            }
            .disposed(by: rx.disposeBag)

        addButton.rx.action = viewModel.makeCreateAction()

        Observable.zip(listTableView.rx.modelSelected(Memo.self), listTableView.rx.itemSelected)
            .do(onNext: { [unowned self] _, indexPath in
                self.listTableView.deselectRow(at: indexPath, animated: true)
            }).map({ $0.0 })
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        
        listTableView.rx.modelDeleted(Memo.self)
            .bind(to: viewModel.deleteAction.inputs)
            .disposed(by: rx.disposeBag)
    }
}
