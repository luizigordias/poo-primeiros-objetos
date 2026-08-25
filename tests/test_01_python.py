import unittest

from sensor_nivel import SensorNivel


class TestPrimeiroObjeto(unittest.TestCase):
    def test_constroi_sensor_e_produz_resumo(self) -> None:
        sensor = SensorNivel("LT-101", 42.5)

        self.assertEqual(sensor.tag, "LT-101")
        self.assertEqual(sensor.valor, 42.5)
        self.assertEqual(sensor.resumo(), "LT-101: 42.5")


if __name__ == "__main__":
    unittest.main()
