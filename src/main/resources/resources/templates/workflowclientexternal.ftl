<#include "header.ftl">
<#import "common.ftl" as lib>
package ${packageName};

import com.amazonaws.services.simpleworkflow.flow.StartWorkflowOptions;
import com.amazonaws.services.simpleworkflow.flow.WorkflowClientExternal;
import com.amazonaws.services.simpleworkflow.flow.WorkflowExecutionAlreadyStartedException;

/**
 * Generated from {@link ${qualifiedTypeName}}. 
 * Used to start workflow executions or send signals from outside of the scope of a workflow.
 * Created through {@link ${clientExternalFactoryName}#getClient}.
 * <p>
 * When starting child workflow from a parent workflow use {@link ${clientInterfaceName}} instead.
 */
public interface ${clientExternalInterfaceName} extends WorkflowClientExternal
<#list workflow.superTypes as superType>
    , ${superType.qualifiedName}ClientExternal
</#list>
{
<#if workflow.executeMethod??>
<#assign executeMethod = workflow.executeMethod>
<#if (executeMethod.methodParameters?size == 0)>

    /**
     * Generated from {@link ${qualifiedTypeName}#${executeMethod.methodName}}
     */
    void ${executeMethod.methodName}() throws WorkflowExecutionAlreadyStartedException;

    /**
     * Generated from {@link ${qualifiedTypeName}#${executeMethod.methodName}}
     */
    void ${executeMethod.methodName}(StartWorkflowOptions optionsOverride) throws WorkflowExecutionAlreadyStartedException;
<#else>

    /**
     * Generated from {@link ${qualifiedTypeName}#${executeMethod.methodName}}
     */
    void ${executeMethod.methodName}(<@lib.printParameters executeMethod/>) throws WorkflowExecutionAlreadyStartedException;

    /**
     * Generated from {@link ${qualifiedTypeName}#${executeMethod.methodName}}
     */
    void ${executeMethod.methodName}(<@lib.printParameters executeMethod/>, StartWorkflowOptions optionsOverride) throws WorkflowExecutionAlreadyStartedException;
</#if>
</#if>
<#list workflow.signals as signalMethod>

    /**
     * Generated from {@link ${qualifiedTypeName}#${signalMethod.methodName}}
     */
    void ${signalMethod.methodName}(<@lib.printParameters signalMethod/>);
</#list>
<#if workflow.getStateMethod??>
<#assign getStateMethod = workflow.getStateMethod>

    /**
     * Generated from {@link ${qualifiedTypeName}#${getStateMethod.methodName}}
     */
    ${getStateMethod.methodReturnTypeUnboxed} ${getStateMethod.methodName}() <@lib.printThrows getStateMethod/>;
</#if>
}