Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389683BADF2
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:09:39 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05cg-0004CQ-8u
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05b2-0001To-Op
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05b1-00073G-6k
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so5848094wmb.3
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIjFa1vlzDxyh9HV658SDCUUQDgEESic8u1n2a+fuvo=;
 b=lQ8fuE9C6WTtL1iZEQKfqN7yvCHpNnJ4C/NgzS9hf5623KGO0iS23YYl1LSnNkEJ5s
 BxlR7Hotk1ZtqxNFp+Nq5FlwvmMDFkpxKpU63bzuMaos/umgrKDrwLE2TgJo//YHA8wq
 GQQx2LthAH2nYsD0/iaV/Si/g0PUDWBn8VM9cCe6CMIRLPJ1vs9dXFEDXrO0UmOKocBh
 3SuZyVfDs9AWhjn40qv+j/ACbn68c3yM9p3KRBA8FvzJGDkMlMwVMWPkXmjJj2btMkmx
 PXsC96yViZkXTZP8jZJ+cnaatCTkmkBgC1sfYhBCPOo54XZIyoMxc/1LpgpIdn6IPpMZ
 AxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dIjFa1vlzDxyh9HV658SDCUUQDgEESic8u1n2a+fuvo=;
 b=lOOL5XUebts5aBsSNYS4m/3y7j6O6MmiQX2L3fw+0B9gU5eLys/A9s+GoI9N5uJyao
 4ZCUEt3tmXLY1Hf/FncwdLp95sait93Zg7nrSFp+nds2nd5tZUB/EprzdqOSfUzN1opM
 cW5emcb9uNUf+meiKadx5iMRUTE1aqZHfNKhC7LiNvS4NjIX4DFGZbx27NB1VryAGm+u
 FvOTNyHHe1kQxFgeUeZNcZpGMGgOVB5WUi0POrwUjWMidu7Fgc8dULGCHPS2g/UdgbjT
 lk3/BmRUQq4cgJPegMsKWCGjHV0K44kzKXzaDJdFx5y583O+Tjwfj0nqS1y1BLvu6Mz7
 bl2A==
X-Gm-Message-State: AOAM533gzmOg1iwE+eYoL/zhDoxU3ydO/1AtVUhQCfXKbShP27mLsQok
 jGMk4psdT+ut5Q8+kgLWOXBivcOaKOw=
X-Google-Smtp-Source: ABdhPJxcNUnO3Ech48RBTU1evbJC1wyzv9bkGpBSiq8doztIFoZDZMtYNiGKqzWDGmX8RstMRRjBJA==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr10012997wmj.127.1625418473886; 
 Sun, 04 Jul 2021 10:07:53 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q19sm19020101wmc.44.2021.07.04.10.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 10:07:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/mips: Rewrite UHI errno_mips() using GHashTable
Date: Sun,  4 Jul 2021 19:07:35 +0200
Message-Id: <20210704170736.617895-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704170736.617895-1-f4bug@amsat.org>
References: <20210704170736.617895-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linking on Haiku OS fails:

  /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
  error: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is too large (0xffff405a bytes)
  /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
  final link failed: memory exhausted
  collect2: error: ld returned 1 exit status

This is because the host_to_mips_errno[] uses errno as index,
for example:

  static const uint16_t host_to_mips_errno[] = {
      [ENAMETOOLONG] = 91,
      ...

and Haiku defines [*] ENAMETOOLONG as:

   12 /* Error baselines */
   13 #define B_GENERAL_ERROR_BASE              INT_MIN
   ..
   22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE + 0x6000)
  ...
  106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE + 4)
  ...
  211 #define ENAMETOOLONG                      B_TO_POSIX_ERROR(B_NAME_TOO_LONG)

so the array ends up beeing indeed too big.

Since POSIX errno can't be use as indexes on Haiku,
rewrite errno_mips() using a GHashTable.

[*] https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 62 ++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 4c924273c1b..3e91c9eb76c 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -4,6 +4,7 @@
  * Specifications: MD01069 Reference Manual (rev 1.1.6, 06 Jul 2015)
  *
  * Copyright (c) 2015 Imagination Technologies
+ * Copyright (c) 2021 Philippe Mathieu-Daudé
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -76,29 +77,56 @@ enum UHIOpenFlags {
     UHIOpen_EXCL   = 0x800
 };
 
-/*
- * Unified Hosting Interface (rev 1.1.6)
- * Appendix A. "Error values"
- */
-static const uint16_t host_to_mips_errno[] = {
-    [ENAMETOOLONG] = 91,
-#ifdef EOVERFLOW
-    [EOVERFLOW]    = 139,
-#endif
+static GHashTable *uhi_errno_hash_table;
+
+static void uhi_errno_insert(int host_errno, int uhi_errno)
+{
+    gboolean ret = TRUE;
+
+    assert(uhi_errno_hash_table != NULL);
+    ret = g_hash_table_insert(uhi_errno_hash_table,
+                              GINT_TO_POINTER(host_errno),
+                              GINT_TO_POINTER(uhi_errno));
+    assert(ret == TRUE);
+}
+
+static void uhi_errno_init(void)
+{
+    gboolean ret = TRUE;
+
+    uhi_errno_hash_table = g_hash_table_new(NULL, NULL);
+
+    /*
+     * Unified Hosting Interface (rev 1.1.6)
+     * Appendix A. "Error values"
+     */
+    uhi_errno_insert(ENAMETOOLONG,  91);
 #ifdef ELOOP
-    [ELOOP]        = 92,
+    uhi_errno_insert(ELOOP,         92);
 #endif
-};
+#ifdef EOVERFLOW
+    uhi_errno_insert(EOVERFLOW,     139);
+#endif
+    assert(ret == TRUE);
+}
 
 static int errno_mips(int host_errno)
 {
-    if (host_errno < 0 || host_errno >= ARRAY_SIZE(host_to_mips_errno)) {
-        return EINVAL;
-    } else if (host_to_mips_errno[host_errno]) {
-        return host_to_mips_errno[host_errno];
-    } else {
-        return host_errno;
+    gpointer uhi_errno;
+
+    if (uhi_errno_hash_table == NULL) {
+        uhi_errno_init();
     }
+
+    if (host_errno == 0) {
+        return 0;
+    }
+    if (g_hash_table_lookup_extended(uhi_errno_hash_table,
+                                     GINT_TO_POINTER(host_errno),
+                                     NULL, &uhi_errno)) {
+        return GPOINTER_TO_INT(uhi_errno);
+    }
+    return EINVAL; /* Not reachable per the specification */
 }
 
 static int copy_stat_to_target(CPUMIPSState *env, const struct stat *src,
-- 
2.31.1


