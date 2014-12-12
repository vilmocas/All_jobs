function [x y]=ciclodiario(table_tariff,kWh_i,kWh_j,trf_j,cd_ib,cd_ie)

cd('C:\Users\hpomb_000\MEOCloud\PPEC_2013_2014\Medidas eficiencia energetica\Simulador tarifa');
load('tariff_data')

kWh=kWh_HP;
kVA=3.45;

kVA_i=find(table_tariff(:,1)==kVA);

x=0;
y=0;

for cd_i=cd_ib:cd_ie
    % periodo vazio
    if ciclo_diario(cd_i,2)==3
        % condições de fronteiras dos horários
        if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                x=x+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
            end
        else
            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                    x=x+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                end
            end
        end                              
    % periodo fora vazio
    else
        % condições de fronteiras dos horários
        if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                y=y+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
            end
        else
            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                    y=y+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                end
            end
        end
    end
end

end