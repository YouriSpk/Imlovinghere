class User < ApplicationRecord
  # 👉 Modules Devise activés
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 👉 Enumération pour les types de profils communautaires
  enum role: {
    visitor: 0,        # Utilisateur de base, accès minimal, contenu privé
    friend: 1,         # Crée du contenu public, rémunéré 1.5x
    active: 2,         # Contributeur régulier, jusqu’à 16h/sem, rémunéré 2x
    philanthropist: 3  # Investisseur temps/argent, rémunéré 4x
  }

  # 👉 Associations principales
  has_many :events, dependent: :destroy
  has_many :participations
  has_many :joined_events, through: :participations, source: :event

  has_many :posts, dependent: :destroy
  has_many :messages, foreign_key: :sender_id
  has_many :conversations, foreign_key: :initiator_id

  has_many :clicks
  has_many :earnings_records

  has_many :notifications, dependent: :destroy
  has_many :offers, class_name: 'Troc', foreign_key: :offerer_id
  has_many :requests, class_name: 'Troc', foreign_key: :requester_id

  # 👉 Méthodes utiles
  def full_profile_completed?
    username.present? && bio.present?
  end

  def time_in_hours
    time_spent.to_f / 60
  end
end
