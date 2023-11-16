//
//  CollegeViewmodel.swift
//  CPB_Firebase
//
//  Created by Jia Jakubiec on 11/14/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class CollegeViewmodel: ObservableObject {
    @Published var colleges: [College] = []
    init() {
        PullFromFirebase()
    }
    
    func AddCollege(currentCollege: College) {
        colleges.append(currentCollege)
        AddToFirebase(college: currentCollege)
    }
    
    func AddToFirebase(college: College) {
        let database = Database.database().reference()
        database.child("Colleges").child(college.name).child("Location").setValue(college.location)
        database.child("Colleges").child(college.name).child("Number of Students").setValue(college.student)
        database.child("Colleges").child(college.name).child("URL").setValue(college.url)
    }
    
    func PullFromFirebase() {
        let databaseRef = Database.database().reference().child("Colleges")
        databaseRef.getData { myError,myDataSnapshot in
            var newList: [College] = []
            for college in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                let nameOfCollege = college.key
                let dictionary = college.value as! [String: String]
                guard let locationOfCollege = dictionary["Location"] else  {return}
                guard let studentsAtCollege = dictionary["Number of Students"] else  {return}
                guard let webOfCollege = dictionary["URL"] else  {return}
                
                let currentCollege = College(name: nameOfCollege, location: locationOfCollege, student: studentsAtCollege, url: webOfCollege)
                newList.append(currentCollege)
            }
            self.colleges = newList
        }
    }
}
