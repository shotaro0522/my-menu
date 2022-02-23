class Week < ActiveHash::Base
  self.data = [
    { id: 0, name: '月曜' },
    { id: 1, name: '火曜' },
    { id: 2, name: '水曜' },
    { id: 3, name: '木曜' },
    { id: 4, name: '金曜' },
    { id: 5, name: '土曜' },
    { id: 6, name: '日曜' },
  ]

  include ActiveHash::Associations
  has_many :plans

  end