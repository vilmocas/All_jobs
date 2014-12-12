function [x1 y1 x2 y2 x3 y3]=ciclosemanal_bi(table_tariff,kWh,kVA,kVA_i,kWh_j,trf_j,cd_ib,cd_ie)

load('tariff_data')

x1=0;
y1=0;
x2=0;
y2=0;
x3=0;
y3=0;

for kWh_i=20:size(kWh,1)-16
    % segunda a sexta-feira (consumo)
    if kWh(3,kWh_j)>=2
        if kWh(3,kWh_j)<=6
            for cd_i=cd_ib:cd_ie
                % segunda a sexta-feira (ciclo_semanal)
                if ciclo_semanal(cd_i,2)==1
                    % periodo vazio    
                    if ciclo_semanal(cd_i,3)==3
                        % condições de fronteiras dos horários
                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                x1=x1+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                            end
                        else
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                    x1=x1+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                                end
                            end
                        end
                    % periodo fora vazio    
                    else
                         % condições de fronteiras dos horários
                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                y1=y1+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                            end
                        else
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                    y1=y1+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                                end
                            end
                        end
                    end
                end
            end
        % sabado (consumo)
        elseif kWh(3,kWh_j)==7
            % ciclo que percorre o periodo horario da tarifa; ciclo
            % semanal    
            for cd_i=cd_ib:cd_ie
                % sabado (ciclo_semanal)
                if ciclo_semanal(cd_i,2)==2  
                    % periodo vazio
                    if ciclo_semanal(cd_i,3)==3
                         % condições de fronteiras dos horários
                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                x2=x2+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                            end
                        else
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                    x2=x2+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                                end
                            end
                        end
                    % periodo fora vazio    
                    else
                         % condições de fronteiras dos horários
                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                y2=y2+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                            end
                        else
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                    y2=y2+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                                end
                            end
                        end
                    end
                end
            end
        end
    %domingo (consumo)    
    elseif kWh(3,kWh_j)==1
        % ciclo que percorre o periodo horario da tarifa; ciclo
        % semanal    
        for cd_i=cd_ib:cd_ie
            % domingo (ciclo_semanal)
            if ciclo_semanal(cd_i,2)==3   
                % periodo vazio
                if ciclo_semanal(cd_i,3)==3
                     % condições de fronteiras dos horários
                    if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                            x3=x3+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                        end
                    else
                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                x3=x3+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+2);
                            end
                        end
                    end
                % periodo fora vazio    
                elseif ciclo_semanal(cd_i,3)==2
                     % condições de fronteiras dos horários
                    if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                            y3=y3+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                        end
                    else
                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                y3=y3+kWh(kWh_i,kWh_j)*table_tariff(kVA_i,trf_j+1);
                            end
                        end
                    end
                end
            end
        end
    end
end
end