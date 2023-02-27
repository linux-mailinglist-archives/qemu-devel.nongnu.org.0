Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84D6A43C2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:08:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5N-0004CE-5f; Mon, 27 Feb 2023 09:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5C-0002pU-HF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:26 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5A-0007jU-4k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l25so6349102wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pRJteGTjU6unOMeXfZg7XjDzKuedaKAslOkcjAGgIUc=;
 b=EK5334E7+UWy1wIEtXdvtNEx0Xim5fl3Wp97jlZd0VXvmOPrhivWmIuyudzoJXaW20
 RAXK2cDeKpCJNkpmd7WSaYjVeuX4aV3YrtTkX/MNwhVkK4HYP6yxm9ZwjECBUogPoiyB
 +BW4wN1yi/78su8vdgAjoMknKwH5hLVGtWVunt0prEUfP4zKFjnwJI7/3iKvEuMaM2es
 y+dRMcZc5bM3HUFXID9i3QiyQQsveSRIHOLcPjC+dSx0D+uS6wCEe9gYMHrdI7GlMswE
 JRn+PFRbMv/U7wWQfHcKs9wxQrF0wWPGXW3fJND6G8xUIIZzdPCiS01BkXbTNrcY33UR
 +l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRJteGTjU6unOMeXfZg7XjDzKuedaKAslOkcjAGgIUc=;
 b=5VD9LS6IKeD9e7LcBrNZseTJ+uPbAxzX2zBQwUBBD7xn4dY88kMtsGgFVq+v2PpyLf
 2mgTtnC/7iTzcElNY49JUTVPmbIMhqFlNeM6JzE6q13pkQGfFhTV8WHX8hpEf4bWI9Xx
 ed4z9ufCqQQntAyLE28qG6NAHxiA/8YdcugvuADS6UnBhIZz8+Y86f5de/kiWdcDHiGS
 wf8+QQe9q6A4d7ttgjLZomFlQF02+7B+pJWU06+xaRWKEPWahIdQNg6R9oPRXNQavKG6
 ppDcmWmKb680Sr8yk0IJcG4fXBBG5QkHEl0M3H2JZPqX6WO00WRtIfoSaN3rUGblR8W1
 WS1A==
X-Gm-Message-State: AO0yUKUEXIZCWCAm7l/iYXJLWUqOIVOqrBvm07gwWtIFDbtt7OT90fdm
 TVgUNrD8TETIRaT0PaOHP7HDmfTLEQlA7cEt
X-Google-Smtp-Source: AK7set+cJ5D2Hhse8Hw0ZoiGsxQCVy5+2rXT5TVqK/tuSFsoOj13TH/m+NEtZ2YyZlECDZ+w+mRjBA==
X-Received: by 2002:a5d:500d:0:b0:2c8:50bf:2137 with SMTP id
 e13-20020a5d500d000000b002c850bf2137mr7352422wrt.46.1677506542237; 
 Mon, 27 Feb 2023 06:02:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i13-20020adfe48d000000b002c5539171d1sm7274652wrm.41.2023.02.27.06.02.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 011/126] target/hppa: Extract system helpers to sys_helper.c
Date: Mon, 27 Feb 2023 15:00:18 +0100
Message-Id: <20230227140213.35084-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221217173219.8715-3-philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/meson.build  |   1 +
 target/hppa/op_helper.c  |  77 -----------------------------
 target/hppa/sys_helper.c | 101 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 77 deletions(-)
 create mode 100644 target/hppa/sys_helper.c

diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index fb90aed5de..81b4b4e617 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -16,6 +16,7 @@ hppa_softmmu_ss = ss.source_set()
 hppa_softmmu_ss.add(files(
   'machine.c',
   'mem_helper.c',
+  'sys_helper.c',
 ))
 
 target_arch += {'hppa': hppa_ss}
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index f5905c9fc2..32c27c66b2 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -24,7 +24,6 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/timer.h"
-#include "sysemu/runstate.h"
 #include "trace.h"
 
 G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)
@@ -209,79 +208,3 @@ target_ureg HELPER(read_interval_timer)(void)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) >> 2;
 #endif
 }
-
-#ifndef CONFIG_USER_ONLY
-void HELPER(write_interval_timer)(CPUHPPAState *env, target_ureg val)
-{
-    HPPACPU *cpu = env_archcpu(env);
-    uint64_t current = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    uint64_t timeout;
-
-    /* Even in 64-bit mode, the comparator is always 32-bit.  But the
-       value we expose to the guest is 1/4 of the speed of the clock,
-       so moosh in 34 bits.  */
-    timeout = deposit64(current, 0, 34, (uint64_t)val << 2);
-
-    /* If the mooshing puts the clock in the past, advance to next round.  */
-    if (timeout < current + 1000) {
-        timeout += 1ULL << 34;
-    }
-
-    cpu->env.cr[CR_IT] = timeout;
-    timer_mod(cpu->alarm_timer, timeout);
-}
-
-void HELPER(halt)(CPUHPPAState *env)
-{
-    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-    helper_excp(env, EXCP_HLT);
-}
-
-void HELPER(reset)(CPUHPPAState *env)
-{
-    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-    helper_excp(env, EXCP_HLT);
-}
-
-target_ureg HELPER(swap_system_mask)(CPUHPPAState *env, target_ureg nsm)
-{
-    target_ulong psw = env->psw;
-    /*
-     * Setting the PSW Q bit to 1, if it was not already 1, is an
-     * undefined operation.
-     *
-     * However, HP-UX 10.20 does this with the SSM instruction.
-     * Tested this on HP9000/712 and HP9000/785/C3750 and both
-     * machines set the Q bit from 0 to 1 without an exception,
-     * so let this go without comment.
-     */
-    env->psw = (psw & ~PSW_SM) | (nsm & PSW_SM);
-    return psw & PSW_SM;
-}
-
-void HELPER(rfi)(CPUHPPAState *env)
-{
-    env->iasq_f = (uint64_t)env->cr[CR_IIASQ] << 32;
-    env->iasq_b = (uint64_t)env->cr_back[0] << 32;
-    env->iaoq_f = env->cr[CR_IIAOQ];
-    env->iaoq_b = env->cr_back[1];
-    cpu_hppa_put_psw(env, env->cr[CR_IPSW]);
-}
-
-void HELPER(getshadowregs)(CPUHPPAState *env)
-{
-    env->gr[1] = env->shadow[0];
-    env->gr[8] = env->shadow[1];
-    env->gr[9] = env->shadow[2];
-    env->gr[16] = env->shadow[3];
-    env->gr[17] = env->shadow[4];
-    env->gr[24] = env->shadow[5];
-    env->gr[25] = env->shadow[6];
-}
-
-void HELPER(rfi_r)(CPUHPPAState *env)
-{
-    helper_getshadowregs(env);
-    helper_rfi(env);
-}
-#endif
diff --git a/target/hppa/sys_helper.c b/target/hppa/sys_helper.c
new file mode 100644
index 0000000000..4bb4cf611c
--- /dev/null
+++ b/target/hppa/sys_helper.c
@@ -0,0 +1,101 @@
+/*
+ * Helpers for HPPA system instructions.
+ *
+ * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
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
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/timer.h"
+#include "sysemu/runstate.h"
+
+void HELPER(write_interval_timer)(CPUHPPAState *env, target_ureg val)
+{
+    HPPACPU *cpu = env_archcpu(env);
+    uint64_t current = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t timeout;
+
+    /*
+     * Even in 64-bit mode, the comparator is always 32-bit.  But the
+     * value we expose to the guest is 1/4 of the speed of the clock,
+     * so moosh in 34 bits.
+     */
+    timeout = deposit64(current, 0, 34, (uint64_t)val << 2);
+
+    /* If the mooshing puts the clock in the past, advance to next round.  */
+    if (timeout < current + 1000) {
+        timeout += 1ULL << 34;
+    }
+
+    cpu->env.cr[CR_IT] = timeout;
+    timer_mod(cpu->alarm_timer, timeout);
+}
+
+void HELPER(halt)(CPUHPPAState *env)
+{
+    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    helper_excp(env, EXCP_HLT);
+}
+
+void HELPER(reset)(CPUHPPAState *env)
+{
+    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    helper_excp(env, EXCP_HLT);
+}
+
+target_ureg HELPER(swap_system_mask)(CPUHPPAState *env, target_ureg nsm)
+{
+    target_ulong psw = env->psw;
+    /*
+     * Setting the PSW Q bit to 1, if it was not already 1, is an
+     * undefined operation.
+     *
+     * However, HP-UX 10.20 does this with the SSM instruction.
+     * Tested this on HP9000/712 and HP9000/785/C3750 and both
+     * machines set the Q bit from 0 to 1 without an exception,
+     * so let this go without comment.
+     */
+    env->psw = (psw & ~PSW_SM) | (nsm & PSW_SM);
+    return psw & PSW_SM;
+}
+
+void HELPER(rfi)(CPUHPPAState *env)
+{
+    env->iasq_f = (uint64_t)env->cr[CR_IIASQ] << 32;
+    env->iasq_b = (uint64_t)env->cr_back[0] << 32;
+    env->iaoq_f = env->cr[CR_IIAOQ];
+    env->iaoq_b = env->cr_back[1];
+    cpu_hppa_put_psw(env, env->cr[CR_IPSW]);
+}
+
+void HELPER(getshadowregs)(CPUHPPAState *env)
+{
+    env->gr[1] = env->shadow[0];
+    env->gr[8] = env->shadow[1];
+    env->gr[9] = env->shadow[2];
+    env->gr[16] = env->shadow[3];
+    env->gr[17] = env->shadow[4];
+    env->gr[24] = env->shadow[5];
+    env->gr[25] = env->shadow[6];
+}
+
+void HELPER(rfi_r)(CPUHPPAState *env)
+{
+    helper_getshadowregs(env);
+    helper_rfi(env);
+}
-- 
2.38.1


