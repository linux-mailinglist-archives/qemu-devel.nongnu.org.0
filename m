Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643D1C2B58
	for <lists+qemu-devel@lfdr.de>; Sun,  3 May 2020 12:29:37 +0200 (CEST)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVBsO-0008I7-0J
	for lists+qemu-devel@lfdr.de; Sun, 03 May 2020 06:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jVBoQ-0002ot-15
 for qemu-devel@nongnu.org; Sun, 03 May 2020 06:25:30 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jVBoO-0007lo-GD
 for qemu-devel@nongnu.org; Sun, 03 May 2020 06:25:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id hi11so2381364pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 May 2020 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hH+WJS7P2vdGj2kP2clpp5p3F7ykGj330Lsee1IC1yw=;
 b=Yo1dI8GIASM54rNwgvJY/RYQ2wUGBNh/kxDo+Yz6w7/L9TI4zvo9NhAZn/ieSSQJz0
 b7LzqgERZ1KsmLlAN2yy9ecCYYKvGamHOzSn5NDKaexUEvUPXgs5V+A5oXe3A9pW++sf
 VyUTgFR2j4U3GvLN3ihSVeoF4vcq7jNme68GjARRsqjMyd4kZBrVw43GeLwM4Kp5wOO2
 99DWBQ/SNCfQyjvEfiJKuTcC1CuyjYp3tmoGIyxWAthZkuaFD7GL0NpmIrTZi39pOdGB
 FxHQCxTlba+FDcbQq/QjyYWaAaig0szcTQqVSX9Lmz5kuf2qJV3g7MUPZgNHtOK3BTdz
 KjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hH+WJS7P2vdGj2kP2clpp5p3F7ykGj330Lsee1IC1yw=;
 b=Fm08o8H7eQdunR36V25O0fVlAZWf+NXvRahPyMOGP1Z0cikpMrvHs63jkCYcG61Pu5
 i7i1dLUuHt2UbI6qGp+DfOpHCaDI8iBEngNUhIG1nxgSYAaUEVy5k6J+hXtI0E1v3gWO
 hq2ZKrz+Fgtk72Bai0m0zyS+5NVuye3TuqRjCQNLhWGdyvvfSp5VHxK31elV9mebvxPV
 TYlDTlRTudcEEok2CUSdMa9lv0ijKmEcenphmGuTT4NqZfEdMR1xOdF3YUTnftvpNkJZ
 MMBfqRDVGsYjCsuzymdrC84/Tf7AU/msvIZZ4TLBfzSI0LG0zjcaSmRxJZ9CirgWR4Aw
 vPoA==
X-Gm-Message-State: AGi0Pua4IhL5AyiIwRq8EaflX9qGKKIwqWnZMN44vjPtCPwVKsLYW9nS
 xAJe/DUxlX8FiIrqMAq+DEw=
X-Google-Smtp-Source: APiQypJE0v2ImuWhCiEGZlCE4F34QNNMQgTOMoC0lM+qPSWujfPkwS3RNWO/Xyd4R13xTrLCvzgntg==
X-Received: by 2002:a17:90a:37a3:: with SMTP id
 v32mr11168607pjb.2.1588501527046; 
 Sun, 03 May 2020 03:25:27 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com.
 [34.92.144.28])
 by smtp.gmail.com with ESMTPSA id a12sm6173654pfr.28.2020.05.03.03.25.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 May 2020 03:25:26 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH for-5.1 V3 5/7] target/mips: Add more CP0 register for
 save/restore
Date: Sun,  3 May 2020 18:20:19 +0800
Message-Id: <1588501221-1205-6-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588501221-1205-1-git-send-email-chenhc@lemote.com>
References: <1588501221-1205-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pj1-x102a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Huacai Chen <chenhuacai@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add more CP0 register for save/restore, including: EBase, XContext,
PageGrain, PWBase, PWSize, PWField, PWCtl, Config*, KScratch1~KScratch6.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/kvm.c     | 212 ++++++++++++++++++++++++++++++++++++++++++++++++++
 target/mips/machine.c |   6 +-
 2 files changed, 216 insertions(+), 2 deletions(-)

diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index de3e26e..96cfa10 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -245,10 +245,16 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int irq, int level)
     (KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U64 | (8 * (_R) + (_S)))
 
 #define KVM_REG_MIPS_CP0_INDEX          MIPS_CP0_32(0, 0)
+#define KVM_REG_MIPS_CP0_RANDOM         MIPS_CP0_32(1, 0)
 #define KVM_REG_MIPS_CP0_CONTEXT        MIPS_CP0_64(4, 0)
 #define KVM_REG_MIPS_CP0_USERLOCAL      MIPS_CP0_64(4, 2)
 #define KVM_REG_MIPS_CP0_PAGEMASK       MIPS_CP0_32(5, 0)
+#define KVM_REG_MIPS_CP0_PAGEGRAIN      MIPS_CP0_32(5, 1)
+#define KVM_REG_MIPS_CP0_PWBASE         MIPS_CP0_64(5, 5)
+#define KVM_REG_MIPS_CP0_PWFIELD        MIPS_CP0_64(5, 6)
+#define KVM_REG_MIPS_CP0_PWSIZE         MIPS_CP0_64(5, 7)
 #define KVM_REG_MIPS_CP0_WIRED          MIPS_CP0_32(6, 0)
+#define KVM_REG_MIPS_CP0_PWCTL          MIPS_CP0_32(6, 6)
 #define KVM_REG_MIPS_CP0_HWRENA         MIPS_CP0_32(7, 0)
 #define KVM_REG_MIPS_CP0_BADVADDR       MIPS_CP0_64(8, 0)
 #define KVM_REG_MIPS_CP0_COUNT          MIPS_CP0_32(9, 0)
@@ -258,13 +264,22 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int irq, int level)
 #define KVM_REG_MIPS_CP0_CAUSE          MIPS_CP0_32(13, 0)
 #define KVM_REG_MIPS_CP0_EPC            MIPS_CP0_64(14, 0)
 #define KVM_REG_MIPS_CP0_PRID           MIPS_CP0_32(15, 0)
+#define KVM_REG_MIPS_CP0_EBASE          MIPS_CP0_64(15, 1)
 #define KVM_REG_MIPS_CP0_CONFIG         MIPS_CP0_32(16, 0)
 #define KVM_REG_MIPS_CP0_CONFIG1        MIPS_CP0_32(16, 1)
 #define KVM_REG_MIPS_CP0_CONFIG2        MIPS_CP0_32(16, 2)
 #define KVM_REG_MIPS_CP0_CONFIG3        MIPS_CP0_32(16, 3)
 #define KVM_REG_MIPS_CP0_CONFIG4        MIPS_CP0_32(16, 4)
 #define KVM_REG_MIPS_CP0_CONFIG5        MIPS_CP0_32(16, 5)
+#define KVM_REG_MIPS_CP0_CONFIG6        MIPS_CP0_32(16, 6)
+#define KVM_REG_MIPS_CP0_XCONTEXT       MIPS_CP0_64(20, 0)
 #define KVM_REG_MIPS_CP0_ERROREPC       MIPS_CP0_64(30, 0)
+#define KVM_REG_MIPS_CP0_KSCRATCH1      MIPS_CP0_64(31, 2)
+#define KVM_REG_MIPS_CP0_KSCRATCH2      MIPS_CP0_64(31, 3)
+#define KVM_REG_MIPS_CP0_KSCRATCH3      MIPS_CP0_64(31, 4)
+#define KVM_REG_MIPS_CP0_KSCRATCH4      MIPS_CP0_64(31, 5)
+#define KVM_REG_MIPS_CP0_KSCRATCH5      MIPS_CP0_64(31, 6)
+#define KVM_REG_MIPS_CP0_KSCRATCH6      MIPS_CP0_64(31, 7)
 
 static inline int kvm_mips_put_one_reg(CPUState *cs, uint64_t reg_id,
                                        int32_t *addr)
@@ -394,6 +409,29 @@ static inline int kvm_mips_get_one_ureg64(CPUState *cs, uint64_t reg_id,
                                          (1U << CP0C5_UFE) | \
                                          (1U << CP0C5_FRE) | \
                                          (1U << CP0C5_UFR))
+#define KVM_REG_MIPS_CP0_CONFIG6_MASK   ((1U << CP0C6_BPPASS) | \
+                                         (0x3fU << CP0C6_KPOS) | \
+                                         (1U << CP0C6_KE) | \
+                                         (1U << CP0C6_VTLBONLY) | \
+                                         (1U << CP0C6_LASX) | \
+                                         (1U << CP0C6_SSEN) | \
+                                         (1U << CP0C6_DISDRTIME) | \
+                                         (1U << CP0C6_PIXNUEN) | \
+                                         (1U << CP0C6_SCRAND) | \
+                                         (1U << CP0C6_LLEXCEN) | \
+                                         (1U << CP0C6_DISVC) | \
+                                         (1U << CP0C6_VCLRU) | \
+                                         (1U << CP0C6_DCLRU) | \
+                                         (1U << CP0C6_PIXUEN) | \
+                                         (1U << CP0C6_DISBLKLYEN) | \
+                                         (1U << CP0C6_UMEMUALEN) | \
+                                         (1U << CP0C6_SFBEN) | \
+                                         (1U << CP0C6_FLTINT) | \
+                                         (1U << CP0C6_VLTINT) | \
+                                         (1U << CP0C6_DISBTB) | \
+                                         (3U << CP0C6_STPREFCTL) | \
+                                         (1U << CP0C6_INSTPREF) | \
+                                         (1U << CP0C6_DATAPREF))
 
 static inline int kvm_mips_change_one_reg(CPUState *cs, uint64_t reg_id,
                                           int32_t *addr, int32_t mask)
@@ -729,6 +767,11 @@ static int kvm_mips_put_cp0_registers(CPUState *cs, int level)
         DPRINTF("%s: Failed to put CP0_INDEX (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_RANDOM, &env->CP0_Random);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_RANDOM (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_CONTEXT,
                                  &env->CP0_Context);
     if (err < 0) {
@@ -747,11 +790,40 @@ static int kvm_mips_put_cp0_registers(CPUState *cs, int level)
         DPRINTF("%s: Failed to put CP0_PAGEMASK (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_PAGEGRAIN,
+                               &env->CP0_PageGrain);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_PAGEGRAIN (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_PWBASE,
+                               &env->CP0_PWBase);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_PWBASE (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_PWFIELD,
+                               &env->CP0_PWField);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_PWField (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_PWSIZE,
+                               &env->CP0_PWSize);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_PWSIZE (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_WIRED, &env->CP0_Wired);
     if (err < 0) {
         DPRINTF("%s: Failed to put CP0_WIRED (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_PWCTL, &env->CP0_PWCtl);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_PWCTL (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_put_one_reg(cs, KVM_REG_MIPS_CP0_HWRENA, &env->CP0_HWREna);
     if (err < 0) {
         DPRINTF("%s: Failed to put CP0_HWRENA (%d)\n", __func__, err);
@@ -799,6 +871,11 @@ static int kvm_mips_put_cp0_registers(CPUState *cs, int level)
         DPRINTF("%s: Failed to put CP0_PRID (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_EBASE, &env->CP0_EBase);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_EBASE (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_change_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG,
                                   &env->CP0_Config0,
                                   KVM_REG_MIPS_CP0_CONFIG_MASK);
@@ -841,12 +918,61 @@ static int kvm_mips_put_cp0_registers(CPUState *cs, int level)
         DPRINTF("%s: Failed to change CP0_CONFIG5 (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_change_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG6,
+                                  &env->CP0_Config6,
+                                  KVM_REG_MIPS_CP0_CONFIG6_MASK);
+    if (err < 0) {
+        DPRINTF("%s: Failed to change CP0_CONFIG6 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_XCONTEXT,
+                                 &env->CP0_XContext);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_XCONTEXT (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_ERROREPC,
                                  &env->CP0_ErrorEPC);
     if (err < 0) {
         DPRINTF("%s: Failed to put CP0_ERROREPC (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH1,
+                                 &env->CP0_KScratch[0]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_KSCRATCH1 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH2,
+                                 &env->CP0_KScratch[1]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_KSCRATCH2 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH3,
+                                 &env->CP0_KScratch[2]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_KSCRATCH3 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH4,
+                                 &env->CP0_KScratch[3]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_KSCRATCH4 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH5,
+                                 &env->CP0_KScratch[4]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_KSCRATCH5 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_put_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH6,
+                                 &env->CP0_KScratch[5]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to put CP0_KSCRATCH6 (%d)\n", __func__, err);
+        ret = err;
+    }
 
     return ret;
 }
@@ -862,6 +988,11 @@ static int kvm_mips_get_cp0_registers(CPUState *cs)
         DPRINTF("%s: Failed to get CP0_INDEX (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_RANDOM, &env->CP0_Random);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_RANDOM (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_CONTEXT,
                                  &env->CP0_Context);
     if (err < 0) {
@@ -880,11 +1011,40 @@ static int kvm_mips_get_cp0_registers(CPUState *cs)
         DPRINTF("%s: Failed to get CP0_PAGEMASK (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_PAGEGRAIN,
+                               &env->CP0_PageGrain);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_PAGEGRAIN (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_PWBASE,
+                               &env->CP0_PWBase);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_PWBASE (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_PWFIELD,
+                               &env->CP0_PWField);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_PWFIELD (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_PWSIZE,
+                               &env->CP0_PWSize);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_PWSIZE (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_WIRED, &env->CP0_Wired);
     if (err < 0) {
         DPRINTF("%s: Failed to get CP0_WIRED (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_PWCTL, &env->CP0_PWCtl);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_PWCtl (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_HWRENA, &env->CP0_HWREna);
     if (err < 0) {
         DPRINTF("%s: Failed to get CP0_HWRENA (%d)\n", __func__, err);
@@ -932,6 +1092,11 @@ static int kvm_mips_get_cp0_registers(CPUState *cs)
         DPRINTF("%s: Failed to get CP0_PRID (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_EBASE, &env->CP0_EBase);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_EBASE (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG, &env->CP0_Config0);
     if (err < 0) {
         DPRINTF("%s: Failed to get CP0_CONFIG (%d)\n", __func__, err);
@@ -962,12 +1127,59 @@ static int kvm_mips_get_cp0_registers(CPUState *cs)
         DPRINTF("%s: Failed to get CP0_CONFIG5 (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_get_one_reg(cs, KVM_REG_MIPS_CP0_CONFIG6, &env->CP0_Config6);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_CONFIG6 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_XCONTEXT,
+                                 &env->CP0_XContext);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_XCONTEXT (%d)\n", __func__, err);
+        ret = err;
+    }
     err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_ERROREPC,
                                  &env->CP0_ErrorEPC);
     if (err < 0) {
         DPRINTF("%s: Failed to get CP0_ERROREPC (%d)\n", __func__, err);
         ret = err;
     }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH1,
+                                 &env->CP0_KScratch[0]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_KSCRATCH1 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH2,
+                                 &env->CP0_KScratch[1]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_KSCRATCH2 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH3,
+                                 &env->CP0_KScratch[2]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_KSCRATCH3 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH4,
+                                 &env->CP0_KScratch[3]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_KSCRATCH4 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH5,
+                                 &env->CP0_KScratch[4]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_KSCRATCH5 (%d)\n", __func__, err);
+        ret = err;
+    }
+    err = kvm_mips_get_one_ulreg(cs, KVM_REG_MIPS_CP0_KSCRATCH6,
+                                 &env->CP0_KScratch[5]);
+    if (err < 0) {
+        DPRINTF("%s: Failed to get CP0_KSCRATCH6 (%d)\n", __func__, err);
+        ret = err;
+    }
 
     return ret;
 }
diff --git a/target/mips/machine.c b/target/mips/machine.c
index 8d5b18b..5b23e3e 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -212,8 +212,8 @@ const VMStateDescription vmstate_tlb = {
 
 const VMStateDescription vmstate_mips_cpu = {
     .name = "cpu",
-    .version_id = 19,
-    .minimum_version_id = 19,
+    .version_id = 20,
+    .minimum_version_id = 20,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         /* Active TC */
@@ -289,6 +289,8 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_INT32(env.CP0_Config1, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config2, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config3, MIPSCPU),
+        VMSTATE_INT32(env.CP0_Config4, MIPSCPU),
+        VMSTATE_INT32(env.CP0_Config5, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config6, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config7, MIPSCPU),
         VMSTATE_UINT64(env.CP0_LLAddr, MIPSCPU),
-- 
2.7.0


