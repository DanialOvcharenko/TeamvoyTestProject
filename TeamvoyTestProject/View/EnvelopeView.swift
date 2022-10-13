//
//  EnvelopeView.swift
//  TeamvoyTestProject
//
//  Created by Mac on 12.10.2022.
//

import SwiftUI

struct EnvelopeView: View {
    var body: some View {
        VStack{
            Text("На випадок якщо рекрутер не передасть мою думку")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("Хочу зазначити, що не все швидко вдається на swiftUI через те, що дуже рідко трапляються тестові на ньому, але мені він дуже подобається і я хотівби мати з ним справу, буду дуже вдячний якщо зможете надати мені таку можливість. Виконав це завдання не с першого разу, але за час навіть другої спроби іще більще сподобався swiftUI, тож дуже мрію працювати з ним.")
                .font(.system(size: 22))
                .padding()
        }
    }
}

struct EnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeView()
    }
}
