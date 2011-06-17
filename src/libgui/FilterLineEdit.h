/****************************************************************************
**
** Copyright (c) 2007 Trolltech ASA <info@trolltech.com>
**
** Use, modification and distribution is allowed without limitation,
** warranty, liability or support of any kind.
**
****************************************************************************/

#ifndef FilterLineEdit_h
#define FilterLineEdit_h

#include <QLineEdit>

class QToolButton;

class FilterLineEdit : public QLineEdit
{
    Q_OBJECT

public:
    FilterLineEdit(QWidget *parent = 0);

protected:
    void resizeEvent(QResizeEvent *);

private slots:
    void updateCloseButton(const QString &text);

private:
    QToolButton *clearButton;
};

#endif  /* FilterLineEdit_h */
