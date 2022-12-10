clear
dados_lc = readmatrix('PassaAltasLC.txt');
freq_lc = dados_lc(:,1);
modulo_lc = dados_lc(:,2);
fase_lc = dados_lc(:,3);

dados_rc = readmatrix('PassaAltasRCAtivo.txt');
freq_rc = dados_rc(:,1);
modulo_rc = dados_rc(:,2);
fase_rc = dados_rc(:,3);
figure(1)
semilogx(freq_lc,modulo_lc,LineWidth=2.2)
hold on
semilogx(freq_rc,modulo_rc,"--",LineWidth=2.5)
legend('Circuito LC', 'Circuito RC Ativo')
hold off
xlabel('Frequência (Hz)')
ylabel('|T(s)| (dB)')
figure(2)
semilogx(freq_lc,modulo_lc,LineWidth=2.2)
hold on
semilogx(freq_rc,modulo_rc,"--",LineWidth=2.5)
xlim([27000 1e6])
legend('Circuito LC', 'Circuito RC Ativo')
hold off
xlabel('Frequência (Hz)')
ylabel('|T(s)| (dB)')
figure(3)
semilogx(freq_lc,fase_lc,LineWidth=2.2)
hold on
semilogx(freq_rc,fase_rc,"--",LineWidth=2.5)
legend('Circuito LC', 'Circuito RC Ativo')
hold off
xlabel('Frequência (Hz)')
ylabel('Fase (graus)')
figure(4)
semilogx(freq_lc,modulo_lc,LineWidth=2.2)
hold on
semilogx(freq_rc,modulo_rc,"--",LineWidth=2.5)
xlim([1e2 27000/4])
legend('Circuito LC', 'Circuito RC Ativo')
hold off
xlabel('Frequência (Hz)')
ylabel('|T(s)| (dB)')
