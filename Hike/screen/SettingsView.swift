//
//  SettingsView.swift
//  Hike
//
//  Created by bui khac lam on 16/07/2023.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK - PROPERTIES
    
    private let alternateAppIcon : [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List{
            // MARK: - SECTION: HEADER
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editors's Choice")
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDart], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top,8)
                
                VStack (spacing:8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                    .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike thats you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust of the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(width: .infinity)
                
            }//: HEADER
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ICON
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack {
                        ForEach(alternateAppIcon.indices,id: \.self) { item in
                            Button{
                                print("\(alternateAppIcon[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcon[item]){error in
                                    if error != nil{
                                        print("Failed request to update the app's icon \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! You have changed the app's icon to \(alternateAppIcon[item])")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }//: SCROLLVIEW
                .padding(.top,12)
                
                Text("Choose your favorite app icon from the colection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top,12)
            }//: SECTION
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copy @ All right reserved. ")
                    Spacer()
                }
                    .padding(.vertical,8)
            ){
               // 1. basic content
                //LabeledContent("Application",value: "Hike")
                
              // 2. Advanced Label Content
                CustomListRowView(rowlabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowlabel: "Compatibility", rowIcon: "info.circle", rowContent: "IOS,IPadOS", rowTintColor: .red)
                
                CustomListRowView(rowlabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowlabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .mint)
                
                CustomListRowView(rowlabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Khac Lam", rowTintColor: .mint)
                
                CustomListRowView(rowlabel: "Desiger", rowIcon: "paintpalette", rowContent: "Phuc Le", rowTintColor: .pink)
                
                CustomListRowView(rowlabel: "Website", rowIcon: "globe", rowTintColor: .indigo,rowLinkLabel: "Lecle.vn",rowLinkDestination: "https://lecle.vn/")
                
            }//: SECTION
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
