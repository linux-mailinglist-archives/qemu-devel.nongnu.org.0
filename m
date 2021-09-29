Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4B41CA16
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:28:16 +0200 (CEST)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcRL-0003nj-4U
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcP0-0000aL-71; Wed, 29 Sep 2021 12:25:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcOx-0000KP-5k; Wed, 29 Sep 2021 12:25:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so5803452wmq.1; 
 Wed, 29 Sep 2021 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/z4q4xz14vgf03sCSRqWiasmkSgRNoaEpSx63WFnDY=;
 b=igiiKPlvIDm8zChKBHOMyJP322gF3d26cumMjCt6yPZC74LDPbg7U8LzKzSQ/6iptZ
 5g1DhUa15KakutnkKuLEDFUkSyPhQA/3HLhZUa46hXGckOUerErl77O7Bu4wH+dMoFIX
 AVCDbuGAbzm+2EjiTG2xqxEmR5OYpogI+onROaCnlCJ78b30n5R3YxoFvN4sW6SjOGxa
 bUIX0KSvJGV/NaICZpY+hoVQCrzv3Im6P9sAiyZzH2IWL563/dmHr49HNl3Xl4XOxdWM
 /ZPwdVbvkGEpVNJ7fFWf1aBr3BLFg7vMNDJzgYfhpVxFxr+FVX97y0ou9ZWGHXqSnz3G
 9rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=M/z4q4xz14vgf03sCSRqWiasmkSgRNoaEpSx63WFnDY=;
 b=gWOiUAJsDUUKbjv8463dsYxv735C/BVyj1SZCkbrjkv2cbsx1RRudzFNAf+Yot0lIs
 k/pKg8+QASFlpp+VdXXjuSP9fLhJ2+IQAWBVbQlNHjy+PPMZiUeKt6nlsbKHbvKbfbxO
 QLuT8NGXTcwkRt158XibOKc96KirQ81DxXpzV4ppmbnKwISShsV1IrgtD/TQ4gGZo5D0
 1ylyCaDZOBk0bkAXjH9K0tS3r3o7fXffG68pSz1u6qQnWqjZDVQgHOTrnp1tST00eeH3
 4OWvVqG6vWPhTImyrNYsb6Et6Tp5JBGbjjvGfVP991oguuGb9woDIIJ5G2oekZHiW7L8
 C1YQ==
X-Gm-Message-State: AOAM530lqSf81WYREzP0jNP6quDTBcNOo6IQNQS27sSnA1WnzlCrrWp2
 Hc2PM7kQCD5FLkaymDqKUfOmpjCMmX8=
X-Google-Smtp-Source: ABdhPJyLLpxoz6jaXKWjW6InwgnCAvHajZusY6QZz9HuVLPUXr8V71rbe7b4dOtV1UdviDt/S287/g==
X-Received: by 2002:a1c:1f0d:: with SMTP id f13mr875976wmf.25.1632932744137;
 Wed, 29 Sep 2021 09:25:44 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id e5sm398966wrd.1.2021.09.29.09.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 09:25:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Include 'hw/i386/apic.h' locally
Date: Wed, 29 Sep 2021 18:25:40 +0200
Message-Id: <20210929162540.2520208-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of including a sysemu-specific header in "cpu.h"
(which is shared with user-mode emulations), include it
locally when required.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h                    | 4 ----
 hw/i386/kvmvapic.c                   | 1 +
 hw/i386/x86.c                        | 1 +
 target/i386/cpu-dump.c               | 1 +
 target/i386/cpu-sysemu.c             | 1 +
 target/i386/cpu.c                    | 1 +
 target/i386/gdbstub.c                | 4 ++++
 target/i386/hax/hax-all.c            | 1 +
 target/i386/helper.c                 | 1 +
 target/i386/hvf/hvf.c                | 1 +
 target/i386/hvf/x86_emu.c            | 1 +
 target/i386/nvmm/nvmm-all.c          | 1 +
 target/i386/tcg/seg_helper.c         | 4 ++++
 target/i386/tcg/sysemu/misc_helper.c | 1 +
 target/i386/tcg/sysemu/seg_helper.c  | 1 +
 target/i386/whpx/whpx-all.c          | 1 +
 16 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c2954c71ea0..4411718bb7a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2045,10 +2045,6 @@ typedef X86CPU ArchCPU;
 #include "exec/cpu-all.h"
 #include "svm.h"
 
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/i386/apic.h"
-#endif
-
 static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 43f8a8f679e..7333818bdd1 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -16,6 +16,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
+#include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 00448ed55aa..e0218f8791f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -43,6 +43,7 @@
 #include "target/i386/cpu.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/fw_cfg.h"
+#include "hw/i386/apic.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 
diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 02b635a52cf..0158fd2bf28 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/i386/apic_internal.h"
+#include "hw/i386/apic.h"
 #endif
 
 /***********************************************************/
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 37b7c562f53..4e8a6973d08 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -30,6 +30,7 @@
 #include "hw/qdev-properties.h"
 
 #include "exec/address-spaces.h"
+#include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
 
 #include "cpu-internal.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf1..52422cbf21b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -33,6 +33,7 @@
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
+#include "hw/i386/apic.h"
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 098a2ad15a9..5438229c1a9 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -21,6 +21,10 @@
 #include "cpu.h"
 #include "exec/gdbstub.h"
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/i386/apic.h"
+#endif
+
 #ifdef TARGET_X86_64
 static const int gpr_map[16] = {
     R_EAX, R_EBX, R_ECX, R_EDX, R_ESI, R_EDI, R_EBP, R_ESP,
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa92..cd89e3233a9 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/boards.h"
+#include "hw/i386/apic.h"
 
 #include "hax-accel-ops.h"
 
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 533b29cb91b..874beda98ae 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -26,6 +26,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/hw_accel.h"
 #include "monitor/monitor.h"
+#include "hw/i386/apic.h"
 #endif
 
 void cpu_sync_bndcs_hflags(CPUX86State *env)
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab3..50058a24f2a 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -70,6 +70,7 @@
 #include <sys/sysctl.h>
 
 #include "hw/i386/apic_internal.h"
+#include "hw/i386/apic.h"
 #include "qemu/main-loop.h"
 #include "qemu/accel.h"
 #include "target/i386/cpu.h"
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 7c8203b21fb..fb3e88959d4 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -45,6 +45,7 @@
 #include "x86_flags.h"
 #include "vmcs.h"
 #include "vmx.h"
+#include "hw/i386/apic.h"
 
 void hvf_handle_io(struct CPUState *cpu, uint16_t port, void *data,
                    int direction, int size, uint32_t count);
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index a488b00e909..944bdb49663 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -22,6 +22,7 @@
 #include "qemu/queue.h"
 #include "migration/blocker.h"
 #include "strings.h"
+#include "hw/i386/apic.h"
 
 #include "nvmm-accel-ops.h"
 
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index baa905a0cd6..76b4ad918a7 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -28,6 +28,10 @@
 #include "helper-tcg.h"
 #include "seg_helper.h"
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/i386/apic.h"
+#endif
+
 /* return non zero if error */
 static inline int load_segment_ra(CPUX86State *env, uint32_t *e1_ptr,
                                uint32_t *e2_ptr, int selector,
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 9ccaa054c4c..b1d3096e9c9 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
 #include "tcg/helper-tcg.h"
+#include "hw/i386/apic.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index bf3444c26b0..34f2c65d47f 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "tcg/helper-tcg.h"
 #include "../seg_helper.h"
+#include "hw/i386/apic.h"
 
 #ifdef TARGET_X86_64
 void helper_syscall(CPUX86State *env, int next_eip_addend)
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 3e925b9da70..9ab844fd05d 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -20,6 +20,7 @@
 #include "qemu/main-loop.h"
 #include "hw/boards.h"
 #include "hw/i386/ioapic.h"
+#include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-- 
2.31.1


