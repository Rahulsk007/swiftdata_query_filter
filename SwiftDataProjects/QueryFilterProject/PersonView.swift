//
//  PersonView.swift
//  SwiftDataProjects
//
//  Created by Sk Sahabuddin on 15/11/26.
//

import SwiftUI
import SwiftData


struct PersonView: View {
    
   
//    @Query(
//        filter: #Predicate<PersonModel> {
//            $0.name.contains("Rahul")
//        }
//    )private var people: [PersonModel]
    
    @Query private var people: [PersonModel]
    
    @Environment(\ .modelContext) private var context
    
    init(searchText: String) {
        if !searchText.isEmpty {
            self._people = Query(
                filter: #Predicate<PersonModel> {
                    $0.name.contains(searchText)
                }
            )
        }
    }
    
    // Create a function for reads data from the JSON file and save in to swift database
    private func loadJson () {
        
        guard people.isEmpty else {
            print("Data already imported")
            return
        }
        
        do {
            // Find JSON file
            guard let url = Bundle.main.url(
                forResource: "PersonData",
                withExtension: "json"
            ) else {
                print("Json file not found")
                return
            }
            
            // Read JSON data
            let jsonData = try Data(contentsOf: url)
            
            // Decode JSON data
            let peopleData = try JSONDecoder().decode(
                [Person].self,
                from: jsonData
            )
            
            // Convert and insert into swiftData
            for person in peopleData {
                let model  = PersonModel(
                    name: person.name,
                    phone: person.phone,
                    email: person.email,
                    address: person.address
                )
                context.insert(model)
            }
            
            print("JSON imported successfully")
        }catch{
            print("Import Error", error)
        }
    }
    
   
    var body: some View {
        VStack() {
            List(people){value in
                Text(value.name)
            }
            .listStyle(.plain)
            
            Button("Update Data"){
                loadJson()
            }
        }
    }
}


//#Preview {
//    PersonView()
//        .modelContainer(for: PersonModel.self)
//}
