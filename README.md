tf_mackerel
================================================================================

A Terraform module for Mackerel AWS Integration.


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


LICENSE
--------------------------------------------------------------------------------

&copy; 2017 Tomohiro TAIRA.

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
