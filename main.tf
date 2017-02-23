resource "aws_iam_role" "mackerel" {
  name               = "${var.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.mackerel_assume_policy.json}"
}

data "aws_iam_policy_document" "mackerel_assume_policy" {
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

resource "aws_iam_role_policy" "mackerel" {
  name   = "MackerelAWSAccess"
  role   = "${aws_iam_role.mackerel.name}"
  policy = "${data.aws_iam_policy_document.mackerel_inline_policy.json}"
}

data "aws_iam_policy_document" "mackerel_inline_policy" {
  statement {
    effect    = "Allow"
    actions   = ["elasticache:ListTagsForResource"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "mackerel_ec2" {
  role       = "${aws_iam_role.mackerel.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "mackerel_elasticache" {
  role       = "${aws_iam_role.mackerel.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonElastiCacheReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "mackerel_rds" {
  role       = "${aws_iam_role.mackerel.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "mackerel_redshift" {
  role       = "${aws_iam_role.mackerel.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftReadOnlyAccess"
}
