Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48A4D9A74
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:34:41 +0100 (CET)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5Ro-0002ha-S8
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:34:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ep-0001kd-8N
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5En-00004t-IL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647343273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXoNdUpTiMthQVSttgoCcJ/jv1ogMBPQ8wmx4rw4RVU=;
 b=bp11z/1e9LdSx03mp5eV0CxvViYcwfsd8iFYTTW5RwNlKz5K18rr2FWmc6/nz3NXAXUGfJ
 pMUJXxEwdRFxpd09jk/qZsfBcng3jMGqeSm9kkXNZBFRIskAjVuvy53V0ZNJOnmPc6welB
 kxfSdWTXZKpBVcDCATW+8codCMljZRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-9D2x_RHqOxqP_gHVtzTEGQ-1; Tue, 15 Mar 2022 07:21:11 -0400
X-MC-Unique: 9D2x_RHqOxqP_gHVtzTEGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DA0E899EC1;
 Tue, 15 Mar 2022 11:21:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9AD1C15D42;
 Tue, 15 Mar 2022 11:21:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] softmmu: List CPU types again
Date: Tue, 15 Mar 2022 12:20:51 +0100
Message-Id: <20220315112052.515467-8-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-1-thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
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
Message-Id: <20220314140108.26222-1-philippe.mathieu.daude@gmail.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0


