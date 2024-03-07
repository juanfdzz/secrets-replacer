# Secrets replacer V1

Allow you to replace GitHub secrets into configuration yaml files during runtime.

It replaces secrets that are between __underscores__ `__NAME_OF_THE_SECRET__`.

#### Basic usage
```yaml
- name: Secrets replacement
  uses: juanfdzz/secrets-replacer/actions/secrets-replacer-v1@main
  with:
    secrets: ${{ toJSON(secrets) }}
    files: values.yaml
    exclude_secret: "SECRET1 SECRET2 SECRET3"
```
#### Features

- For private keys stored in secrets, you must include "PRIVATE_KEY" as part of the name. 

- Exclude secret feature is not required.
