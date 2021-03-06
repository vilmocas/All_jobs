function [x y z]=ciclodiario_tri(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie)

load('tariff_data')

x=0;
y=0;
z=0;

for kWh_i=20:size(kWh,1)-16
    for cd_i=cd_ib:cd_ie
        % periodo vazio
        if ciclo_diario(cd_i,2)==3
            % condi��es de fronteiras dos hor�rios
            if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                    x=x+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+3);
                end
            else
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                        x=x+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+3);
                    end
                end
            end                       
        % periodo cheia
        elseif ciclo_diario(cd_i,2)==2
            % condi��es de fronteiras dos hor�rios
            if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                    y=y+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                end
            else
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                        y=y+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                    end
                end
            end
        % periodo ponta    
        elseif ciclo_diario(cd_i,2)==1
            % condi��es de fronteiras dos hor�rios
            if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                    z=z+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                end
            else
                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                        z=z+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                    end
                end
            end
        end
    end
end
end