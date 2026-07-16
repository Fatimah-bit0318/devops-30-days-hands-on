# AWS VPC Architecture

```text
                    Internet
                        │
                Internet Gateway
                        │
          -------------------------
          │                       │
     Public Subnet          Private Subnet
          │                       │
       EC2 Instance          Database Server
```

Traffic Flow

Internet → IGW → Public Subnet → EC2

Private resources remain inaccessible directly from the internet.