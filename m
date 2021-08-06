Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDE3E30A6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:07:48 +0200 (CEST)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC74F-00064P-Sf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72V-0003Ri-As
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:05:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72T-0008Nz-CX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:05:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z4so12628262wrv.11
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+Z+wzzxvnZ3+Pd2ULhHSg80v3gwgjV2sFikCRT73jM=;
 b=MRMAVUHFV+0BFgkE5IGTCOSR4UJSS20YQODZU/5i7bL63Fi4FRadMyBoXdD7ecHVoc
 nZLRCbAa1jH9QrNMdMnfCVTsgnhY/HlCWIbxEUPv6qpAUxc5P50esVvJLpx8rJsEYRBQ
 4u3hC4A2MRKLFv1m4x6JZQACMARKYaRTnlCkcraXEvkFaMs6/Np1KnfURfdLSfkC7+Rb
 Jo/lkFBd0U54+hfEbuO2rAtVvADuxP2YHPut8OzTS8WoJPXqd7siEiZ4XL5r8Y7UsbQo
 Q/s5ezP/WZZB/SylBPoRql4qVb7qdD2NpEOyHQxxrecrlPhR/3Hme+6IvPSSjSIixyx1
 Lraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y+Z+wzzxvnZ3+Pd2ULhHSg80v3gwgjV2sFikCRT73jM=;
 b=IIn5sYVD4uW2jPCqjmyhBRdGpqhIiQxF/mduXzf2mfTKjhlSE8cuXcsaQ/G8IhVm3Y
 NXrD3Y59vWW2tLR+L6o/IsZfX9iQChJIhBYV8yur2f1+f3E9PSMNasmZeA3vPMIaaKEn
 5Rt41N/Gw5x9UHKJXHaB8y+VxL8p5pMyiSSRUXl0hZ6W/kYe+cdlwXZJ3b11GWlVz19o
 yQBP0YNAiYscxeTbySLpLgWP+Qt0MBICUCsSNqIo0OpjiiVMIFoXs3cHEqGSlugGxqAD
 3uaLiM/PjmzULcIgdJS1Zy4l5ZfStD9x/A6G36AT6Od7PZv9+zdqBCNPpuZUgfXvFca3
 Dg1Q==
X-Gm-Message-State: AOAM530icwE+T5RN2KFlkLeHADMjeEd20e3SSSsivi8TA1nnKsqfY6Bt
 sFmqJpjrAimwNuWF7Gd00+fpw67CMaBUfWSr1/c=
X-Google-Smtp-Source: ABdhPJxx5P3aJ8+y0lOzfpoqUivzCoaL0RJyjLf13IlhO8lOe8q9FHG41FFVsfJ1CtNlGHYg4Q7CuQ==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr12788161wrj.143.1628283955820; 
 Fri, 06 Aug 2021 14:05:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z17sm10971169wrt.47.2021.08.06.14.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:05:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 1/5] target/mips: Extract NEC Vr54xx helpers to
 vr54xx_helper.c
Date: Fri,  6 Aug 2021 23:05:44 +0200
Message-Id: <20210806210548.8568-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806210548.8568-1-f4bug@amsat.org>
References: <20210806210548.8568-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index 70fa3dd57df..ff618a159b7 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -18,6 +18,7 @@
   'translate.c',
   'translate_addr_const.c',
   'txx9_translate.c',
+  'vr54xx_helper.c',
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-- 
2.31.1


