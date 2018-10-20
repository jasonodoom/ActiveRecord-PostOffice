PostOffice.create(name: "Laurensville Post Office")
PostOffice.create(name: "Duke Post Office")
PostOffice.create(name: "Caroline Post Office")
PostOffice.create(name: "Bloomington Post Office")
PostOffice.create(name: "Newark Post Office")
PostOffice.create(name: "Livingston Post Office")
PostOffice.create(name: "Rhode Island Post Office")
PostOffice.create(name: "Island Post Office")



Recipient.create(name: "Stuart", available: true)
Recipient.create(name: "Jorge")
Recipient.create(name: "Frankie")
Recipient.create(name: "Sonnie", available: true)
Recipient.create(name: "Grinch")
Recipient.create(name: "Sandra")
Recipient.create(name: "Kurt")
Recipient.create(name: "Steven")
Recipient.create(name: "Carlos")
Recipient.create(name: "Henrietta")



DeliveryPerson.create(name: "Vincent", post_office_id: 2)
DeliveryPerson.create(name: "Amy", post_office_id: 4)
DeliveryPerson.create(name: "Luis", post_office_id: 1)
DeliveryPerson.create(name: "Jane", post_office_id: 3)
DeliveryPerson.create(name: "Scott", post_office_id: 5)


# # rake db:seed
