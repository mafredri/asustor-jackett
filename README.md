# asustor-jackett
![Jackett](./source/CONTROL/icon.png)

[Jackett](https://github.com/Jackett/Jackett) for Asustor ADM.

From the Jackett [README](https://github.com/Jackett/Jackett/blob/master/README.md):

> Jackett works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

## Notice

Jackett crashes occasionally (possibly due to the Mono version running on ASUSTOR). For this reason I have created a shell script (`jackett-daemon`) which takes care of launching Jackett. If Jackett crashes, the script will relaunch Jackett automatically. For this reason there might occasionally be a few seconds downtime while Jackett is relaunching.
