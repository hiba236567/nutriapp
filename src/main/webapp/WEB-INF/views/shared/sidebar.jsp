<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<nav class="sidebar" role="navigation" aria-label="Main Navigation">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/images/logoo.png" 
             alt="Profile Picture" 
             class="profile-picture lazy-load">
        <h2>${user.name}</h2>
        <p>${user.role}</p>
    </div>
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/dashboard" 
               class="${pageName eq 'dashboard' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-home"></i> Dashboard
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/profile" 
               class="${pageName eq 'profile' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-user"></i> Profile
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/meal-plans" 
               class="${pageName eq 'meal-plans' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-utensils"></i> Meal Plans
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/progress" 
               class="${pageName eq 'progress' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-chart-line"></i> Progress
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/messages" 
               class="${pageName eq 'messages' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-comments"></i> Messages 
               <c:if test="${not empty unreadMessages}">
                   <span class="notification-badge">${unreadMessages}</span>
               </c:if>
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/appointments" 
               class="${pageName eq 'appointments' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-calendar"></i> Appointments
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/settings" 
               class="${pageName eq 'settings' ? 'active' : ''}" 
               role="menuitem">
               <i class="fas fa-cog"></i> Settings
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/logout" 
               role="menuitem">
               <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </li>
    </ul>
</nav> 