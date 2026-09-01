class SensorNivel:
    def __init__(self, tag: str, valor: float):
        self.tag = tag
        self.valor = valor

    def resumo(self) -> str:
        return f"{self.tag}: {self.valor:g}"
