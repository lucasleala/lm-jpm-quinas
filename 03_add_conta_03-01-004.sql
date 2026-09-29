-- JP Máquinas · adiciona a conta 03.01.004 (nova no Citel) ao De:Para.
-- Só INSERE (não apaga nada). Pode rodar com segurança, mesmo mais de uma vez.
insert into public.bd_plano_contas (codigo, nome_citel, dre_grupo, dre_linha, dre_ordem, exibir_dre, tipo)
select '03.01.004','OUTRAS MERCADORIAS PARA REVENDA','CMV','03_CMV.OUTRAS MERCADORIAS PARA REVENDA',33,true,'DESPESA'
where not exists (select 1 from public.bd_plano_contas where codigo = '03.01.004');
