Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838442B330
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:11:44 +0200 (CEST)
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUgB-0003zf-Ae
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI1-0004zt-K7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:46 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI0-00059a-0A
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id e7so902064pgk.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lqN/uiH3UUIeVg5yhYMxWg7ld7QYTaBAGHdI8OeAIs=;
 b=ME+Rk2AnpC2B5exQwr/bDmShZKfqZNODJjNJYXpZZiL/yi8PfCElC4A1z9VH9UnnuI
 S7HqUf2X/hizj8C0HA5HkbDfzG647GHVqrabW4th7QAC+OroJwb1JrO8BooJY02F2dZJ
 sWBwDlwtAkNao2NicnnLhhOE7JxHgJXcnsG84/YWLk0QGAKWh6LcFi9eU0Y0Pu0JP0pK
 er9AdXKY4Du7ypFVPhMg9aOcxXLQ1S1K5SDaGF7sYBAJasHyv1/C5aG7Hehjq7sR/TG3
 Cv7yQc/rNx8IR/yFLGuy1FNFpeIpzulEGdV2UJMAije6Wp0yQLlU6YTAdkU2VB2Pn0CD
 On8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lqN/uiH3UUIeVg5yhYMxWg7ld7QYTaBAGHdI8OeAIs=;
 b=jGjzPITlfQawem5V/cFWDVdIQb5lmX7H6RyWjj8qpw6ZWfhQ+Rd0KRWNflBLfakNg7
 i0H+EUXGV8toCbu3Nynu65MXTJ0l4Xg2TGL4MYKyhimWvGYEl/iUyZXmy1adyPdgzQSQ
 h/IvtBYtKc+9V/4RqBB3IhNtM8uI4phogLkl2Fc1XoUDEGeNJ5lSwJfQoRbL7NBPRoNn
 FafmVdGFNmcmgB70KnLi1w6X3iw8bcDdOSbyxB718J3wOo9oCtU5fgOVglSV1rKtdzhX
 1rz0IIutvbYdGX07foJ79oOiPpAGOEKR0T9jeLNGFr2h/d0YU4AA5XgsqC0YppJ/k+YJ
 Ea6Q==
X-Gm-Message-State: AOAM530rMhdWfib4YS082gKcDre2iCADiKNt0+XfTfQL6wqDdUBgCJqw
 Au8OFYzXJQkp5bdZh7FxirzmgH3O71+/Bg==
X-Google-Smtp-Source: ABdhPJwZ66l/M8ViYIRUF0AuDIrSNDU8Ubshth2htHYyidVHFToi3/nM9NtmsiepjTxEJbKZXyyc0w==
X-Received: by 2002:a65:664f:: with SMTP id z15mr25730926pgv.252.1634093202506; 
 Tue, 12 Oct 2021 19:46:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/48] Revert "cpu: Move cpu_common_props to hw/core/cpu.c"
Date: Tue, 12 Oct 2021 19:45:52 -0700
Message-Id: <20211013024607.731881-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 1b36e4f5a5de585210ea95f2257839c2312be28f.

Despite a comment saying why cpu_common_props cannot be placed in
a file that is compiled once, it was moved anyway.  Revert that.

Since then, Property is not defined in hw/core/cpu.h, so it is now
easier to declare a function to install the properties rather than
the Property array itself.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  1 +
 cpu.c                 | 21 +++++++++++++++++++++
 hw/core/cpu-common.c  | 17 +----------------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7d5bc1200..1a10497af3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1008,6 +1008,7 @@ void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
 /* $(top_srcdir)/cpu.c */
+void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
diff --git a/cpu.c b/cpu.c
index e1799a15bc..9bce67ef55 100644
--- a/cpu.c
+++ b/cpu.c
@@ -179,6 +179,27 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     cpu_list_remove(cpu);
 }
 
+static Property cpu_common_props[] = {
+#ifndef CONFIG_USER_ONLY
+    /*
+     * Create a memory property for softmmu CPU object,
+     * so users can wire up its memory. (This can't go in hw/core/cpu.c
+     * because that file is compiled only once for both user-mode
+     * and system builds.) The default if no link is set up is to use
+     * the system address space.
+     */
+    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+#endif
+    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+void cpu_class_init_props(DeviceClass *dc)
+{
+    device_class_set_props(dc, cpu_common_props);
+}
+
 void cpu_exec_initfn(CPUState *cpu)
 {
     cpu->as = NULL;
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..9e3241b430 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -257,21 +257,6 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
-static Property cpu_common_props[] = {
-#ifndef CONFIG_USER_ONLY
-    /* Create a memory property for softmmu CPU object,
-     * so users can wire up its memory. (This can't go in hw/core/cpu.c
-     * because that file is compiled only once for both user-mode
-     * and system builds.) The default if no link is set up is to use
-     * the system address space.
-     */
-    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-#endif
-    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -286,7 +271,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
     dc->reset = cpu_common_reset;
-    device_class_set_props(dc, cpu_common_props);
+    cpu_class_init_props(dc);
     /*
      * Reason: CPUs still need special care by board code: wiring up
      * IRQs, adding reset handlers, halting non-first CPUs, ...
-- 
2.25.1


