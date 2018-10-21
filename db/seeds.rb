PostOffice.create(name: "Laurensville Post Office")
PostOffice.create(name: "Duke Post Office")
PostOffice.create(name: "Caroline Post Office")
PostOffice.create(name: "Bloomington Post Office")
PostOffice.create(name: "Newark Post Office")
PostOffice.create(name: "Livingston Post Office")
PostOffice.create(name: "Langaston Post Office")
PostOffice.create(name: "Conneticut Post Office")
PostOffice.create(name: "Hershire Post Office")
PostOffice.create(name: "Davenport Post Office")

Recipient.create(name: "Stuart", available: true)
Recipient.create(name: "Frankie")
Recipient.create(name: "Sonnie", available: true)
Recipient.create(name: "Grinch")
Recipient.create(name: "Sandra", post_office_id: 3)

DeliveryPerson.create(name: "Bob", post_office_id: 2)
DeliveryPerson.create(name: "Amy", post_office_id: 4)
DeliveryPerson.create(name: "Luis", post_office_id: 1)
DeliveryPerson.create(name: "Jane", post_office_id: 3)
DeliveryPerson.create(name: "Alice", post_office_id: 5)
DeliveryPerson.create(name: "Kenya", post_office_id: 9)
DeliveryPerson.create(name: "Trevor", post_office_id: 1)
DeliveryPerson.create(name: "Kenny", post_office_id: 10)
DeliveryPerson.create(name: "Linda", post_office_id: 7)

# # rake db:seed
