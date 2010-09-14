<%--
  - Author: isv
  - Version: 1.1
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page fragment is to be included to all pages from TC Direct application.
  - It renders the common page headers.
  -
  - Version 1.1 (Direct Permissions Setting Back-end and Integration Assembly 1.0) changes: added Permissions tab for
  - dahsboard pages.
--%>
<%@ page import="com.topcoder.direct.services.view.action.cloudvm.DashboardVMAction" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>

<div id="header">
    <c:choose>
        <c:when test="${requestScope.PAGE_TYPE eq 'dashboard'}">
            <a href="<s:url action="dashboardActive" namespace="/"/>" class="logo">
                <img src="/images/dashboard_logo.png" alt="Direct Dashboard" /></a>
        </c:when>
        <c:when test="${requestScope.PAGE_TYPE eq 'launch'}">
            <a href="javascript:;" class="logo">
                <img src="/images/launghContent_logo.png" alt="Launch Contest" /></a>
        </c:when>
        <c:otherwise>
            <a href="<s:url action="currentProjectOverview" namespace="/"/>" class="logo projectLogo">
                <s:property value="sessionData.currentProjectContext.name"/>
            </a>
        </c:otherwise>
    </c:choose>

    <div id="tabs0"><!-- the left tabs -->
        <ui:isDashboardPage>
            <ul>
                <li class="on">
                    <a href="<s:url action="dashboardActive" namespace="/"/>"><span>Dashboard</span></a>
                </li>
				<li>
                    <a href="<s:url action="allProjects" namespace="/"/>"><span>Projects</span></a>
                </li>

				<!--
                <li><a href="#" onclick="return false;"><span>CoPilots</span></a></li>
				<li><a href="#"><span>Messages (0)</span></a></li>
				-->
            </ul>
        </ui:isDashboardPage>
        <ui:isProjectPage>
            <ul>
                <li>
                    <a href="<s:url action="dashboardActive" namespace="/"/>"><span>Dashboard</span></a>
                </li>

				<li class="on">
                     <a href="<s:url action="allProjects" namespace="/"/>"><span>Projects</span></a>
                </li>

				<!--
                <li><a href="#" onclick="return false;"><span>CoPilots</span></a></li>
				<li><a href="#"><span>Messages (0)</span></a></li>
				-->
            </ul>
        </ui:isProjectPage>
        <c:if test="${requestScope.PAGE_TYPE eq 'launch'}">
            <ul>
                <li class="on">
                    <a href="<s:url action="dashboard" namespace="/"/>"><span>Dashboard</span></a>
                </li>

				<li>
                     <a href="<s:url action="allProjects" namespace="/"/>"><span>Projects</span></a>
                </li>

				<!--
                <li><a href="#" onclick="return false;"><span>CoPilots</span></a></li>
				<li><a href="#"><span>Messages (0)</span></a></li>
				-->
            </ul>
        </c:if>
    </div><!-- End #tabs0 -->
	
	<div class="helloUser">
        <ul>
            <li>
                <strong>Hello</strong> <link:currentUser/>|
            </li>
            <li><a href="<s:url action="logout" namespace="/"/>">Logout</a>|</li>
            <li><link:help/></li>
        </ul>
    </div><!-- End .helloUSer -->

	<c:if test="${requestScope.CURRENT_TAB eq 'overview'}">
		<s:set name="projId" value="viewData.projectStats.project.id"/>  
	</c:if>
	<c:if test="${requestScope.CURRENT_TAB eq 'contests'}">
		<s:set name="projId" value="viewData.contestStats.contest.project.id"/>  
	</c:if>	
	
    <ui:isProjectPage>
        <div id="tabs1">
             <ul>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'overview'}">class="on"</c:if>>
            		<a href="<s:url action="projectOverview" namespace="/"><s:param name="formData.projectId" value="%{#session.currentProject.id}"/></s:url>">
						<span>Overview</span>
					</a>
                </li>

                <li <c:if test="${requestScope.CURRENT_TAB eq 'contests'}">class="on"</c:if>>
           			<a href="<s:url action="projectDetails" namespace="/"><s:param name="formData.projectId" value="%{#session.currentProject.id}"/></s:url>">
						<span>Contests</span>
					</a>
                </li>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'gameplan'}">class="on"</c:if>>
                    <a href="<s:url action="ProjectGamePlanView" namespace="/"> <s:param name="formData.projectId" value="%{#session.currentProject.id}" /></s:url>"><span>Game Plan</span></a>
                </li>
            </ul>
        </div>
    </ui:isProjectPage>

    <ui:isDashboardPage>
        <div id="tabs1">
             <ul>
				<li <c:if test="${requestScope.CURRENT_TAB eq 'active'}">class="on"</c:if>>
                    <a href="<s:url action="dashboardActive" namespace="/"/>"><span class="dashboardSpan">Active Contests</span></a>
                </li>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'dashboard'}">class="on"</c:if>>
                    <a href="<s:url action="dashboard" namespace="/"/>"><span class="dashboardSpan">Upcoming Activities</span></a>
                </li>

                <li <c:if test="${requestScope.CURRENT_TAB eq 'latest'}">class="on"</c:if>>
                    <a href="<s:url action="dashboardLatest" namespace="/"/>"><span class="dashboardSpan">Latest Activities</span></a>
                </li>
             </ul>
        </div>
            
     </ui:isDashboardPage>

    
    <div id="tabs2"><!-- tabs on the right side-->
        <ul>
          
            <li <c:if test="${requestScope.CURRENT_TAB eq 'search'}">class="on"</c:if>>
                <a href="<s:url action="dashboardSearchView" namespace="/"/>"><span>Search</span></a>
            </li>
            <li <c:if test="${requestScope.CURRENT_TAB eq 'settings'}">class="on"</c:if>>
                <a href="<s:url action="dashboardNotifications" namespace="/"/>"><span>Settings</span></a>
            </li>
            
            <%
                if (DashboardVMAction.isApplicable()) {
            %>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'VM Management'}">class="on"</c:if>>
                    <a href="<s:url action="dashboardVMAction" namespace="/"/>"><span>VM Management</span></a>
                </li>
            <%
                }
            %>
        </ul>
    </div><!-- End #tabs2 -->
</div><!-- End #header -->
