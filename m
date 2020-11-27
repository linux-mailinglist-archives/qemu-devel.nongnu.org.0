Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23472C6BCB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:06:38 +0100 (CET)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kij4n-0006DG-Hp
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUn-0007KP-6l
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:25 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUl-00073c-BC
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:24 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MI4gb-1kxL4L0Dnb-00FG2i; Fri, 27 Nov 2020 19:29:18 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: mst@redhat.com, ehabkost@redhat.com, crosa@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 1/5] scripts: minikconf: support config titles
Date: Fri, 27 Nov 2020 19:29:13 +0100
Message-Id: <20201127182917.2387-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:OuaTerzzvNagYuqlNfw7vkn8/kL6ypSN/V9m8rxluxhjbMVDcS2
 sJDwjYexfdGgP/sQCin4k7BDk1yl3uSAvIxkVWptVm5KfPBZyTfXSo9DXbQMv3kllGf26mW
 nu0NegApLoPsK7a3e9gZedSjruO5XnvKnHTnqR5TRq7k6gwg4fZLoyVeV1rCX38l/TNYO9U
 7A3Djdb8IHew89q3yQoYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3jbbhP5G9xU=:c4QcDBdJmctPXN8CJUVHEV
 0SrxIqyhb7fI7AnEupPrNtZQiW0GC9oG6otqigqe+DfHKCJ8R92CKuYp9Gh6s1MPuqDW1wRgR
 eQ/eiJYBc97ZHvR5oHhEMX8wpHrb8A5IynUQt9d/MdUU1N58JyA73eKhjDbNx/QHTyHSEeaKr
 QJr5W4TRn8B/WNEaMBAaR6cgGwWvtJLX+FqH8fbHU48X6w9tL/9wHTzwEkW26ukaWz8dfRQ/s
 EgKXfmpG+eVb6gpg0Iw+3hjFIlZQ7Lz9yv22phZO/mR6oaghoN0nSpTQMFm+75DedknXPRXaa
 +/PqRMj0vbMv3+kPcpC6X4BJpGal3/KXAU374QI0d72WZK09YsVFa5jx3faiIHJkFASq5qOoh
 DtjdXvMWdkAirug5McvZjsvtUCKN98Pe2VevBSMHU4xhdZqez0FGgvkDMzMFC
Received-SPF: none client-ip=217.72.192.75; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:04:07 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for config option titles, like the real kconfig does.
Even though they're not presented anywhere yet (since minikconf
only acts in the background), it's good to have them supported,
so we can start adding descriptions in the Kconfig files.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/minikconf.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index bcd91015d3..28c67906cb 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -206,6 +206,7 @@ class KconfigData:
         self.defined_vars = set()
         self.referenced_vars = dict()
         self.clauses = list()
+        self.title = None
 
     # semantic analysis -------------
 
@@ -290,6 +291,9 @@ class KconfigData:
         cond = (cond & var) if cond is not None else var
         self.clauses.append(KconfigData.SelectClause(symbol, cond))
 
+    def do_title(self, title):
+        self.title = title
+
     def do_imply(self, var, symbol, cond=None):
         # "config X imply Y [if COND]" is the same as
         # "config Y default y if X [&& COND]"
@@ -323,6 +327,7 @@ TOK_BOOL = 15;    TOKENS[TOK_BOOL] = '"bool"';
 TOK_IF = 16;      TOKENS[TOK_IF] = '"if"';
 TOK_ID = 17;      TOKENS[TOK_ID] = 'identifier';
 TOK_EOF = 18;     TOKENS[TOK_EOF] = 'end of file';
+TOK_QUOTED = 19;  TOKENS[TOK_QUOTED] = 'quoted string';
 
 class KconfigParserError(Exception):
     def __init__(self, parser, msg, tok=None):
@@ -501,6 +506,7 @@ class KconfigParser:
     # property: DEFAULT y_or_n condition
     #       | DEPENDS ON expr
     #       | SELECT var condition
+    #       | BOOL "comment"
     #       | BOOL
     def parse_property(self, var):
         if self.tok == TOK_DEFAULT:
@@ -526,6 +532,9 @@ class KconfigParser:
             self.data.do_imply(var, symbol, cond)
         elif self.tok == TOK_BOOL:
             self.get_token()
+            if self.tok == TOK_QUOTED:
+                self.data.do_title(self.val)
+                self.get_token()
         else:
             raise KconfigParserError(self, 'Error in recursive descent?')
 
@@ -645,6 +654,11 @@ class KconfigParser:
             self.cursor = self.src.find('\n', self.cursor)
             self.val = self.src[start:self.cursor]
             return TOK_SOURCE
+        elif self.tok == '"':
+            start = self.cursor
+            self.cursor = self.src.find('"', self.cursor)+1
+            self.val = self.src[start:self.cursor]
+            return TOK_QUOTED;
         elif self.tok.isalnum():
             # identifier
             while self.src[self.cursor].isalnum() or self.src[self.cursor] == '_':
-- 
2.11.0


