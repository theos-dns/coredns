```corefile
. {
    blacklist_watcher {
        # DNS servers to query for detection
        dns-to-check 78.157.42.101:53 10.202.10.202:53

        # Optional: DNS query timeout in seconds (default: 5)
        dns-timeout 10

        # Detection patterns
        sanction-search develop.403 electro
        ban-search 10.10.34.35

        # PostgreSQL connection
        pg-host 127.0.0.1
        pg-port 5432
        pg-user postgres
        pg-password yourpassword
        pg-db blacklist_db
        pg-schema public

        # Optional: Custom tags
        additional-tags server=dns1 location=us-west

        # Optional: Buffer configuration
        sanction-buffer-size 10
        ban-buffer-size 10

        # Optional: Logging
        log-level info
    }
}
```