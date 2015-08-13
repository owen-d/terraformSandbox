# templates -----------------------------------------------
resource "template_file" "subnets" {
  filename = "${path.module}/subnets.tpl"
  count = "${var.count}"

  vars {
    # Ok, this one is a little tricky (and hopefully the terraform syntax will evolve to make this more easily done/understandable)
    # We create a list & use the modulo function between it's length & our current index to keep iterating over possible subnets to use.
    # By using the modulo function, this would work with any number of count.
    subnet-id = "${element(split(",", var.elb-subnets), count.index % length(split(",", var.elb-subnets)))}"
  }
}