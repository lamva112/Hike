//
//  CustomListRowView.swift
//  Hike
//
//  Created by bui khac lam on 16/07/2023.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowlabel : String
    @State var rowIcon : String
    @State var rowContent : String? = nil
    @State var rowTintColor : Color
    @State var rowLinkLabel : String? = nil
    @State var rowLinkDestination : String? = nil
    var body: some View {
        LabeledContent{
            //Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link( rowLinkLabel!,destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30,height: 30)
                        .foregroundColor(rowTintColor)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                
                    
                }
                Text(rowlabel)
            }
        }

    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            CustomListRowView(rowlabel: "Desiger", rowIcon: "paintpalette", rowContent: "Khac Lam", rowTintColor: .pink)
        }
    }
}
