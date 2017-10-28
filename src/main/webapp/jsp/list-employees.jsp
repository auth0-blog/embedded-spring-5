<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h2>Employees</h2>
    <!--Search Form -->
    <form action="/employee" method="get" id="seachEmployeeForm" role="form">
        <input type="hidden" id="searchAction" name="searchAction" value="searchByName">
        <div class="form-group col-xs-5">
            <input type="text" name="employeeName" id="employeeName" class="form-control" required="true"
                   placeholder="Type the Name or Last Name of the employee"/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
        <br></br>
        <br></br>
    </form>

    <!--Employees List-->
    <form action="/employee" method="post" id="employeeForm" role="form">

        <c:choose>
            <c:when test="${not empty employeeList}">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td>#</td>
                        <td>Name</td>
                        <td>Last name</td>
                        <td>Birth date</td>
                        <td>Role</td>
                        <td>Department</td>
                        <td>E-mail</td>
                    </tr>
                    </thead>
                    <c:forEach var="employee" items="${employeeList}">
                        <c:set var="classSucess" value=""/>
                        <c:if test="${idEmployee == employee.id}">
                            <c:set var="classSucess" value="info"/>
                        </c:if>
                        <tr class="${classSucess}">
                            <td>${employee.id}</td>
                            <td>${employee.name}</td>
                            <td>${employee.lastName}</td>
                            <td>${employee.birthDate}</td>
                            <td>${employee.role}</td>
                            <td>${employee.department}</td>
                            <td>${employee.email}</td>

                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <br>
                <div class="alert alert-info">
                    No people found matching your search criteria
                </div>
            </c:otherwise>
        </c:choose>
    </form>

</div>
</body>
</html>