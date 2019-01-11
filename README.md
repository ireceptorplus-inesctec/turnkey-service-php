# iReceptor Service Turnkey (PHP)

A quick and easy way to build your own AIRR-seq repository. It contains:
- a database with scripts to load data into it
- a web application exposing that database through the [iReceptor API](https://github.com/sfu-ireceptor/api)

## Installation (10 min)
Get the code and launch the installation:
```
git clone https://github.com/sfu-ireceptor/turnkey-service-php.git
cd turnkey-service-php
scripts/install_turnkey.sh
```

#### Check it's working

Go to <http://localhost/v2/samples> in your browser (if necessary, replace "localhost" with your server URL).

This returns the list of samples in your database by querying the web application at `/v2/samples`, which is an entry point of the [iReceptor API](https://github.com/sfu-ireceptor/api). You can also use the command line:
```
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" "http://localhost/v2/samples"
```


An empty array is returned because the database is currently empty:
```
[]
```

## Loading data

#### General procedure
1. load the metadata associated with a study that has generated sequence data.
2. load the sequence annotations (from imgt, mixcr, etc).

#### Example: loading the test data

1. Load the metadata file [test_data/metadata_mixcr.csv](test_data/metadata_mixcr.csv):
```
scripts/load_metadata.sh test_data/metadata_mixcr.csv
```

To check it worked, go to <http://localhost/v2/samples> or execute:
```
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" "http://localhost/v2/samples"
```

2. Load the associated sequence annotations file [test_data/rearrangements_mixcr.txt](test_data/rearrangements_mixcr.txt):
```
scripts/load_rearrangements.sh mixcr test_data/rearrangements_mixcr.txt
```

To check it worked, go to <http://localhost/v2/sequences_summary> or execute:
```
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" "http://localhost/v2/sequences_summary"
```


## Customization

#### Moving the database folder
The database data is in the `data` folder. To move it somewhere else:

1. Stop the turnkey
```
scripts/stop_turnkey.sh
```

2. Move the data folder
```
mv data <another folder>
```

2. Create a symbolic link to that new data folder
```
ln -s <another folder>/data data
```

3. Start the turnkey
```
scripts/start_turnkey.sh
```

## Other documentation
- [How it works](doc/how_it_works.md)
- [Turnkey admin scripts](doc/admin_scripts.md)


## Reference
- <http://ireceptor.org>
- Contact us at <support@ireceptor.org>
