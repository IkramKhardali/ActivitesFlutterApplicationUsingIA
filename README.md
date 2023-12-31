# recognizeme_ia
## Description du Projet
- L'objectif de ce projet consiste à développer une application offrant une sélection d'activités à réaliser en groupe. Dans l'environnement actuel des entreprises, le développement d'une application implique souvent la création d'une version MVP (Minimum Viable Product), permettant de recueillir un maximum de retours clients avec un effort minimal. Nous appliquerons ce concept en définissant notre propre MVP.

- Parallèlement, de nombreuses entreprises adoptent les méthodologies agiles et l'utilisation de User Stories. Nous suivrons cette formalisation pour exprimer nos différents besoins. Chaque User Story décrivant le MVP sera préfixée par [MVP] dans son titre.

- Le developpement de cette application mobile est basé sur les fonctionnalités de Flutter tout en intégrant les capacités avancées de TensorFlowlite.



## Sommaire
- [US#1 : MVP Interface de login](#us1--mvp-interface-de-login)
- [US#2 : MVP Liste des activités](#us2--mvp-liste-des-activités)
- [US#3 : MVP Détail d'une activité](#us3--mvp-détail-dune-activité)
- [US#4 : MVP Filtrer sur la liste des activités](#us4--mvp-filtrer-sur-la-liste-des-activités)
- [US#5 : MVP Profil utilisateur](#us5--mvp-profil-utilisateur)
- [US#6 : IA Ajouter une nouvelle activité](#us6--ia-ajouter-une-nouvelle-activité)

  
### US#1 : MVP Interface de login

#### Objectif
L'objectif de cette fonctionnalité est de permettre aux utilisateurs de se connecter à l'application afin d'accéder à la page suivante.

#### Détails 
En tant qu'utilisateur, je souhaite me connecter à l'application pour accéder à la page suivante.
1. Au lancement de l'application, une interface de connexion est présentée, comprenant 
   - Un headerBar contenant le nom de l'application.
   - Deux champs de saisie pour le login et le mot de passe.
   - Un bouton "Se connecter".
2. Les libellés des champs de saisie sont "Login" et "Password".
3. Le champ de saisie du mot de passe est obfusqué pour masquer la saisie.
4. Le libellé du bouton est "Se connecter".
5. En cliquant sur le bouton "Se connecter", une vérification en base de données est effectuée 
   - Si l'utilisateur existe, redirection vers la page suivante.
   - Si l'utilisateur n'existe pas, au moins un log est affiché dans la console, l'application reste fonctionnelle.
6. En cliquant sur le bouton "Se connecter" avec les deux champs vides, l'application doit rester fonctionnelle.

#### Page de Connexion :
Lorsque l'application est lancée, une interface de connexion est affichée, comprenant :
- Une barre d'en-tête avec le nom de l'application.
- Deux champs de saisie étiquetés "Login" et "Mot de passe".
- Un champ de saisie masqué pour le mot de passe.
- Un bouton "Se connecter".

#### Critères d'Acceptance
1. Les champs de saisie sont présents et étiquetés correctement.
2. Le champ de saisie du mot de passe masque la saisie.
3. Le libellé du bouton de connexion est "Se connecter".
4. En cliquant sur le bouton "Se connecter", une vérification est réalisée dans la base de données :
   - Si l'utilisateur existe, redirection vers la page suivante.
   - Si l'utilisateur n'existe pas, au moins un log est affiché dans la console, mais l'application reste fonctionnelle.
5. En cliquant sur le bouton "Se connecter" avec les deux champs vides, l'application reste fonctionnelle.

#### Captures d'écran
##### Interface "Register"
![WhatsApp Image 2023-12-30 à 13 38 39_3b64831c](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/18086094-e51c-489e-9666-4ba7eeda2bf4)

##### Interface "Sign in"
![WhatsApp Image 2023-12-30 à 13 37 51_e9eb32f9](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/568c89bc-1d5a-42d2-882d-b28eee2d5e44)

##### Interface "Forgotten password"
![WhatsApp Image 2023-12-28 à 16 10 24_0366ed6e](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/cc3c5cfa-af65-49df-afa4-36f2477cffc9)

[Jump back to Top](#sommaire)

### US#2 : MVP Liste des activités
#### Objectif
En tant qu'utilisateur connecté, je souhaite visualiser la liste des activités pour choisir celles auxquelles je souhaite m'inscrire.

#### Détails
En tant qu'utilisateur connecté, je souhaite voir la liste des activités pour choisir celles auxquelles je veux m'inscrire.

1. Une fois connecté, l'utilisateur arrive sur une page composée du contenu principal et d'une BottomNavigationBar contenant trois entrées avec leurs icônes correspondantes : Activités, Ajout et Profil.
2. La page actuelle est celle des "Activités", identifiée par une icône et un texte affichés dans une couleur différente des autres entrées.
3. Une liste déroulante de toutes les activités est présentée à l'écran.
4. Chaque activité affiche les informations suivantes :
   - Un titre.
   - Le lieu.
   - Le prix.
   - Nombre Minimum.
   - Catégorie
   - Date de création
   - Une image représentative.
5. En cliquant sur une entrée de la liste, le détail de l'activité est affiché (voir US#3).
6. Cette liste d'activités est récupérée depuis la base de données.

#### Critères d'acceptance
Après la connexion, l'utilisateur est dirigé vers la page "Activités", qui comprend :
- Le contenu principal.
- Une barre de navigation inférieure (BottomNavigationBar) avec trois onglets et leurs icônes : Activités (Home), Ajout, et Profil.
- L'onglet actuellement affiché est celui des "Activités", identifiable par une couleur différente de celle des autres onglets.
1. Une liste déroulante de toutes les activités est visible à l'écran.
2. Chaque activité est représentée par :
   - Un titre.
   - Le lieu.
   - Le prix.
   - Nombre Minimum.
   - Catégorie
   - Date de création
   - Une image représentative.
3. En cliquant sur une entrée de la liste, les détails de l'activité sont affichés (voir US#3).
4. La liste d'activités est récupérée depuis la base de données.

#### Capture d'écran
##### Interface "Liste des activités (All)"
![WhatsApp Image 2023-12-30 à 13 57 42_0eb7329e](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/53c4a050-ed15-4803-87de-d6636f26a088)

[Jump back to Top](#sommaire)

### US#3 : MVP Détail d'une activité
#### Objectif
En tant qu'utilisateur connecté, je souhaite voir les détails d'une activité pour évaluer si elle me convient.

### Critère d'Acceptance
1. La page de détail de l'activité comprend les informations suivantes :
   - Une image représentative.
   - Un titre.
   - Une catégorie (Sport, Shopping, Ludique, ...).
   - Le lieu.
   - Le nombre minimum de personnes requis pour réaliser l'activité.
   - Le prix.

#### Capture d'écran
##### Interface "Détails Activité (Catégorie : Shopping)"
![WhatsApp Image 2023-12-28 à 16 06 44_3977abe9](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/3ec2ad48-7f18-49cf-8441-26c79f1b1951)

##### Interface "Détails Activité (Catégorie : Sport)"
![WhatsApp Image 2023-12-28 à 16 07 06_1bed4a28](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/3507da2d-ec47-43cd-aadc-fe0d2da8ab7a)

[Jump back to Top](#sommaire)

### US#4 : MVP Filtrer sur la liste des activités
#### Objectif
En tant qu'utilisateur connecté, je souhaite avoir la possibilité de filtrer la liste des activités pour afficher uniquement une catégorie spécifique.

#### Critères d'acceptance
1. Sur la page "Activités", une TabBar est présente, listant les différentes catégories d'activités.
2. Par défaut, l'entrée "Toutes" est sélectionnée, affichant toutes les activités.
3. Au clic sur une des entrées de la TabBar, la liste est filtrée pour afficher uniquement les activités correspondant à la catégorie sélectionnée.

#### Capture d'écran
##### Interface "Liste des activités (Shopping)"
![WhatsApp Image 2023-12-30 à 13 58 39_bdb94ca2](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/0adc0a2a-cdcc-429e-8b10-0129030e9ab6)

##### Interface "Liste des activités (Sport)"
![WhatsApp Image 2023-12-30 à 14 00 22_9a22830c](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/6e50eaff-c0c8-419f-a420-fb39ecf56782)

[Jump back to Top](#sommaire)

### US#5 : MVP Profil utilisateur
#### Objectif
En tant qu'utilisateur connecté, je souhaite accéder aux informations de mon profil afin de les vérifier et de les modifier si nécessaire.

#### Critères d'acceptance
Sur la barre de navigation inférieure (BottomNavigationBar), en cliquant sur l'option "Profil", les informations de l'utilisateur s'affichent (récupérées en base de données).
Les informations comprennent :
- Le login (lecture seule)
- Le mot de passe (obfusqué)
- L'anniversaire
- L'adresse
- Le code postal (affiche le clavier numérique et n'accepte que les chiffres)
- La ville
Un bouton "Valider" permet de sauvegarder les données en base de données.
Un bouton "Se déconnecter" permet de retourner à la page de connexion.

#### Capture d'écran
##### Interface "Profil"
![WhatsApp Image 2023-12-28 à 16 09 32_3e8c718c](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/b0a22f0c-9856-4b1c-aaf1-cb564dc2ce59)

[Jump back to Top](#sommaire)

### US#6 : IA Ajouter une nouvelle activité
#### Objectif
En tant qu'utilisateur connecté, je souhaite pouvoir ajouter une nouvelle activité depuis mon profil.

#### Critères d'acceptance
Sur la barre de navigation inférieure (BottomNavigationBar), l'option "Ajout" permet d'accéder à la page correspondante.
Un formulaire s'affiche, comprenant les champs suivants :
- Image
- Titre
- Catégorie (Sport, Shopping)
- Lieu
- Nombre minimum de participants requis
- Prix
Un bouton "Valider" permet de sauvegarder les données en base de données.

#### Capture d'écran
##### Interface de création d'activité
![WhatsApp Image 2023-12-28 à 15 58 59_4be6eac4](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/ec0bcc45-f8e9-4dd8-bf63-0f1f2822adf3)

![WhatsApp Image 2023-12-28 à 16 01 16_694d4b7f](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/929b10a2-ce72-4b5b-99a4-30eba54bcbbf)

![WhatsApp Image 2023-12-28 à 16 04 36_922af2b5](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/a1564a52-e7ef-410d-b23b-757969059573)

![WhatsApp Image 2023-12-28 à 16 00 19_59e55ac3](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/140e1fe9-b014-434e-886e-764f25374e71)

![WhatsApp Image 2023-12-28 à 16 05 36_d40a462a](https://github.com/IkramKhardali/ActivitesFlutterApplicationUsingIA/assets/127056219/ba61eccf-a542-45fd-b91c-d8240422bdad)


## About
This project, led by KHARDALI Ikram, aims to create a mobile application utilizing Flutter and TensorFlowlite. The app is designed to facilitate group activity discovery and engagement. It's focused on developing a Minimum Viable Product (MVP) to efficiently gather user feedback while prioritizing essential features.

### Contact Information

- **KHARDALI Ikram**
  - Mobile: 0672247837
  - Email: [ikramkhardali@gmail.com](mailto:ikramkhardali@gmail.com)


## Resources
- [Readme](link_to_readme)
- [Activity](link_to_activity)

