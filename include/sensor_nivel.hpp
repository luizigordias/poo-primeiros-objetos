#ifndef SENSOR_NIVEL_HPP
#define SENSOR_NIVEL_HPP

#include <string>

class SensorNivel {
public:
    std::string tag;
    double valor;

    SensorNivel(std::string tagInicial, double valorInicial);
    std::string resumo() const;
};

#endif
