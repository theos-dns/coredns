```corefile

.:53 {

    blacklist_resolver {
        pg-host 127.0.0.1
        pg-port 5433
        pg-user postgres
        pg-password postgres
        pg-db blacklist_db
        pg-schema public

        pg-table-domains domains
        pg-table-servers servers_pro

        pg-ssl false
        pg-ssl-mode require
        pg-ssl-root-cert /path/to/cert.pem

        redis-host 127.0.0.1

        ttl 10m

        ban-listen-tags type=BAN plan=!plus category=!porn||!messenger
        sanction-listen-tags type=SANCTION plan=!plus
        whitelist-listen-tags type=WHITELIST

        log-level debug
    }




    blacklist_watcher {
        dns-to-check 78.157.42.101:53 8.8.8.8:53

        dns-timeout 2

        sanction-search develop.403 electro
        ban-search 10.10.34.35

        pg-host 127.0.0.1
        pg-port 5433
        pg-user postgres
        pg-password postgres
        pg-db blacklist_db
        pg-schema public

        additional-tags server=dns1 location=us-west

        sanction-buffer-size 2
        ban-buffer-size 2

        log-level debug
    }

    forward . 8.8.8.8 {
        expire 0
    }

    log
    errors
}
```