#ifndef REPOSITORYHANDLER_H
#define REPOSITORYHANDLER_H

#include <QObject>

class RepositoryHandler : public QObject
{
    Q_OBJECT
public:
    explicit RepositoryHandler(QObject *parent = nullptr);

signals:
};

#endif // REPOSITORYHANDLER_H
