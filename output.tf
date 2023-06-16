
output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "public_sg" {
  value = module.vpc.public_sg_id
}

output "private_sg" {
  value = module.vpc.private_sg_id
}