Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3D6A093
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 04:48:34 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnDW4-0003rK-Rv
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 22:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44275)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <npiggin@gmail.com>) id 1hnDVQ-0002Ao-GC
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 22:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1hnDVP-0004Tm-4F
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 22:47:52 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1hnDVM-0004P8-8F; Mon, 15 Jul 2019 22:47:48 -0400
Received: by mail-pg1-x533.google.com with SMTP id z75so8654541pgz.5;
 Mon, 15 Jul 2019 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PzwK4vtv/PDyhfXpJbiQNfSLcteSs1hAR52r+MzvdUY=;
 b=Clsy1lqvQ+brPUaCagfqXzIwQJaFkktO9aUTxPdv9UhYJbfFsOdQtX9kioO06xuHVO
 tIx/VKgzOeCyD0YkYQdlk4x5GAr75YC4evYSM7bZKxJvZlzAzTd9riEKTs9BSayP2agi
 QOADGyoE+sCxnA6h9TwB+I+Y8ZsLvMIbXUYxiEjdyvdUfUrpTtQqyIu2qX+l/FFrqVMi
 qmUyWqW0PVb2u+sdksZ2C5DtanuFrrU+G16QtPnorzTn3eWdIBPXTWxCTSbWzmUpbQIT
 CKw68X3NB1gBjkFazZT27t9EyrHuBt8cYibGxyw0bpdCpd52srVZxANC/hQ2j9xLKGo0
 XgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PzwK4vtv/PDyhfXpJbiQNfSLcteSs1hAR52r+MzvdUY=;
 b=oQSOG2BnWjX2lcNslt3krlBvsdRpX4Q6mQgr55JCW2H+dLR/ikSUPyAyH7RT+aesdg
 HTULwIMYlPyFR7ZvW5vlXjhfPscrZn+skww8FIQeNww7UXoI/OOYWE2eXsmEKPpEELFe
 uKOGHfa00q3CsqD2cLpYxd3q2HiDpuHQd4v6vcDXQmh/jpopjS4kyaIFZFN1n1wmd8bK
 4tqvzXI1VDVF6F7VAc1CGoyD7McYiVkvXkATGipTGE4Dvvt3odSi1SbEz5++misyicKH
 t2WFJ61IF1YHPViE6JMUVZTQDjE0CyHXU83XQIwfN88XC7UxGphCIgXy001O8QWcyvb5
 RJow==
X-Gm-Message-State: APjAAAW1125NhwEvp+D+eX+xYOVuU2kSuN9zF0ZXvjPOvMJjPi77iHpv
 f1y3p0HWKlUiFUTnUDmSDlA=
X-Google-Smtp-Source: APXvYqz4FtsMJsXeoozSjP+Sm7fdcXk32s8SfYRkIKSI8idPKlU0d54sZ+YB/T87XeW3K67tlf33Zw==
X-Received: by 2002:a63:5550:: with SMTP id f16mr11661981pgm.426.1563245263688; 
 Mon, 15 Jul 2019 19:47:43 -0700 (PDT)
Received: from bobo.local0.net ([203.220.8.141])
 by smtp.gmail.com with ESMTPSA id x8sm16557837pfa.46.2019.07.15.19.47.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 19:47:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 16 Jul 2019 12:47:22 +1000
Message-Id: <20190716024726.17864-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716024726.17864-1-npiggin@gmail.com>
References: <20190716024726.17864-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-devel] [PATCH v4 1/5] spapr: Implement dispatch counter and
 prod bit on tcg
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement cpu_exec_enter/exit on ppc which calls into new methods of
the same name in PPCVirtualHypervisorClass. These are used by spapr
to implement these splpar elements, used in subsequent changes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr.c                  | 25 +++++++++++++++++++++++++
 hw/ppc/spapr_cpu_core.c         |  5 ++++-
 hw/ppc/spapr_hcall.c            |  5 -----
 include/hw/ppc/spapr.h          |  7 +++++++
 include/hw/ppc/spapr_cpu_core.h |  2 ++
 target/ppc/cpu.h                |  2 ++
 target/ppc/translate_init.inc.c | 25 +++++++++++++++++++++++++
 7 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 821f0d4a49..87b11e2484 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4302,6 +4302,29 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
     return NULL;
 }
 
+static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
+{
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+
+    /* These are only called by TCG, KVM maintains dispatch state */
+
+    spapr_cpu->prod = false;
+    spapr_cpu->dispatch_counter++;
+    assert((spapr_cpu->dispatch_counter & 1) == 0);
+    if (spapr_cpu->vpa_addr) {
+        CPUState *cs = CPU(cpu);
+        stl_be_phys(cs->as, spapr_cpu->vpa_addr + VPA_DISPATCH_COUNTER, spapr_cpu->dispatch_counter);
+    }
+}
+
+static void spapr_cpu_exec_exit(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
+{
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+
+    spapr_cpu->dispatch_counter++;
+    assert((spapr_cpu->dispatch_counter & 1) == 1);
+}
+
 static void spapr_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -4358,6 +4381,8 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     vhc->hpte_set_r = spapr_hpte_set_r;
     vhc->get_pate = spapr_get_pate;
     vhc->encode_hpt_for_kvm_pr = spapr_encode_hpt_for_kvm_pr;
+    vhc->cpu_exec_enter = spapr_cpu_exec_enter;
+    vhc->cpu_exec_exit = spapr_cpu_exec_exit;
     xic->ics_get = spapr_ics_get;
     xic->ics_resend = spapr_ics_resend;
     xic->icp_get = spapr_icp_get;
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 5621fb9a3d..fb2ed9e95d 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -261,6 +261,7 @@ error:
 static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
 {
     SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_GET_CLASS(sc);
+    SpaprCpuState *spapr_cpu;
     CPUCore *cc = CPU_CORE(sc);
     Object *obj;
     char *id;
@@ -287,7 +288,9 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
         goto err;
     }
 
-    cpu->machine_data = g_new0(SpaprCpuState, 1);
+    spapr_cpu = g_new0(SpaprCpuState, 1);
+    spapr_cpu->dispatch_counter = 1;
+    cpu->machine_data = spapr_cpu;
 
     object_unref(obj);
     return cpu;
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 6808d4cda8..e615881ac4 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -874,11 +874,6 @@ unmap_out:
 #define FLAGS_DEREGISTER_DTL       0x0000c00000000000ULL
 #define FLAGS_DEREGISTER_SLBSHADOW 0x0000e00000000000ULL
 
-#define VPA_MIN_SIZE           640
-#define VPA_SIZE_OFFSET        0x4
-#define VPA_SHARED_PROC_OFFSET 0x9
-#define VPA_SHARED_PROC_VAL    0x2
-
 static target_ulong register_vpa(PowerPCCPU *cpu, target_ulong vpa)
 {
     CPUState *cs = CPU(cpu);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 60553d32c4..5d36eec9d0 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -525,6 +525,13 @@ void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
 
+/* Virtual Processor Area structure constants */
+#define VPA_MIN_SIZE           640
+#define VPA_SIZE_OFFSET        0x4
+#define VPA_SHARED_PROC_OFFSET 0x9
+#define VPA_SHARED_PROC_VAL    0x2
+#define VPA_DISPATCH_COUNTER   0x100
+
 /* ibm,set-eeh-option */
 #define RTAS_EEH_DISABLE                 0
 #define RTAS_EEH_ENABLE                  1
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index f9645a7290..3032dfa7ee 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -46,6 +46,8 @@ typedef struct SpaprCpuState {
     uint64_t vpa_addr;
     uint64_t slb_shadow_addr, slb_shadow_size;
     uint64_t dtl_addr, dtl_size;
+    uint32_t dispatch_counter;
+    bool prod;
     struct ICPState *icp;
     struct XiveTCTX *tctx;
 } SpaprCpuState;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c9beba2a5c..78d6504acb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1224,6 +1224,8 @@ struct PPCVirtualHypervisorClass {
     void (*hpte_set_r)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t pte1);
     void (*get_pate)(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry);
     target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
+    void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
+    void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
 };
 
 #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index 86fc8f2e31..58d4a93b23 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10473,6 +10473,28 @@ static bool ppc_cpu_is_big_endian(CPUState *cs)
 }
 #endif
 
+static void ppc_cpu_exec_enter(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        vhc->cpu_exec_enter(cpu->vhyp, cpu);
+    }
+}
+
+static void ppc_cpu_exec_exit(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        vhc->cpu_exec_exit(cpu->vhyp, cpu);
+    }
+}
+
 static void ppc_cpu_instance_init(Object *obj)
 {
     PowerPCCPU *cpu = POWERPC_CPU(obj);
@@ -10624,6 +10646,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_initialize = ppc_translate_init;
     cc->tlb_fill = ppc_cpu_tlb_fill;
 #endif
+    cc->cpu_exec_enter = ppc_cpu_exec_enter;
+    cc->cpu_exec_exit = ppc_cpu_exec_exit;
+
     cc->disas_set_info = ppc_disas_set_info;
 
     dc->fw_name = "PowerPC,UNKNOWN";
-- 
2.20.1


