function Tarifa

cd(cd)
% cd('D:\MEOCloud\PPEC_2013_2014\Medidas eficiencia energetica\Simulador tarifa')
% cd('C:\Users\hpomb_000\MEOCloud\PPEC_2013_2014\Medidas eficiencia energetica\Simulador tarifa');
load('tariff_data')

kWh=kWh_HP;
kVA=3.45;

Final_cost_EDP_CASA=cost_EDP_CASA(kWh);
Final_cost_EDP_CASA_sem_DD=cost_EDP_CASA_sem_DD(kWh);
Final_cost_ENAT_BASE=cost_ENAT_BASE(kWh);
Final_cost_ENAT_PENTA=cost_ENAT_PENTA(kWh);
Final_cost_ENAT_TRINCA=cost_ENAT_TRINCA(kWh);
Final_cost_ENDESA=cost_ENDESA(kWh);
Final_cost_GALP_BASE=cost_GALP_BASE(kWh);
Final_cost_GALP_BASE_DESCONTO=cost_GALP_BASE_DESCONTO(kWh);
Final_cost_GALP_ONLINE=cost_GALP_ONLINE(kWh);
Final_cost_GN_FENOSA_CUSTOM=cost_GN_FENOSA_CUSTOM(kWh);
Final_cost_IBERDROLA=cost_IBERDROLA_BASICO(kWh);
Final_cost_YLCE=cost_YLCE(kWh);

Final_cost=[Final_cost_EDP_CASA;Final_cost_EDP_CASA_sem_DD;Final_cost_ENAT_BASE;Final_cost_ENAT_PENTA;Final_cost_ENAT_TRINCA;Final_cost_ENDESA;Final_cost_GALP_BASE;Final_cost_GALP_BASE;Final_cost_GALP_BASE_DESCONTO;Final_cost_GALP_ONLINE;Final_cost_GN_FENOSA_CUSTOM;Final_cost_IBERDROLA;Final_cost_YLCE];
Final_cost=sortrows(Final_cost,2);

a=0;
for i=1:size(Final_cost,1)
    if cell2mat(Final_cost(i,2))>0
        if a==0
            message=sprintf('A tarifa mais adequada ao seu perfil de consumo é %s, correspondendo a um custo mensal de %0.1f €',char(Final_cost(i,1)),cell2mat(Final_cost(i,2)))
            a=a+1;
        end
    end
end

end