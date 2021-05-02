Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31A370DF8
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:31:15 +0200 (CEST)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEzy-0002HA-NQ
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmM-00063p-Pw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmI-0007ej-VT
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so4412159wmq.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BSxAg+QNnno53jdugbRrYx5ZtfO8FYfElFGGEXHpVo=;
 b=nHjbmXwnFuM0TJI9JQaEsfBmCq05Pt1CystoBmiXCm1Qp8v9E67a0RhrMeKIA+3a4a
 MtsP+kaby4Ks80+xex/+7ibjlu8HF8wAK1R8oNZ30YjFEyCIZzvNAyhQBR8yE7btivQI
 sthiK7KmqW2WNWL8mNIzBCawBaAV9SAbiqFVfIM5xUzOS2l/IXLh1l7GzIJGGcVvPEue
 +0B0lY7gmHv5WqZi1O0siMIlYeS7dGcp4eCA8rO0OYxz+9XUQ6cGBtq/caDPCW2qIQv4
 886+B4c2BemF0Jy2X09DOCBCaUk1tcTMTjSUnyuKtOCpglViiqPTsCT8u64Vs20EqMHX
 4RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+BSxAg+QNnno53jdugbRrYx5ZtfO8FYfElFGGEXHpVo=;
 b=WgGhgZWNq7PGKifjNBKx/iV8UdvTTg8BeqV8hQWxBM1dJqtjA7x5F6n0vGJlP0X7uP
 pHdgPYINhGlNYw8/NGa1H14YbaDtaprv4D2TCS5J6zdUl4trZVBoc6vZYzo1L16YYnIe
 Dz7Zsfd3PY7x7OMgvLY3/5MXW6YbGUo8XVPWvco78m/IXZ1paJTNXR025rSlkKA8uOMd
 Fb39l4EiZKr4AoIGHIOsaX7Fg2Dz/gzIEG6v0OSNdfJSFsdADh+fKaR9dXIS/C71+fFd
 6+6inb3aAQ1wPSFGYEStiMPQ3+0UPLn6SXvcnfQd1H5BbsDnHtgT2Lw4M5CUG9Xmmezo
 Eofw==
X-Gm-Message-State: AOAM530LqpZv3RhzI1QidQQfcruzS5nWG+kzbDK9kxOjTMovhm/DFjp5
 MAMsgRVA6uzldBn6nSZ3lGHnHVI1Ybcw/Uqx
X-Google-Smtp-Source: ABdhPJxhKYtucNvJ10Vww9cx8+Z/lgGq5rqLSOusplwPrERLF5J/Oouk+77Kq8emVvXlhsnhDPgJ4Q==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr12145798wma.1.1619972225295;
 Sun, 02 May 2021 09:17:05 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id g13sm5109544wrd.41.2021.05.02.09.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/36] target/mips: Extract load/store helpers to ldst_helper.c
Date: Sun,  2 May 2021 18:15:18 +0200
Message-Id: <20210502161538.534038-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-11-f4bug@amsat.org>
---
 target/mips/ldst_helper.c | 288 ++++++++++++++++++++++++++++++++++++++
 target/mips/op_helper.c   | 259 ----------------------------------
 target/mips/meson.build   |   1 +
 3 files changed, 289 insertions(+), 259 deletions(-)
 create mode 100644 target/mips/ldst_helper.c

diff --git a/target/mips/ldst_helper.c b/target/mips/ldst_helper.c
new file mode 100644
index 00000000000..d42812b8a6a
--- /dev/null
+++ b/target/mips/ldst_helper.c
@@ -0,0 +1,288 @@
+/*
+ *  MIPS emulation load/store helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
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
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/memop.h"
+#include "internal.h"
+
+#ifndef CONFIG_USER_ONLY
+
+#define HELPER_LD_ATOMIC(name, insn, almask, do_cast)                         \
+target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
+{                                                                             \
+    if (arg & almask) {                                                       \
+        if (!(env->hflags & MIPS_HFLAG_DM)) {                                 \
+            env->CP0_BadVAddr = arg;                                          \
+        }                                                                     \
+        do_raise_exception(env, EXCP_AdEL, GETPC());                          \
+    }                                                                         \
+    env->CP0_LLAddr = cpu_mips_translate_address(env, arg, MMU_DATA_LOAD,     \
+                                                 GETPC());                    \
+    env->lladdr = arg;                                                        \
+    env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
+    return env->llval;                                                        \
+}
+HELPER_LD_ATOMIC(ll, ldl, 0x3, (target_long)(int32_t))
+#ifdef TARGET_MIPS64
+HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
+#endif
+#undef HELPER_LD_ATOMIC
+
+#endif /* !CONFIG_USER_ONLY */
+
+#ifdef TARGET_WORDS_BIGENDIAN
+#define GET_LMASK(v) ((v) & 3)
+#define GET_OFFSET(addr, offset) (addr + (offset))
+#else
+#define GET_LMASK(v) (((v) & 3) ^ 3)
+#define GET_OFFSET(addr, offset) (addr - (offset))
+#endif
+
+void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
+
+    if (GET_LMASK(arg2) <= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) <= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) == 0) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
+                          mem_idx, GETPC());
+    }
+}
+
+void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
+
+    if (GET_LMASK(arg2) >= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) >= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) == 3) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+                          mem_idx, GETPC());
+    }
+}
+
+#if defined(TARGET_MIPS64)
+/*
+ * "half" load and stores.  We must do the memory access inline,
+ * or fault handling won't work.
+ */
+#ifdef TARGET_WORDS_BIGENDIAN
+#define GET_LMASK64(v) ((v) & 7)
+#else
+#define GET_LMASK64(v) (((v) & 7) ^ 7)
+#endif
+
+void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
+
+    if (GET_LMASK64(arg2) <= 6) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 5) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 4) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 3) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 0) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
+                          mem_idx, GETPC());
+    }
+}
+
+void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
+
+    if (GET_LMASK64(arg2) >= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 3) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 4) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 5) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 6) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) == 7) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
+                          mem_idx, GETPC());
+    }
+}
+#endif /* TARGET_MIPS64 */
+
+static const int multiple_regs[] = { 16, 17, 18, 19, 20, 21, 22, 23, 30 };
+
+void helper_lwm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            env->active_tc.gpr[multiple_regs[i]] =
+                (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
+            addr += 4;
+        }
+    }
+
+    if (do_r31) {
+        env->active_tc.gpr[31] =
+            (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
+    }
+}
+
+void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
+                              mem_idx, GETPC());
+            addr += 4;
+        }
+    }
+
+    if (do_r31) {
+        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
+    }
+}
+
+#if defined(TARGET_MIPS64)
+void helper_ldm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            env->active_tc.gpr[multiple_regs[i]] =
+                cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
+            addr += 8;
+        }
+    }
+
+    if (do_r31) {
+        env->active_tc.gpr[31] =
+            cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
+    }
+}
+
+void helper_sdm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
+                              mem_idx, GETPC());
+            addr += 8;
+        }
+    }
+
+    if (do_r31) {
+        cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
+    }
+}
+
+#endif /* TARGET_MIPS64 */
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 61e68cc8bed..7a7369bc8a6 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -285,265 +285,6 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
     return (int64_t)(int32_t)(uint32_t)tmp5;
 }
 
-#ifndef CONFIG_USER_ONLY
-
-#define HELPER_LD_ATOMIC(name, insn, almask, do_cast)                         \
-target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
-{                                                                             \
-    if (arg & almask) {                                                       \
-        if (!(env->hflags & MIPS_HFLAG_DM)) {                                 \
-            env->CP0_BadVAddr = arg;                                          \
-        }                                                                     \
-        do_raise_exception(env, EXCP_AdEL, GETPC());                          \
-    }                                                                         \
-    env->CP0_LLAddr = cpu_mips_translate_address(env, arg, MMU_DATA_LOAD,     \
-                                                 GETPC());                    \
-    env->lladdr = arg;                                                        \
-    env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
-    return env->llval;                                                        \
-}
-HELPER_LD_ATOMIC(ll, ldl, 0x3, (target_long)(int32_t))
-#ifdef TARGET_MIPS64
-HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
-#endif
-#undef HELPER_LD_ATOMIC
-#endif
-
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK(v) ((v) & 3)
-#define GET_OFFSET(addr, offset) (addr + (offset))
-#else
-#define GET_LMASK(v) (((v) & 3) ^ 3)
-#define GET_OFFSET(addr, offset) (addr - (offset))
-#endif
-
-void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
-
-    if (GET_LMASK(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) == 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
-                          mem_idx, GETPC());
-    }
-}
-
-void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
-
-    if (GET_LMASK(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) == 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
-                          mem_idx, GETPC());
-    }
-}
-
-#if defined(TARGET_MIPS64)
-/*
- * "half" load and stores.  We must do the memory access inline,
- * or fault handling won't work.
- */
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK64(v) ((v) & 7)
-#else
-#define GET_LMASK64(v) (((v) & 7) ^ 7)
-#endif
-
-void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
-
-    if (GET_LMASK64(arg2) <= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
-                          mem_idx, GETPC());
-    }
-}
-
-void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
-
-    if (GET_LMASK64(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) == 7) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
-                          mem_idx, GETPC());
-    }
-}
-#endif /* TARGET_MIPS64 */
-
-static const int multiple_regs[] = { 16, 17, 18, 19, 20, 21, 22, 23, 30 };
-
-void helper_lwm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            env->active_tc.gpr[multiple_regs[i]] =
-                (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
-            addr += 4;
-        }
-    }
-
-    if (do_r31) {
-        env->active_tc.gpr[31] =
-            (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
-    }
-}
-
-void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
-                              mem_idx, GETPC());
-            addr += 4;
-        }
-    }
-
-    if (do_r31) {
-        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
-    }
-}
-
-#if defined(TARGET_MIPS64)
-void helper_ldm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            env->active_tc.gpr[multiple_regs[i]] =
-                cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
-            addr += 8;
-        }
-    }
-
-    if (do_r31) {
-        env->active_tc.gpr[31] =
-            cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
-    }
-}
-
-void helper_sdm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
-                              mem_idx, GETPC());
-            addr += 8;
-        }
-    }
-
-    if (do_r31) {
-        cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
-    }
-}
-#endif
-
-
 void helper_fork(target_ulong arg1, target_ulong arg2)
 {
     /*
diff --git a/target/mips/meson.build b/target/mips/meson.build
index daf5f1d55bc..15c2f835c68 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -18,6 +18,7 @@
 mips_tcg_ss.add(files(
   'dsp_helper.c',
   'fpu_helper.c',
+  'ldst_helper.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'msa_translate.c',
-- 
2.26.3


