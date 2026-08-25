#include "sensor_nivel.hpp"

#include <sstream>

namespace {
std::string formatarValor(double valor) {
    std::ostringstream saida;
    saida << valor;
    return saida.str();
}
}  // namespace

SensorNivel::SensorNivel(std::string tagInicial, double valorInicial)
    : tag("TODO"), valor(0.0) {
    // TODO etapa 01: inicialize os atributos com os parâmetros recebidos.
    (void)tagInicial;
    (void)valorInicial;
}

std::string SensorNivel::resumo() const {
    // TODO etapa 01: devolva, por exemplo, "LT-101: 42.5%".
    // Use formatarValor(valor) para converter o número sem zeros extras.
    (void)formatarValor;
    return "TODO C++";
}
