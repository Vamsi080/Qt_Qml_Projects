#ifndef DATABASE_MANAGER_H
#define DATABASE_MANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QString>
#include <QDate>
#include <QDateTime>

class database_manager : public QObject
{
    Q_OBJECT
public:
    explicit database_manager(QObject *parent = nullptr);
    ~database_manager(); //Destrcutor

    //checking_States

    bool open();
    bool close();
    bool isOpen() const;

    Q_INVOKABLE void createEmployee(const QString &employeeId, const QString &username, const QString &email, const QString &password, const QString &phoneNo, const QString &gender);

    Q_INVOKABLE bool login(const QString &employeeId, const QString &password);
    Q_INVOKABLE void createExpense(const QString &employeeId, const QString &expenseDateStr, double amount, const QString &description);
    Q_INVOKABLE void calculateMonthlyExpenses(const QString &employeeId, const QString &monthYear);
    Q_INVOKABLE double getMonthlyExpenses(const QString &employeeId, const QString &monthYear);

signals:
    void employeeCreated(bool success);
    void loginSuccessful(bool success);
    void expenseCreated(bool success);
    void monthlyExpensesCalculated(bool success);
    void monthlyExpensesRetrieved(double total);

private:
    QSqlDatabase db;
};

#endif // DATABASE_MANAGER_H
