# the_gossip_project_sinatra

Ce projet est une application web simple, développée avec Sinatra, qui permet aux utilisateurs d'ajouter et de consulter des potins. L'application suit l'architecture MVC (Modèle-Vue-Contrôleur) et stocke les potins dans un fichier CSV.

Fonctionnalités principales
Affichage de tous les potins sur la page d'accueil.
Ajout d'un nouveau potin via un formulaire.
Affichage des détails d'un potin spécifique sur une page dédiée.

the_gossip_project_sinatra/
├── Gemfile
├── Gemfile.lock
├── config.ru
├── db/
│   └── gossip.csv          # Fichier CSV où tous les potins sont stockés
└── lib/
    ├── controller.rb       # Le contrôleur principal gérant les routes
    ├── gossip.rb           # Le modèle Gossip pour gérer les données
    └── views/
        ├── index.erb       # Vue affichant tous les potins
        ├── new_gossip.erb  # Formulaire pour créer un nouveau potin
        └── show.erb        # Vue affichant les détails d'un potin spécifique

Détails des fichiers

Gemfile
Ce fichier contient la liste des dépendances nécessaires au projet, comme Sinatra.
Nous avons utilisé la gem Sinatra pour gérer les routes et afficher les pages HTML.
Rerun est utilisé pour recharger automatiquement le serveur à chaque modification du code.

config.ru
Ce fichier est utilisé pour configurer et démarrer l'application Sinatra via Rack.
Il requiert les gems nécessaires et lance l'ApplicationController, qui gère les routes principales de l'application.

controller.rb
Responsabilité : Ce fichier gère les routes de l'application et la logique de traitement des requêtes.
La route '/' affiche tous les potins sur la page d'accueil en récupérant les données du modèle Gossip.
La route '/gossips/new' affiche un formulaire pour ajouter un nouveau potin.
La route POST '/gossips/new' gère la soumission du formulaire, crée un nouveau potin, et redirige l'utilisateur vers la page d'accueil.
La route '/gossips/:id' permet d'afficher un potin spécifique selon son ID, en récupérant les informations du modèle Gossip.

gossip.rb
Responsabilité : Ce fichier est le modèle qui gère la lecture et l'écriture des potins dans un fichier CSV.
La méthode save enregistre un nouveau potin dans le fichier gossip.csv avec l'auteur et le contenu.
La méthode all lit tous les potins du fichier CSV et retourne une liste d'instances Gossip.
La méthode find(id) permet de récupérer un potin spécifique en fonction de son ID.

gossip.csv
Responsabilité : C'est le fichier où sont stockés tous les potins sous forme de données structurées (auteur, contenu).
Chaque ligne du fichier représente un potin avec son auteur et son contenu.
Les potins sont lus et écrits dans ce fichier via le modèle Gossip.

index.erb
Responsabilité : Vue qui affiche tous les potins sur la page d'accueil.
Pour chaque potin, on affiche l'auteur, le contenu, et un lien vers la page dédiée du potin.
Utilise une boucle pour parcourir et afficher tous les potins récupérés via la méthode Gossip.all.

new_gossip.erb
Responsabilité : Vue qui affiche un formulaire permettant à l'utilisateur de soumettre un nouveau potin.
Le formulaire envoie les données via une requête POST à la route '/gossips/new'.
L'utilisateur doit renseigner son nom et le contenu du potin, qui sont ensuite enregistrés dans le fichier CSV.

show.erb
Responsabilité : Vue qui affiche les détails d'un potin spécifique (auteur et contenu) en fonction de son ID.
Cette vue est appelée par la route dynamique '/gossips/:id'.
Un lien permet de retourner à la page d'accueil.
