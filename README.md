tf_mackerel
================================================================================

A Terraform module for [Mackerel AWS Integration](https://mackerel.io/docs/entry/integrations/aws).


Usage
--------------------------------------------------------------------------------

```js
module "mackerel" {
  source    = "github.com/Tomohiro/tf_mackerel"
  role_name = "..."
}
```


Module Input Variables
--------------------------------------------------------------------------------

- `role_name` - Role name of a Mackerel AWS Integration


Outpus
--------------------------------------------------------------------------------

- `role_arn` - The Amazon Resource Name (ARN) specifying the mackerel role.


LICENSE
--------------------------------------------------------------------------------

&copy; 2017 Tomohiro TAIRA.

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
