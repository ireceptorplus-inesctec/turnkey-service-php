# stop turnkey
scripts/stop_turnkey.sh 

# delete database folder contents
sudo rm -Rf .mongodb_data/*

sudo docker system prune -a --force

# start turnkey
scripts/start_turnkey.sh

scripts/load_metadata.sh ireceptor test_data/PRJNA330606_Wang_1_sample_metadata.csv

curl --data "{}" "http://localhost/airr/v1/repertoire"