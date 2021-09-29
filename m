Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6F41CA33
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:35:25 +0200 (CEST)
Received: from localhost ([::1]:54096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcYG-0005Yt-Im
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcUV-0001XG-0e; Wed, 29 Sep 2021 12:31:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcUT-0004w3-3e; Wed, 29 Sep 2021 12:31:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id h15so3686654wrc.3;
 Wed, 29 Sep 2021 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N3IJV0m/ZFM0ggqe7+WRaHWf341S7hpElakJ20EkmsI=;
 b=Vxx20VuLOomRCmIrdrDCiCHZKDkLreLOKim8fQK+khAezLamZNy2m5a6ouNRM3uPwV
 EW6xhMIOgl5zIXK7XgyxX7D+/EVY7iR6eyOBskk34Rz8dO9cteclLkNsroU6TChInkNp
 mWM7rzwc9ejqqk7pKJb6Z8yEwQ4PsY6e6LyDZcNpv/c43NC7VFZdKX+FdPqRrDIRv1FA
 jlW6NGYyyBvOjS3E9/EebZZI50h6ALfwPnWInxeRfxyKzHrMg3BQg/lm23GY//oDmRZU
 dxlFcpRazyeLB60MX/ocyWRgou+2yCAV3u+KxuUhNHOq/gQS2UUcfVzxaz4nYgfkPszh
 exuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=N3IJV0m/ZFM0ggqe7+WRaHWf341S7hpElakJ20EkmsI=;
 b=DoZrmNZOxThQj0PhLct8S+ImuuWScu6ZpBVcDlARRW6ThrSkSQcOGlSsCFo1q3wRWY
 fmTleE/GRHxO8G1j57qqNuD6n3XC4LMXVw4YAsFnWflZl463NkCPSjiuPm6/vb/LwgOw
 NKqG/yHng8G+I9KzW2gO+Bg0oGzHvWp6yf5Lpwn3BiKjYYfLMnxkIdQNobo4K/36Z/yY
 kiqY8PS6yuYzIhyTkAIJI4VUqEL5Fb6UE+c6iGjhXXHHqTcI5Bs4Ke8e9fjrVWtAIuHJ
 HWWJd3cVeEdFy1v8z+rvS8n/OWK2SdKW2eGTyy9ImpLWOar4D1fSY57S0lyai0tLbvpM
 /qvw==
X-Gm-Message-State: AOAM530SI/qxLx3FnM6Gg3O3/0AgKMLt8KJcxuFQCw9rR+BB0dn9NeYN
 rfncMd0q4XOGujlYVz1h7URwH+VI340=
X-Google-Smtp-Source: ABdhPJx58FdQ3h8ScVZyvT0XMTE/Z+oNevVl88ncNK3lbBYBEp1D4Wfhmku9AXw1a3xxirKpNId8qw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr956316wrm.201.1632933086919;
 Wed, 29 Sep 2021 09:31:26 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 1sm2437902wms.0.2021.09.29.09.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 09:31:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/i386: Include 'hw/i386/apic.h' locally
Date: Wed, 29 Sep 2021 18:31:24 +0200
Message-Id: <20210929163124.2523413-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
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
 target/i386/tcg/sysemu/misc_helper.c | 1 +
 target/i386/tcg/sysemu/seg_helper.c  | 1 +
 target/i386/whpx/whpx-all.c          | 1 +
 15 files changed, 17 insertions(+), 4 deletions(-)

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


