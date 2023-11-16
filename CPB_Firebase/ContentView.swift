//
//  ContentView.swift
//  CPB_Firebase
//
//  Created by Jia Jakubiec on 11/6/23.
//

import SwiftUI
import SwiftData
import FirebaseDatabaseSwift
import FirebaseDatabase

struct ContentView: View {
    //var body: some View{
//        Button("Press Me"){
//            let database = Database.database().reference()
//            database.child("things").setValue(5)
//        }
//    }
    @ObservedObject var viewModel = CollegeViewmodel()
    @State private var showingAlert = false
    @Environment(\.modelContext) var context
    //@Query var colleges: [College]
    @State var enteredCollege:String = ""
    //@Query var location: [College]
    @State var enteredCollegeLocation:String = ""
    //@Query var students: [College]
    @State var enteredNumOfStudents:String = ""
    //@Query var url: [College]
    @State var enteredCollegeUrl:String = ""
    var body: some View {
        Button("+") {
            showingAlert = true
        }
        .alert("Add New College", isPresented: $showingAlert) {
            VStack {
                TextField ("Enter College", text: $enteredCollege)
                TextField ("Enter College Location", text: $enteredCollegeLocation)
                TextField ("Enter Number of Students", text: $enteredNumOfStudents)
                TextField ("Enter College URL", text: $enteredCollegeUrl)
            }
            Button("Cancel") {
                showingAlert = false
            }
            Button("Add") {
                showingAlert = true
                let college = College(name: enteredCollege, location: enteredCollegeLocation, student: enteredNumOfStudents, url: enteredCollegeUrl)
                viewModel.AddCollege(currentCollege: college)
                enteredCollege = ""
                enteredCollegeLocation = ""
                enteredNumOfStudents = ""
                enteredCollegeUrl = ""
                showingAlert = false
            }
        }
        List {
            ForEach(viewModel.colleges) { currentCollege in
                Text(currentCollege.name)
                Text(currentCollege.location)
                Text(currentCollege.student)
                Text(currentCollege.url)
                Button("-") {
                    context.delete(currentCollege)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
