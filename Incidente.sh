#!/bin/bash

# Função para exibir o menu
mostrar_menu() {
    clear
    echo "=============================================="
    echo -e "\033[36m         GERENCIADOR DE DNS AILOS (macOS)     \033[0m"
    echo "=============================================="
    echo "1) Definir DNS Ailos (10.41.204.120 / 8.8.8.8)"
    echo "2) Definir DNS Ailos (10.204.0.99 / 8.8.8.8)"
    echo "3) Definir DNS Ailos (10.41.200.50 / 8.8.8.8)"
    echo "4) Restaurar DNS Padrão (Automático/DHCP)"
    echo "5) Limpar Cache DNS (Flush DNS) - sudo"
    echo "6) Sair"
    echo "----------------------------------------------"
}

# Identifica a interface de rede ativa (geralmente Wi-Fi ou Ethernet)
# No Mac, precisamos do nome do serviço de rede

[ -z "$INTERFACE" ];

while true; do
    mostrar_menu
    read -p "Escolha uma opção [1-6]: " opcao

    case $opcao in
        1)
            echo "Configurando DNS Ailos para: Wi-Fi..."
            networksetup -setdnsservers Wi-Fi '10.41.204.120'
            #sudo networksetup -setdnsservers "Wi-Fi" 10.41.204.120 8.8.8.8
            #sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
            echo -e "\033[32mDNS Ailos configurado com sucesso!\033[0m"
            read -p "Pressione Enter para continuar..."
            ;;
        2)
            echo "Configurando DNS Ailos para: Wi-Fi..."
            networksetup -setdnsservers Wi-Fi '10.204.0.99'
            #sudo networksetup -setdnsservers "Wi-Fi" 10.204.0.99 8.8.8.8
            #sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
            echo -e "\033[32mDNS Ailos configurado com sucesso!\033[0m"
            read -p "Pressione Enter para continuar..."
            ;;
        3)
            echo "Configurando DNS Ailos para: Wi-Fi..."
            networksetup -setdnsservers Wi-Fi '10.41.200.50'
            #sudo networksetup -setdnsservers "Wi-Fi" 10.41.200.50 8.8.8.8
            #sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
            echo -e "\033[32mDNS Ailos configurado com sucesso!\033[0m"
            read -p "Pressione Enter para continuar..."
            ;;            
        4)
            echo "Restaurando DNS para modo automático..."
            networksetup -setdnsservers Wi-Fi 'Empty'
            #sudo networksetup -setdnsservers "Wi-Fi" Empty
            #sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
            echo -e "\033[32mDNS restaurado para DHCP!\033[0m"
            read -p "Pressione Enter para continuar..."
            ;;
        5)
            echo "Limpando cache DNS..."
            sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
            echo -e "\033[32mCache limpo!\033[0m"
            read -p "Pressione Enter para continuar..."
            ;;
        6)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo -e "\033[31mOpção inválida!\033[0m"
            sleep 1
            ;;
    esac
done
