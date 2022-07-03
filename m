Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61558564A11
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:37:05 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87H6-0000Nb-Gx
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879P-00044w-8m
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879N-0006MF-Kh
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:06 -0400
Received: by mail-pl1-x633.google.com with SMTP id n10so7022833plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MXXLV0LZy1uJbbvG08ZlNwuwtS15Y0l66bFqVyGakc=;
 b=f9tO0eeVwQC+n50B1O9h5A3Q805au/rhO85CZBsJMAW9/y3kKM1ucr1XKT+rjoE/i9
 niYCOFv3UKNusApMrbyXo/GbQQZrVVpFZnDNlm595B7lMydviyk57ojZKPKKjs9g7G9/
 jNeJwtBFkXPxRIZDDNQNqXfmLSmUJsrB8qdkOT9QoEqVyXCi4pMCO5FTADTCOmmCQfot
 XT1R6ELEF4VjG3UG2ai5dwZDdpGb8u3PmphmnMnrm4TqeV415c6vo8fMIp5O3G8Y+/PK
 AsD1m0KRTyajqN2X3/HvZkcq/p69GY8h1kP1xaCslzb6P3OAR5ShIfSM7VnkvRHxmkIy
 OunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MXXLV0LZy1uJbbvG08ZlNwuwtS15Y0l66bFqVyGakc=;
 b=bl4wLYaj0LTWH6K/uYsWAfFdXUBgNb3MqxZOHoA7vBMfSXnKRyLPcoGZTKGs87KLIl
 xxjAGNdMAK3pjsF1h35bIYFC1JbRzrqEGq67orZuZepeWH+llv9a+M7QesFBwC1Rk4U8
 TIBw0+QzIzJPZCJaVlg6ib6nxLirVRm5sXfdFMXprPl77FrHLtMDS7myUlBhGnByE21X
 wQ4j9W/LoIOu4JKBIWMArrK62dx/YwbXPKIkpTw2lQ/ghtijFGdnLi1dc67PvLwzkhE9
 06EZ4neECGp5DzkXx/Efmh+lCFcuOkvSCBDpJc2InPiag5r0mKcKvawNW6YTXwrvkpET
 YGKA==
X-Gm-Message-State: AJIora8nZfl6PKRv/rCISbwK3A69LecuFxAvknPCQiP5/+oLdX1w16/P
 M1Ap7cDyeDX8mJuS2uImUwLYS5EL92M=
X-Google-Smtp-Source: AGRyM1soSKfk0pyXM4TITOlMDRo1+PWVK4Hcot5w1kezisVD/61i2wNsXF3wp35V8t+H8q/wVO2D6g==
X-Received: by 2002:a17:902:8345:b0:167:879c:abe8 with SMTP id
 z5-20020a170902834500b00167879cabe8mr31507013pln.7.1656883744682; 
 Sun, 03 Jul 2022 14:29:04 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 iw4-20020a170903044400b0016be5ed14d5sm65243plb.40.2022.07.03.14.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:29:04 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 08/11] target/openrisc: Enable MTTCG
Date: Mon,  4 Jul 2022 06:28:20 +0900
Message-Id: <20220703212823.10067-9-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch enables multithread TCG for OpenRISC.  Since the or1k shared
syncrhonized timer can be updated from each vCPU via helpers we use a
mutex to synchronize updates.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 configs/targets/or1k-softmmu.mak |  1 +
 hw/openrisc/cputimer.c           | 17 +++++++++++++++++
 target/openrisc/cpu.h            |  3 +++
 target/openrisc/sys_helper.c     | 11 +++++++++--
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
index 263e970870..432f855a30 100644
--- a/configs/targets/or1k-softmmu.mak
+++ b/configs/targets/or1k-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=openrisc
+TARGET_SUPPORTS_MTTCG=y
 TARGET_BIG_ENDIAN=y
 TARGET_NEED_FDT=y
diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 4dbba3a3d4..2298eff8b9 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -43,6 +43,23 @@ uint32_t cpu_openrisc_count_get(OpenRISCCPU *cpu)
     return or1k_timer->ttcr;
 }
 
+/*
+ * Check to see if calling cpu_openrisc_count_update will
+ * actually advance the time.
+ *
+ * Used in hot spots to avoid taking expensive locks.
+ */
+bool cpu_openrisc_timer_has_advanced(OpenRISCCPU *cpu)
+{
+    uint64_t now;
+
+    if (!cpu->env.is_counting) {
+        return false;
+    }
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    return (now - or1k_timer->last_clk) >= TIMER_PERIOD;
+}
+
 /* Add elapsed ticks to ttcr */
 void cpu_openrisc_count_update(OpenRISCCPU *cpu)
 {
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index b9584f10d4..5354d681f5 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -25,6 +25,8 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
+#define TCG_GUEST_DEFAULT_MO (0)
+
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
@@ -333,6 +335,7 @@ void cpu_openrisc_pic_init(OpenRISCCPU *cpu);
 
 /* hw/openrisc_timer.c */
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu);
+bool cpu_openrisc_timer_has_advanced(OpenRISCCPU *cpu);
 uint32_t cpu_openrisc_count_get(OpenRISCCPU *cpu);
 void cpu_openrisc_count_set(OpenRISCCPU *cpu, uint32_t val);
 void cpu_openrisc_count_update(OpenRISCCPU *cpu);
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 48674231e7..7c0d3d6187 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -145,6 +145,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         break;
     case TO_SPR(10, 0): /* TTMR */
         {
+            qemu_mutex_lock_iothread();
             if ((env->ttmr & TTMR_M) ^ (rb & TTMR_M)) {
                 switch (rb & TTMR_M) {
                 case TIMER_NONE:
@@ -168,14 +169,16 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
                 env->ttmr = rb & ~TTMR_IP;
                 cs->interrupt_request &= ~CPU_INTERRUPT_TIMER;
             }
-
             cpu_openrisc_timer_update(cpu);
+            qemu_mutex_unlock_iothread();
         }
         break;
 
     case TO_SPR(10, 1): /* TTCR */
+        qemu_mutex_lock_iothread();
         cpu_openrisc_count_set(cpu, rb);
         cpu_openrisc_timer_update(cpu);
+        qemu_mutex_unlock_iothread();
         break;
 #endif
 
@@ -303,7 +306,11 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return env->ttmr;
 
     case TO_SPR(10, 1): /* TTCR */
-        cpu_openrisc_count_update(cpu);
+        if (cpu_openrisc_timer_has_advanced(cpu)) {
+            qemu_mutex_lock_iothread();
+            cpu_openrisc_count_update(cpu);
+            qemu_mutex_unlock_iothread();
+        }
         return cpu_openrisc_count_get(cpu);
 #endif
 
-- 
2.36.1


