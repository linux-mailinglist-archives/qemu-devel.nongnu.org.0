Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7B4D489A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:09:13 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJTc-0003M3-ML
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSJS2-0001uR-Vf
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:07:34 -0500
Received: from [2a00:1450:4864:20::32c] (port=43964
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSJS1-0004Q8-BN
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:07:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so3471978wmq.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eHCxI2MnY0tz1s/LDMeO8VhyDgiKSIP9Sz5dCGPSnu8=;
 b=SCtGO8fD1+pIGr/ha8hT+tUed64XirK7D0OjfcUHXSCNAvwsFjCXhOpqncXNP/KWIb
 OxH0mOx5nh6oLQsiUBklDEQ6oFIAclLxm0dOSmTqdQF2eru0jO40QNf9cLL0VkL2cYGA
 R+x7r56Grv7gpDyeW1Jvit2mWbfj5uAhQvsHEFaaJIsRG8bxqiwuvEfA1cQm12aEa7Wa
 8jrZwsGL+vrAR1eJBoAYBDaqHJUUIFH03bVoxcsblxWV66Xilk4kh+494v4VX+dmw0md
 1Rp84y1D874rX4gf9zb0FW9MSFE7y1SDit/MHaiyffwXsYzPjT25ta6qum2SZDepEOgB
 Lt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eHCxI2MnY0tz1s/LDMeO8VhyDgiKSIP9Sz5dCGPSnu8=;
 b=pKkSWB6iOWp6vJ4LGw5QN20zj3aeF+cYn+gvLOX7yTV5xbNlt6xRlF4jv/3LWUICRb
 CVOboQGdTjgf0gdV0uZWhMSyz+FaAv7F9WiFzHWvM4T24yO+fcqHOZpxxO/GOObUENwZ
 3hMQAg7+cXqOVcTSj6zGCPe81wTwpkEwnOE2it3DyxAXSnrwtcoHmihm/8v3lJM0qu1K
 fMwRD6SQRrwt7NIFsm2xDedcQkRA0gq+kqCp6SdADb1fJQ1hR7aqExGSlaN6EOIbw8sX
 ygnf7wBYFfdKpHNRv0Gkso4yqLg2Ma4PnFd2YGieHY4P1HOs/G+wkTpuNp33P1DMKn1B
 nQoQ==
X-Gm-Message-State: AOAM531v5mvb1WOibCMuGO3Yt3o24LIcXxovqn9veGyAPbNBags7pp5q
 yokFkxUQZ3AEoo/BLRmGsWTIhMJ5tdw=
X-Google-Smtp-Source: ABdhPJy/0UNYgXYjRvWqRsEF7EKMLQqblLTojRcd6lVs5ITcfXak6srDLPR7PfveFh8Zy+MiOy5g4g==
X-Received: by 2002:a05:600c:3c8b:b0:37f:1546:40c9 with SMTP id
 bg11-20020a05600c3c8b00b0037f154640c9mr3678218wmb.161.1646921251128; 
 Thu, 10 Mar 2022 06:07:31 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 u25-20020a05600c211900b00389d4bdb3d2sm5196753wml.36.2022.03.10.06.07.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 10 Mar 2022 06:07:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v2] softmmu: List CPU types again
Date: Thu, 10 Mar 2022 15:07:28 +0100
Message-Id: <20220310140728.6506-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
the cpu_list() function is only defined in target-specific code
in "cpu.h". Move list_cpus() declaration to "exec/cpu-common.h"
because this function is not softmmu-specific and can also be
used by user-mode, along with moving its implementation to cpu.c,
which is compiled per target.

Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c                     | 9 +++++++++
 include/exec/cpu-common.h | 2 ++
 include/sysemu/cpus.h     | 2 --
 softmmu/cpus.c            | 8 --------
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/cpu.c b/cpu.c
index d564886149..d50845f713 100644
--- a/cpu.c
+++ b/cpu.c
@@ -35,6 +35,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/replay.h"
+#include "exec/cpu-all.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
@@ -266,6 +267,14 @@ const char *parse_cpu_option(const char *cpu_option)
     return cpu_type;
 }
 
+void list_cpus(const char *optarg)
+{
+    /* XXX: implement xxx_cpu_list for targets that still miss it */
+#if defined(cpu_list)
+    cpu_list();
+#endif
+}
+
 #if defined(CONFIG_USER_ONLY)
 void tb_invalidate_phys_addr(target_ulong addr)
 {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 7f7b5943c7..50a7d2912e 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -158,4 +158,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 /* vl.c */
 extern int singlestep;
 
+void list_cpus(const char *optarg);
+
 #endif /* CPU_COMMON_H */
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 868f1192de..b5c87d48b3 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -55,6 +55,4 @@ extern int smp_cores;
 extern int smp_threads;
 #endif
 
-void list_cpus(const char *optarg);
-
 #endif
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e1d84c8ccb..7b75bb66d5 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
     }
 }
 
-void list_cpus(const char *optarg)
-{
-    /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
-    cpu_list();
-#endif
-}
-
 void qmp_memsave(int64_t addr, int64_t size, const char *filename,
                  bool has_cpu, int64_t cpu_index, Error **errp)
 {
-- 
2.34.1


