class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  # def author
  #   "Willamy Silva"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description ],
  #     include: { kind: { only: :description } }
  #   )
  # end

  def to_br
    { 
      name: self.name,
      email: self.email,
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    }
  end
end
