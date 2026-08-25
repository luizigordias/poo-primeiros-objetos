import unittest

from sensor_nivel import SensorNivel


class TestExtensaoUnidade(unittest.TestCase):
    def test_acrescenta_unidade_ao_resumo(self) -> None:
        nivel = SensorNivel("LT-101", 42.5, "%")
        pressao = SensorNivel("PT-201", 2.7, "bar")

        self.assertEqual(nivel.unidade, "%")
        self.assertEqual(pressao.unidade, "bar")
        self.assertEqual(nivel.resumo(), "LT-101: 42.5 %")
        self.assertEqual(pressao.resumo(), "PT-201: 2.7 bar")


if __name__ == "__main__":
    unittest.main()
