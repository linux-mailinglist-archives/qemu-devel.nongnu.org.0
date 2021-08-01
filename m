Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8B3DCE3E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 02:03:02 +0200 (CEST)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALQ5-0000si-CS
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 20:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMn-0003Sx-2v
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMl-0006mA-0u
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b13so8467047wrs.3
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zv+GKBWChYiL7jtN3ifnlUeQ3KYEnUk/PWHE3YGCQS4=;
 b=Bh6iUcjzoCSV6h2bYmHzfuXS7lqOdz9zzT+Cbtyim4vG5aYpoLCvgaonTdamSGXEk2
 36uXtPkLIL6bLwk0L55/LlxnzE27h9hEon3uVWec1OohfCOcN8q8qfKKJywGxKRas9sy
 SPFNR5Z6pJARIaPlJYpMk7bQ2EVxT5/DyqUJSg/KzF67pxsa923M4VEJjtBOt+Z5RMpv
 dPUCA3ufnvGKGVmIj5RLEMWA1JLxypxtx3VnjLUUWYqSVYh2oFVw6z2UYFDNsooB4p71
 2A0NPH9/vAQXdTM2e05iBbTTM4s/Gj7lpp/kfFFsIk6QU6N+va36KTf5OQlxjgCRIXJq
 /ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zv+GKBWChYiL7jtN3ifnlUeQ3KYEnUk/PWHE3YGCQS4=;
 b=ZWZrMcN71ggA+E2NJMLAqDTo+lN9QCSOM2ZX/Q1MjvO4scMK4SMiKIyl2zs7B5lYJ0
 QQfEvo6kD9cynTTxlc7cw11YlJNHnhQP6G1q+UjEIJsIojgD95dRR6DWPcQSIzTI66VF
 Y1XmgJeZsfmCHw+6kp9lDTJd8gmQlRN2BC71S880s/EZzZVklHlGRrkF/x/vNVA6aKmt
 D/lolMz+1sQRUJdF1VhRXtqXXDs+xboD3r++LXadxTgJjNiDltI7xaNvAnoJEm8rkffX
 ElUkSGtpzxB9Nm/NnIHyGDakjyhbQW25Bj1OOPQc50+/m4OpCL//wn8xGMB0CsErdpKq
 1Slw==
X-Gm-Message-State: AOAM532t3sLfd8Pc4H4A90XUBj5ldH2YR3bg5C3oRKNMN1Bcxbv8TadP
 kn+6ZUsr6xPOu5Ed24GuqBUgEXm/DCpNOw==
X-Google-Smtp-Source: ABdhPJyYqXQW+cWmEVAfwRVJP83VmQrlvXxp0tkpQMN38aMoj2cUxfgEpKDPu+lHm3D115C7NHzSFw==
X-Received: by 2002:adf:ea41:: with SMTP id j1mr14666025wrn.147.1627862373522; 
 Sun, 01 Aug 2021 16:59:33 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l2sm9043969wru.67.2021.08.01.16.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:59:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/5] target/mips: Extract NEC Vr54xx helpers to
 vr54xx_helper.c
Date: Mon,  2 Aug 2021 01:59:22 +0200
Message-Id: <20210801235926.3178085-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801235926.3178085-1-f4bug@amsat.org>
References: <20210801235926.3178085-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract NEC Vr54xx helpers from op_helper.c to a new file:
'vr54xx_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-14-f4bug@amsat.org>
---
 target/mips/tcg/op_helper.c     | 118 --------------------------
 target/mips/tcg/vr54xx_helper.c | 142 ++++++++++++++++++++++++++++++++
 target/mips/tcg/meson.build     |   1 +
 3 files changed, 143 insertions(+), 118 deletions(-)
 create mode 100644 target/mips/tcg/vr54xx_helper.c

diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index fafbf1faca7..ef3dafcbb3f 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -26,124 +26,6 @@
 #include "exec/memop.h"
 #include "fpu_helper.h"
 
-/* 64 bits arithmetic for 32 bits hosts */
-static inline uint64_t get_HILO(CPUMIPSState *env)
-{
-    return ((uint64_t)(env->active_tc.HI[0]) << 32) |
-           (uint32_t)env->active_tc.LO[0];
-}
-
-static inline target_ulong set_HIT0_LO(CPUMIPSState *env, uint64_t HILO)
-{
-    env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
-    return env->active_tc.HI[0] = (int32_t)(HILO >> 32);
-}
-
-static inline target_ulong set_HI_LOT0(CPUMIPSState *env, uint64_t HILO)
-{
-    target_ulong tmp = env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
-    env->active_tc.HI[0] = (int32_t)(HILO >> 32);
-    return tmp;
-}
-
-/* Multiplication variants of the vr54xx. */
-target_ulong helper_muls(CPUMIPSState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    return set_HI_LOT0(env, 0 - ((int64_t)(int32_t)arg1 *
-                                 (int64_t)(int32_t)arg2));
-}
-
-target_ulong helper_mulsu(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HI_LOT0(env, 0 - (uint64_t)(uint32_t)arg1 *
-                       (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_macc(CPUMIPSState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    return set_HI_LOT0(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_macchi(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_maccu(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HI_LOT0(env, (uint64_t)get_HILO(env) +
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_macchiu(CPUMIPSState *env, target_ulong arg1,
-                            target_ulong arg2)
-{
-    return set_HIT0_LO(env, (uint64_t)get_HILO(env) +
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_msac(CPUMIPSState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    return set_HI_LOT0(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_msachi(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_msacu(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HI_LOT0(env, (uint64_t)get_HILO(env) -
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_msachiu(CPUMIPSState *env, target_ulong arg1,
-                            target_ulong arg2)
-{
-    return set_HIT0_LO(env, (uint64_t)get_HILO(env) -
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_mulhi(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HIT0_LO(env, (int64_t)(int32_t)arg1 * (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_mulhiu(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, (uint64_t)(uint32_t)arg1 *
-                       (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_mulshi(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, 0 - (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_mulshiu(CPUMIPSState *env, target_ulong arg1,
-                            target_ulong arg2)
-{
-    return set_HIT0_LO(env, 0 - (uint64_t)(uint32_t)arg1 *
-                       (uint64_t)(uint32_t)arg2);
-}
-
 static inline target_ulong bitswap(target_ulong v)
 {
     v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
diff --git a/target/mips/tcg/vr54xx_helper.c b/target/mips/tcg/vr54xx_helper.c
new file mode 100644
index 00000000000..2255bd11163
--- /dev/null
+++ b/target/mips/tcg/vr54xx_helper.c
@@ -0,0 +1,142 @@
+/*
+ *  MIPS VR5432 emulation helpers
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+
+/* 64 bits arithmetic for 32 bits hosts */
+static inline uint64_t get_HILO(CPUMIPSState *env)
+{
+    return ((uint64_t)(env->active_tc.HI[0]) << 32) |
+           (uint32_t)env->active_tc.LO[0];
+}
+
+static inline target_ulong set_HIT0_LO(CPUMIPSState *env, uint64_t HILO)
+{
+    env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
+    return env->active_tc.HI[0] = (int32_t)(HILO >> 32);
+}
+
+static inline target_ulong set_HI_LOT0(CPUMIPSState *env, uint64_t HILO)
+{
+    target_ulong tmp = env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
+    env->active_tc.HI[0] = (int32_t)(HILO >> 32);
+    return tmp;
+}
+
+/* Multiplication variants of the vr54xx. */
+target_ulong helper_muls(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, 0 - ((int64_t)(int32_t)arg1 *
+                                 (int64_t)(int32_t)arg2));
+}
+
+target_ulong helper_mulsu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, 0 - (uint64_t)(uint32_t)arg1 *
+                                (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_macc(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
+                                                     (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_macchi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
+                       (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_maccu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, (uint64_t)get_HILO(env) + (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_macchiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)get_HILO(env) + (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_msac(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
+                                                     (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_msachi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
+                                                     (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_msacu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, (uint64_t)get_HILO(env) - (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_msachiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)get_HILO(env) - (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_mulhi(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)(int32_t)arg1 * (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_mulhiu(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)(uint32_t)arg1 *
+                            (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_mulshi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, 0 - (int64_t)(int32_t)arg1 *
+                                (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_mulshiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, 0 - (uint64_t)(uint32_t)arg1 *
+                                (uint64_t)(uint32_t)arg2);
+}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index bf4001e5741..68eb284e099 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -19,6 +19,7 @@
   'translate.c',
   'translate_addr_const.c',
   'txx9_translate.c',
+  'vr54xx_helper.c',
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-- 
2.31.1


