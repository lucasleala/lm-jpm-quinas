# JP Máquinas — Sistema Financeiro

Página única (`index.html`) que lê e grava direto no Supabase (Auth + REST, RLS ligado).
Arquitetura derivada do sistema Belacor.

## Estrutura
- `index.html` — o sistema (publicado pelo Vercel).
- `sql/01_schema_rls.sql` — tabelas + RLS (já executado).
- `sql/02_depara_carga_inicial.sql` — carga inicial do De:Para. **Apaga e recarrega**: não rodar de novo depois de editar o De:Para pela tela.
- `sql/03_add_conta_03-01-004.sql` — só insere a conta 03.01.004 (seguro rodar).
- `.github/workflows/keepalive.yml` — ping a cada 3 dias para o Supabase não pausar.

## Keep-alive (configurar uma vez)
Settings → Secrets and variables → Actions → New repository secret:
- `SUPABASE_URL` = `https://nutncrarojpdpaahrbln.supabase.co`
- `SUPABASE_ANON_KEY` = a anon public key (Supabase → Settings → API)

Depois: Actions → "Supabase keep-alive" → Run workflow (teste manual).

## Exportações do Citel (para a DRE de Caixa ficar certa)
**Títulos Recebidos – Analítico**
- Data de Cadastro: **TODOS**
- Data Inicial / Data Final (recebimento): o período desejado
- Pesquisar por: DATA DO RECEBIMENTO
- Exibir Tipo de Recebimento e Histórico: **SIM** (sem isso a receita não se separa por forma)
- Considerar a Data Bancária: NÃO

**Títulos Pagos**
- Data Inicial/Final (Pagamento): o período desejado
- Exibir Modalidade de Pagamento e Histórico: SIM

A importação lê as colunas **pelo nome**, então mudanças de posição no Citel não quebram mais.
