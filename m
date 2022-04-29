Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB50514FC6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:40:57 +0200 (CEST)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSjo-0001q8-Fi
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSk-0001fq-Py
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:18 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSh-00067N-Qp
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:18 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g20so9455407edw.6
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sr+1S5AfPs7pF8A9J3lRj9fU0Gq6cRnPtGYyBTEolJA=;
 b=JOPknC+rTJoK3eLqu3R8+GmaZD2Jfhp8jKxnkmF4HBwFT6Y+O99LELhU1m8+Qx4Aj6
 hShIirnsEzMEUgYsSxmlR78yFCdNOrPapCumRbzsa12LgJ193q75rgtndz7Pd/S1ksqJ
 iIs47RrEkXvcoY/n+2JYjwOVbdc3qoAN1sds0hS3/KUrXbRyjUFAPKdU9XyUezcwhRt/
 CrceruzRXDpQspuh6yIGjWEHpjjL12HGoGnrfuhVjRN0gFL85J4EAEjv5Rg9i8o+7Ayq
 AkEEfnSITAVOmdkojR37Wm47DIt4v5Ipb0X75ZkM75FvOSY8rVuI0yn4fDLG5CcT7H/I
 M3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sr+1S5AfPs7pF8A9J3lRj9fU0Gq6cRnPtGYyBTEolJA=;
 b=KgjpeS7fphqaAdteiPnHP54VV32u9MGwU16UcmZT/P8C3WtRlHSnLverAf+MqJnMu9
 d2AVgpwVo7ggOv/Y5SjLfXrj0rqXk85ME+MHPWqXAkDxQ9HwUE9rG+HQEo6OIyPminNg
 3hE5aedRbm2cabi/Xlq6si8ej5zIgp535SCESPWjZMmH2JvEUtvQ8k+CqzMslIEMwfUb
 zlV+vF1bfHk7rOpdoW0kEQm3v3ZyCKndj+pzAuADPViLc5N1ZohqZiDIyD5kuIoAxLyU
 BexpGuXOapvl5oTL0J45c6sw9OKttfcSf4hVQxAH/8M3DMEHt6GxYfjnr0IcIULbDxT7
 BWVg==
X-Gm-Message-State: AOAM532DqmHSbA9T7qjWDK9Qfv5BzUOl6oInxolyPDA3qVRWr/vIFMS8
 jD/yizkc3MNPs+IjKIk46HLKv+S2+tdq+Q==
X-Google-Smtp-Source: ABdhPJyu7UqEAHLela71/ppzNv0ft41Ak+X1RaJu6kp3qggq3peSuQASVM6y2mWBIKkC/5fRvTVakg==
X-Received: by 2002:aa7:c3ca:0:b0:425:ecfc:4258 with SMTP id
 l10-20020aa7c3ca000000b00425ecfc4258mr27110006edr.266.1651245794433; 
 Fri, 29 Apr 2022 08:23:14 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/25] WHPX: support for xcr0
Date: Fri, 29 Apr 2022 17:22:48 +0200
Message-Id: <20220429152312.335715-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sunil Muthuswamy <sunilmut@microsoft.com>

Support for xcr0 to be able to enable xsave/xrstor. This by itself
is not sufficient to enable xsave/xrstor. WHPX XSAVE API's also
needs to be hooked up.

Signed-off-by: Sunil Muthuswamy <sunilmut@microsoft.com>
Message-Id: <MW2PR2101MB1116F07C07A26FD7A7ED8DCFC0780@MW2PR2101MB1116.namprd21.prod.outlook.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/whpx/whpx-all.c      | 89 ++++++++++++++++++++++++++++++++
 target/i386/whpx/whpx-internal.h |  3 ++
 2 files changed, 92 insertions(+)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b625ad5bbb..c8376da7ed 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -246,9 +246,15 @@ static bool whpx_allowed;
 static bool whp_dispatch_initialized;
 static HMODULE hWinHvPlatform, hWinHvEmulation;
 static uint32_t max_vcpu_index;
+static WHV_PROCESSOR_XSAVE_FEATURES whpx_xsave_cap;
+
 struct whpx_state whpx_global;
 struct WHPDispatch whp_dispatch;
 
+static bool whpx_has_xsave(void)
+{
+    return whpx_xsave_cap.XsaveSupport;
+}
 
 /*
  * VP support
@@ -300,6 +306,28 @@ static SegmentCache whpx_seg_h2q(const WHV_X64_SEGMENT_REGISTER *hs)
     return qs;
 }
 
+/* X64 Extended Control Registers */
+static void whpx_set_xcrs(CPUState *cpu)
+{
+    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    HRESULT hr;
+    struct whpx_state *whpx = &whpx_global;
+    WHV_REGISTER_VALUE xcr0;
+    WHV_REGISTER_NAME xcr0_name = WHvX64RegisterXCr0;
+
+    if (!whpx_has_xsave()) {
+        return;
+    }
+
+    /* Only xcr0 is supported by the hypervisor currently */
+    xcr0.Reg64 = env->xcr0;
+    hr = whp_dispatch.WHvSetVirtualProcessorRegisters(
+        whpx->partition, cpu->cpu_index, &xcr0_name, 1, &xcr0);
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to set register xcr0, hr=%08lx", hr);
+    }
+}
+
 static int whpx_set_tsc(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
@@ -435,6 +463,12 @@ static void whpx_set_registers(CPUState *cpu, int level)
 
     /* 8 Debug Registers - Skipped */
 
+    /*
+     * Extended control registers needs to be handled separately depending
+     * on whether xsave is supported/enabled or not.
+     */
+    whpx_set_xcrs(cpu);
+
     /* 16 XMM registers */
     assert(whpx_register_names[idx] == WHvX64RegisterXmm0);
     idx_next = idx + 16;
@@ -541,6 +575,30 @@ static int whpx_get_tsc(CPUState *cpu)
     return 0;
 }
 
+/* X64 Extended Control Registers */
+static void whpx_get_xcrs(CPUState *cpu)
+{
+    struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
+    HRESULT hr;
+    struct whpx_state *whpx = &whpx_global;
+    WHV_REGISTER_VALUE xcr0;
+    WHV_REGISTER_NAME xcr0_name = WHvX64RegisterXCr0;
+
+    if (!whpx_has_xsave()) {
+        return;
+    }
+
+    /* Only xcr0 is supported by the hypervisor currently */
+    hr = whp_dispatch.WHvGetVirtualProcessorRegisters(
+        whpx->partition, cpu->cpu_index, &xcr0_name, 1, &xcr0);
+    if (FAILED(hr)) {
+        error_report("WHPX: Failed to get register xcr0, hr=%08lx", hr);
+        return;
+    }
+
+    env->xcr0 = xcr0.Reg64;
+}
+
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
@@ -634,6 +692,12 @@ static void whpx_get_registers(CPUState *cpu)
 
     /* 8 Debug Registers - Skipped */
 
+    /*
+     * Extended control registers needs to be handled separately depending
+     * on whether xsave is supported/enabled or not.
+     */
+    whpx_get_xcrs(cpu);
+
     /* 16 XMM registers */
     assert(whpx_register_names[idx] == WHvX64RegisterXmm0);
     idx_next = idx + 16;
@@ -2513,6 +2577,31 @@ static int whpx_accel_init(MachineState *ms)
         goto error;
     }
 
+    /*
+     * Query the XSAVE capability of the partition. Any error here is not
+     * considered fatal.
+     */
+    hr = whp_dispatch.WHvGetPartitionProperty(
+        whpx->partition,
+        WHvPartitionPropertyCodeProcessorXsaveFeatures,
+        &whpx_xsave_cap,
+        sizeof(whpx_xsave_cap),
+        &whpx_cap_size);
+
+    /*
+     * Windows version which don't support this property will return with the
+     * specific error code.
+     */
+    if (FAILED(hr) && hr != WHV_E_UNKNOWN_PROPERTY) {
+        error_report("WHPX: Failed to query XSAVE capability, hr=%08lx", hr);
+    }
+
+    if (whpx_has_xsave()) {
+        printf("WHPX: Partition XSAVE capable\n");
+    } else {
+        printf("WHPX: Partition is not XSAVE capable\n");
+    }
+
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
     prop.ProcessorCount = ms->smp.cpus;
     hr = whp_dispatch.WHvSetPartitionProperty(
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-internal.h
index 2416ec7922..dbb7e7ba82 100644
--- a/target/i386/whpx/whpx-internal.h
+++ b/target/i386/whpx/whpx-internal.h
@@ -48,6 +48,9 @@ void whpx_apic_get(DeviceState *s);
 
 #define WHV_E_UNKNOWN_CAPABILITY 0x80370300L
 
+/* This should eventually come from the Windows SDK */
+#define WHV_E_UNKNOWN_PROPERTY 0x80370302
+
 #define LIST_WINHVPLATFORM_FUNCTIONS(X) \
   X(HRESULT, WHvGetCapability, (WHV_CAPABILITY_CODE CapabilityCode, VOID* CapabilityBuffer, UINT32 CapabilityBufferSizeInBytes, UINT32* WrittenSizeInBytes)) \
   X(HRESULT, WHvCreatePartition, (WHV_PARTITION_HANDLE* Partition)) \
-- 
2.35.1



