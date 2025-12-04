# HashiTalks Packer AWS Demo 🎄

Este repositorio contiene una demo real de cómo usar **Packer** para crear una
**Golden AMI en AWS de forma repetible, automatizada y sin drama**.

## 🚀 ¿Qué hace esta demo?

- Construye una AMI basada en **Ubuntu 22.04**
- Instala **nginx**
- Publica una página navideña 🎄
- La imagen queda lista para usar como base en EC2, ASG, ECS, etc.

## ⚙️ Ejecutar localmente

### 1. Formatear
```bash
packer fmt .
packer validate packer/main.pkr.hcl
packer build packer/main.pkr.hcl

aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type t2.micro \
  --security-group-id rules-sg-demo-http \
  --associate-public-ip-address \
  --profile $PROFILE \
  --region us-west-2

aws ec2 terminate-instances --instance-ids $INSTANCE_ID
```