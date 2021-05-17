Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0030382C02
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:23:03 +0200 (CEST)
Received: from localhost ([::1]:44080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licH0-0000Ju-Mc
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1licDY-0006Ql-E0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1licDT-0007jG-3r
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621253962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1Jrva8vudo21DlZoI/Lt2l8LbSnN9L9urf7Y+evK0xk=;
 b=iC+wykc+5ap7RxQOAS8e6F1fIbGFcNONMRijRQj9L41C07Kj5uFB5M9DyM6njh30C6GsEx
 +ikPDv0W2jQ0VYRzkPr4SqpBollxLyGmxOvbR692E+I0ONgHqsaK7NNe5Hq0lzXdE/n5tl
 ouKdI/DDf5t52H7K3Hc/j3lkdiiwDEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-_GWJFcdhMh2UPIYF4qnysA-1; Mon, 17 May 2021 08:19:09 -0400
X-MC-Unique: _GWJFcdhMh2UPIYF4qnysA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBDAD107ACCD
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 12:19:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A988B5DDAD
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 12:19:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] remove qemu-options* from root directory
Date: Mon, 17 May 2021 08:19:08 -0400
Message-Id: <20210517121908.2624991-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These headers are also included from softmmu/vl.c, so they should be
in include/.  Removing qemu-options-wrapper.h, since elsewhere
we include "template" headers directly and #define the parameters in
the including file, and move qemu-options.h to include/.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.h => include/qemu/qemu-options.h |  9 ++++-
 os-posix.c                                    |  2 +-
 os-win32.c                                    |  1 -
 qemu-options-wrapper.h                        | 40 -------------------
 qemu-options.hx                               |  4 ++
 softmmu/vl.c                                  | 24 ++++++++---
 6 files changed, 31 insertions(+), 49 deletions(-)
 rename qemu-options.h => include/qemu/qemu-options.h (88%)
 delete mode 100644 qemu-options-wrapper.h

diff --git a/qemu-options.h b/include/qemu/qemu-options.h
similarity index 88%
rename from qemu-options.h
rename to include/qemu/qemu-options.h
index b4ee63cd60..4a62c83c45 100644
--- a/qemu-options.h
+++ b/include/qemu/qemu-options.h
@@ -29,8 +29,13 @@
 #define QEMU_OPTIONS_H
 
 enum {
-#define QEMU_OPTIONS_GENERATE_ENUM
-#include "qemu-options-wrapper.h"
+
+#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
+    opt_enum,
+#define DEFHEADING(text)
+#define ARCHHEADING(text, arch_mask)
+
+#include "qemu-options.def"
 };
 
 #endif
diff --git a/os-posix.c b/os-posix.c
index a6846f51c1..ae6c9f2a5e 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -32,7 +32,7 @@
 #include "qemu-common.h"
 /* Needed early for CONFIG_BSD etc. */
 #include "net/slirp.h"
-#include "qemu-options.h"
+#include "qemu/qemu-options.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "sysemu/runstate.h"
diff --git a/os-win32.c b/os-win32.c
index fd1137bab1..e31c921983 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -27,7 +27,6 @@
 #include <windows.h>
 #include <mmsystem.h>
 #include "qemu-common.h"
-#include "qemu-options.h"
 #include "sysemu/runstate.h"
 
 static BOOL WINAPI qemu_ctrl_handler(DWORD type)
diff --git a/qemu-options-wrapper.h b/qemu-options-wrapper.h
deleted file mode 100644
index 6f548e3922..0000000000
--- a/qemu-options-wrapper.h
+++ /dev/null
@@ -1,40 +0,0 @@
-
-#if defined(QEMU_OPTIONS_GENERATE_ENUM)
-
-#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
-    opt_enum,
-#define DEFHEADING(text)
-#define ARCHHEADING(text, arch_mask)
-
-#elif defined(QEMU_OPTIONS_GENERATE_HELP)
-
-#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)    \
-    if ((arch_mask) & arch_type)                               \
-        fputs(opt_help, stdout);
-
-#define ARCHHEADING(text, arch_mask) \
-    if ((arch_mask) & arch_type)    \
-        puts(stringify(text));
-
-#define DEFHEADING(text) ARCHHEADING(text, QEMU_ARCH_ALL)
-
-#elif defined(QEMU_OPTIONS_GENERATE_OPTIONS)
-
-#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
-    { option, opt_arg, opt_enum, arch_mask },
-#define DEFHEADING(text)
-#define ARCHHEADING(text, arch_mask)
-
-#else
-#error "qemu-options-wrapper.h included with no option defined"
-#endif
-
-#include "qemu-options.def"
-
-#undef DEF
-#undef DEFHEADING
-#undef ARCHHEADING
-
-#undef QEMU_OPTIONS_GENERATE_ENUM
-#undef QEMU_OPTIONS_GENERATE_HELP
-#undef QEMU_OPTIONS_GENERATE_OPTIONS
diff --git a/qemu-options.hx b/qemu-options.hx
index ecdb064409..8116f79818 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5276,3 +5276,7 @@ ERST
 
 
 HXCOMM This is the last statement. Insert new options before this line!
+
+#undef DEF
+#undef DEFHEADING
+#undef ARCHHEADING
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 11ac3750d8..ac0ff6e160 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -88,7 +88,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
-#include "qemu-options.h"
+#include "qemu/qemu-options.h"
 #include "qemu/main-loop.h"
 #ifdef CONFIG_VIRTFS
 #include "fsdev/qemu-fsdev.h"
@@ -854,8 +854,17 @@ static void help(int exitcode)
            "'disk_image' is a raw hard disk image for IDE hard disk 0\n\n",
             error_get_progname());
 
-#define QEMU_OPTIONS_GENERATE_HELP
-#include "qemu-options-wrapper.h"
+#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)    \
+    if ((arch_mask) & arch_type)                               \
+        fputs(opt_help, stdout);
+
+#define ARCHHEADING(text, arch_mask) \
+    if ((arch_mask) & arch_type)    \
+        puts(stringify(text));
+
+#define DEFHEADING(text) ARCHHEADING(text, QEMU_ARCH_ALL)
+
+#include "qemu-options.def"
 
     printf("\nDuring emulation, the following keys are useful:\n"
            "ctrl-alt-f      toggle full screen\n"
@@ -880,8 +889,13 @@ typedef struct QEMUOption {
 
 static const QEMUOption qemu_options[] = {
     { "h", 0, QEMU_OPTION_h, QEMU_ARCH_ALL },
-#define QEMU_OPTIONS_GENERATE_OPTIONS
-#include "qemu-options-wrapper.h"
+
+#define DEF(option, opt_arg, opt_enum, opt_help, arch_mask)     \
+    { option, opt_arg, opt_enum, arch_mask },
+#define DEFHEADING(text)
+#define ARCHHEADING(text, arch_mask)
+
+#include "qemu-options.def"
     { NULL },
 };
 
-- 
2.27.0


