#include "sensor_nivel.hpp"

#include <sstream>

namespace {
std::string formatarValor(double valor) {
    std::ostringstream saida;
    saida << valor;
    return saida.str();
}
}  // namespace

SensorNivel::SensorNivel(
    std::string tagInicial,
    double valorInicial,
    std::string unidadeInicial
)
    : tag(tagInicial),
      valor(valorInicial),
      unidade(unidadeInicial) {
}

std::string SensorNivel::resumo() const {
    // TODO: sem unidade, devolver "LT-101: 42.5".
    // TODO: com unidade, devolver "LT-101: 42.5 %"
    if (unidade.empty()) {
        return tag + ": " + formatarValor(valor);
    }else {
        return tag + ": " + formatarValor(valor) + " " + unidade;
    }
}
