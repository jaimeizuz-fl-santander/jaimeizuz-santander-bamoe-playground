set schema 'kogito';

select * from tasks where actual_owner = 'cf647c2a-ef2b-4cb1-bb12-983ac08b101f';

select id, process_id, start_time, end_time, last_update_time, state, variables
from processes
where id = '6264126c-edc1-426a-bf70-b1da44155c36';

select id, encode(pi.payload, 'escape')
from process_instances pi
where pi.id='6264126c-edc1-426a-bf70-b1da44155c36'

select jut.id, jut.task_name, jut.status, jut.actual_owner
from jbpm_user_tasks jut, jbpm_user_tasks_metadata jum
where jut.id = jum.task_id
	and jum.metadata_name = 'ProcessInstanceId'
	and jum.metadata_value = '"6264126c-edc1-426a-bf70-b1da44155c36"';

select jut.user_task_id, jut.task_name, jut.actual_owner, jut.status, jut.external_reference_id
from tasks t, jbpm_user_tasks jut
where t.id = jut.id
	and t.process_instance_id = '6264126c-edc1-426a-bf70-b1da44155c36';

select n.id, n.enter, n.exit, n.name, n.type, n.process_instance_id
from nodes n
where n.process_instance_id = '6264126c-edc1-426a-bf70-b1da44155c36'
order by enter;