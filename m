Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB184D86C7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:18:28 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlWk-00027B-Qv
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:18:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTlGE-0002dB-Ch
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:01:23 -0400
Received: from [2607:f8b0:4864:20::1035] (port=54165
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTlGC-0005zO-5L
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:01:21 -0400
Received: by mail-pj1-x1035.google.com with SMTP id bx5so14774779pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3z/auhle10a0P6S2YxzDDIM0Xx+7EqUaf9p0CFMBhds=;
 b=G2T+UKgK1IAiazPoGnHR4FrOzdfDj4Lge7Lz08xAfutPlZXxyDaB2mxfSTvqbVNTUa
 gsGokrubqJpQOAcrZdXw5oR8YN3v9kIxYtul/Iv3in/XJn0/wnKd4qmJTze3eWyE4WqK
 +KJAvd1gyWj1bzp7r/eYAsDXqlcjKlwhB6hOOSCXkzKUHET//l6zo3nmCVJ+3m9Hgs5Y
 v6C+ynbkPwEhNtIrKExC+HtSoKRGQ5NmdEW0IN1HVCeklG+ghF0u0rSJTPS2sQfNwDKd
 3Q2qOswdr6DeDMmNnOfRkL3ASgXkbTjFczQ/3s7Thl1ATYyfak9LmvL4wBueDb/Vbhkt
 h1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3z/auhle10a0P6S2YxzDDIM0Xx+7EqUaf9p0CFMBhds=;
 b=UGI8z/nUKfWB9s0aaavpFiEeWUy7NvBhaFWmlC90Yr0Zr3kYJnswtSKB4ncNEik/Tp
 OcFDOCPwXNrDfJ0jaPJW3xoUJMCvWO9l+JB7D6HtXxcRqEwvuuRkcTWWK0LjE/5P532z
 N2wJHFiva3kfiJkky2IqbOu3R1SNK7s4MFVGFDRamMXEmDFZ4IJTf0+IJsLwJfGettmw
 DFMj7QlIRCpm7M2DYsduuBmWgo4l3hNnFJ+NgJLCx8M54j8BehVcYX9dEc7C9da85Bzb
 RTxKPOLBTcQhYAP3FRyg02IGJB9W7e2zJEkSuIXzd+MqaS/sdK9vOj2jdBKrDREnR+rF
 fZ7A==
X-Gm-Message-State: AOAM5308ym2U66+aWrGzPZnRZKoKOC+q6dQE0ijl0OQ/RjKCGur82FPR
 SrU/zumFkPTXz+c/EC+ETIf9HZGtcK8=
X-Google-Smtp-Source: ABdhPJyIWKnrT/tS0HqrjwROi1bzZqUvK5/e2mgftJLDep7DimTj2Df7zUE8llB9axR56/kD7i1QrQ==
X-Received: by 2002:a17:902:9a4b:b0:14f:fe0b:5546 with SMTP id
 x11-20020a1709029a4b00b0014ffe0b5546mr24004545plv.46.1647266475980; 
 Mon, 14 Mar 2022 07:01:15 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 16-20020a056a00073000b004dfe2217090sm20796055pfm.200.2022.03.14.07.01.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Mar 2022 07:01:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v3] softmmu: List CPU types again
Date: Mon, 14 Mar 2022 15:01:08 +0100
Message-Id: <20220314140108.26222-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Since v2:
- include exec/cpu-all.h -> exec/cpu-common.h (thuth)
---
 cpu.c                     | 9 +++++++++
 include/exec/cpu-common.h | 2 ++
 include/sysemu/cpus.h     | 2 --
 softmmu/cpus.c            | 8 --------
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/cpu.c b/cpu.c
index d564886149..be1f8b074c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -35,6 +35,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/replay.h"
+#include "exec/cpu-common.h"
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


