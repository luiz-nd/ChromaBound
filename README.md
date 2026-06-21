# 🎨 ChromaBound

## 📝 Sobre o Projeto
O **ChromaBound** é um jogo eletrônico educativo bidimensional (2D) que transpõe os conceitos abstratos da **Teoria das Cores de Wassily Kandinsky** para mecânicas práticas de jogabilidade inspiradas no clássico estilo *Arkanoid*. 

Desenvolvido como um projeto prático que aplica conceitos rigorosos de Engenharia de Software, o jogo coloca o jogador no controle de um personagem pintor (Rose) que deve selecionar, misturar e rebater esferas coloridas para eliminar monstros na tela. O sucesso no combate depende diretamente da equivalência cromática entre a esfera lançada e a cor do inimigo atingido.

---

## 🕹️ Mecânicas do Jogo
* **Movimentação Dinâmica:** O jogador se move lateralmente pela base da tela para encontrar o melhor ângulo vetorial de rebote com o pincel.
* **Sistema de Combate Cromático:** * Se a esfera e o monstro possuírem a **mesma cor**, o inimigo é eliminado e o jogador pontua.
  * Se as cores forem **diferentes**, o monstro permanece intacto e o sistema processa apenas a física de rebatimento tradicional.
* **Mistura de Cores (Níveis Avançados):** Para derrotar monstros que exibem cores secundárias (como Verde, Roxo ou Laranja), o jogador deve realizar a combinação em tempo real das tintas primárias corretas antes de lançar a esfera.
* **Gerenciamento de Ciclo de Jogo:** O sistema controla um limite de 3 vidas. Se a esfera cair sem ser interceptada pelo pincel, uma vida é subtraída até o acionamento do *Game Over*. O progresso acontece de forma incremental a cada tela limpa.

---

## 🛠️ Tecnologias Utilizadas
* **Engine:** GameMaker Studio
* **Linguagem de Programação:** GameMaker Language (GML Code) — Utilização de sintaxe textual e orientada a eventos para manipulação de matrizes, colisões em tempo real e otimização de memória.
* **Modelagem de Sistema:** Linguagem de Modelagem Unificada (UML).

---

## 📐 Engenharia de Software e Arquitetura
O projeto foi estruturado seguindo boas práticas de desenvolvimento para evitar o antipadrão de *God Object* (classes infladas) e o surgimento de *código espaguete* (alto acoplamento). 

### Artefatos de Modelagem (UML)
O comportamento e o escopo do software foram mapeados utilizando diagramas padrões:
1. **Diagrama de Casos de Uso:** Mapeia as interações e responsabilidades entre o *Ator Primário (Jogador)* e o *Ator Secundário (Sistema GML)*.
2. **Diagrama de Atividades:** Descreve a lógica sequencial do *game loop*, detalhando os pontos de decisão condicional das validações cromáticas simples e secundárias.

*(Opcional: Se você gerou as imagens dos diagramas pelo PlantUML, pode salvá-las em uma pasta `/img` e linká-las aqui)*
---

## 🚀 Como Executar o Projeto

### Pré-requisitos
Para abrir e compilar o projeto, você precisará do:
* [GameMaker Studio](https://gamemaker.io/) instalado (versão recente com suporte a GML Code/Visual).

### Passo a Passo
1. Clone este repositório para a sua máquina local:
   ```bash
   git clone [https://github.com/seu-usuario/chromabound.git](https://github.com/seu-usuario/chromabound.git)
