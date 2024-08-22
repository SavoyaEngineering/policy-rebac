# policy-rebac

A policy that exposes the Aserto Directory built-ins as OPA rules.

## Directory structure

`src` contains all the policy files.

`src/.manifest` contains the policy roots - in this case, `rebac`. If you change the name of the `package` definitions in the `.rego` files, make sure that the first component of the package name is reflected in this list.

`src/policies` contains the policy modules:
* rebac.check.rego - calls the `ds.check_relation` built-in, with the calling user as the subject, `input.resource.relation` as the relation name, `input.resource.object_type` as the object type, and `input.resource.object_key` as the key. This will be updated to use the new `ds.check` built-in when it is available. 
* rebac.check_permission.rego - calls the `ds.check_permission` built-in, with the calling user as the subject, `input.resource.permission` as the permission name, `input.resource.object_type` as the object type, and `input.resource.object_key` as the key.
* rebac.check_relation.rego - calls the `ds.check_relation` built-in, with the calling user as the subject, `input.resource.relation` as the relation name, `input.resource.object_type` as the object type, and `input.resource.object_key` as the key.

## Releasing a new version

`git tag {version} && git push --tags` will invoke the actions to create a new release (a policy bundle that can be delivered to the Aserto authorizer)

e.g. `git tag v0.0.1 && git push --tags` will create a new release with v0.0.1.
