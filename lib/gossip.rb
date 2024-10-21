require 'csv'                                  # charge la biblio CSV de Ruby, qui permet de lire et écrire des fichiers CSV (fichiers texte où les données sont séparées par des virgules)

class Gossip                                   # ouverture de la classe Gossip, avec deux attributs, autour et le contenu du potin 
  attr_reader :author, :content                # lecture pour les deux variables avec attr_reader

  def initialize(author, content)              # accès aux deux variables à l'extérieur de la classe mais sans pouvoir le modifier, go dans le bon fichier 
    @author = author
    @content = content
  end

  def save                                     # méthode pour save le gossip dans un fichier CSV             
    CSV.open("./db/gossip.csv", "ab") do |csv| # ouvre le fichier gossip.csv dans le dossier db / ab permet d'ajouter des données à la fin du fichier dans écraser 
      csv << [@author, @content]               # ajout d'une nouvelle ligne CSV avec auteur + contenu du potin avev une virgule puisque CSV 
    end
  end


  def self.all
    all_gossips = []                               # méthode self.all pour récupérer tous les gossips
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end                               # Cette méthode lit le fichier gossip.csv et retourne un tableau d'objets Gossip créés à partir des données du CSV


# Méthode pour récupérer un gossip spécifique par ID
  def self.find(id)
    all_gossips = self.all
    return all_gossips[id - 1]  # -1 car les index de tableau commencent à 0
  end
end