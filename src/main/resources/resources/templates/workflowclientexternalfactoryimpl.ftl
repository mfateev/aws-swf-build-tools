<#include "header.ftl">
package ${packageName};

import com.amazonaws.services.simpleworkflow.flow.DataConverter;
import com.amazonaws.services.simpleworkflow.flow.StartWorkflowOptions;
import com.amazonaws.services.simpleworkflow.flow.WorkflowClientFactoryExternalBase;
import com.amazonaws.services.simpleworkflow.flow.generic.GenericWorkflowClientExternal;
import com.uber.cadence.WorkflowExecution;
import com.uber.cadence.WorkflowService;
import com.uber.cadence.WorkflowType;

public class ${clientExternalFactoryImplName} extends WorkflowClientFactoryExternalBase<${clientExternalInterfaceName}>  implements ${clientExternalFactoryName} {

    public ${clientExternalFactoryImplName}(WorkflowService.Iface service, String domain) {
		super(service, domain);
		setDataConverter(new ${workflow.dataConverter}());
	}
	
	public ${clientExternalFactoryImplName}() {
        super(null);
		setDataConverter(new ${workflow.dataConverter}());
    }
    
    public ${clientExternalFactoryImplName}(GenericWorkflowClientExternal genericClient) {
        super(genericClient);
		setDataConverter(new ${workflow.dataConverter}());
    }
	
    @Override
    protected ${clientExternalInterfaceName} createClientInstance(WorkflowExecution workflowExecution,
            StartWorkflowOptions options, DataConverter dataConverter, GenericWorkflowClientExternal genericClient) {
<#if workflow.executeMethod??>
<#assign executeMethod = workflow.executeMethod>
<#assign workflowName = executeMethod.workflowName>
        WorkflowType workflowType = new WorkflowType();
        workflowType.setName("${workflowName}");
        return new ${clientExternalImplName}(workflowExecution, workflowType, options, dataConverter, genericClient);
<#else>
        return new ${clientExternalImplName}(workflowExecution, null, options, dataConverter, genericClient);
</#if>
    }
    
}