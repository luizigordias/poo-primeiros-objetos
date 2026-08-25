#include <iostream>

#include "sensor_nivel.hpp"

int main() {
    const SensorNivel sensor{"LT-101", 42.5};
    std::cout << sensor.resumo() << '\n';
    return 0;
}
