Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2DE38F1D4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:54:41 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDqi-0006Mh-6t
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004o9-A8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004ON-HG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:56 -0400
Received: by mail-ej1-x635.google.com with SMTP id k14so39352181eji.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CKD3OtHqojn7OMLGARJQq+Hx6C8OYSiCkvBwkT+gLE=;
 b=urzGMW0R3vYlDPn4EEjXycMZ6heCTTmEiiWEMn9CTmLXSBPu+egICMqfcOKZdvGrKr
 0/zU5RKTnX0+pVwqRe1f+sVjoJU1SfRn83K09u9DKybJdKONLkQEK9CPRRe6W5gVgAg7
 cxIAbOIhfg1QRmoZvGrphliBit3fHUMM9Ct4z2GIKK7Njt0WdFhnQtNgG2CfoZ3/ymLP
 SJ8LbwFRXgwv847gMLDurBv7HMZn3LTEzo+2vLz0TgW3C5aP56J2bt0U3IwfzuQqMpDS
 WXTqLeDw8TFR0zxCEN0eLjkvCo0HFBtUgGiXRKjQNFoKw8HlxIlxqyRu4uxKG/xNjD9O
 ZLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7CKD3OtHqojn7OMLGARJQq+Hx6C8OYSiCkvBwkT+gLE=;
 b=Kk4KVfhETH1rI5KwXqcbl5l3PWdQbT3jI0NYdVN0/pDXA7XeF+hIOKtjOy8jmbmrFQ
 dObVOxLdKUhQ282XEz9DcVVxzrxssQz2aUe3GKHm0wTjcc+R/jtlWLKFOznd6rKpeNsa
 06pJcBr9P4HCfHDKN4x55FldCgq5IkeUqnjZ8Xp3098iNINMLN+gZJyRwacTENoG47fq
 2Jo7xBFteNhCSvtaXrGy77mIcOGPtDVrjqaCMEU24heimj2ziukHq7gQb5hOxHD7XIdm
 Z9ny7cd+tUIfYQoF+eWRRK5uyB3HEX7jdtsK8/7hhtIyKP0mcwZRR2t3HYa2P02a36dA
 HHLw==
X-Gm-Message-State: AOAM533wP5ztHmgN2fBz3/gzxASGorNWkp3+Gbxpoj0OJReaQDXmwZf/
 4Rb95K8yfT/Xx+ARSn7flXAMjVkf+Jc28A==
X-Google-Smtp-Source: ABdhPJzueAlUKppslrAzHfnJvA1SgicZTPEWsdpRuvZ4HczlUSE5kjJlfOXB5/6XultZ/YFaDM38Ug==
X-Received: by 2002:a17:906:55c1:: with SMTP id
 z1mr24650142ejp.229.1621874507042; 
 Mon, 24 May 2021 09:41:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/28] remove qemu-options* from root directory
Date: Mon, 24 May 2021 18:41:24 +0200
Message-Id: <20210524164131.383778-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These headers are also included from softmmu/vl.c, so they should be
in include/.  Remove qemu-options-wrapper.h, since elsewhere
we include "template" headers directly and #define the parameters in
the including file; move qemu-options.h to include/.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
2.31.1



