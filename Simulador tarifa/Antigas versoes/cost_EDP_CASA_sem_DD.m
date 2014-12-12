function Cost_EDP_CASA_sem_DD=cost_EDP_CASA_sem_DD(kWh)

cd('C:\Users\hpomb_000\MEOCloud\PPEC_2013_2014\Medidas eficiencia energetica\Simulador tarifa');
load('tariff_data')

kWh=kWh_HP;
kVA=3.45;

kVA_i=find(EDP_CASA_sem_DD(:,1)==kVA);

% CASA
js=0;
jb=0;
jt=0;
days_wint=0;
days_summ=0;
cost_EDP_CASA_sem_DD_bi_diar_wint_vaz=0;
cost_EDP_CASA_sem_DD_bi_diar_wint_forvaz=0;
cost_EDP_CASA_sem_DD_bi_diar_summ_vaz=0;
cost_EDP_CASA_sem_DD_bi_diar_summ_forvaz=0;

cost_EDP_CASA_sem_DD_bi_sem_sem_wint_vaz=0;
cost_EDP_CASA_sem_DD_bi_sem_sem_wint_forvaz=0;
cost_EDP_CASA_sem_DD_bi_sem_sab_wint_vaz=0;
cost_EDP_CASA_sem_DD_bi_sem_sab_wint_forvaz=0;
cost_EDP_CASA_sem_DD_bi_sem_dom_wint_vaz=0;
cost_EDP_CASA_sem_DD_bi_sem_dom_wint_forvaz=0;

cost_EDP_CASA_sem_DD_bi_sem_sem_summ_vaz=0;
cost_EDP_CASA_sem_DD_bi_sem_sem_summ_forvaz=0;
cost_EDP_CASA_sem_DD_bi_sem_sab_summ_vaz=0;
cost_EDP_CASA_sem_DD_bi_sem_sab_summ_forvaz=0;
cost_EDP_CASA_sem_DD_bi_sem_dom_summ_vaz=0;
cost_EDP_CASA_sem_DD_bi_sem_dom_summ_forvaz=0;

cost_EDP_CASA_sem_DD_tri_diar_wint_vaz=0;
cost_EDP_CASA_sem_DD_tri_diar_wint_che=0;
cost_EDP_CASA_sem_DD_tri_diar_wint_pont=0;
cost_EDP_CASA_sem_DD_tri_diar_summ_vaz=0;
cost_EDP_CASA_sem_DD_tri_diar_summ_che=0;
cost_EDP_CASA_sem_DD_tri_diar_summ_pont=0;

cost_EDP_CASA_sem_DD_tri_sem_sem_wint_vaz=0;
cost_EDP_CASA_sem_DD_tri_sem_sem_wint_che=0;
cost_EDP_CASA_sem_DD_tri_sem_sem_wint_pont=0;
cost_EDP_CASA_sem_DD_tri_sem_sab_wint_vaz=0;
cost_EDP_CASA_sem_DD_tri_sem_sab_wint_che=0;
cost_EDP_CASA_sem_DD_tri_sem_sab_wint_pont=0;
cost_EDP_CASA_sem_DD_tri_sem_dom_wint_vaz=0;
cost_EDP_CASA_sem_DD_tri_sem_dom_wint_che=0;
cost_EDP_CASA_sem_DD_tri_sem_dom_wint_pont=0;

cost_EDP_CASA_sem_DD_tri_sem_sem_summ_vaz=0;
cost_EDP_CASA_sem_DD_tri_sem_sem_summ_che=0;
cost_EDP_CASA_sem_DD_tri_sem_sem_summ_pont=0;
cost_EDP_CASA_sem_DD_tri_sem_sab_summ_vaz=0;
cost_EDP_CASA_sem_DD_tri_sem_sab_summ_che=0;
cost_EDP_CASA_sem_DD_tri_sem_sab_summ_pont=0;
cost_EDP_CASA_sem_DD_tri_sem_dom_summ_vaz=0;
cost_EDP_CASA_sem_DD_tri_sem_dom_summ_che=0;
cost_EDP_CASA_sem_DD_tri_sem_dom_summ_pont=0;

for trf_j=2:size(EDP_CASA_sem_DD,2)
    
    % Simples
    if EDP_CASA_sem_DD(1,trf_j)==1
        if js==0
            cost_EDP_CASA_sem_DD_simples=(sum(sum(kWh(20:(size(kWh,1)-16),3:size(kWh,2))))*EDP_CASA_sem_DD(kVA_i,trf_j+1)/(size(kWh,2)-2)+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            js=1;
        end
        
    % Bi-horário    
    elseif EDP_CASA_sem_DD(1,trf_j)==2
        if jb==0
            %%% Ciclo diário %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    for kWh_i=20:size(kWh,1)-16
                        % ciclo que percorre o periodo horario da tarifa; ciclo
                        % diario
                        for cd_i=1:6    
                            % periodo vazio
                            if ciclo_diario(cd_i,2)==3
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_bi_diar_wint_vaz=cost_EDP_CASA_sem_DD_bi_diar_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_bi_diar_wint_vaz=cost_EDP_CASA_sem_DD_bi_diar_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                        end
                                    end
                                end                                             
%                                 if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
%                                     cost_EDP_CASA_sem_DD_bi_diar_wint_vaz=cost_EDP_CASA_sem_DD_bi_diar_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
%                                 end
                            % periodo fora vazio
                            else
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_bi_diar_wint_forvaz=cost_EDP_CASA_sem_DD_bi_diar_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_bi_diar_wint_forvaz=cost_EDP_CASA_sem_DD_bi_diar_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                        end
                                    end
                                end
                            end
                        end
                    end
                    days_wint=days_wint+1;
                % Verão
                else 
                    for kWh_i=20:size(kWh,1)-16
                        % ciclo que percorre o periodo horario da tarifa; ciclo
                        % diario
                        for cd_i=7:12    
                            % periodo vazio
                            if ciclo_diario(cd_i,2)==3
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_bi_diar_summ_vaz=cost_EDP_CASA_sem_DD_bi_diar_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_bi_diar_summ_vaz=cost_EDP_CASA_sem_DD_bi_diar_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                        end
                                    end
                                end
                            % periodo fora vazio
                            else                                
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_bi_diar_summ_forvaz=cost_EDP_CASA_sem_DD_bi_diar_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_bi_diar_summ_forvaz=cost_EDP_CASA_sem_DD_bi_diar_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                        end
                                    end
                                end
                            end
                        end
                    end
                    days_summ=days_summ+1;
                end
            end
            Cost_EDP_CASA_sem_DD_bi_diar_wint=((cost_EDP_CASA_sem_DD_bi_diar_wint_vaz+cost_EDP_CASA_sem_DD_bi_diar_wint_forvaz)/days_wint+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            Cost_EDP_CASA_sem_DD_bi_diar_summ=((cost_EDP_CASA_sem_DD_bi_diar_summ_vaz+cost_EDP_CASA_sem_DD_bi_diar_summ_forvaz)/days_summ+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            Cost_EDP_CASA_sem_DD_bi_diar=(Cost_EDP_CASA_sem_DD_bi_diar_wint+Cost_EDP_CASA_sem_DD_bi_diar_summ)/2;
            
            %%% ciclo semanal %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    for kWh_i=20:size(kWh,1)-16
                        % segunda a sexta-feira (consumo)
                        if kWh(3,kWh_j)>=2
                            if kWh(3,kWh_j)<=6
                                % ciclo que percorre o periodo horario da tarifa; ciclo
                                % semanal    
                                for cd_i=1:11    
                                    % segunda a sexta-feira (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==1
                                        % periodo vazio    
                                        if ciclo_semanal(cd_i,3)==3
                                            % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sem_wint_vaz=cost_EDP_CASA_sem_DD_bi_sem_sem_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sem_wint_vaz=cost_EDP_CASA_sem_DD_bi_sem_sem_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo fora vazio    
                                        else
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sem_wint_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sem_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sem_wint_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sem_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                                for cd_i=1:11            
                                    % sabado (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==2  
                                        % periodo vazio
                                        if ciclo_semanal(cd_i,3)==3
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sab_wint_vaz=cost_EDP_CASA_sem_DD_bi_sem_sab_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sab_wint_vaz=cost_EDP_CASA_sem_DD_bi_sem_sab_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo fora vazio    
                                        else
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sab_wint_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sab_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sab_wint_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sab_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                            for cd_i=1:11            
                                % domingo (ciclo_semanal)
                                if ciclo_semanal(cd_i,2)==3   
                                    % periodo vazio
                                    if ciclo_semanal(cd_i,3)==3
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_bi_sem_dom_wint_vaz=cost_EDP_CASA_sem_DD_bi_sem_dom_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_dom_wint_vaz=cost_EDP_CASA_sem_DD_bi_sem_dom_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            end
                                        end
                                    % periodo fora vazio    
                                    elseif ciclo_semanal(cd_i,3)==2
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_bi_sem_dom_wint_forvaz=cost_EDP_CASA_sem_DD_bi_sem_dom_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_dom_wint_forvaz=cost_EDP_CASA_sem_DD_bi_sem_dom_wint_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                % Verão    
                else
                   for kWh_i=20:size(kWh,1)-16
                        % segunda a sexta-feira (consumo)
                        if kWh(3,kWh_j)>=2
                            if kWh(3,kWh_j)<=6
                                % ciclo que percorre o periodo horario da tarifa; ciclo
                                % semanal    
                                for cd_i=12:20    
                                    % segunda a sexta-feira (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==1
                                        % periodo vazio    
                                        if ciclo_semanal(cd_i,3)==3
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sem_summ_vaz=cost_EDP_CASA_sem_DD_bi_sem_sem_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sem_summ_vaz=cost_EDP_CASA_sem_DD_bi_sem_sem_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo fora vazio    
                                        else
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sem_summ_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sem_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sem_summ_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sem_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                                for cd_i=12:20            
                                    % sabado (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==2  
                                        % periodo vazio
                                        if ciclo_semanal(cd_i,3)==3
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sab_summ_vaz=cost_EDP_CASA_sem_DD_bi_sem_sab_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sab_summ_vaz=cost_EDP_CASA_sem_DD_bi_sem_sab_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo fora vazio    
                                        else
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_sab_summ_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sab_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_bi_sem_sab_summ_forvaz=cost_EDP_CASA_sem_DD_bi_sem_sab_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                            for cd_i=12:20            
                                % domingo (ciclo_semanal)
                                if ciclo_semanal(cd_i,2)==3   
                                    % periodo vazio
                                    if ciclo_semanal(cd_i,3)==3
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_bi_sem_dom_summ_vaz=cost_EDP_CASA_sem_DD_bi_sem_dom_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_dom_summ_vaz=cost_EDP_CASA_sem_DD_bi_sem_dom_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            end
                                        end
                                    % periodo fora vazio    
                                    elseif ciclo_semanal(cd_i,3)==2
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_bi_sem_dom_summ_forvaz=cost_EDP_CASA_sem_DD_bi_sem_dom_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_bi_sem_dom_summ_forvaz=cost_EDP_CASA_sem_DD_bi_sem_dom_summ_forvaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Cost_EDP_CASA_sem_DD_bi_sem_wint=((cost_EDP_CASA_sem_DD_bi_sem_sem_wint_vaz+cost_EDP_CASA_sem_DD_bi_sem_sab_wint_vaz+cost_EDP_CASA_sem_DD_bi_sem_dom_wint_vaz+cost_EDP_CASA_sem_DD_bi_sem_sem_wint_forvaz+cost_EDP_CASA_sem_DD_bi_sem_sab_wint_forvaz+cost_EDP_CASA_sem_DD_bi_sem_dom_wint_forvaz)/days_wint+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            Cost_EDP_CASA_sem_DD_bi_sem_summ=((cost_EDP_CASA_sem_DD_bi_sem_sem_summ_vaz+cost_EDP_CASA_sem_DD_bi_sem_sab_summ_vaz+cost_EDP_CASA_sem_DD_bi_sem_dom_summ_vaz+cost_EDP_CASA_sem_DD_bi_sem_sem_summ_forvaz+cost_EDP_CASA_sem_DD_bi_sem_sab_summ_forvaz+cost_EDP_CASA_sem_DD_bi_sem_dom_summ_forvaz)/days_summ+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            Cost_EDP_CASA_sem_DD_bi_sem=(Cost_EDP_CASA_sem_DD_bi_sem_wint+Cost_EDP_CASA_sem_DD_bi_sem_summ)/2;
            jb=1;
        end
    % Tri-horário    
    elseif EDP_CASA_sem_DD(1,trf_j)==3
        if jt==0
            %%% Ciclo diário %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    for kWh_i=20:size(kWh,1)-16
                        % ciclo que percorre o periodo horario da tarifa; ciclo
                        % diario
                        for cd_i=1:6    
                            % periodo vazio
                            if ciclo_diario(cd_i,2)==3
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_tri_diar_wint_vaz=cost_EDP_CASA_sem_DD_tri_diar_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_tri_diar_wint_vaz=cost_EDP_CASA_sem_DD_tri_diar_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                        end
                                    end
                                end                                             
%                                 if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
%                                     cost_EDP_CASA_sem_DD_tri_diar_wint_vaz=cost_EDP_CASA_sem_DD_tri_diar_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
%                                 end
                            % periodo cheia
                            elseif ciclo_diario(cd_i,2)==2
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_tri_diar_wint_che=cost_EDP_CASA_sem_DD_tri_diar_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_tri_diar_wint_che=cost_EDP_CASA_sem_DD_tri_diar_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                        end
                                    end
                                end
                            % periodo ponta    
                            elseif ciclo_diario(cd_i,2)==1
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_tri_diar_wint_pont=cost_EDP_CASA_sem_DD_tri_diar_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_tri_diar_wint_pont=cost_EDP_CASA_sem_DD_tri_diar_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                        end
                                    end
                                end
                            end
                        end
                    end
%                     days_wint=days_wint+1;
                % Verão
                else 
                    for kWh_i=20:size(kWh,1)-16
                        % ciclo que percorre o periodo horario da tarifa; ciclo
                        % diario
                        for cd_i=7:12    
                            % periodo vazio
                            if ciclo_diario(cd_i,2)==3
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_tri_diar_summ_vaz=cost_EDP_CASA_sem_DD_tri_diar_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_tri_diar_summ_vaz=cost_EDP_CASA_sem_DD_tri_diar_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                        end
                                    end
                                end
                            % periodo cheia
                            elseif ciclo_diario(cd_i,2)==2
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_tri_diar_summ_che=cost_EDP_CASA_sem_DD_tri_diar_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_tri_diar_summ_che=cost_EDP_CASA_sem_DD_tri_diar_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                        end
                                    end
                                end
                            % periodo ponta
                            elseif ciclo_diario(cd_i,2)==1
                                % condições de fronteiras dos horários
                                if ciclo_diario(cd_i,3)>=ciclo_diario(cd_i,4)
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                        cost_EDP_CASA_sem_DD_tri_diar_summ_pont=cost_EDP_CASA_sem_DD_tri_diar_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                    end
                                else
                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_diario(cd_i,3)
                                        if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_diario(cd_i,4)
                                            cost_EDP_CASA_sem_DD_tri_diar_summ_pont=cost_EDP_CASA_sem_DD_tri_diar_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                        end
                                    end
                                end
    
                            end
                        end
                    end
%                     days_summ=days_summ+1;
                end
            end
             Cost_EDP_CASA_sem_DD_tri_diar_wint=((cost_EDP_CASA_sem_DD_tri_diar_wint_vaz+cost_EDP_CASA_sem_DD_tri_diar_wint_che+cost_EDP_CASA_sem_DD_tri_diar_wint_pont)/days_wint+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
             Cost_EDP_CASA_sem_DD_tri_diar_summ=((cost_EDP_CASA_sem_DD_tri_diar_summ_vaz+cost_EDP_CASA_sem_DD_tri_diar_summ_che+cost_EDP_CASA_sem_DD_tri_diar_summ_pont)/days_summ+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
             Cost_EDP_CASA_sem_DD_tri_diar=(Cost_EDP_CASA_sem_DD_tri_diar_wint+Cost_EDP_CASA_sem_DD_tri_diar_summ)/2;
            
            %%% ciclo semanal %%%
            for kWh_j=3:size(kWh,2)
                % Inverno, >=21 Dezembro & <= 20 Junho
                if kWh(2,kWh_j)>=yeardays(kWh(1,kWh_j))-10 || kWh(2,kWh_j)<=yeardays(kWh(1,kWh_j))-194    
                    for kWh_i=20:size(kWh,1)-16
                        % segunda a sexta-feira (consumo)
                        if kWh(3,kWh_j)>=2
                            if kWh(3,kWh_j)<=6
                                % ciclo que percorre o periodo horario da tarifa; ciclo
                                % semanal    
                                for cd_i=1:11    
                                    % segunda a sexta-feira (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==1
                                        % periodo vazio    
                                        if ciclo_semanal(cd_i,3)==3
                                            % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sem_wint_vaz=cost_EDP_CASA_sem_DD_tri_sem_sem_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sem_wint_vaz=cost_EDP_CASA_sem_DD_tri_sem_sem_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                    end
                                                end
                                            end
                                        % periodo cheia    
                                        elseif ciclo_semanal(cd_i,3)==2
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sem_wint_che=cost_EDP_CASA_sem_DD_tri_sem_sem_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sem_wint_che=cost_EDP_CASA_sem_DD_tri_sem_sem_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo ponta    
                                        elseif ciclo_semanal(cd_i,3)==1
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sem_wint_pont=cost_EDP_CASA_sem_DD_tri_sem_sem_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sem_wint_pont=cost_EDP_CASA_sem_DD_tri_sem_sem_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                                for cd_i=1:11            
                                    % sabado (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==2  
                                        % periodo vazio
                                        if ciclo_semanal(cd_i,3)==3
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sab_wint_vaz=cost_EDP_CASA_sem_DD_tri_sem_sab_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sab_wint_vaz=cost_EDP_CASA_sem_DD_tri_sem_sab_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                    end
                                                end
                                            end
                                        % periodo cheia
                                        elseif ciclo_semanal(cd_i,3)==2
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sab_wint_che=cost_EDP_CASA_sem_DD_tri_sem_sab_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sab_wint_che=cost_EDP_CASA_sem_DD_tri_sem_sab_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo cheia
                                        elseif ciclo_semanal(cd_i,3)==1
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sab_wint_pont=cost_EDP_CASA_sem_DD_tri_sem_sab_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sab_wint_pont=cost_EDP_CASA_sem_DD_tri_sem_sab_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                            for cd_i=1:11            
                                % domingo (ciclo_semanal)
                                if ciclo_semanal(cd_i,2)==3   
                                    % periodo vazio
                                    if ciclo_semanal(cd_i,3)==3
                                        % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_tri_sem_dom_wint_vaz=cost_EDP_CASA_sem_DD_tri_sem_dom_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_dom_wint_vaz=cost_EDP_CASA_sem_DD_tri_sem_dom_wint_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                end
                                            end
                                        end
                                    % periodo cheia    
                                    elseif ciclo_semanal(cd_i,3)==2
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_tri_sem_dom_wint_che=cost_EDP_CASA_sem_DD_tri_sem_dom_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_dom_wint_che=cost_EDP_CASA_sem_DD_tri_sem_dom_wint_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            end
                                        end
                                    % periodo ponta    
                                    elseif ciclo_semanal(cd_i,3)==3
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_tri_sem_dom_wint_pont=cost_EDP_CASA_sem_DD_tri_sem_dom_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_dom_wint_pont=cost_EDP_CASA_sem_DD_tri_sem_dom_wint_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                % Verão    
                else
                   for kWh_i=20:size(kWh,1)-16
                        % segunda a sexta-feira (consumo)
                        if kWh(3,kWh_j)>=2
                            if kWh(3,kWh_j)<=6
                                % ciclo que percorre o periodo horario da tarifa; ciclo
                                % semanal    
                                for cd_i=12:20    
                                    % segunda a sexta-feira (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==1
                                        % periodo vazio    
                                        if ciclo_semanal(cd_i,3)==3
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sem_summ_vaz=cost_EDP_CASA_sem_DD_tri_sem_sem_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sem_summ_vaz=cost_EDP_CASA_sem_DD_tri_sem_sem_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                    end
                                                end
                                            end
                                        % periodo cheia
                                        elseif ciclo_semanal(cd_i,3)==2
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sem_summ_che=cost_EDP_CASA_sem_DD_tri_sem_sem_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sem_summ_che=cost_EDP_CASA_sem_DD_tri_sem_sem_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo ponta
                                        elseif ciclo_semanal(cd_i,3)==1
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sem_summ_pont=cost_EDP_CASA_sem_DD_tri_sem_sem_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sem_summ_pont=cost_EDP_CASA_sem_DD_tri_sem_sem_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                                for cd_i=12:20            
                                    % sabado (ciclo_semanal)
                                    if ciclo_semanal(cd_i,2)==2  
                                        % periodo vazio
                                        if ciclo_semanal(cd_i,3)==3
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sab_summ_vaz=cost_EDP_CASA_sem_DD_tri_sem_sab_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sab_summ_vaz=cost_EDP_CASA_sem_DD_tri_sem_sab_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                    end
                                                end
                                            end
                                        % periodo cheia
                                        elseif ciclo_semanal(cd_i,3)==2
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sab_summ_che=cost_EDP_CASA_sem_DD_tri_sem_sab_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sab_summ_che=cost_EDP_CASA_sem_DD_tri_sem_sab_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                    end
                                                end
                                            end
                                        % periodo ponta    
                                        elseif ciclo_semanal(cd_i,3)==1
                                             % condições de fronteiras dos horários
                                            if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_sab_summ_pont=cost_EDP_CASA_sem_DD_tri_sem_sab_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            else
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                    if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                        cost_EDP_CASA_sem_DD_tri_sem_sab_summ_pont=cost_EDP_CASA_sem_DD_tri_sem_sab_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
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
                            for cd_i=12:20            
                                % domingo (ciclo_semanal)
                                if ciclo_semanal(cd_i,2)==3   
                                    % periodo vazio
                                    if ciclo_semanal(cd_i,3)==3
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_tri_sem_dom_summ_vaz=cost_EDP_CASA_sem_DD_tri_sem_dom_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_dom_summ_vaz=cost_EDP_CASA_sem_DD_tri_sem_dom_summ_vaz+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+3);
                                                end
                                            end
                                        end
                                    % periodo cheia
                                    elseif ciclo_semanal(cd_i,3)==2
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_tri_sem_dom_summ_che=cost_EDP_CASA_sem_DD_tri_sem_dom_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_dom_summ_che=cost_EDP_CASA_sem_DD_tri_sem_dom_summ_che+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+2);
                                                end
                                            end
                                        end
                                    % periodo ponta
                                    elseif ciclo_semanal(cd_i,3)==2
                                         % condições de fronteiras dos horários
                                        if ciclo_semanal(cd_i,4)>=ciclo_semanal(cd_i,5)
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4) || kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                cost_EDP_CASA_sem_DD_tri_sem_dom_summ_pont=cost_EDP_CASA_sem_DD_tri_sem_dom_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                            end
                                        else
                                            if kWh(kWh_i,1)+kWh(kWh_i,2)/60>ciclo_semanal(cd_i,4)
                                                if kWh(kWh_i,1)+kWh(kWh_i,2)/60<=ciclo_semanal(cd_i,5)
                                                    cost_EDP_CASA_sem_DD_tri_sem_dom_summ_pont=cost_EDP_CASA_sem_DD_tri_sem_dom_summ_pont+kWh(kWh_i,kWh_j)*EDP_CASA_sem_DD(kVA_i,trf_j+1);
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Cost_EDP_CASA_sem_DD_tri_sem_wint=((cost_EDP_CASA_sem_DD_tri_sem_sem_wint_vaz+cost_EDP_CASA_sem_DD_tri_sem_sem_wint_che+cost_EDP_CASA_sem_DD_tri_sem_sem_wint_pont+cost_EDP_CASA_sem_DD_tri_sem_sab_wint_vaz+cost_EDP_CASA_sem_DD_tri_sem_sab_wint_che+cost_EDP_CASA_sem_DD_tri_sem_sab_wint_pont+cost_EDP_CASA_sem_DD_tri_sem_dom_wint_vaz+cost_EDP_CASA_sem_DD_tri_sem_dom_wint_che+cost_EDP_CASA_sem_DD_tri_sem_dom_wint_pont)/days_wint+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            Cost_EDP_CASA_sem_DD_tri_sem_summ=((cost_EDP_CASA_sem_DD_tri_sem_sem_summ_vaz+cost_EDP_CASA_sem_DD_tri_sem_sem_summ_che+cost_EDP_CASA_sem_DD_tri_sem_sem_summ_pont+cost_EDP_CASA_sem_DD_tri_sem_sab_summ_vaz+cost_EDP_CASA_sem_DD_tri_sem_sab_summ_che+cost_EDP_CASA_sem_DD_tri_sem_sab_summ_pont+cost_EDP_CASA_sem_DD_tri_sem_dom_summ_vaz+cost_EDP_CASA_sem_DD_tri_sem_dom_summ_che+cost_EDP_CASA_sem_DD_tri_sem_dom_summ_pont)/days_summ+EDP_CASA_sem_DD(kVA_i,trf_j))*30;
            Cost_EDP_CASA_sem_DD_tri_sem=(Cost_EDP_CASA_sem_DD_tri_sem_wint+Cost_EDP_CASA_sem_DD_tri_sem_summ)/2;
            jt=1;
        end
    end
end
Cost_EDP_CASA_sem_DD={'EDP_CASA_sem_DD_simples',cost_EDP_CASA_sem_DD_simples;'EDP_CASA_sem_DD_bi_diar',Cost_EDP_CASA_sem_DD_bi_diar;'EDP_CASA_sem_DD_bi_sem',Cost_EDP_CASA_sem_DD_bi_sem;'EDP_CASA_sem_DD_tri_diar',Cost_EDP_CASA_sem_DD_tri_diar;'EDP_CASA_sem_DD_tri_sem',Cost_EDP_CASA_sem_DD_tri_sem};
save('Cost_EDP_CASA_sem_DD','Cost_EDP_CASA_sem_DD');
end