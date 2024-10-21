class ApplicationController < Sinatra::Base

  # Route pour afficher la page d'accueil
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # Route pour afficher le formulaire de création de gossip
  get '/gossips/new' do
    erb :new_gossip
  end

  # Route pour traiter le formulaire et ajouter un gossip
  post '/gossips/new' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  # Route pour afficher un gossip spécifique
  get '/gossips/:id' do
    gossip = Gossip.find(params['id'].to_i)  # Récupère le gossip avec l'ID correspondant
    erb :show, locals: {gossip: gossip}      # Affiche la vue show.erb avec le gossip
  end
end
