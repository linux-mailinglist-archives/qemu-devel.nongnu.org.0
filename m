Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6443FF05D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:40:46 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLopa-00011u-1W
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoYD-0003zr-Sc
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:22:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoYB-0006LR-KI
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:22:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso1633775wmr.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRxaaF+8dsZ1zmXaM7sjZ+Mi6rCeV5Km3TCPoa1xp0o=;
 b=D8Apizj4GHUGsXwL1/B/iLfmSkfiKmAsZmoDd3/7YDACNJkAKFkWSokq8XiwwcsRKm
 0eaUKUUTSWmsrIsUNGIBMz22o7G2OpPk1xSk7Mq97P+7rpdjtHUtHvvq4qE1GsPiOfFO
 A0cPjIm2QmYPOiKZvo0/vzQO/9WeiAbrsWqY1grmps4PDKf5GYkMURgtdPlfns0xP2Ai
 qw4h4dZGotbF7YVBkYIfp8sI9t3bhaYq+sJVP0tisDgGml0DX6aqYT0c5uKkIx7gg/pL
 brPEkgT3e2lRis9UmI7AR1IP6nE571F8qv7r9+9K0vTZyvBsWITfxZI7YHVxIpnVncWn
 b1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SRxaaF+8dsZ1zmXaM7sjZ+Mi6rCeV5Km3TCPoa1xp0o=;
 b=awuTZuPBcKqlLABallpbGknXwnqPl1k71Ibd5x1Z59hoT5/DisMjtRjabRkFu0Kbkf
 cOM9zGdCVA8/aH1PtiVPjYbcHlR6ZPt9ZPNmnslEJDs0l9VrwrvgmAQ6z4j8GkaJFcuk
 ZUchJXUkzhOHlDuTUQEKJ9nYNg6r7X62Z13EhGlrIYd4YCqjEca1waL9DPuRRsXgtH+i
 caI/DPFSr02OWsazHLFC7B+3ONLSNsiycOOX9s5bL8cD4F9wPgpqQPzY16tjklj0veK2
 rkYcnYA/L8EK2iBWUc8/jfzuT9lH4uvvbyRD3952vjMKxW+qRGYdOTpxKUXZUtWDhkts
 DTvQ==
X-Gm-Message-State: AOAM532rKkktI43pQTrAVSkUuw2uDEXCPlFR2pXfcwAo6R4x/q/pnQn/
 Ph9Qd0G2SqMp97h2xXsBHicTYKb8HuA=
X-Google-Smtp-Source: ABdhPJxgIru6W0cGoHrqWNI00OVj9GENwaPoGp9UI3ACZcApEDqZ3cfCnrbk0jobPxa5pQ2uvjpaPQ==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr3779803wme.95.1630596165699; 
 Thu, 02 Sep 2021 08:22:45 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f3sm1889907wmj.28.2021.09.02.08.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:22:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
Date: Thu,  2 Sep 2021 17:22:43 +0200
Message-Id: <20210902152243.386118-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20210902151715.383678-1-f4bug@amsat.org>
"accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to sysemu"
---
 target/i386/cpu.h                    | 4 ----
 hw/i386/kvmvapic.c                   | 1 +
 hw/i386/x86.c                        | 1 +
 target/i386/cpu-sysemu.c             | 1 +
 target/i386/cpu.c                    | 1 +
 target/i386/gdbstub.c                | 4 ++++
 target/i386/hax/hax-all.c            | 1 +
 target/i386/helper.c                 | 1 +
 target/i386/hvf/x86_emu.c            | 1 +
 target/i386/nvmm/nvmm-all.c          | 1 +
 target/i386/tcg/seg_helper.c         | 4 ++++
 target/i386/tcg/sysemu/misc_helper.c | 1 +
 target/i386/whpx/whpx-all.c          | 1 +
 13 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c7cc65e92d5..eddafd1acd5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2046,10 +2046,6 @@ typedef X86CPU ArchCPU;
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
 
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 1078e3d157f..65709e41903 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -30,6 +30,7 @@
 #include "hw/qdev-properties.h"
 
 #include "exec/address-spaces.h"
+#include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
 
 #include "cpu-internal.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 97e250e8760..04f59043804 100644
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
index 28dee4c5ee3..4c07cfc7194 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -22,6 +22,7 @@
 #include "qemu/queue.h"
 #include "migration/blocker.h"
 #include "strings.h"
+#include "hw/i386/apic.h"
 
 #include "nvmm-accel-ops.h"
 
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 13c6e6ee62e..71fd2bf8d06 100644
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
index e7a2ebde813..dbeda8d0b0f 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
 #include "tcg/helper-tcg.h"
+#include "hw/i386/apic.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
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


