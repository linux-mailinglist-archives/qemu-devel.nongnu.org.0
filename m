Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD338A014
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:48:33 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeM4-0004Ai-21
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxm-0005RY-P9
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxe-0001Zl-Vw
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id 62so7588397wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CKD3OtHqojn7OMLGARJQq+Hx6C8OYSiCkvBwkT+gLE=;
 b=CRxHG0AIiK5E8RGhWaaPV0yLpDZc8fdsXM98Mq8G+7P9XZfyyg9m7TQSujC2U4X6aF
 SgN3zpcMVXy4ke7wlFnI9PAhIO1b6aJxe34Si1qdSfW+5vm+csmy/oE/Xd3W5EvGPVpa
 32XfPs7+yzgKfPhCFRbvGxM/8OYZYE6TcfSLgACHXw0fh+DmrdeqvmIPXniY0605NNq1
 +8sl25whyoUo6Up7Ti6CTVAFS7DOBlXlHgF/l41BKai36S32cKc+A95xDsTAViMoXShN
 Ygc0jSy1aMhbl8OaVOeUjhvxloOkRp5Zee57A3vqu5KJAn4cNC3PmhGxMuaqQSW3gv0o
 UiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7CKD3OtHqojn7OMLGARJQq+Hx6C8OYSiCkvBwkT+gLE=;
 b=TT9BDkQ8Bx4oIorA/yYvhKPJXy/UI2/9bmieTgqSTJodiIxs1nWBgoDhWyzIiWzn/Z
 5ik8zewoTQO7UCm1GGZ3kgn/whEt3LtdiPI62aXGhQuhFlZbI8agpmff0jsY+3EZbB2q
 g4PmUgQ4co+NpkyFr5ralYz8TGJTLq1L8NuRGnPo+9pYsPSQyuMchzP/Nkxr5xiCALb7
 DXY0avqjlnqWC/PxLv2rghsNgg5iQ8TmG1c+cunL9NKykHkNa6XWerikhM0tiNGqi3Xi
 goWXEajo3eWE8OM0sP/zKAebD2Cvs8cpfzta0dPot4vD8p3NkoSj66bImtzPJ+YMUgFv
 J7HQ==
X-Gm-Message-State: AOAM531t2nR6fcncUJIZ8DyF4rrg6qFlqUO7magkQn5xSReapVYsIYmS
 HhKD3OFm8Gmh85NZDdw+XT0JcbAiZ+XV7A==
X-Google-Smtp-Source: ABdhPJw4+2C9F1aS3wWI8JNXb67mWKd4wkVqIzgfN/f493BdxxjntXTuHJkUI13nGhoZ+C9C5tM5GQ==
X-Received: by 2002:a05:600c:48a8:: with SMTP id
 j40mr2442127wmp.114.1621498992905; 
 Thu, 20 May 2021 01:23:12 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] remove qemu-options* from root directory
Date: Thu, 20 May 2021 10:22:53 +0200
Message-Id: <20210520082257.187061-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



