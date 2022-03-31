class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind do 
    link(:related) { kind_url(object.kind.id) }
  end

  has_many :phones
  has_one :address

  # link(:path_contact) { contact_url(object.id) }
  # link(:kind_path) { kind_url(object.kind.id) }

  # def author
  #   "Diego Silva"
  # end

  meta do
     { author: "Diego Silva "}
  end

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
