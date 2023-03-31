//
//  Pokeball .swift
//  Challenge3
//
//  Created by Cameron Johnson on 3/24/23.
//

import Foundation
import SwiftUI

struct Pokeball: View {
    var body: some View {
      
            VStack{
                
                Rectangle()
                    .foregroundColor(.red)
                    //use modifier to keep things proportional
                    .frame(width: UIScreen.main.bounds.width * 1)
                    .frame(height: UIScreen.main.bounds.height * 0.2)
                    //.ignoresSafeArea()
                    .overlay(
                        Image("pokemonlogo")
                            .resizable()
                            .scaledToFit()
                            .font(.headline)
                            .padding()
                            
                            
                        
                        
                    )
                Spacer()
                
                Image("pokeball")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()
                
                Spacer()
                
                Text("Created: Cameron Johnson")
                    .font(.title)
                    
                
                
                Spacer()
                
            
    
                
            }
        }
    
    
    struct Pokeball_Previews: PreviewProvider {
        static var previews: some View {
            Pokeball()
        }
    }
    
}

