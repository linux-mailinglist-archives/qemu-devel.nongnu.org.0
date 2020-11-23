Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA52C14CF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:55:12 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHvb-0003Ly-Pk
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpT-0006Hj-1o
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpR-0007nW-6l
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+am16SMzOkZedLb5QC0zdtv7tBIX1dgj7b9ouOfr9c=;
 b=PqHNKLuQMr7dQDmuhlCaF/64ZqLEocPGT+CmGWJ2w41yAZfd3se57CdP7tJxOSPUzqRVdA
 Deu9TnWDNKq7eEqia43Whvtbiv2JQpQQBwiZomo6H3F05UU9+Pksc0B+rQxgBZVVE/f9f2
 js9ojyq7K7pSLbz/R/uiCjYNDlA9rHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-KmkHOSEYNwqiEW-QAfiQ8w-1; Mon, 23 Nov 2020 14:48:46 -0500
X-MC-Unique: KmkHOSEYNwqiEW-QAfiQ8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D116C1015214
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:37 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED24460873;
 Mon, 23 Nov 2020 19:48:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/19] qlit: Rename QLIT_QNUM to QLIT_QNUM_INT
Date: Mon, 23 Nov 2020 14:48:05 -0500
Message-Id: <20201123194818.2773508-7-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the existing QLIT_QNUM macro to indicate it only supports
signed int values.  We're going to add support to other types of
QNums later.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.

In v2, the existing QLIT_QNUM() macro was being kept, now it is
replaced by QLIT_QNUM_INT().
---
 include/qapi/qmp/qlit.h |  2 +-
 tests/check-qjson.c     | 30 +++++++++++++++---------------
 tests/check-qlit.c      | 10 +++++-----
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
index c0676d5daf..2fc2db282e 100644
--- a/include/qapi/qmp/qlit.h
+++ b/include/qapi/qmp/qlit.h
@@ -39,7 +39,7 @@ struct QLitDictEntry {
     { .type = QTYPE_QNULL }
 #define QLIT_QBOOL(val) \
     { .type = QTYPE_QBOOL, .value.qbool = (val) }
-#define QLIT_QNUM(val) \
+#define QLIT_QNUM_INT(val) \
     { .type = QTYPE_QNUM, .value.qnum = (val) }
 #define QLIT_QSTR(val) \
     { .type = QTYPE_QSTRING, .value.qstr = (val) }
diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 07a773e653..bc5b7ebdf3 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -1062,7 +1062,7 @@ static void simple_dict(void)
         {
             .encoded = "{\"foo\": 42, \"bar\": \"hello world\"}",
             .decoded = QLIT_QDICT(((QLitDictEntry[]){
-                        { "foo", QLIT_QNUM(42) },
+                        { "foo", QLIT_QNUM_INT(42) },
                         { "bar", QLIT_QSTR("hello world") },
                         { }
                     })),
@@ -1074,7 +1074,7 @@ static void simple_dict(void)
         }, {
             .encoded = "{\"foo\": 43}",
             .decoded = QLIT_QDICT(((QLitDictEntry[]){
-                        { "foo", QLIT_QNUM(43) },
+                        { "foo", QLIT_QNUM_INT(43) },
                         { }
                     })),
         },
@@ -1160,15 +1160,15 @@ static void simple_list(void)
         {
             .encoded = "[43,42]",
             .decoded = QLIT_QLIST(((QLitObject[]){
-                        QLIT_QNUM(43),
-                        QLIT_QNUM(42),
+                        QLIT_QNUM_INT(43),
+                        QLIT_QNUM_INT(42),
                         { }
                     })),
         },
         {
             .encoded = "[43]",
             .decoded = QLIT_QLIST(((QLitObject[]){
-                        QLIT_QNUM(43),
+                        QLIT_QNUM_INT(43),
                         { }
                     })),
         },
@@ -1217,35 +1217,35 @@ static void simple_whitespace(void)
         {
             .encoded = " [ 43 , 42 ]",
             .decoded = QLIT_QLIST(((QLitObject[]){
-                        QLIT_QNUM(43),
-                        QLIT_QNUM(42),
+                        QLIT_QNUM_INT(43),
+                        QLIT_QNUM_INT(42),
                         { }
                     })),
         },
         {
             .encoded = "\t[ 43 , { 'h' : 'b' },\r\n\t[ ], 42 ]\n",
             .decoded = QLIT_QLIST(((QLitObject[]){
-                        QLIT_QNUM(43),
+                        QLIT_QNUM_INT(43),
                         QLIT_QDICT(((QLitDictEntry[]){
                                     { "h", QLIT_QSTR("b") },
                                     { }})),
                         QLIT_QLIST(((QLitObject[]){
                                     { }})),
-                        QLIT_QNUM(42),
+                        QLIT_QNUM_INT(42),
                         { }
                     })),
         },
         {
             .encoded = " [ 43 , { 'h' : 'b' , 'a' : 32 }, [ ], 42 ]",
             .decoded = QLIT_QLIST(((QLitObject[]){
-                        QLIT_QNUM(43),
+                        QLIT_QNUM_INT(43),
                         QLIT_QDICT(((QLitDictEntry[]){
                                     { "h", QLIT_QSTR("b") },
-                                    { "a", QLIT_QNUM(32) },
+                                    { "a", QLIT_QNUM_INT(32) },
                                     { }})),
                         QLIT_QLIST(((QLitObject[]){
                                     { }})),
-                        QLIT_QNUM(42),
+                        QLIT_QNUM_INT(42),
                         { }
                     })),
         },
@@ -1275,11 +1275,11 @@ static void simple_interpolation(void)
     QObject *embedded_obj;
     QObject *obj;
     QLitObject decoded = QLIT_QLIST(((QLitObject[]){
-            QLIT_QNUM(1),
+            QLIT_QNUM_INT(1),
             QLIT_QSTR("100%"),
             QLIT_QLIST(((QLitObject[]){
-                        QLIT_QNUM(32),
-                        QLIT_QNUM(42),
+                        QLIT_QNUM_INT(32),
+                        QLIT_QNUM_INT(42),
                         {}})),
             {}}));
 
diff --git a/tests/check-qlit.c b/tests/check-qlit.c
index 58ceaae5a3..24ac21395c 100644
--- a/tests/check-qlit.c
+++ b/tests/check-qlit.c
@@ -17,12 +17,12 @@
 #include "qapi/qmp/qstring.h"
 
 static QLitObject qlit = QLIT_QDICT(((QLitDictEntry[]) {
-    { "foo", QLIT_QNUM(42) },
+    { "foo", QLIT_QNUM_INT(42) },
     { "bar", QLIT_QSTR("hello world") },
     { "baz", QLIT_QNULL },
     { "bee", QLIT_QLIST(((QLitObject[]) {
-        QLIT_QNUM(43),
-        QLIT_QNUM(44),
+        QLIT_QNUM_INT(43),
+        QLIT_QNUM_INT(44),
         QLIT_QBOOL(true),
         { },
     }))},
@@ -30,7 +30,7 @@ static QLitObject qlit = QLIT_QDICT(((QLitDictEntry[]) {
 }));
 
 static QLitObject qlit_foo = QLIT_QDICT(((QLitDictEntry[]) {
-    { "foo", QLIT_QNUM(42) },
+    { "foo", QLIT_QNUM_INT(42) },
     { },
 }));
 
@@ -72,7 +72,7 @@ static void qlit_equal_large_qnum_test(void)
     /* 2^32 */
     QNum *too_large = qnum_from_uint(9223372036854775808ULL);
     QNum *dbl = qnum_from_double(9223372036854775808.0);
-    QLitObject qlit_large = QLIT_QNUM(9223372036854775807LL);
+    QLitObject qlit_large = QLIT_QNUM_INT(9223372036854775807LL);
 
     g_assert(qlit_equal_qobject(&qlit_large, QOBJECT(large)));
     g_assert(!qlit_equal_qobject(&qlit_large, QOBJECT(too_large)));
-- 
2.28.0


