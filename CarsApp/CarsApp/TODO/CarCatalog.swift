//
//  CarCatalog.swift
//  CarsApp
//
//  Created by Abdulaziz Albahar on 1/15/24.
//

import Foundation

/*
 TODO: PART 3
     You are given a class called CarCatalog, with certain variables such as carsAvailable (mapping of CarModel to amount available), favourites (list of CarModels), etc.
     Implement the empty functions throughout this class - favourite(CarModel), getCarAvailability(CarModel), getAvailableCars(), filterCarsBy(brand).
     Some helper functions will already be given. Implement the class initializer to initialize your variables.
 */

class CarCatalog {

    var carsAvailable: [CarModel : Int] // A mapping of the car models to the amount of these models available.
    var displayedCars: [CarModel]
    var favourites: [CarModel]
    
    /*
     TODO: write an initializer that fetches all the car models. For the purposes of this assignment, initialize carsAvailable to a default array of 5-6 car models of your choice, with an arbitrary number representing their amount. Make sure the displayedCars are initialized with all the cars in carsAvailable. Upon launch, the user should have no favourites (empty).
     NOTE: The ids of the cars you provide must be unique, otherwise the app will crash.
    */
    init() {
        var carModelA: CarModel = CarModel(id: "1000", aBrand: .Lamborghini, modelName: "A", speed: 80, color: "Black", capacity: 250)
        var carModelB: CarModel = CarModel(id: "2000", aBrand: .Mercedes, modelName: "B", speed: 65, color: "Silver", capacity: 400)
        var carModelC: CarModel = CarModel(id: "3000", aBrand: .Porsche, modelName: "C", speed: 60, color: "White", capacity: 300)
        var carModelD: CarModel = CarModel(id: "4000", aBrand: .BMW, modelName: "D", speed: 70, color: "Blue", capacity: 350)
        var carModelE: CarModel = CarModel(id: "5000", aBrand: .Ford, modelName: "E", speed: 50, color: "Brown", capacity: 250)
        self.carsAvailable = [carModelA:1, carModelB:1, carModelC:1, carModelD:1, carModelE:1]
        self.displayedCars = Array(carsAvailable.keys)
        self.favourites = []
    }
    
    
    /*
        TODO: implement this function
        This function gets called by the UI whenever the user wants to ADD/REMOVE this car from their favourites list. Change the state of the favourites array to accomplish this.
     */
    func toggleFavourite(car: CarModel) {
        if favourites.contains(car) {
            var num:Int = 0
            var index:Int = 0
            while num<displayedCars.count {
                if displayedCars[num] == car {
                    index = num
                }
                num+=1
            }
            favourites.remove(at: index)
        } else {
            favourites.append(car)
        }
 
    }
    
    /*
        TODO: implement this function
        This function gets called by the UI whenever the user wants to view the amount of cars available from a certain model.
     */
    func getCarAvailability(car: CarModel) -> Int {
        if let numOfCars = carsAvailable[car] {
            return numOfCars
        } else {
            return 0
        }
    }
    
    /*
        TODO: implement this function
        Set the displayedCars to all the available cars excluding any car that IS NOT of the given brand. In essence, this is the filtering functionality our app uses to display cars of a certain brand.
        NOTE: make sure you handle the case where it's 'none', as it implies that we don't want a filter.
     */
    func filterCarsBy(brand: CarBrand) {
        var newArr:[CarModel] = []
        if brand != .none {
            for aCar in displayedCars{
                if aCar.aBrand == brand {
                    newArr.append(aCar)
                }
            }
            displayedCars = newArr
        }
    }
}
