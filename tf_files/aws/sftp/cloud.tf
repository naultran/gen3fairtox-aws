terraform {
  backend "s3" {
    encrypt = "true"
  }
}

locals {
  fips_endpoints =  {
    acm = "${var.fips ? "https://acm-fips.us-east-1.amazonaws.com" : ""}"
    acmpca = "${var.fips ? "https://acm-pca-fips.us-east-1.amazonaws.com" : ""}"
    apigateway = "${var.fips ? "https://apigateway-fips.us-east-1.amazonaws.com" : ""}"
    appstream = "${var.fips ? "https://appstream2-fips.us-east-1.amazonaws.com" : ""}"
    cloudformation = "${var.fips ? "https://cloudformation-fips.us-east-1.amazonaws.com" : ""}"
    cloudfront = "${var.fips ? "https://cloudfront-fips.amazonaws.com" : ""}"
    cloudtrail = "${var.fips ? "https://cloudtrail-fips.us-east-1.amazonaws.com" : ""}"
    codebuild = "${var.fips ? "https://codebuild-fips.us-east-1.amazonaws.com" : ""}"
    codecommit = "${var.fips ? "https://codecommit-fips.us-east-1.amazonaws.com" : ""}"
    codedeploy = "${var.fips ? "https://codedeploy-fips.us-east-1.amazonaws.com" : ""}"
    cognitoidentity = "${var.fips ? "https://cognito-identity-fips.us-east-1.amazonaws.com" : ""}"
    cognitoidp = "${var.fips ? "https://cognito-idp-fips.us-east-1.amazonaws.com" : ""}"
    configservice = "${var.fips ? "https://config-fips.us-east-1.amazonaws.com" : ""}"
    datasync = "${var.fips ? "https://datasync-fips.us-east-1.amazonaws.com" : ""}"
    directconnect = "${var.fips ? "https://directconnect-fips.us-east-1.amazonaws.com" : ""}"
    dms = "${var.fips ? "https://dms-fips.us-east-1.amazonaws.com" : ""}"
    ds = "${var.fips ? "https://ds-fips.us-east-1.amazonaws.com" : ""}"
    dynamodb = "${var.fips ? "https://dynamodb-fips.us-east-1.amazonaws.com" : ""}"
    ec2 = "${var.fips ? "https://ec2-fips.us-east-1.amazonaws.com" : ""}"
    ecr = "${var.fips ? "https://ecr-fips.us-east-1.amazonaws.com" : ""}"
    elasticache = "${var.fips ? "https://elasticache-fips.us-east-1.amazonaws.com" : ""}"
    elasticbeanstalk = "${var.fips ? "https://elasticbeanstalk-fips.us-east-1.amazonaws.com" : ""}"
    elb = "${var.fips ? "https://elasticloadbalancing-fips.us-east-1.amazonaws.com" : ""}"
    emr = "${var.fips ? "https://elasticmapreduce-fips.us-east-1.amazonaws.com" : ""}"
    es = "${var.fips ? "https://es-fips.us-east-1.amazonaws.com" : ""}"
    fms = "${var.fips ? "https://fms-fips.us-east-1.amazonaws.com" : ""}"
    glacier = "${var.fips ? "https://glacier-fips.us-east-1.amazonaws.com" : ""}"
    guardduty = "${var.fips ? "https://guardduty-fips.us-east-1.amazonaws.com" : ""}"
    inspector = "${var.fips ? "https://inspector-fips.us-east-1.amazonaws.com" : ""}"
    kinesis = "${var.fips ? "https://kinesis-fips.us-east-1.amazonaws.com" : ""}"
    kms = "${var.fips ? "https://kms-fips.us-east-1.amazonaws.com" : ""}"
    lambda = "${var.fips ? "https://lambda-fips.us-east-1.amazonaws.com" : ""}"
    mq = "${var.fips ? "https://mq-fips.us-east-1.amazonaws.com" : ""}"
    pinpoint = "${var.fips ? "https://pinpoint-fips.us-east-1.amazonaws.com" : ""}"
    quicksight = "${var.fips ? "https://fips-us-east-1.quicksight.aws.amazon.com" : ""}"
    rds = "${var.fips ? "https://rds-fips.us-east-1.amazonaws.com" : ""}"
    redshift = "${var.fips ? "https://redshift-fips.us-east-1.amazonaws.com" : ""}"
    resourcegroups = "${var.fips ? "https://resource-groups-fips.us-east-1.amazonaws.com" : ""}"
    route53 = "${var.fips ? "https://route53-fips.amazonaws.com" : ""}"
    s3 = "${var.fips ? "https://s3-fips.us-east-1.amazonaws.com" : ""}"
    sagemaker = "${var.fips ? "https://api-fips.sagemaker.us-east-1.amazonaws.com" : ""}"
    secretsmanager = "${var.fips ? "https://secretsmanager-fips.us-east-1.amazonaws.com" : ""}"
    servicecatalog = "${var.fips ? "https://servicecatalog-fips.us-east-1.amazonaws.com" : ""}"
    ses = "${var.fips ? "https://email-fips.us-east-1.amazonaws.com" : ""}"
    shield = "${var.fips ? "https://shield-fips.us-east-1.amazonaws.com" : ""}"
    sns = "${var.fips ? "https://sns-fips.us-east-1.amazonaws.com" : ""}"
    sqs = "${var.fips ? "https://sqs-fips.us-east-1.amazonaws.com" : ""}"
    ssm = "${var.fips ? "https://ssm-fips.us-east-1.amazonaws.com" : ""}"
    sts = "${var.fips ? "https://sts-fips.us-east-1.amazonaws.com" : ""}"
    swf = "${var.fips ? "https://swf-fips.us-east-1.amazonaws.com" : ""}"
    waf = "${var.fips ? "https://waf-fips.amazonaws.com" : ""}"
    wafregional = "${var.fips ? "https://waf-regional-fips.us-east-1.amazonaws.com" : ""}"
    wafv2 = "${var.fips ? "https://wafv2-fips.us-east-1.amazonaws.com" : ""}"
  }
}

provider "aws" {
  # AWS provider 4 introduces breaking changes for s3
  version = "~> 3.74.1"
  endpoints  {
    acm = "${local.fips_endpoints["acm"]}"
    acmpca = "${local.fips_endpoints["acmpca"]}"
    apigateway = "${local.fips_endpoints["apigateway"]}"
    appstream = "${local.fips_endpoints["appstream"]}"
    cloudformation = "${local.fips_endpoints["cloudformation"]}"
    cloudfront = "${local.fips_endpoints["cloudfront"]}"
    cloudtrail = "${local.fips_endpoints["cloudtrail"]}"
    codebuild = "${local.fips_endpoints["codebuild"]}"
    codecommit = "${local.fips_endpoints["codecommit"]}"
    codedeploy = "${local.fips_endpoints["codedeploy"]}"
    cognitoidentity = "${local.fips_endpoints["cognitoidentity"]}"
    cognitoidp = "${local.fips_endpoints["cognitoidp"]}"
    configservice = "${local.fips_endpoints["configservice"]}"
    datasync = "${local.fips_endpoints["datasync"]}"
    directconnect = "${local.fips_endpoints["directconnect"]}"
    dms = "${local.fips_endpoints["dms"]}"
    ds = "${local.fips_endpoints["ds"]}"
    dynamodb = "${local.fips_endpoints["dynamodb"]}"
    ec2 = "${local.fips_endpoints["ec2"]}"
    ecr = "${local.fips_endpoints["ecr"]}"
    elasticache = "${local.fips_endpoints["elasticache"]}"
    elasticbeanstalk = "${local.fips_endpoints["elasticbeanstalk"]}"
    elb = "${local.fips_endpoints["elb"]}"
    emr = "${local.fips_endpoints["emr"]}"
    es = "${local.fips_endpoints["es"]}"
    fms = "${local.fips_endpoints["fms"]}"
    glacier = "${local.fips_endpoints["glacier"]}"
    guardduty = "${local.fips_endpoints["guardduty"]}"
    inspector = "${local.fips_endpoints["inspector"]}"
    kinesis = "${local.fips_endpoints["kinesis"]}"
    kms = "${local.fips_endpoints["kms"]}"
    lambda = "${local.fips_endpoints["lambda"]}"
    mq = "${local.fips_endpoints["mq"]}"
    pinpoint = "${local.fips_endpoints["pinpoint"]}"
    quicksight = "${local.fips_endpoints["quicksight"]}"
    rds = "${local.fips_endpoints["rds"]}"
    redshift = "${local.fips_endpoints["redshift"]}"
    resourcegroups = "${local.fips_endpoints["resourcegroups"]}"
    route53 = "${local.fips_endpoints["route53"]}"
    s3 = "${local.fips_endpoints["s3"]}"
    sagemaker = "${local.fips_endpoints["sagemaker"]}"
    secretsmanager = "${local.fips_endpoints["secretsmanager"]}"
    servicecatalog = "${local.fips_endpoints["servicecatalog"]}"
    ses = "${local.fips_endpoints["ses"]}"
    shield = "${local.fips_endpoints["shield"]}"
    sns = "${local.fips_endpoints["sns"]}"
    sqs = "${local.fips_endpoints["sqs"]}"
    ssm = "${local.fips_endpoints["ssm"]}"
    sts = "${local.fips_endpoints["sts"]}"
    swf = "${local.fips_endpoints["swf"]}"
    waf = "${local.fips_endpoints["waf"]}"
    wafregional = "${local.fips_endpoints["wafregional"]}"
    wafv2 = "${local.fips_endpoints["wafv2"]}"
  }
}



resource "aws_s3_bucket" "sftp_bucket" {
  bucket = var.s3_bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}


resource "aws_iam_role" "sftp_role" {
  name = "sftp_role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "sftp" {
  name = "sftp_policy"
  role = aws_iam_role.sftp_role.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Put*",
                "s3:List*",
                "s3:Get*"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.sftp_bucket.bucket}",
                "arn:aws:s3:::${aws_s3_bucket.sftp_bucket.bucket}/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = aws_iam_role.sftp_role.arn
}

resource "aws_transfer_user" "sftp_user" {
  server_id = aws_transfer_server.sftp_server.id
  user_name = "sftp_user"
  role      = aws_iam_role.sftp_role.arn
  home_directory = "/${aws_s3_bucket.sftp_bucket.bucket}/sftp_user"
}

resource "aws_transfer_ssh_key" "ssh_keys" {
  server_id = aws_transfer_server.sftp_server.id
  user_name = aws_transfer_user.sftp_user.user_name
  body      = var.ssh_key
}
