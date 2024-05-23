terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.50.0"
      }
    }
}

resource "aws_s3_object" "new_institution_bucket" {
    count =  contains(var.products, "tomaetest") ? 1 : 0
    bucket = "capsule.private"
    key    = "Products/TomaETest/${var.env}/Configurations/${var.customer_name}/"
}

resource "null_resource" "tomaetest_settings_json" {
    count =  contains(var.products, "tomaetest") ? 1 : 0
    # get demo setting json file from s3 and modify it and upload it to new institution bucket
    provisioner "local-exec" {
        interpreter = ["bash", "-c"]
        command = <<EOT
            #!/bin/bash
            set -e

            # cehck if the file already exists on aws s3
            aws s3 ls s3://capsule.private/Products/TomaETest/Tst/Configurations/${var.customer_name}/Settings.json || { echo "Settings.json file does not exist"; exit 1; }
            
            # Download JSON file from S3
            aws s3 cp s3://capsule.private/Products/TomaETest/Tst/Configurations/demo/Settings.json /tmp/Settings.json || { echo "Failed to download JSON file"; exit 1; }

            # Check if Settings.json file exists
            if [ ! -f /tmp/Settings.json ]; then
                echo "Settings.json file does not exist"
                exit 1
            fi

            # Modify JSON file
            jq '.TomaETest.apikey = "Missing" | .connections.tet.schema = "${var.customer_name}_tet" | .connections.tet.user = "${var.customer_name}_tet" | .connections.tet.password = "${var.db_password}"' /tmp/Settings.json > /tmp/ModifiedSettings.json || { echo "Failed to modify JSON file"; exit 1; }

            # Check if ModifiedSettings.json file was created
            if [ ! -f /tmp/ModifiedSettings.json ]; then
                echo "ModifiedSettings.json file was not created"
                exit 1
            fi

            # Upload modified JSON file to S3
            aws s3 cp /tmp/ModifiedSettings.json s3://capsule.private/Products/TomaETest/Tst/Configurations/${var.customer_name}/Settings.json || { echo "Failed to upload modified JSON file"; exit 1; }

            # Indicate script completion
            echo "Script completed successfully"
        EOT
    }
}