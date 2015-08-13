provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
    depends_on = ["aws_instance.example"]
}

resource "aws_instance" "example" {
    ami = "ami-aa7ab6c2"
    instance_type = "t1.micro"
}

resource "aws_instance" "another" {
    ami = "ami-aa7ab6c2"
    instance_type = "t1.micro"
}