from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago

def data_transformation_func():
    # Import your Data_Transformation.py logic here
    print("Running Data_Transformation.py")

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 31),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'data_transformation_dag',
    default_args=default_args,
    description='DAG for running Data_Transformation.py',
    schedule_interval='@monthly',  # Run once every month
)

data_transformation_task = PythonOperator(
    task_id='data_transformation_task',
    python_callable=data_transformation_func,
    dag=dag,
)

if __name__ == "__main__":
    dag.cli()