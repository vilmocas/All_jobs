function Cost_ENAT_TRINCA=cost_ENAT_TRINCA(~)

cd(cd)
% cd('D:\MEOCloud\PPEC_2013_2014\Medidas eficiencia energetica\Simulador tarifa')
% cd('C:\Users\hpomb_000\MEOCloud\PPEC_2013_2014\Medidas eficiencia energetica\Simulador tarifa');
load('tariff_data')

kWh=kWh_HP;
kVA=3.45;

kVA_i=find(ENAT_TRINCA(:,1)==kVA);

table_tariff=ENAT_TRINCA;

% CASA
js=0;
jb=0;
jt=0;
days_wint=0;
days_summ=0;
cost_ENAT_TRINCA_bi_diar_wint_vaz=0;
cost_ENAT_TRINCA_bi_diar_wint_forvaz=0;
cost_ENAT_TRINCA_bi_diar_summ_vaz=0;
cost_ENAT_TRINCA_bi_diar_summ_forvaz=0;

cost_ENAT_TRINCA_bi_sem_sem_wint_vaz=0;
cost_ENAT_TRINCA_bi_sem_sem_wint_forvaz=0;
cost_ENAT_TRINCA_bi_sem_sab_wint_vaz=0;
cost_ENAT_TRINCA_bi_sem_sab_wint_forvaz=0;
cost_ENAT_TRINCA_bi_sem_dom_wint_vaz=0;
cost_ENAT_TRINCA_bi_sem_dom_wint_forvaz=0;

cost_ENAT_TRINCA_bi_sem_sem_summ_vaz=0;
cost_ENAT_TRINCA_bi_sem_sem_summ_forvaz=0;
cost_ENAT_TRINCA_bi_sem_sab_summ_vaz=0;
cost_ENAT_TRINCA_bi_sem_sab_summ_forvaz=0;
cost_ENAT_TRINCA_bi_sem_dom_summ_vaz=0;
cost_ENAT_TRINCA_bi_sem_dom_summ_forvaz=0;

cost_ENAT_TRINCA_tri_diar_wint_vaz=0;
cost_ENAT_TRINCA_tri_diar_wint_che=0;
cost_ENAT_TRINCA_tri_diar_wint_pont=0;
cost_ENAT_TRINCA_tri_diar_summ_vaz=0;
cost_ENAT_TRINCA_tri_diar_summ_che=0;
cost_ENAT_TRINCA_tri_diar_summ_pont=0;

cost_ENAT_TRINCA_tri_sem_sem_wint_vaz=0;
cost_ENAT_TRINCA_tri_sem_sem_wint_che=0;
cost_ENAT_TRINCA_tri_sem_sem_wint_pont=0;
cost_ENAT_TRINCA_tri_sem_sab_wint_vaz=0;
cost_ENAT_TRINCA_tri_sem_sab_wint_che=0;
cost_ENAT_TRINCA_tri_sem_sab_wint_pont=0;
cost_ENAT_TRINCA_tri_sem_dom_wint_vaz=0;
cost_ENAT_TRINCA_tri_sem_dom_wint_che=0;
cost_ENAT_TRINCA_tri_sem_dom_wint_pont=0;

cost_ENAT_TRINCA_tri_sem_sem_summ_vaz=0;
cost_ENAT_TRINCA_tri_sem_sem_summ_che=0;
cost_ENAT_TRINCA_tri_sem_sem_summ_pont=0;
cost_ENAT_TRINCA_tri_sem_sab_summ_vaz=0;
cost_ENAT_TRINCA_tri_sem_sab_summ_che=0;
cost_ENAT_TRINCA_tri_sem_sab_summ_pont=0;
cost_ENAT_TRINCA_tri_sem_dom_summ_vaz=0;
cost_ENAT_TRINCA_tri_sem_dom_summ_che=0;
cost_ENAT_TRINCA_tri_sem_dom_summ_pont=0;

cost_ENAT_TRINCA_simples=0;
Cost_ENAT_TRINCA_bi_diar=0;
Cost_ENAT_TRINCA_bi_sem=0;
Cost_ENAT_TRINCA_tri_diar=0;
Cost_ENAT_TRINCA_tri_sem=0;

for trf_j=2:size(ENAT_TRINCA,2)
    
    % Simples
    if ENAT_TRINCA(1,trf_j)==1
        if js==0
            cost_ENAT_TRINCA_simples=(sum(sum(kWh(20:(size(kWh,1)-16),3:size(kWh,2))))*ENAT_TRINCA(kVA_i,trf_j+1)/(size(kWh,2)-2)+ENAT_TRINCA(kVA_i,trf_j))*30;
            js=1;
        end
        
    % Bi-hor�rio    
    elseif ENAT_TRINCA(1,trf_j)==2
        if jb==0
            %%% Ciclo di�rio %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    cd_ib=1;
                    cd_ie=6;
                    [x y]=ciclodiario_bi(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_bi_diar_wint_vaz =cost_ENAT_TRINCA_bi_diar_wint_vaz+x;                    
                    cost_ENAT_TRINCA_bi_diar_wint_forvaz=cost_ENAT_TRINCA_bi_diar_wint_forvaz+y;
                    days_wint=days_wint+1;
                % Ver�o
                else
                    cd_ib=7;
                    cd_ie=12;
                    [x y]=ciclodiario_bi(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_bi_diar_summ_vaz =cost_ENAT_TRINCA_bi_diar_summ_vaz+x;
                    cost_ENAT_TRINCA_bi_diar_summ_forvaz=cost_ENAT_TRINCA_bi_diar_summ_forvaz+y;      
                    days_summ=days_summ+1;
                end
            end
            Cost_ENAT_TRINCA_bi_diar_wint=((cost_ENAT_TRINCA_bi_diar_wint_vaz+cost_ENAT_TRINCA_bi_diar_wint_forvaz)/days_wint+ENAT_TRINCA(kVA_i,trf_j))*30;
            Cost_ENAT_TRINCA_bi_diar_summ=((cost_ENAT_TRINCA_bi_diar_summ_vaz+cost_ENAT_TRINCA_bi_diar_summ_forvaz)/days_summ+ENAT_TRINCA(kVA_i,trf_j))*30;
            Cost_ENAT_TRINCA_bi_diar=(Cost_ENAT_TRINCA_bi_diar_wint+Cost_ENAT_TRINCA_bi_diar_summ)/2;
            
            %%% ciclo semanal %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    cd_ib=1;
                    cd_ie=11;
                    [x1 y1 x2 y2 x3 y3]=ciclosemanal_bi(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_bi_sem_sem_wint_vaz=cost_ENAT_TRINCA_bi_sem_sem_wint_vaz+x1;
                    cost_ENAT_TRINCA_bi_sem_sem_wint_forvaz=cost_ENAT_TRINCA_bi_sem_sem_wint_forvaz+y1;
                    cost_ENAT_TRINCA_bi_sem_sab_wint_vaz=cost_ENAT_TRINCA_bi_sem_sab_wint_vaz+x2;
                    cost_ENAT_TRINCA_bi_sem_sab_wint_forvaz=cost_ENAT_TRINCA_bi_sem_sab_wint_forvaz+y2;
                    cost_ENAT_TRINCA_bi_sem_dom_wint_vaz=cost_ENAT_TRINCA_bi_sem_dom_wint_vaz+x3;
                    cost_ENAT_TRINCA_bi_sem_dom_wint_forvaz=cost_ENAT_TRINCA_bi_sem_dom_wint_forvaz+y3;
                % Ver�o    
                else
                    cd_ib=12;
                    cd_ie=20;
                    [x1 y1 x2 y2 x3 y3]=ciclosemanal_bi(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_bi_sem_sem_summ_vaz=cost_ENAT_TRINCA_bi_sem_sem_summ_vaz+x1;
                    cost_ENAT_TRINCA_bi_sem_sem_summ_forvaz=cost_ENAT_TRINCA_bi_sem_sem_summ_forvaz+y1;
                    cost_ENAT_TRINCA_bi_sem_sab_summ_vaz=cost_ENAT_TRINCA_bi_sem_sab_summ_vaz+x2;
                    cost_ENAT_TRINCA_bi_sem_sab_summ_forvaz=cost_ENAT_TRINCA_bi_sem_sab_summ_forvaz+y2;
                    cost_ENAT_TRINCA_bi_sem_dom_summ_vaz=cost_ENAT_TRINCA_bi_sem_dom_summ_vaz+x3;
                    cost_ENAT_TRINCA_bi_sem_dom_summ_forvaz=cost_ENAT_TRINCA_bi_sem_dom_summ_forvaz+y3;  
                end
            end
            Cost_ENAT_TRINCA_bi_sem_wint=((cost_ENAT_TRINCA_bi_sem_sem_wint_vaz+cost_ENAT_TRINCA_bi_sem_sab_wint_vaz+cost_ENAT_TRINCA_bi_sem_dom_wint_vaz+cost_ENAT_TRINCA_bi_sem_sem_wint_forvaz+cost_ENAT_TRINCA_bi_sem_sab_wint_forvaz+cost_ENAT_TRINCA_bi_sem_dom_wint_forvaz)/days_wint+ENAT_TRINCA(kVA_i,trf_j))*30;
            Cost_ENAT_TRINCA_bi_sem_summ=((cost_ENAT_TRINCA_bi_sem_sem_summ_vaz+cost_ENAT_TRINCA_bi_sem_sab_summ_vaz+cost_ENAT_TRINCA_bi_sem_dom_summ_vaz+cost_ENAT_TRINCA_bi_sem_sem_summ_forvaz+cost_ENAT_TRINCA_bi_sem_sab_summ_forvaz+cost_ENAT_TRINCA_bi_sem_dom_summ_forvaz)/days_summ+ENAT_TRINCA(kVA_i,trf_j))*30;
            Cost_ENAT_TRINCA_bi_sem=(Cost_ENAT_TRINCA_bi_sem_wint+Cost_ENAT_TRINCA_bi_sem_summ)/2;
            jb=1;
        end
    % Tri-hor�rio    
    elseif ENAT_TRINCA(1,trf_j)==3
        if jt==0
            %%% Ciclo di�rio %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    cd_ib=1;
                    cd_ie=6;
                    [x y z]=ciclodiario_tri(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_tri_diar_wint_vaz =cost_ENAT_TRINCA_tri_diar_wint_vaz+x;
                    cost_ENAT_TRINCA_tri_diar_wint_che=cost_ENAT_TRINCA_tri_diar_wint_che+y;
                    cost_ENAT_TRINCA_tri_diar_wint_pont=cost_ENAT_TRINCA_tri_diar_wint_pont+z;
                % Ver�o
                else
                    cd_ib=7;
                    cd_ie=12;
                    [x y z]=ciclodiario_tri(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_tri_diar_summ_vaz =cost_ENAT_TRINCA_tri_diar_summ_vaz+x;
                    cost_ENAT_TRINCA_tri_diar_summ_che=cost_ENAT_TRINCA_tri_diar_summ_che+y;
                    cost_ENAT_TRINCA_tri_diar_summ_pont=cost_ENAT_TRINCA_tri_diar_summ_pont+z;
                end
            end
             Cost_ENAT_TRINCA_tri_diar_wint=((cost_ENAT_TRINCA_tri_diar_wint_vaz+cost_ENAT_TRINCA_tri_diar_wint_che+cost_ENAT_TRINCA_tri_diar_wint_pont)/days_wint+ENAT_TRINCA(kVA_i,trf_j))*30;
             Cost_ENAT_TRINCA_tri_diar_summ=((cost_ENAT_TRINCA_tri_diar_summ_vaz+cost_ENAT_TRINCA_tri_diar_summ_che+cost_ENAT_TRINCA_tri_diar_summ_pont)/days_summ+ENAT_TRINCA(kVA_i,trf_j))*30;
             Cost_ENAT_TRINCA_tri_diar=(Cost_ENAT_TRINCA_tri_diar_wint+Cost_ENAT_TRINCA_tri_diar_summ)/2;
            
            %%% ciclo semanal %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    cd_ib=1;
                    cd_ie=11;
                    [x1 y1 z1 x2 y2 z2 x3 y3 z3]=ciclosemanal_tri(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_tri_sem_sem_wint_vaz=cost_ENAT_TRINCA_tri_sem_sem_wint_vaz+x1;
                    cost_ENAT_TRINCA_tri_sem_sem_wint_che=cost_ENAT_TRINCA_tri_sem_sem_wint_che+y1;
                    cost_ENAT_TRINCA_tri_sem_sem_wint_pont=cost_ENAT_TRINCA_tri_sem_sem_wint_pont+z1;
                    cost_ENAT_TRINCA_tri_sem_sab_wint_vaz=cost_ENAT_TRINCA_tri_sem_sab_wint_vaz+x2;
                    cost_ENAT_TRINCA_tri_sem_sab_wint_che=cost_ENAT_TRINCA_tri_sem_sab_wint_che+y2;
                    cost_ENAT_TRINCA_tri_sem_sab_wint_pont=cost_ENAT_TRINCA_tri_sem_sab_wint_pont+z2;
                    cost_ENAT_TRINCA_tri_sem_dom_wint_vaz=cost_ENAT_TRINCA_tri_sem_dom_wint_vaz+x3;
                    cost_ENAT_TRINCA_tri_sem_dom_wint_che=cost_ENAT_TRINCA_tri_sem_dom_wint_che+y3;
                    cost_ENAT_TRINCA_tri_sem_dom_wint_pont=cost_ENAT_TRINCA_tri_sem_dom_wint_pont+z3;
                % Ver�o    
                else
                    cd_ib=12;
                    cd_ie=20;
                    [x1 y1 z1 x2 y2 z2 x3 y3 z3]=ciclosemanal_tri(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie);
                    cost_ENAT_TRINCA_tri_sem_sem_summ_vaz=cost_ENAT_TRINCA_tri_sem_sem_summ_vaz+x1;
                    cost_ENAT_TRINCA_tri_sem_sem_summ_che=cost_ENAT_TRINCA_tri_sem_sem_summ_che+y1;
                    cost_ENAT_TRINCA_tri_sem_sem_summ_pont=cost_ENAT_TRINCA_tri_sem_sem_summ_pont+z1;
                    cost_ENAT_TRINCA_tri_sem_sab_summ_vaz=cost_ENAT_TRINCA_tri_sem_sab_summ_vaz+x2;
                    cost_ENAT_TRINCA_tri_sem_sab_summ_che=cost_ENAT_TRINCA_tri_sem_sab_summ_che+y2;
                    cost_ENAT_TRINCA_tri_sem_sab_summ_pont=cost_ENAT_TRINCA_tri_sem_sab_summ_pont+z2;
                    cost_ENAT_TRINCA_tri_sem_dom_summ_vaz=cost_ENAT_TRINCA_tri_sem_dom_summ_vaz+x3;
                    cost_ENAT_TRINCA_tri_sem_dom_summ_che=cost_ENAT_TRINCA_tri_sem_dom_summ_che+y3;
                    cost_ENAT_TRINCA_tri_sem_dom_summ_pont=cost_ENAT_TRINCA_tri_sem_dom_summ_pont+z3;                          
                end
            end
            Cost_ENAT_TRINCA_tri_sem_wint=((cost_ENAT_TRINCA_tri_sem_sem_wint_vaz+cost_ENAT_TRINCA_tri_sem_sem_wint_che+cost_ENAT_TRINCA_tri_sem_sem_wint_pont+cost_ENAT_TRINCA_tri_sem_sab_wint_vaz+cost_ENAT_TRINCA_tri_sem_sab_wint_che+cost_ENAT_TRINCA_tri_sem_sab_wint_pont+cost_ENAT_TRINCA_tri_sem_dom_wint_vaz+cost_ENAT_TRINCA_tri_sem_dom_wint_che+cost_ENAT_TRINCA_tri_sem_dom_wint_pont)/days_wint+ENAT_TRINCA(kVA_i,trf_j))*30;
            Cost_ENAT_TRINCA_tri_sem_summ=((cost_ENAT_TRINCA_tri_sem_sem_summ_vaz+cost_ENAT_TRINCA_tri_sem_sem_summ_che+cost_ENAT_TRINCA_tri_sem_sem_summ_pont+cost_ENAT_TRINCA_tri_sem_sab_summ_vaz+cost_ENAT_TRINCA_tri_sem_sab_summ_che+cost_ENAT_TRINCA_tri_sem_sab_summ_pont+cost_ENAT_TRINCA_tri_sem_dom_summ_vaz+cost_ENAT_TRINCA_tri_sem_dom_summ_che+cost_ENAT_TRINCA_tri_sem_dom_summ_pont)/days_summ+ENAT_TRINCA(kVA_i,trf_j))*30;
            Cost_ENAT_TRINCA_tri_sem=(Cost_ENAT_TRINCA_tri_sem_wint+Cost_ENAT_TRINCA_tri_sem_summ)/2;
            jt=1;
        end
    end
end
Cost_ENAT_TRINCA={'ENAT_TRINCA_simples',cost_ENAT_TRINCA_simples;'ENAT_TRINCA_bi_diar',Cost_ENAT_TRINCA_bi_diar;'ENAT_TRINCA_bi_sem',Cost_ENAT_TRINCA_bi_sem;'ENAT_TRINCA_tri_diar',Cost_ENAT_TRINCA_tri_diar;'ENAT_TRINCA_tri_sem',Cost_ENAT_TRINCA_tri_sem};
save('Cost_ENAT_TRINCA','Cost_ENAT_TRINCA');
end