CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Werror -pedantic -Iinclude
PYTHON := python3
BUILD_DIR := build

.PHONY: all build run test evidencia clean

all: build

build: $(BUILD_DIR)/sensor

$(BUILD_DIR)/sensor: src/main.cpp src/sensor_nivel.cpp include/sensor_nivel.hpp
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) src/main.cpp src/sensor_nivel.cpp -o $@

run: build
	./$(BUILD_DIR)/sensor
	PYTHONPATH=src $(PYTHON) src/main.py

test: build
	@if [ -z "$(ETAPA)" ]; then \
		echo "Informe a etapa: make test ETAPA=01 ou ETAPA=02"; \
		exit 2; \
	fi
	@set -e; \
	case "$(ETAPA)" in \
		01) etapas="01" ;; \
		02) etapas="01 02" ;; \
		*) echo "Etapa desconhecida: $(ETAPA)"; exit 2 ;; \
	esac; \
	for numero in $$etapas; do \
		$(CXX) $(CXXFLAGS) tests/test_$${numero}_cpp.cpp src/sensor_nivel.cpp -o $(BUILD_DIR)/test_$${numero}_cpp; \
		./$(BUILD_DIR)/test_$${numero}_cpp; \
		PYTHONPATH=src $(PYTHON) -m unittest tests/test_$${numero}_python.py; \
	done

evidencia:
	./scripts/gerar_evidencia.sh

clean:
	rm -rf $(BUILD_DIR)
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
