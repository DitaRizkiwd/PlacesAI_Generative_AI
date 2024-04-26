//
//  PlaceViewModel.swift
//  PlacesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
import GoogleGenerativeAI

class PlaceViewModel : ObservableObject {
    private var geminiModel: GenerativeModel?
    @Published var place: [PlaceModel] = []
    
    init(){
//        self.geminiModel = GenerativeModel(name: "gemini-pro", apiKey: Constant.apiKey)
        configureGenerativeModel()
    }
    func configureGenerativeModel() {
        Task{
            do{
                    let apiKey: String = try await RemoteConfigService.shared.fetchConfig(forKey: .apiKey)
                    geminiModel = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
            }
            catch{
                print("Error configure generative model \(error)")
            }
        }
        
    }
    
    func getPlaces() async {
        let prompt = Constant.prompt
        guard let geminiModel = self.geminiModel else{
            print("generative model is not configured")
            return
        }
        do{
            let response = try await geminiModel.generateContent(prompt)
            //encoding
            guard let text = response.text, let data = text.data(using: .utf8)
            else{
                print("😅 Unable to extract text or convert to data")
                return
            }
            //decoding
            place = try JSONDecoder().decode([PlaceModel].self, from: data)
        }
        catch{
            print("🤬 Error fetching places: \(error.localizedDescription)")
        }
    }
}
