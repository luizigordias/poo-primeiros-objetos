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
    : tag(tagInicial), valor(valorInicial){
    // TODO etapa 01: inicialize os atributos com os parâmetros recebidos.
}

std::string SensorNivel::resumo() const {
    // TODO etapa 01: devolva, por exemplo, "LT-101: 42.5".
    // Use formatarValor(valor) para converter o número sem zeros extras. 
    return tag + ": " + formatarValor(valor);
}
