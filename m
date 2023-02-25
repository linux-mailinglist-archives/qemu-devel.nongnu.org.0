Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20EB6A28A3
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrBY-0000Sn-Vd; Sat, 25 Feb 2023 04:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBQ-0000Pn-RQ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrBP-0000Qd-5V
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso487844wmb.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctL4KXUjEttAEhfjTfJB9VEH6H9wRZDJy/S9HVcuPtg=;
 b=wzGN95Aa/1MT179TjccGrtswYIaifT77hyyEyX0+nMR3NlGsilC20tufTphpC57Vdc
 IzfCOoEdv0vfbe8NYv+J9v2nPnVPxiWwHSpGbgXhiVV9hqelFDY5tHRWSVtEcYFPdvVq
 qZ1CPww4pkAVmngAT56shoIQVjXkgYA0VVUo5MjcHKC5t+zaPgRno5EEjL3nDJa1pjsV
 ii22IQxW+qSRcvSyeGBOdL+LAoQb8fF2z/w9KQPZ5bKMfvDXLNsW5OZNAVDIMjePeqth
 WBfYsErfXjX4yC/Kp2TbEi7KzpFtp3T8WaLDnzNPNX3E7StJFMZNfs7SGytUqxKOtwCB
 9+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctL4KXUjEttAEhfjTfJB9VEH6H9wRZDJy/S9HVcuPtg=;
 b=YV4BDOR7oX+ztOzwZRO5Zw9xxad4MarQiO5rNWFIBUOR9D4Jf1B17mynWTIGLl6FT/
 tozhyamKnR1yGXh4r3ewqYbC2eyOd5yAWydYRqA9uU60eVbmSw3xelmObAlVwBmVvz1l
 fKaz5EXjBv/16h+VBgOukFy3PeroQ2/RaIeWasneoCfOhkWP1Z2iqnl9hMyp0GxisCMV
 k0pds6nJZplshOazmNQI78XIPkUyodQqhUF1Qq43Fz1qjrBrJ3PZc3AjssZlx+Dq8pCk
 beL1xXoC7DFSM2I8YeKexg1IOeX9B50nP3Z39mg90KEQkkBtSdcjbQS0NhyOygBeTWvG
 lIGA==
X-Gm-Message-State: AO0yUKVIdW8DTt3ydXDp1RpU37+3FBo5MHf8SrgDDpO15sKUB7uJ/yWI
 T0swFYNtY2fZh7Z28ZkX51qGpB3oIZNY6xp8o4I=
X-Google-Smtp-Source: AK7set/RFRnW2i3+S00dTSUt1kUsrisNiireVGi1za7x+QPEadxC08ZA3qf8+hR4gHko2srzAFdZIw==
X-Received: by 2002:a05:600c:1716:b0:3dc:5302:ad9 with SMTP id
 c22-20020a05600c171600b003dc53020ad9mr9320958wmn.27.1677318573284; 
 Sat, 25 Feb 2023 01:49:33 -0800 (PST)
Received: from localhost.localdomain (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm1287864wrw.83.2023.02.25.01.49.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Feb 2023 01:49:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 4/5] dump: Simplify compiling win_dump.o by introducing
 win_dump_available()
Date: Sat, 25 Feb 2023 10:49:02 +0100
Message-Id: <20230225094903.53167-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230225094903.53167-1-philmd@linaro.org>
References: <20230225094903.53167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To make dump.c less target dependent, move the TARGET_X86_64 #ifdef'ry
from dump.c to win_dump.c (introducing a win_dump_available() method
there). By doing so we can build win_dump.c on any target, and
simplify the meson rule.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c      | 16 +++++-----------
 dump/meson.build |  2 +-
 dump/win_dump.c  | 18 ++++++++++++++++++
 dump/win_dump.h  |  3 +++
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index da63129825..fa650980d8 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -28,10 +28,7 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
 #include "hw/core/cpu.h"
-
-#ifdef TARGET_X86_64
 #include "win_dump.h"
-#endif
 
 #include <zlib.h>
 #ifdef CONFIG_LZO
@@ -2126,12 +2123,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     }
 #endif
 
-#ifndef TARGET_X86_64
-    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-        error_setg(errp, "Windows dump is only available for x86-64");
+    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP
+        && !win_dump_available(errp)) {
         return;
     }
-#endif
 
 #if !defined(WIN32)
     if (strstart(file, "fd:", &p)) {
@@ -2213,10 +2208,9 @@ DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
     QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY);
 #endif
 
-    /* Windows dump is available only if target is x86_64 */
-#ifdef TARGET_X86_64
-    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
-#endif
+    if (win_dump_available(NULL)) {
+        QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
+    }
 
     return cap;
 }
diff --git a/dump/meson.build b/dump/meson.build
index 2eff29c3ea..f13b29a849 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,4 @@
 softmmu_ss.add(files('dump-hmp-cmds.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: files('win_dump.c'))
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
diff --git a/dump/win_dump.c b/dump/win_dump.c
index ba7fa404fe..ff9c5bd339 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -18,6 +18,13 @@
 #include "win_dump.h"
 #include "cpu.h"
 
+#if defined(TARGET_X86_64)
+
+bool win_dump_available(Error **errp)
+{
+    return true;
+}
+
 static size_t win_dump_ptr_size(bool x64)
 {
     return x64 ? sizeof(uint64_t) : sizeof(uint32_t);
@@ -470,3 +477,14 @@ out_cr3:
 
     return;
 }
+
+#else /* !TARGET_X86_64 */
+
+bool win_dump_available(Error **errp)
+{
+    error_setg(errp, "Windows dump is only available for x86-64");
+
+    return false;
+}
+
+#endif
diff --git a/dump/win_dump.h b/dump/win_dump.h
index 56f63683c3..c9b49f87dc 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -13,6 +13,9 @@
 
 #include "sysemu/dump.h"
 
+/* Check Windows dump availability for the current target */
+bool win_dump_available(Error **errp);
+
 void create_win_dump(DumpState *s, Error **errp);
 
 #endif /* WIN_DUMP_H */
-- 
2.38.1


