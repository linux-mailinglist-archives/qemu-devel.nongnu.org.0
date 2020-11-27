Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0E2C6BD8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:12:07 +0100 (CET)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijA6-0003fv-2d
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiif4-00041o-Ot
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:40:02 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:54257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiif0-0002EE-Cz
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:40:02 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDQqk-1ktCF033oM-00AZNi for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020
 19:39:56 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts: minikconf: support config titles
Date: Fri, 27 Nov 2020 19:39:56 +0100
Message-Id: <20201127183956.11311-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:ZRWLrxqxHkRqrOT58NTOyjiI5N38TzmZAqv9ASjS7H5aH3zBUuC
 x/qFNtUBfFHydDpIicnzoA4ndygYQIZHHkAhCMJe5EizKzEsVs+UiPYB9DcxdXN1SNondY0
 VsylHD/XEYr/Y7WYCJC9SoVC+yeRCidPKaIJWs/KFK6fTR3xeoyvYcEnoENlaU+ouYxQ7JU
 c5u7/3PKa++s42eK0vdQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Aso1z0DzrNo=:m1eJFudYYAyRKghi5YXwBB
 iaZHmtdXrtG0+OKYlhbNKfx5NNJfCI+F+sol7izjlbU5Du2B2p7pgiGrdDp/uFalL3RiJ54ol
 jRMVkZzI95T5mRnjd8q8y5i0dTt9qDTT4plO6XfmATMIMqIiAnUdi/pB4SM74l1VgqBNZQavj
 Lkp4Np8L+34XRYoKrR/iWpIL1qMMwg6C89u6F7pFqzviioTphGNYFU5IFeBp+48tGzuLOwV18
 M6OZmD1pSsrcFBffmL21IpCfdxwCEOvzWEsNX0m76HvBxMPsrCVOwmDNyaN8rBwSYfEG52Kzs
 C4vOnBWhJgQGEvlMhO8w13CkL3spDIxwpeR9EwI23LwcW3Byjnl96lBzRHIEJrtmqIa2iLnHt
 1KPdMAAzTXuUzdOEVsiuoKTwXnWhR4MgKgvBvsBMSCeV5kfqAbNA8xSkQclnw
Received-SPF: none client-ip=212.227.126.135; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


