Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF0D4CE7B7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 00:37:24 +0100 (CET)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQdxi-0008G4-Ay
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 18:37:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQdvD-00057Q-8R
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 18:34:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=54955
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQdvB-0008ED-JC
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 18:34:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id b8so10204538pjb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 15:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJLfXFP7GsP/ko9zMevXg4zO3LA2kewd2DmWli03WKo=;
 b=FDOo5Ta7qSZoNI2WROBNdZUYnuAtTBxUKpYYBJNqxpV8HWdOdY0HtJG4JKykjBnSwX
 fXei74ZFepSuIxMieofZJHdal7pNUjr8GDpPJzNt6xCY4XZcIxic8o6Ud4VRMxxf3ljE
 FymgV1WQOL70TdSvFJxddGV5Wk0tM7xSs8l74VCnHVhx5HD4VQu6dguEtHh9VNe566bc
 uvDuHrCi+wOUn/9ucyuWMOS5EsCI9mh3WGpm5avZwRi0KtkOPFJEZoAxcFbj71w5fbI3
 pRAQlWbYRAFqT4zmtqxk3keluW2ZleNnUPONclb6IRA7DNHcw049CBhOHiNrdsvcZQYk
 wk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJLfXFP7GsP/ko9zMevXg4zO3LA2kewd2DmWli03WKo=;
 b=W1LavDiOzgFe2Tv2zWU4fyfsbU6FKMueQktrNurnDWH9e1bOF6Csjn5MbRsaHGSTH1
 yeUmex9aswmnv8pTdxTmEUnPYEB8Sx5wdb/sGGCLJcJ9Q/7Mh3R17orbuxs1SS0kwwpI
 TKrj3m7tdMI4wmcpIGqwd4ry0LdAvyi7DDlXM/TTxq919zGwI7vi3lfceNLFirrtjGD8
 k4Q94orHs3rFyMdX/nUFmjcEVvmOMwa7989h/eaEbTZReOtlGTJ2Ppyd8dgeaWocyf/Z
 QhuSekLKWNp+neSBTnwJ65Z8sOzQtZ8pvAJ2NsrAkJ9+7Ft/17zoHPMADeSJCOE6G5kE
 LzOA==
X-Gm-Message-State: AOAM531IBEh8PfKnCx1jgdUJdjghguKlq9ctUQhgNL2YP44Q8n0GZIf8
 A4O7iKnxaz2QDMQnPEbSHgA23Fee9Zk=
X-Google-Smtp-Source: ABdhPJw+Sni4QtCCYZjRHKVfFtrztLWDy3ojHdYCRpJ/2/c94Ru4M4hQY6zphk/PCfkiifBtUBm65g==
X-Received: by 2002:a17:902:cf0e:b0:14f:8a60:475c with SMTP id
 i14-20020a170902cf0e00b0014f8a60475cmr5291370plg.146.1646523284096; 
 Sat, 05 Mar 2022 15:34:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a17090adb4e00b001bee5dd39basm13115664pjx.1.2022.03.05.15.34.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Mar 2022 15:34:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/i386: Remove pointless CPUArchState casts
Date: Sun,  6 Mar 2022 00:34:15 +0100
Message-Id: <20220305233415.64627-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
References: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax/hax-all.c   |  4 ++--
 target/i386/nvmm/nvmm-all.c | 14 +++++++-------
 target/i386/whpx/whpx-all.c | 18 +++++++++---------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index ccdcb6afab..81f665e212 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -222,7 +222,7 @@ int hax_init_vcpu(CPUState *cpu)
 
     cpu->hax_vcpu = hax_global.vm->vcpus[cpu->cpu_index];
     cpu->vcpu_dirty = true;
-    qemu_register_reset(hax_reset_vcpu_state, (CPUArchState *) (cpu->env_ptr));
+    qemu_register_reset(hax_reset_vcpu_state, cpu->env_ptr);
 
     return ret;
 }
@@ -669,7 +669,7 @@ void hax_cpu_synchronize_pre_loadvm(CPUState *cpu)
 
 int hax_smp_cpu_exec(CPUState *cpu)
 {
-    CPUArchState *env = (CPUArchState *) (cpu->env_ptr);
+    CPUArchState *env = cpu->env_ptr;
     int fatal;
     int ret;
 
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index e159dd2b93..b97d091a50 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -85,7 +85,7 @@ nvmm_set_segment(struct nvmm_x64_state_seg *nseg, const SegmentCache *qseg)
 static void
 nvmm_set_registers(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -222,7 +222,7 @@ nvmm_get_segment(SegmentCache *qseg, const struct nvmm_x64_state_seg *nseg)
 static void
 nvmm_get_registers(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -347,7 +347,7 @@ nvmm_get_registers(CPUState *cpu)
 static bool
 nvmm_can_take_int(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
@@ -394,7 +394,7 @@ nvmm_can_take_nmi(CPUState *cpu)
 static void
 nvmm_vcpu_pre_run(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
@@ -480,7 +480,7 @@ static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
 
@@ -652,7 +652,7 @@ static int
 nvmm_handle_halted(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     int ret = 0;
 
     qemu_mutex_lock_iothread();
@@ -685,7 +685,7 @@ nvmm_inject_ud(struct nvmm_machine *mach, struct nvmm_vcpu *vcpu)
 static int
 nvmm_vcpu_loop(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)cpu->env_ptr;
+    CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index a822246144..c7e25abf42 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -221,7 +221,7 @@ static SegmentCache whpx_seg_h2q(const WHV_X64_SEGMENT_REGISTER *hs)
 
 static int whpx_set_tsc(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     WHV_REGISTER_NAME tsc_reg = WHvX64RegisterTsc;
     WHV_REGISTER_VALUE tsc_val;
     HRESULT hr;
@@ -260,7 +260,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
     HRESULT hr;
@@ -428,7 +428,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
 
 static int whpx_get_tsc(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     WHV_REGISTER_NAME tsc_reg = WHvX64RegisterTsc;
     WHV_REGISTER_VALUE tsc_val;
     HRESULT hr;
@@ -449,7 +449,7 @@ static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
     uint64_t tpr, apic_base;
@@ -760,7 +760,7 @@ static int whpx_handle_portio(CPUState *cpu,
 
 static int whpx_handle_halt(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     int ret = 0;
 
     qemu_mutex_lock_iothread();
@@ -781,7 +781,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
     uint8_t tpr;
@@ -903,7 +903,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
     env->eflags = vcpu->exit_ctx.VpContext.Rflags;
@@ -927,7 +927,7 @@ static void whpx_vcpu_post_run(CPUState *cpu)
 
 static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
 
@@ -1333,7 +1333,7 @@ int whpx_init_vcpu(CPUState *cpu)
     struct whpx_state *whpx = &whpx_global;
     struct whpx_vcpu *vcpu = NULL;
     Error *local_error = NULL;
-    CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     UINT64 freq = 0;
     int ret;
-- 
2.34.1


