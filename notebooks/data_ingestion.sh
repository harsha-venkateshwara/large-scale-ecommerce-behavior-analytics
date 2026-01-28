set -e

LOCAL_FILE="/data/ecommerce_cleaned.csv"
HDFS_DIR="/data/ecommerce"

echo "Starting data ingestion..."
echo "------------------------------------------"

hdfs dfs -mkdir -p $HDFS_DIR

echo "Uploading $LOCAL_FILE → $HDFS_DIR"
hdfs dfs -put -f $LOCAL_FILE $HDFS_DIR/

echo "Verifying HDFS contents..."
hdfs dfs -ls $HDFS_DIR

echo "------------------------------------------"
echo "Data ingestion completed successfully!"
