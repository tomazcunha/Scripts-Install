#!/usr/bin/env bash

# autor: Tomaz Cunha
# contato: tomazmcn@gmail.com
# data-criacao: 21-06-2020 14:52
# data-atualizacao: 21-06-2020 14:52
# versão: 1.0
# licença: GPL3
# Testado em:
#     - Debian GNU/Linux 10 (buster)
#     - GNU bash, versão 5.0.3(1)-release (x86_64-pc-linux-gnu)
# descrição:
    # Spript para instalação do navegador Firefox Developer.
# referências:
    #

echo "... Guardando nome do usuário atual."
meu_usuario=$(echo $USER)

echo "... Criando o diretório onde será instalada o pacote."
sudo mkdir /opt/firefox_dev

echo "... Trocando de diretório."
cd /opt/firefox_dev || exit

echo "... Alterando a propriedade do diretório para que o atual usuário tenha total permissão."
sudo chown $meu_usuario:$meu_usuario -R /opt/firefox_dev

echo "... Baixando a ultima versão do 'firefox-devedition' em Português"
wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=pt-BR"

echo "... Descompactando o pacote."
tar -jxvf firefox-dev.tar.bz2

echo "... Criando o lançador (ícone para execução)."
echo -e '#!/usr/bin/env xdg-open\n[Desktop Entry]\nName=Firefox Developer\nGenericName=Firefox Developer Edition\nExec=/opt/firefox_dev/firefox/firefox\nTerminal=false\nIcon=/opt/firefox_dev/firefox/browser/chrome/icons/default/default128.png\nType=Application\nCategories=Application;Network;X-Developer;\nComment=Firefox Developer Edition Web Browser.' | sudo tee -a /usr/share/applications/firefox-Dev.desktop

echo "... Removendo arquivos desnecessários."
rm firefox-dev.tar.bz2

echo ""
echo "... OK. Deve ter dado tudo certo. Procure pelo ícone 'Firefox Developer' no seu gerenciador de janelas."
echo "... Contribua com o script enviando sugestões ou alterações."
