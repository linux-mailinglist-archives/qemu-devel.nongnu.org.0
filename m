Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E464B5A6E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:08:48 +0100 (CET)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgiM-0001H4-S0
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:08:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXF-0001QN-GL; Mon, 14 Feb 2022 13:57:17 -0500
Received: from [2607:f8b0:4864:20::62a] (port=41725
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXD-0006QY-Mu; Mon, 14 Feb 2022 13:57:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id j4so11259933plj.8;
 Mon, 14 Feb 2022 10:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUpXSgEfdHti7BNle9BRd8vJ4VdWvb4m7Pa200NuX4M=;
 b=QwZyK+1mE9BKBE5RiGTBlO5Mf9LRhWDzTSJVaGoYq6vqTbbDXUo8t8WrnjcwV/jwfg
 /AfsWVOR78lQpaMre8vwE9v596HboqTIo5GVkMLk1PXXu9VmNU5rEEf6iuaUyAXxS+PF
 EWov24XiqlRxFLYkbPBrX2Sf9toRNT7QIg3EyijsmXviGdUyRhzjEvabSxWsfuiIIHz/
 7UmcksbnFKe9ViEaY2xrqafdBfGqY/z9USeMJFGc6t2O6ACDy/rTWNX18dMF+bc5Q74H
 vweiC3+nEYTb0iakOf5HaQQxqa7g2iqJuRQGPIrIU5ivZIxT1bKxHal40UYraJcfHWxw
 fKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XUpXSgEfdHti7BNle9BRd8vJ4VdWvb4m7Pa200NuX4M=;
 b=CNYWWZacGPK+1UFklKQWdFcASyACKfvYYSMByNDu8VVkXsRi68mSG77CpLLoqXnRTY
 fVi79UcOWiz2KJHrzszeR+SPx7DgTwRYRqGKVv2UDqewYd7zNs0yuPzsePdsLx2K2KMJ
 cBLeRbxQcd1pcFz1ji9MMmcsb23HxqEMyqVfuNOzNxrStFHG4tOeDK5Nc7f+dqWhqqV6
 xRECcGjBJUTaYtLBu99/4p04T9HmDFQCi2IvpwXex8iwO6ODTVsiXCKKI5I4xPoyxlYs
 PaOmeWvlm7IJ0bYjtEcmbG+CtTHs8PGdBg4LuCm/z9tmgJ2ky24tfYO7xa2DUTbIYZ8v
 +e4w==
X-Gm-Message-State: AOAM532EAyocU2UhpKw2//W5OFGekEM4m2XBFEUhe8laAoZZQBdWjKZp
 ezg3vLDZtd0neS+B8GR6mGKXxg/ZPg4=
X-Google-Smtp-Source: ABdhPJy6HURQooqEMuauTbr2ERFg1XFbkfBdAX6VqJ54JUWG21YbWQX4x+k20QpOvVBNGTwTjpFxhg==
X-Received: by 2002:a17:902:d510:: with SMTP id
 b16mr158430plg.152.1644865032559; 
 Mon, 14 Feb 2022 10:57:12 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id g22sm38618962pfc.177.2022.02.14.10.57.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:57:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 06/16] hvf: Enable RDTSCP support
Date: Mon, 14 Feb 2022 19:55:55 +0100
Message-Id: <20220214185605.28087-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Cameron Esfahani <dirty@apple.com>

Pass through RDPID and RDTSCP support in CPUID if host supports it.
Correctly detect if CPU_BASED_TSC_OFFSET and CPU_BASED2_RDTSCP would
be supported in primary and secondary processor-based VM-execution
controls.  Enable RDTSCP in secondary processor controls if RDTSCP
support is indicated in CPUID.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/hvf.c       | 26 +++++++++++++++++---------
 target/i386/hvf/vmcs.h      |  3 ++-
 target/i386/hvf/x86_cpuid.c |  7 ++++---
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab..4712fe66d4 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -221,6 +221,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
     CPUX86State *env = &x86cpu->env;
+    uint64_t reqCap;
 
     init_emu();
     init_decoder();
@@ -257,19 +258,26 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     /* set VMCS control fields */
     wvmcs(cpu->hvf->fd, VMCS_PIN_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_pinbased,
-          VMCS_PIN_BASED_CTLS_EXTINT |
-          VMCS_PIN_BASED_CTLS_NMI |
-          VMCS_PIN_BASED_CTLS_VNMI));
+                   VMCS_PIN_BASED_CTLS_EXTINT |
+                   VMCS_PIN_BASED_CTLS_NMI |
+                   VMCS_PIN_BASED_CTLS_VNMI));
     wvmcs(cpu->hvf->fd, VMCS_PRI_PROC_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased,
-          VMCS_PRI_PROC_BASED_CTLS_HLT |
-          VMCS_PRI_PROC_BASED_CTLS_MWAIT |
-          VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
-          VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
+                   VMCS_PRI_PROC_BASED_CTLS_HLT |
+                   VMCS_PRI_PROC_BASED_CTLS_MWAIT |
+                   VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
+                   VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
           VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL);
+
+    reqCap = VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES;
+
+    /* Is RDTSCP support in CPUID?  If so, enable it in the VMCS. */
+    if (hvf_get_supported_cpuid(0x80000001, 0, R_EDX) & CPUID_EXT2_RDTSCP) {
+        reqCap |= VMCS_PRI_PROC_BASED2_CTLS_RDTSCP;
+    }
+
     wvmcs(cpu->hvf->fd, VMCS_SEC_PROC_BASED_CTLS,
-          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2,
-                   VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES));
+          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2, reqCap));
 
     wvmcs(cpu->hvf->fd, VMCS_ENTRY_CTLS, cap2ctrl(hvf_state->hvf_caps->vmx_cap_entry,
           0));
diff --git a/target/i386/hvf/vmcs.h b/target/i386/hvf/vmcs.h
index 42de7ebc3a..bb4c764557 100644
--- a/target/i386/hvf/vmcs.h
+++ b/target/i386/hvf/vmcs.h
@@ -354,7 +354,7 @@
 #define VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET (1 << 3)
 #define VMCS_PRI_PROC_BASED_CTLS_HLT (1 << 7)
 #define VMCS_PRI_PROC_BASED_CTLS_MWAIT         (1 << 10)
-#define VMCS_PRI_PROC_BASED_CTLS_TSC           (1 << 12)
+#define VMCS_PRI_PROC_BASED_CTLS_RDTSC         (1 << 12)
 #define VMCS_PRI_PROC_BASED_CTLS_CR8_LOAD      (1 << 19)
 #define VMCS_PRI_PROC_BASED_CTLS_CR8_STORE     (1 << 20)
 #define VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW    (1 << 21)
@@ -362,6 +362,7 @@
 #define VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL   (1 << 31)
 
 #define VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES (1 << 0)
+#define VMCS_PRI_PROC_BASED2_CTLS_RDTSCP        (1 << 3)
 #define VMCS_PRI_PROC_BASED2_CTLS_X2APIC        (1 << 4)
 
 enum task_switch_reason {
diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index 32b0d131df..b11ddaa349 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -96,7 +96,8 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 ebx &= ~CPUID_7_0_EBX_INVPCID;
             }
 
-            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
+            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ |
+                   CPUID_7_0_ECX_RDPID;
             edx &= CPUID_7_0_EDX_AVX512_4VNNIW | CPUID_7_0_EDX_AVX512_4FMAPS;
         } else {
             ebx = 0;
@@ -133,11 +134,11 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
                 CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
-        if (!(cap & CPU_BASED2_RDTSCP)) {
+        if (!(cap2ctrl(cap, CPU_BASED2_RDTSCP) & CPU_BASED2_RDTSCP)) {
             edx &= ~CPUID_EXT2_RDTSCP;
         }
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
-        if (!(cap & CPU_BASED_TSC_OFFSET)) {
+        if (!(cap2ctrl(cap, CPU_BASED_TSC_OFFSET) & CPU_BASED_TSC_OFFSET)) {
             edx &= ~CPUID_EXT2_RDTSCP;
         }
         ecx &= CPUID_EXT3_LAHF_LM | CPUID_EXT3_CMP_LEG | CPUID_EXT3_CR8LEG |
-- 
2.34.1


