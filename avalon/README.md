# Avalon 8

Playbooks and suplmentary files for Avalon 8

## Changing Streaming Service

After any change to the `STREAMING_HOST` /
`SETTINGS__STREAMING__HTTP_BASE` an update to the assets records need to be
made.

1. Log into the console `docker compose exec -it avalon /bin/bash`
2. Run the derivatives rake task `bundle exec rake avalon:derivative:set_streams`
