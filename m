Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EFC536691
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:29:18 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudm1-0005UG-9l
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nudkZ-0003RF-Nj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:27:47 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nudkX-0004A6-Ex
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:27:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p8so4864971pfh.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGyk9o8Y+uwTh9lPK5GKDrj4v4XTzOVoGpkFAdXL5O4=;
 b=P3nSeMrU2vMfTS5BIkUKgwrhwQkHf8gvkOqzh6KZDYIawtJ3Tn0v2gUYVXmwwWrGvq
 43fmiEsH7LpvuAoUeMInem8yLlbwBkL+QSOqz8pTZmpk1WfqWdbRkFbog4UJDTRzPpYH
 VkhdMrwhXOw22g82ksMizOpPsDlcoMWqx2+oAlXTLpUM61Nzcn48Hbey8bE1wfOtZTFc
 Fb6W/jrN4WFQt/TWrg9PGiX7Tt4IN9khmpOGlFbcvwv3b/XaJWYfdSn0DomSDs44KE5s
 JGbryK8v2Q6BndoBsb9yIkmyNumVjjHL0uEhDUXFdOdUHAmi0/cUPUZiCYuz06V11O4P
 fnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGyk9o8Y+uwTh9lPK5GKDrj4v4XTzOVoGpkFAdXL5O4=;
 b=8DNjrX+pAUboKEHEq2YQl02iS0Qilhue45fQTL2VOm1B0oIZOHZT84XZvXXjFinIZA
 CUfEzlh0zAVLaAQRksXBUCE5xiFamoZ6Yw8RGxpiondeh3mFJIGHfiF2nnZCcX/GcCJU
 O+niXn+nwHRmYimC92CQhq1501vJEASQibzs0hRMAHw6Si82Em10h/xzgKTXJzn7rUMt
 JzjV+fCIWnPk8H78jdESBw8UMmlyMW67jbnATwlhJ+lDOWU411TB6n+GfvN2sOCGmHfC
 /dFTitdMSsx3PIC4UHdcBpxYFS8QrLrGJcdK6rUknGIMVzInDEebCpKtHZnRJAIiADIt
 Qw7A==
X-Gm-Message-State: AOAM5315ep9hAZZkWLw8Wgmjh+r4xRwPuF0wdKdKTue04c5dGAmyZ3fI
 rM0rzq9Y8HEYF78ks/HGrCbzA2UCbDbnIw==
X-Google-Smtp-Source: ABdhPJxTKtZxTGAhWXwbbTSanXiupMpTAQczRwhGIk3ky6FeUpy0ms5sJMUwtWo3DpzwcYNK//UwUg==
X-Received: by 2002:a05:6a00:1588:b0:518:8ce2:7753 with SMTP id
 u8-20020a056a00158800b005188ce27753mr30918903pfk.51.1653672462098; 
 Fri, 27 May 2022 10:27:42 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 lb14-20020a17090b4a4e00b001d9780b7779sm1903881pjb.15.2022.05.27.10.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 10:27:41 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [RFC PATCH 1/3] target/openrisc: Add basic support for semihosting
Date: Sat, 28 May 2022 02:27:28 +0900
Message-Id: <20220527172731.1742837-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220527172731.1742837-1-shorne@gmail.com>
References: <20220527172731.1742837-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For OpenRISC we currently only use semihosting for system exit and
reset.  This patch implements that.

The implementation uses a helper to delegate to the semihosting
facility.  The helper is marked as having side effects but currently
does not have any.  I have defined it like this as our other
unimplemented semihosting calls will have side effects and return
results in register r11.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 configs/devices/or1k-softmmu/default.mak |  2 +
 qemu-options.hx                          | 16 ++++---
 target/openrisc/cpu.h                    |  2 +
 target/openrisc/helper.h                 |  1 +
 target/openrisc/meson.build              |  1 +
 target/openrisc/openrisc-semi.c          | 54 ++++++++++++++++++++++++
 target/openrisc/sys_helper.c             |  5 +++
 target/openrisc/translate.c              |  6 +++
 8 files changed, 82 insertions(+), 5 deletions(-)
 create mode 100644 target/openrisc/openrisc-semi.c

diff --git a/configs/devices/or1k-softmmu/default.mak b/configs/devices/or1k-softmmu/default.mak
index 168101c39a..5b3ac89491 100644
--- a/configs/devices/or1k-softmmu/default.mak
+++ b/configs/devices/or1k-softmmu/default.mak
@@ -1,5 +1,7 @@
 # Default configuration for or1k-softmmu
 
+CONFIG_SEMIHOSTING=y
+
 # Boards:
 #
 CONFIG_OR1K_SIM=y
diff --git a/qemu-options.hx b/qemu-options.hx
index b484640067..312c68b065 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4566,10 +4566,12 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
-    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV |
+    QEMU_ARCH_OPENRISC)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
+    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V,
+    OpenRISC only).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4581,11 +4583,12 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
     "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
-QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV |
+QEMU_ARCH_OPENRISC)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
-    only).
+    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V,
+    OpenRISC only).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4601,6 +4604,9 @@ SRST
 
     On RISC-V this implements the standard semihosting API, version 0.2.
 
+    On OpenRISC this only supports providing simulation exit and reset
+    facilities.
+
     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
         (``native``) or to GDB (``gdb``). The default is ``auto``, which
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index b9584f10d4..4617f1272b 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -407,4 +407,6 @@ void cpu_set_fpcsr(CPUOpenRISCState *env, uint32_t val);
 
 #define CPU_INTERRUPT_TIMER   CPU_INTERRUPT_TGT_INT_0
 
+void do_or1k_semihosting(CPUOpenRISCState *env, uint32_t k);
+
 #endif /* OPENRISC_CPU_H */
diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
index d847814a28..2fe3e4e4ca 100644
--- a/target/openrisc/helper.h
+++ b/target/openrisc/helper.h
@@ -64,3 +64,4 @@ DEF_HELPER_FLAGS_1(rfe, 0, void, env)
 /* sys */
 DEF_HELPER_FLAGS_3(mtspr, 0, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(mfspr, TCG_CALL_NO_WG, tl, env, tl, tl)
+DEF_HELPER_FLAGS_2(nop, 0, void, env, i32)
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index 84322086ec..1c1758b846 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -10,6 +10,7 @@ openrisc_ss.add(files(
   'fpu_helper.c',
   'gdbstub.c',
   'interrupt_helper.c',
+  'openrisc-semi.c',
   'sys_helper.c',
   'translate.c',
 ))
diff --git a/target/openrisc/openrisc-semi.c b/target/openrisc/openrisc-semi.c
new file mode 100644
index 0000000000..97d6aaacdb
--- /dev/null
+++ b/target/openrisc/openrisc-semi.c
@@ -0,0 +1,54 @@
+/*
+ *  OpenRISC Semihosting syscall interface.
+ *
+ *  Copyright (c) 2022 Stafford Horne
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "exec/gdbstub.h"
+#include "sysemu/runstate.h"
+#include "qemu/log.h"
+
+#define HOSTED_EXIT 1
+#define HOSTED_RESET 13
+
+static void or1k_semi_return_u32(CPUOpenRISCState *env, uint32_t ret)
+{
+    cpu_set_gpr(env, 11, ret);
+}
+
+void do_or1k_semihosting(CPUOpenRISCState *env, uint32_t k)
+{
+    uint32_t result;
+
+    switch (k) {
+    case HOSTED_EXIT:
+        gdb_exit(cpu_get_gpr(env, 3));
+        exit(cpu_get_gpr(env, 3));
+    case HOSTED_RESET:
+#ifndef CONFIG_USER_ONLY
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        return;
+#endif
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "or1k-semihosting: unsupported "
+                      "semihosting syscall %d\n", k);
+        result = 0;
+    }
+    or1k_semi_return_u32(env, result);
+}
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 48674231e7..eb698a527e 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -314,3 +314,8 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
     /* for rd is passed in, if rd unchanged, just keep it back.  */
     return rd;
 }
+
+void HELPER(nop)(CPUOpenRISCState *env, target_ulong k)
+{
+    do_or1k_semihosting(env, k);
+}
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7b8ad43d5f..ec7b3b46ad 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -28,6 +28,7 @@
 #include "qemu/qemu-print.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
+#include "semihosting/semihost.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -780,6 +781,11 @@ static bool trans_l_sh(DisasContext *dc, arg_store *a)
 
 static bool trans_l_nop(DisasContext *dc, arg_l_nop *a)
 {
+    if (semihosting_enabled() &&
+        a->k != 0) {
+        gen_helper_nop(cpu_env, tcg_constant_i32(a->k));
+    }
+
     return true;
 }
 
-- 
2.31.1


