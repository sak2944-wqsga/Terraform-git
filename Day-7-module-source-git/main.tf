module "git-source" {
    source = "github.com/sak2944-wqsga/Terraform-git/Day-7-module-source-local"
    ami-id = "ami-08a6efd148b1f7504"
    instance-type = "t2.micro"
  
}