resource "aws_iam_role" "aws_integration" {
  name               = "${var.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_policy.json}"
}

data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals = {
      type        = "AWS"
      identifiers = ["arn:aws:iam::217452466226:root"]
    }

    condition = {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["Mackerel-AWS-Integration"]
    }
  }
}

resource "aws_iam_role_policy" "aws_integration" {
  name   = "MackerelAWSIntegrationAccess"
  role   = "${aws_iam_role.aws_integration.name}"
  policy = "${data.aws_iam_policy_document.inline_policy.json}"
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    effect    = "Allow"
    actions   = ["elasticache:ListTagsForResource"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "ec2_readonly_access" {
  role       = "${aws_iam_role.aws_integration.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "elasticache_readonly_access" {
  role       = "${aws_iam_role.aws_integration.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonElastiCacheReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "rds_readonly_access" {
  role       = "${aws_iam_role.aws_integration.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "redshift_readonly_access" {
  role       = "${aws_iam_role.aws_integration.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftReadOnlyAccess"
}
