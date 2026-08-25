#include <cassert>
#include <iostream>

#include "sensor_nivel.hpp"

int main() {
    const SensorNivel nivel{"LT-101", 42.5, "%"};
    const SensorNivel pressao{"PT-201", 2.7, "bar"};

    assert(nivel.unidade == "%");
    assert(pressao.unidade == "bar");
    assert(nivel.resumo() == "LT-101: 42.5 %");
    assert(pressao.resumo() == "PT-201: 2.7 bar");

    std::cout << "OK etapa 02 C++: extensão de unidade confirmada\n";
    return 0;
}
