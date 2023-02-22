import logging
from pathlib import Path
import warnings

from airflow.models.dagbag import DagBag


def test_dags_validation(caplog):
    """
    Validates that all DAGs assembles properly and doesn't have problems

    """
   # https://stackoverflow.com/questions/73871485/how-to-remove-pytest-no-header-no-summary-q-parameters-in-pycharm?noredirect=1&lq=1
    dags_path = (Path(__file__).parent.parent.parent/'dags').as_posix()
    with warnings.catch_warnings(record=True) as records:
        dag_bag = DagBag(dags_path)
    logging.info(f"dags num: {len(dag_bag.dags)}")
    assert len(dag_bag.import_errors) == 0
    warns = [rec for rec in caplog.records if rec.levelno == logging.WARNING]
    assert len(warns) == 0
    for warn_rec in records:
        warnings.warn(warn_rec.message, warn_rec.category)
    assert len(records) == 0
