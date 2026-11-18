import SwiftUI
import Playgrounds

/**
 ContentView
 1. Create VStack that contains textfield as well as PersonView.
 2. Connect the textfield with its state variable.
 3. Pass the textfield's state variable to the PersonView via its init function
 
 PersonView
 1. Create an init function.
 2. Add a parameter to the init function to pass search text.
 3. Inside the init function, if the search text is not empty, set custom query to the @Query variable with the help of underscored prefixed variable name.
 */

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Enter name", text: self.$searchText)
                .textFieldStyle(.bordered)
            
            PersonView(searchText: self.searchText)
        }
    }
}

#Preview {
    ContentView()
}


