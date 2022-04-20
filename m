Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0795D5089EC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 15:59:30 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhArd-0007ps-7G
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 09:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOF-0000P1-3X
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOD-0004mG-Bs
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zg1HRcCZu0QC+wWpJo7kYkJVX+3xsApouQ5ZfxjoZGM=;
 b=VWTfZZxVocMrzVrw8q2UO2dcvgYKiqyJ/lTl3J/zDghJBQP/5pm68o7tfzpQG/H1/gInEz
 kq2hM0HkqHsJIudsHPX3qOGX/hPYVUKPivhy2yi7yadcovwEMxkR64SNlzWL+d1X1/nbe4
 J8BuBa+Y2PquNrtL2yqjoAsaLDIGi+4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-2a-YIgUtPcOiUpANTGQKDQ-1; Wed, 20 Apr 2022 09:28:59 -0400
X-MC-Unique: 2a-YIgUtPcOiUpANTGQKDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E53DD1C05139;
 Wed, 20 Apr 2022 13:28:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A89B8145B98F;
 Wed, 20 Apr 2022 13:28:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 23/41] include: add qemu/keyval.h
Date: Wed, 20 Apr 2022 17:26:06 +0400
Message-Id: <20220420132624.2439741-24-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Do not require the whole option machinery to handle keyval, as it is
used by QAPI alone, without the option API. And match the associated
unit name.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/keyval.h             | 14 ++++++++++++++
 include/qemu/option.h             |  6 ------
 qapi/qobject-input-visitor.c      |  2 +-
 qom/object_interfaces.c           |  1 +
 softmmu/vl.c                      |  1 +
 tests/unit/check-qom-proplist.c   |  1 +
 tests/unit/test-forward-visitor.c |  2 +-
 tests/unit/test-keyval.c          |  2 +-
 util/keyval.c                     |  2 +-
 9 files changed, 21 insertions(+), 10 deletions(-)
 create mode 100644 include/qemu/keyval.h

diff --git a/include/qemu/keyval.h b/include/qemu/keyval.h
new file mode 100644
index 000000000000..2d263286d7c5
--- /dev/null
+++ b/include/qemu/keyval.h
@@ -0,0 +1,14 @@
+/*
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef KEYVAL_H_
+#define KEYVAL_H_
+
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp);
+QDict *keyval_parse(const char *params, const char *implied_key,
+                    bool *help, Error **errp);
+void keyval_merge(QDict *old, const QDict *new, Error **errp);
+
+#endif /* KEYVAL_H_ */
diff --git a/include/qemu/option.h b/include/qemu/option.h
index bbd86e1c4eab..b34982878238 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -144,12 +144,6 @@ void qemu_opts_print_help(QemuOptsList *list, bool print_caption);
 void qemu_opts_free(QemuOptsList *list);
 QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
 
-QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
-                         bool *p_help, Error **errp);
-QDict *keyval_parse(const char *params, const char *implied_key,
-                    bool *help, Error **errp);
-void keyval_merge(QDict *old, const QDict *new, Error **errp);
-
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuOpts, qemu_opts_del)
 
 #endif
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index f0b4c7ca9d39..3e8aca6b1594 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -28,7 +28,7 @@
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
 #include "qemu/cutils.h"
-#include "qemu/option.h"
+#include "qemu/keyval.h"
 
 typedef struct StackObject {
     const char *name;            /* Name of @obj in its parent, if any */
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 3b61c195c53d..f94b6c319312 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -17,6 +17,7 @@
 #include "qemu/qemu-print.h"
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
+#include "qemu/keyval.h"
 
 bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b0bf16e16aaa..8e3163a09233 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -128,6 +128,7 @@
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
+#include "qemu/keyval.h"
 
 #include "config-host.h"
 
diff --git a/tests/unit/check-qom-proplist.c b/tests/unit/check-qom-proplist.c
index ed341088d35f..79d4a8b89d38 100644
--- a/tests/unit/check-qom-proplist.c
+++ b/tests/unit/check-qom-proplist.c
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/keyval.h"
 #include "qemu/config-file.h"
 #include "qom/object_interfaces.h"
 
diff --git a/tests/unit/test-forward-visitor.c b/tests/unit/test-forward-visitor.c
index 01de15522711..eea8ffc0720e 100644
--- a/tests/unit/test-forward-visitor.c
+++ b/tests/unit/test-forward-visitor.c
@@ -15,7 +15,7 @@
 #include "qapi/qmp/qobject.h"
 #include "qapi/qmp/qdict.h"
 #include "test-qapi-visit.h"
-#include "qemu/option.h"
+#include "qemu/keyval.h"
 
 typedef bool GenericVisitor (Visitor *, const char *, void **, Error **);
 #define CAST_VISIT_TYPE(fn) ((GenericVisitor *)(fn))
diff --git a/tests/unit/test-keyval.c b/tests/unit/test-keyval.c
index af0581ae6c5b..4dc52c7a1a8b 100644
--- a/tests/unit/test-keyval.c
+++ b/tests/unit/test-keyval.c
@@ -19,7 +19,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "test-qapi-visit.h"
 #include "qemu/cutils.h"
-#include "qemu/option.h"
+#include "qemu/keyval.h"
 
 static void test_keyval_parse(void)
 {
diff --git a/util/keyval.c b/util/keyval.c
index 0cf2e84dc8d8..66a5b4740f12 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -95,8 +95,8 @@
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qstring.h"
 #include "qemu/cutils.h"
+#include "qemu/keyval.h"
 #include "qemu/help_option.h"
-#include "qemu/option.h"
 
 /*
  * Convert @key to a list index.
-- 
2.35.1.693.g805e0a68082a


