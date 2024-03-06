# Secrets replacer V1

Allow you to replace GitHub secrets into configuration yaml files during runtime.

#### Basic usage
```yaml
- name: Secrets replacement
  uses: stemdo/actions/secrets-replacer-v1@main
  with:
    secrets: ${{ toJSON(secrets) }}
    files: ${{ inputs.helm_values_file }}
    exclude_secret: "SECRET1 SECRET2 SECRET3"
```
#### Features

- For private keys stored in secrets, you must include "PRIVATE_KEY" as part of the name. 

- Exclude secret feature is not required.
