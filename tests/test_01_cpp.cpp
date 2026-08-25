#include <cassert>
#include <iostream>
#include <string>

#include "sensor_nivel.hpp"

int main() {
    const SensorNivel sensor{"LT-101", 42.5};

    assert(sensor.tag == "LT-101");
    assert(sensor.valor == 42.5);
    assert(sensor.resumo() == "LT-101: 42.5");

    std::cout << "OK etapa 01 C++: objeto construído e resumo confirmado\n";
    return 0;
}
