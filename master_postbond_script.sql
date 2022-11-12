create table if not exists nexperia_atsn.r_apc_ruleparamchange
(
paramname string, 
apcrulename string, 
old_value string, 
new_value string, 
inserttime timestamp, 
insertuser string
)
;

insert into nexperia_atsn.r_apc_ruleparamchange values
('EV900', 'DACA_PARAMCHANGE_1', '', '1',current_timestamp(), 'APP'),
('EV940', 'DACA_PARAMCHANGE_1', '', '1',current_timestamp(), 'APP')
;

insert into nexperia_atsn.r_apc_alertmaster values
(
'DACA_PARAMCHANGE_1', 'DACA machine encountered pre-bond post-bond turn off', true,	false, 1, 10000.0, 'count based', true,	false, true, false,	false, current_timestamp()
)
;

insert into nexperia_atsn.r_apc_mailmaster values
(
'DACA_PARAMCHANGE_1', 'APC Alert for DACA PARAMCHANGE 1', 'jianyou.sim@nexperia.com', 'nilo.dejesus@nexperia.com,anoop.sankunny.nair@nexperia.com,dean.p.su@nexperia.com,victor.zhao@nexperia.com,nilesh.pandey@nexperia.com', 'ASM DACA Pre-bond/post-bond turn off', ' ', ' ', "SELECT 'preproc_parameterchange',machinename,SPLIT(errortopic,'\\|')[2] lot_num, SPLIT(errortopic,'\\|')[1] param_name, SPLIT(errortopic,'\\|')[4] param_value,SPLIT(errortopic,'\\|')[3] strp_id,SPLIT(errortopic,'\\|')[5] datetime FROM logical_bigdata_atsn.l_alertinitiator where errortopic=<errortopic> and machinename=<equipmentname>"
)
;
