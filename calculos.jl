impedancia_k(k,epsilon,n) = 2*epsilon^(1/n)*sin((2k-1)/(2n)*pi)
epsilon_bt(Amax) = sqrt(10^(Amax/10) - 1)
buttord(ωp,ωs,Amax,Amin) = log10((10^(Amin/10) -1) /(10^(Amax/10)-1))/log10((ωs/ωp)^2)


fp = 27e3
fs = fp/4
Amax = 0.2
Amin = 55
n_real = buttord(2*pi*fs,2*pi*fp,Amax,Amin)
n::Int64 = ceil(n_real)
ϵ = epsilon_bt(0.2)
Zk = ones(n)

println("Valor de n: ",n , " Valor de n_real: ",n_real)
println("valor de ϵ: ",ϵ)
for i = 1:n
    Zk[i] = impedancia_k(i,ϵ,n)
    if i % 2 != 0
        print("Capacitor",i,": ")
    else
        print("Indutor",i,": ")
    end
    println(Zk[i])
end
println()
a = fp*(2pi)
Zk_novo = Zk.^(-1)
Zk_novo = Zk_novo./a

R = 10000
Rl = 5000

for i = 1:n
    if i % 2 != 0
        Zk_novo[i] = 750*Zk_novo[i]
        C = Zk_novo[i]/(R*Rl)
        print("Indutor",i,": ",Zk_novo[i])
        println()
        println("Capacitor do GIC",i," ",C)
    else
        Zk_novo[i] = Zk_novo[i]/750
        print("Capacitor",i,": ",Zk_novo[i])
        println()
    end
    
end