class Reservation < ApplicationRecord
  enun status: [ :pending, :active, :finished, :paid, :canceled]
end
