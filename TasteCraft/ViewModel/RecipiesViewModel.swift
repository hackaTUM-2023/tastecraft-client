//
//  RecipiesViewModel.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import Foundation

class RecipiesViewModel: ObservableObject {
    @Published var recipies: [Recipe] = []
}
