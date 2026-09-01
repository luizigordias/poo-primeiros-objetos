from sensor_nivel import SensorNivel


def main() -> None:
    sensor = SensorNivel("LT-101", 42.5)
    print(sensor.resumo())
    sensor = SensorNivel("LT-101", 42.5, "%")
    print(sensor.resumo())


if __name__ == "__main__":
    main()
