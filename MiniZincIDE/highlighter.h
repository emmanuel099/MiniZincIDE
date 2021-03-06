/*
 *  Author:
 *     Guido Tack <guido.tack@monash.edu>
 *
 *  Copyright:
 *     NICTA 2013
 */

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef HIGHLIGHTER_H
#define HIGHLIGHTER_H

#include <QSyntaxHighlighter>
#include <QTextCharFormat>
#include <QTextDocument>

struct Bracket {
    QChar b;
    int pos;
};

class BracketData : public QTextBlockUserData
{
public:
    QVector<Bracket> brackets;
};

struct FixedBg {
  unsigned int sl;
  unsigned int sc;
  unsigned int el;
  unsigned int ec;
};
typedef QMap<FixedBg, QPair<QColor, QString> > BgMap;
inline bool operator<(const FixedBg& A, const FixedBg& B) {
  return A.sl < B.sl || A.sc < B.sc || A.el < B.el || A.ec < B.ec;
}

class Highlighter : public QSyntaxHighlighter
{
    Q_OBJECT

public:
    Highlighter(QFont& font, bool darkMode, QTextDocument *parent = 0);
    void setEditorFont(QFont& font);
    void copyHighlightedToClipboard(QTextCursor selectionCursor);
    void setDarkMode(bool);
    void addFixedBg(unsigned int sl, unsigned int sc, unsigned int el, unsigned ec, QColor colour, QString tip);
    void clearFixedBg();
protected:
    void highlightBlock(const QString &text);

private:
    struct Rule
    {
        QRegExp pattern;
        QTextCharFormat format;
    };
    QVector<Rule> rules;

    BgMap fixedBg;

    QTextCharFormat quoteFormat;
    QTextCharFormat commentFormat;
    QRegExp commentStartExp;
    QRegExp commentEndExp;
    bool darkMode;

};

#endif // HIGHLIGHTER_H
