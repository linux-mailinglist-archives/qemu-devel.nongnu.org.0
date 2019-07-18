Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B76C819
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 05:43:12 +0200 (CEST)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnxK3-0008Th-EK
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 23:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40162)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <npiggin@gmail.com>) id 1hnxJX-0006o2-6I
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 23:42:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1hnxJW-0007M6-2m
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 23:42:39 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34501)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1hnxJT-0007J9-QE; Wed, 17 Jul 2019 23:42:35 -0400
Received: by mail-pg1-x544.google.com with SMTP id n9so5963951pgc.1;
 Wed, 17 Jul 2019 20:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uhiCgc+dCxSfR3eJ9HdFX08Apd62hEJrdjSNK2SkpNA=;
 b=P2K8nm5sk8RKytRZa0LuS4F8yJQS6gCCGUX6pgR11I5/FnVW0uQkihyaTgOgF6UQNg
 w1AAzJD86izx1X82qGmJj0maIS48Liq/c46E9MKxfIP+oe4LdYwPrahMaoiEA+stDGFT
 gcvzt2L1wuKWeFYihJCRb2ZAqQ4R4pTvLAbxzpz8xREBIid5gRX3afUOrob4cQvzr0pc
 mcuhO+5TGHbGuPCamGTUtlJZe60S+2zvBHPtiZMKdXAn9RzjTOFUFnUNS0kvnhVsJP3v
 xN6ysXUH326SWBEnVH376K9jP6YMXnXU99nXeVU2SDQUSQ4g+0v+h3COKTD1Q3w0QzIX
 2T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uhiCgc+dCxSfR3eJ9HdFX08Apd62hEJrdjSNK2SkpNA=;
 b=ayQXDANdczN7oM09yvI3b8OMDhNPwCKbZcY+gqZ0WjQ6/H71FqhIfhlpY/Bb1b/fOZ
 caR8Mm97lmI5eAPU9VvpHvOdZ8PyzeQawuiQdYZynFYkddmG/kfxQrHTokFlnBoZzE5E
 bo0xteiWiLueh4ltYk8PdCJrhl9g28tGvXoFidGLEsaAMMqdLTk2BTOJ+su8wNZpXevQ
 BtyDz8lxlyaGPLkDOSNEdA2mS7FIR+g7lxQsxO2O7FxZ/xnza1YPvFeSCeYvmfHoKXdW
 4rddrGTqNnBbUHdrDbq28i4dn8GrtDUsQWGoR4m+N9sq4rtHuhhoom3iI6358RJDx2V/
 Wt3g==
X-Gm-Message-State: APjAAAWX7OtBRT5ONMOM0M68RzuJtVqFtq7fKdxtMv2AMPd4A+LuccX7
 RqCiOGdakzXCKetLoItS7BM=
X-Google-Smtp-Source: APXvYqysCqvsANl9putZ6l6JABcuHAP4S+z56FZG2jhmm2pslfWk5oJJazGX6LYLK6nGfT9YLF24KQ==
X-Received: by 2002:a63:221f:: with SMTP id i31mr46388929pgi.251.1563421354942; 
 Wed, 17 Jul 2019 20:42:34 -0700 (PDT)
Received: from bobo.local0.net ([203.220.8.141])
 by smtp.gmail.com with ESMTPSA id b3sm38787612pfp.65.2019.07.17.20.42.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 20:42:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Jul 2019 13:42:12 +1000
Message-Id: <20190718034214.14948-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718034214.14948-1-npiggin@gmail.com>
References: <20190718034214.14948-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v6 2/4] spapr: Implement H_PROD
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

H_PROD is added, and H_CEDE is modified to test the prod bit
according to PAPR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Changes since v5:
- Add the prod bit here
- Fix target CPU

 hw/ppc/spapr.c                  |  1 +
 hw/ppc/spapr_hcall.c            | 32 ++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_cpu_core.h |  1 +
 3 files changed, 34 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3e5678d467..68341c128d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4309,6 +4309,7 @@ static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
 
     /* These are only called by TCG, KVM maintains dispatch state */
 
+    spapr_cpu->prod = false;
     if (spapr_cpu->vpa_addr) {
         CPUState *cs = CPU(cpu);
         uint32_t dispatch;
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index e615881ac4..098b3dda22 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1050,14 +1050,44 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
 {
     CPUPPCState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
 
     env->msr |= (1ULL << MSR_EE);
     hreg_compute_hflags(env);
+
+    if (spapr_cpu->prod) {
+        spapr_cpu->prod = false;
+        return H_SUCCESS;
+    }
+
     if (!cpu_has_work(cs)) {
         cs->halted = 1;
         cs->exception_index = EXCP_HLT;
         cs->exit_request = 1;
     }
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_prod(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                           target_ulong opcode, target_ulong *args)
+{
+    target_long target = args[0];
+    PowerPCCPU *tcpu;
+    CPUState *cs;
+    SpaprCpuState *spapr_cpu;
+
+    tcpu = spapr_find_cpu(target);
+    cs = CPU(tcpu);
+    if (!cs) {
+        return H_PARAMETER;
+    }
+
+    spapr_cpu = spapr_cpu_state(tcpu);
+    spapr_cpu->prod = true;
+    cs->halted = 0;
+    qemu_cpu_kick(cs);
+
     return H_SUCCESS;
 }
 
@@ -1882,6 +1912,8 @@ static void hypercall_register_types(void)
     /* hcall-splpar */
     spapr_register_hypercall(H_REGISTER_VPA, h_register_vpa);
     spapr_register_hypercall(H_CEDE, h_cede);
+    spapr_register_hypercall(H_PROD, h_prod);
+
     spapr_register_hypercall(H_SIGNAL_SYS_RESET, h_signal_sys_reset);
 
     /* processor register resource access h-calls */
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index f9645a7290..a40cd08ea0 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -46,6 +46,7 @@ typedef struct SpaprCpuState {
     uint64_t vpa_addr;
     uint64_t slb_shadow_addr, slb_shadow_size;
     uint64_t dtl_addr, dtl_size;
+    bool prod; /* not migrated, only used to improve dispatch latencies */
     struct ICPState *icp;
     struct XiveTCTX *tctx;
 } SpaprCpuState;
-- 
2.20.1


