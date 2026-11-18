# Hogwarts - Casa da Sonserina 🐍

Um aplicativo iOS desenvolvido em Swift e SwiftUI que consome uma API pública do universo de Harry Potter para exibir os personagens da casa Sonserina. O projeto aplica conceitos de consumo de APIs REST, decodificação de JSON e a arquitetura MVVM para separar a interface da lógica de dados.

## 🚀 Funcionalidades e Modelagem

O aplicativo é composto pelas seguintes estruturas principais:
- **DrMa (Model):** Modelo de dados dos personagens, conforme o JSON da API. Implementa `Decodable` e `Identifiable` e armazena id, nome, patrono, imagem e casa.
- **ViewModel:** Responsável por buscar os dados na API com `URLSession` e decodificar a resposta. Publica a lista de personagens com `@Published` para que a interface seja atualizada automaticamente.
- **ContentView (View):** Tela principal com o brasão da Sonserina, a mensagem de boas-vindas e a lista rolável de personagens, cada um com foto circular e nome. Enquanto a imagem carrega, um placeholder é exibido.
- **DMApp:** Ponto de entrada do aplicativo (`@main`).

## 🌐 API Utilizada

Os dados são obtidos em tempo real da [HP-API](https://hp-api.onrender.com), pelo endpoint de personagens da Sonserina:

```
GET https://hp-api.onrender.com/api/characters/house/slytherin
```

## 🛠️ Tecnologias Utilizadas

- **Swift**: Linguagem principal do projeto.
- **SwiftUI**: Construção da interface (`NavigationStack`, `ScrollView`, `ForEach`, `AsyncImage`).
- **URLSession e JSONDecoder**: Requisição HTTP e decodificação do JSON.
- **Arquitetura MVVM**: Uso de `ObservableObject`, `@Published` e `@StateObject`.
- **Xcode**: Ambiente de desenvolvimento.

## 📁 Estrutura do Projeto

```
HOGWARTS/
├── DMApp.swift          # Ponto de entrada do app
├── ContentView.swift    # Tela principal e modelo DrMa
├── ViewModel.swift      # Requisição à API e estado da lista
├── Contents.json        # Metadados do asset de imagem
└── sonserina.png        # Imagem do brasão exibida no topo
```

## ▶️ Como executar

**Pré-requisitos:** macOS com Xcode 15 ou superior e conexão com a internet (os dados e as fotos vêm da API).

**1. Clone este repositório:**
```bash
git clone https://github.com/SEU-USUARIO/HOGWARTS.git
```

**2. Crie um novo projeto no Xcode:**

Em *File > New > Project*, escolha **iOS > App**, com interface **SwiftUI** e linguagem **Swift**, e dê o nome `DM`.

**3. Adicione os arquivos do repositório ao projeto:**

Substitua o `DMApp.swift` e o `ContentView.swift` gerados pelo Xcode e adicione o `ViewModel.swift`.

**4. Configure os assets em `Assets.xcassets`:**
- Adicione a imagem `sonserina.png` com o nome **Sonserina**.
- Crie dois *Color Sets* chamados **back** (cor de fundo) e **place** (cor dos textos e do placeholder), usados como `Color.back` e `Color.place`.

**5. Execute a aplicação:**

Selecione um simulador de iPhone e pressione `Cmd + R`.
