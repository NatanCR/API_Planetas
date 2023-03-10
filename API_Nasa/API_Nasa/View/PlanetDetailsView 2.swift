//
//  PlanetDetailsView.swift
//  API_Nasa
//
//  Created by Natan de Camargo Rodrigues on 07/02/23.
//

import SwiftUI

struct PlanetDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var planetsWS = WebService()
    @State var planetDetails: PlanetInfos
    @State var planetPlusDetails: PlusPlanetInfos
    var infosServices = InfosService()
    
    
    var body: some View {
        VStack(spacing: 5){
            ImageFormatter(imgURL: infosServices.searchImage(planets: [planetDetails])!)
                .shadow(color: infosServices.chooseShadowColor(id: planetDetails.id),radius: 10)
                .padding(.bottom, 20)
            
            Section {
                ScrollView(){
                    DetailCell(text: "Name: " + planetDetails.name)
                    DetailCell(text: "Planet order: " + planetDetails.planetOrder)
                    
                    Text("Description: " + planetDetails.description)
                        .multilineTextAlignment(.leading).padding(10)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1.00)))
                                .opacity(0.4)
                        }
                        .padding(.horizontal)
                    
                    DetailCell(text: "Planet mass: \(infosServices.searchMass(planetsPlusInfos: [planetPlusDetails], planetName:planetDetails.name)!)")
                    DetailCell(text: "Planet volume: " + infosServices.searchVolume(planetInfos: [planetDetails])!)
                    
                }
            } header: {
                Text("Information:")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
            }
            .padding(.bottom, 10)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        Text("Back")
                    }.foregroundColor(Color.white)
                })
            }
        }
    }
    
}

//struct PlanetDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetDetailsView()
//    }
//}
