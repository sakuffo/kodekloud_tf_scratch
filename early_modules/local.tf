resource "local_file" "pet" {
    filename = "./files/pets.txt"
    content = "We love pets! ${random_pet.my-pet.id}"
    file_permission = "0700"
}

resource "random_pet" "my-pet" {
    prefix = "Mrs"
    separator = "."
    length = 1
}