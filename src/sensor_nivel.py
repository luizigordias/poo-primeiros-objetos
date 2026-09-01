class SensorNivel:
    def __init__(self, tag: str, valor: float, unidade: str = ""):
        self.tag = tag
        self.valor = valor
        self.unidade = unidade

    def resumo(self) -> str:
        # TODO: sem unidade, devolver "LT-101: 42.5".
        # TODO: com unidade, devolver "LT-101: 42.5 %".
        if self.unidade:
            return f"{self.tag}: {self.valor} {self.unidade}"
        else:
            return f"{self.tag}: {self.valor}"
        