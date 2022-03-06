Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F54CEBC9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:41:58 +0100 (CET)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQr93-0002bz-Mm
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:41:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqXJ-0003fV-Ht
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:57 -0500
Received: from [2a00:1450:4864:20::32b] (port=39923
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqXH-0004Js-O4
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so9204423wmq.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tu+dcsbHyVQvgi6pp/9x0jcimoaLaKVIamSRlZrE4n8=;
 b=gB8MWXjC1SrR0JlaCQGCHXCcBUGs2rWyuv3kGv6wOtkcqxzV96h8H5T1B/PYAnUOz0
 Tfy5F0/HJaRyZUTxs4kEnNMf/aTLBtJY+zs1wLDPXnTZmzx2iBTwf43XUYrDwMquyrqX
 HH965PSo9TNPlksOkRdanjLhUglQzv7mK6ACKLbAtIBLbC5e2IM7EFx5q35G2LaszzPF
 NwbuyWfO9+s2k8P+1rsfZD/d0Zx8aQhM0bgyf8aTV5JbbbxxTN4UaNJtpOGe+h/7pMJX
 f6aYdKkk5PvMKyC8GwTbtD1np+Nps+CHAnR8KB6tplmb8vkjP3IBiZ/PF4zkoE3uR0xA
 Jjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tu+dcsbHyVQvgi6pp/9x0jcimoaLaKVIamSRlZrE4n8=;
 b=PV5BqrH+LtQRD5kprxYpsPtBK9zdJktbPx0U0GjEpENhtzU8ZNwr3PC1RPtLm5zWpw
 49TvSNabRfpH0nOmdXVbQ+0Qd+jIPa2p29ZCV98BKDgTLIsO/NMpvxrsAEMPsYQnq3OA
 kLixm3M8U/0gDQKtQLh6OPrFQEmo8zc7k21OFiU19TrQ3ei7+E0qJ41VERDsDqqngNys
 EYVG8hVuwUA7NdIQV9sJqOxh0fjPcMsThEwZ9/mFo3MZlg4sCXiANXG+Igg+OYS1yada
 SPXfN6s1ISZ7RaAF4M2GoJC8zoHJwpCdHtIh7MumlzkkIoRmDaBy5pr37rG1t3BD6CZr
 unAA==
X-Gm-Message-State: AOAM532ogB+31hcsrT1xQN5O8FABQHzUGF2IfUvhukgvou/C2P97/OIo
 da4u7fTnL+2372zf+ke/Fbi5NaYJz9g=
X-Google-Smtp-Source: ABdhPJzLyZKoDtosQ9RJ2uzn3XKJatNCS+WUwEvzzXZvRzmwosPm9xK6m8qlW2dFD3IbHel6mq9ULA==
X-Received: by 2002:a7b:cd94:0:b0:380:b241:8c52 with SMTP id
 y20-20020a7bcd94000000b00380b2418c52mr14801281wmj.2.1646571770743; 
 Sun, 06 Mar 2022 05:02:50 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b00352ec3b4c5asm12522643wms.7.2022.03.06.05.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] target/i386: Remove pointless CPUArchState casts
Date: Sun,  6 Mar 2022 13:59:59 +0100
Message-Id: <20220306130000.8104-33-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220305233415.64627-3-philippe.mathieu.daude@gmail.com>
---
 target/i386/hax/hax-all.c   |  4 ++--
 target/i386/nvmm/nvmm-all.c | 14 +++++++-------
 target/i386/whpx/whpx-all.c | 18 +++++++++---------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index ccdcb6afabc..81f665e2124 100644
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
index e159dd2b939..b97d091a502 100644
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
index a8222461440..c7e25abf42c 100644
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
2.35.1


