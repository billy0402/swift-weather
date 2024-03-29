//
//  WeatherListTableViewController.swift
//  swift-weather
//
//  Created by User on 2020/3/15.
//  Copyright © 2020 NTUB. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {

    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.dataSource = TableViewDataSource(cellIdentifier: "WeatherCell", viewModels: self.weatherListViewModel.weatherViewModels) { cell, vm in
            cell.configure(vm)
        }
        self.tableView.dataSource = self.dataSource
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WeatherDetailsViewController" {
            self.prepareSegueForWeatherDetailsViewController(segue: segue)
        } else if segue.identifier == "AddWeatherCityViewController" {
            self.prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            self.prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        weatherDetailsVC.weatherViewModel = weatherVM
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherVC.delegate = self
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        settingsTVC.delegate = self
    }

}

extension WeatherListTableViewController: AddWeatherDelegate {

    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.dataSource.updateViewModels(self.weatherListViewModel.weatherViewModels)
        self.tableView.reloadData()
    }

}

extension WeatherListTableViewController: SettingsDelegate {

    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }

}
