#include "database_manager.h"
#include <QDebug>

database_manager::database_manager(QObject *parent) : QObject{parent}{

    db= QSqlDatabase :: addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("AiraaCorporates");
    db.setUserName("root");
    db.setPassword("Vamsi08@");
}

database_manager::~database_manager()
{
    close();
}

bool database_manager::open()
{
    if(!db.open()){
        qDebug()<<"Failed to open DataBase: "<<db.lastError().text();
        return false;
    }
    return true;
}

bool database_manager::close()
{
    if(db.isOpen()){
        db.close();
    }
}

bool database_manager::isOpen() const
{
    return db.isOpen();
}

void database_manager::createEmployee(const QString &employeeId, const QString &username, const QString &email, const QString &password, const QString &phoneNo, const QString &gender)
{
    if(!isOpen()){
        emit employeeCreated(false);
        return;
    }

    QSqlQuery query;
    query.prepare("INSERT INTO Employee (employee_id, username, email, password, phone_number, gender) "
                  "VALUES (:employee_id, :username, :email, :password, :phone_number, :gender)");

    query.bindValue(":employee_id", employeeId);
    query.bindValue(":username",username);
    query.bindValue(":email", email);
    query.bindValue(":password", password);
    query.bindValue(":phone_number", phoneNo);
    query.bindValue(":gender", gender);

    bool success = query.exec();
    emit employeeCreated(success);
}

bool database_manager::login(const QString &employeeId, const QString &password)
{

    if(!isOpen()){
        emit loginSuccessful(false);
        return false;
    }

    QSqlQuery query;
    query.prepare("SELECT password FROM Employee WHERE employee_id = :employee_id");
    query.bindValue(":employee_id", employeeId);

    if(!query.exec()||!query.next()){
        emit loginSuccessful(false);
        return false;
    }

    QString dbpassword = query.value(0).toString();
    bool success = (dbpassword == password);
    emit loginSuccessful(success);
    return success;
}

void database_manager::createExpense(const QString &employeeId, const QString &expenseDateStr, double amount, const QString &description)
{
    if(!open()){
        emit expenseCreated(false);
        return;
    }

    QDate expenseDate = QDate::fromString(expenseDateStr, "yyyy-MM-dd");

    if (!expenseDate.isValid()) {
        emit expenseCreated(false);
        return;
    }

    QSqlQuery query;
    query.prepare("INSERT INTO Expenses (employee_id, expense_date, amount, description) "
                  "VALUES (:employee_id, :expense_date, :amount, :description)");
    query.bindValue(":employee_id", employeeId);
    query.bindValue(":expense_date", expenseDate);
    query.bindValue(":amount", amount);
    query.bindValue(":description", description);
    bool success = query.exec();
    emit expenseCreated(success);
}


void database_manager::calculateMonthlyExpenses(const QString &employeeId, const QString &monthYear)
{
    if(!open()){
        emit monthlyExpensesCalculated(false);
        return;
    }

    QSqlQuery query;
    query.prepare("INSERT INTO MonthlyExpenses (employee_id, month_year, total_expenses) "
                  "SELECT :employee_id, :month_year, SUM(amount) "
                  "FROM Expenses "
                  "WHERE expense_date BETWEEN :start_date AND :end_date "
                  "GROUP BY employee_id " "ON DUPLICATE KEY UPDATE total_expenses = VALUES(total_expenses)");
    query.bindValue(":employee_id", employeeId);
    query.bindValue(":month_year", monthYear);
    query.bindValue(":start_date", monthYear + "-01");
    query.bindValue(":end_date", monthYear + "-31");

    bool success = query.exec();
    emit monthlyExpensesCalculated(success);
}

double database_manager::getMonthlyExpenses(const QString &employeeId, const QString &monthYear)
{
    if(!isOpen()){
        emit monthlyExpensesRetrieved(0);
        return 0;
    }

    QSqlQuery query;

    query.prepare("SELECT total_expenses FROM MonthlyExpenses WHERE employee_id = :employee_id AND month_year = :month_year");
    query.bindValue(":employee_id", employeeId);
    query.bindValue(":month_year", monthYear);

    if(!query.exec() || !query.next()){
        emit monthlyExpensesRetrieved(0);
        return 0;
    }

    double total = query.value(0).toDouble();
    emit monthlyExpensesRetrieved(total);
    return total;
}
