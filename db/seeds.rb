PostOffice.create(name: "Laurensville Post Office")
PostOffice.create(name: "Duke Post Office")
PostOffice.create(name: "Caroline Post Office")
PostOffice.create(name: "Bloomington Post Office")
PostOffice.create(name: "Sarajevo Post Office")


Recipient.create(name: "Stuart", available: true)
Recipient.create(name: "Jorge")
Recipient.create(name: "Frankie")
Recipient.create(name: "Sonnie", available: true)
Recipient.create(name: "Grinch")


DeliveryPerson.create(name: "Vincent", post_office_id: 2)
DeliveryPerson.create(name: "Amy", post_office_id: 4)
DeliveryPerson.create(name: "Luis", post_office_id: 1)
DeliveryPerson.create(name: "Jane", post_office_id: 3)
DeliveryPerson.create(name: "Scott", post_office_id: 5)


# # rake db:seed
