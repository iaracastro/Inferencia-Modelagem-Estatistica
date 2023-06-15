## Resumo
O objetivo do artigo é desenvolver um modelo estatístico para prever a ocorrência de doenças cardiovasculares com base em dados reais de pacientes e elaborar uma análise exploratória dos dados (EAD), com o intuito de identificar possíveis relações entre as covariáveis do dataset que podem vir a influenciar um indivíduo a contrair doenças cardiovasculares. O conjunto utilizado está disponível no [Kaggle](https://www.kaggle.com/sulianova/cardiovascular-disease-dataset), que contém 70.000 registros de pacientes, com 12 variáveis de entrada e 1 variável de saída, que indica se o paciente possui ou não doença cardiovascular. 

Palavras-chave: modelagem. estatística. doença cardiovascular. análise de dados. regressão linear. bayes. machine learning. R.
## Abstract
The objective of this work is to develop a statistical model to predict the occurrence of cardiovascular diseases based on real patient data and to elaborate an exploratory data analysis (EDA), in order to identify possible relationships between the covariates of the dataset that may influence an individual to contract cardiovascular diseases. The dataset used is available on [Kaggle](https://www.kaggle.com/sulianova/cardiovascular-disease-dataset), which contains 70,000 patient records, with 12 input variables and 1 output variable, which indicates whether the patient has cardiovascular disease or not.

Keywords: modeling. statistics. cardiovascular disease. data analysis. linear regression. bayes. machine learning. R.

## Introdução
	
Doenças cardiovasculares são a principal causa de morte no mundo. Segundo a Organização Mundial da Saúde (OMS), 17,9 milhões de pessoas morreram em 2019 devido a doenças cardiovasculares, sendo que 85\% dessas mortes são causadas por infarto do miocárdio e acidente vascular cerebral (AVC). A OMS e a Organização Pan-Americana de saúde também estimam que 80\% das mortes prematuras por doenças cardiovasculares podem ser evitadas com mudanças no estilo de vida, como: evitar o consumo de tabaco, alimentação saudável e prática de atividades físicas. 

serão analisadas variáveis como: idade, gênero, altura, peso, nível de colesterol, nível de glicose, pressão arterial sistólica, pressão arterial diastólica, fumante ou não, se o paciente possui ou não hipertensão e se o paciente possui ou não diabetes. O dataset foi dividido em 80% para treino e 20% para teste. O modelo foi desenvolvido utilizando a linguagem R e a biblioteca Stan, para a implementação do modelo bayesiano.


Para destrinchar o problema, o artigo será dividido partes. No Capítulo 2 serão apresentados os conceitos que serão utilizados ao longo do artigo. No Capítulo 3 serão analisados os dados para construção da análise exploratória e entendimento do problema e do dataset.
No Capítulo 4 será apresentada a metodologia utilizada para a construção do modelo. No Capítulo 5, serão apresentados as estimativas e predições obtidas, assim como as considerações finais sobre os classificadores. E por fim, no capítulo 6 será feita uma discussão de possíveis trabalhos futuros.


## Metologia

Foram testados os modelos de regressão logística, árvore de decisão, floresta aleatória e SVM. O modelo que obteve melhor desempenho foi o de regressão logística, com acurácia de 0.72 e AUC de 0.79. O modelo foi implementado em um aplicativo web, utilizando a biblioteca Streamlit, que pode ser acessado [aqui](https://cardiovascular-disease-prediction.herokuapp.com/).
