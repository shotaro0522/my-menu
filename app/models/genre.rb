class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食' },
    { id: 3, name: '洋食' },
    { id: 4, name: '中華' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :recipes

  end