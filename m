Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABB4AE06F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:12:21 +0100 (CET)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUyS-0007dX-6T
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:12:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLl-0001M7-RJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:15 -0500
Received: from [2607:f8b0:4864:20::636] (port=41639
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLk-0000Nh-60
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:13 -0500
Received: by mail-pl1-x636.google.com with SMTP id j4so1796627plj.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yflQUiX7sYcNBUpLi7Jm2+bDnmb0i5/uhV0Mw+vbU28=;
 b=Kqnj12vp7zdPHflnIqY4W5t6JUNkYrAB49lnGAfQ5QCao0ky8QoRwHSyb5bRUZDuaX
 mVLiE1aoOMexacvy3y7e0q9YmmCe+8Xa4I2v2YEy9w+AY0sl+TfZHJASsSYJLEEJgO5B
 lsEgcRoY6ZqRFVLr9HGQtlkrSQ5/ojRTQ+YJaUmCYCo3OipQCMQkIK28jvfYIaOkAsbn
 LEOfV67HyZlK/ZnTWmacx3YVIcM27CkiVRV/RCshKhDP+sASg3WvSXiJ2ceqh4pT6zcV
 y9zWW/vJLIcrzagZWIks7AAtwQxpGEscHq9d/qf1/trgenN1uH4sT6vcdK1PCCthueNO
 L9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yflQUiX7sYcNBUpLi7Jm2+bDnmb0i5/uhV0Mw+vbU28=;
 b=r5U4pAOmsnosk9G9oAMjIaCxI3E88FR70BvzIDkOsAh85jF3hbsFm2kJ8tkgtiACjS
 9jFmt8n/UfH/nxp+2PuHeA2/zPW6KwjYHl4ZezO1OrhbOin/DRTM0MUpYI1Mul37fBOz
 ZiEZF8jHCgUWWp+rtLx8yb3MW2FNN0IQap1keJwHeYOM2rY5AJL3+iGDnretP5RanwD7
 I2vyaD2/IWR9fICnWSG1EtnANySrE9U/75dOdaUxT4eBPFpQn40WEnuyRjp7CduJzv7v
 YESk/ursgPM+R3hdQ0Q+rPOUfR4KPbziXXnXRFiplaJ0gaKSI94PEmmsl+tu/TuSOT5Z
 eyJQ==
X-Gm-Message-State: AOAM533k/JYN+b+3zMi2uwsQoOrxxcV/+R+HVgtqODPE3nvwY8CXi8NB
 Ux43X854rXr39Cpuj2aT4wuzZgqyh7I=
X-Google-Smtp-Source: ABdhPJwfv9cA1gC5pOeXGnj4l8wQgqtPw7n1LvkeOdOsZySFu+HeQEUBqMLZmQz5HmDlym4j0/lXRg==
X-Received: by 2002:a17:902:f612:: with SMTP id
 n18mr4848925plg.102.1644333833570; 
 Tue, 08 Feb 2022 07:23:53 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l2sm16857561pfc.183.2022.02.08.07.23.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:53 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 08/13] target: Include missing 'cpu.h'
Date: Tue,  8 Feb 2022 16:22:38 +0100
Message-Id: <20220208152243.16452-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

These target-specific files use the target-specific CPU state
but lack to include "cpu.h"; i.e.:

    ../target/riscv/pmp.h:61:23: error: unknown type name 'CPURISCVState'
    void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
                          ^
    ../target/nios2/mmu.h:43:18: error: unknown type name 'CPUNios2State'
    void mmu_flip_um(CPUNios2State *env, unsigned int um);
                     ^
    ../target/microblaze/mmu.h:88:19: error: unknown type name 'CPUMBState'; did you mean 'CPUState'?
    uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
                      ^~~~~~~~~~
                      CPUState

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/mmu.h | 2 ++
 target/mips/internal.h  | 1 +
 target/nios2/mmu.h      | 2 ++
 target/riscv/pmp.h      | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index b6b4b9ad60..1068bd2d52 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -20,6 +20,8 @@
 #ifndef TARGET_MICROBLAZE_MMU_H
 #define TARGET_MICROBLAZE_MMU_H
 
+#include "cpu.h"
+
 #define MMU_R_PID    0
 #define MMU_R_ZPR    1
 #define MMU_R_TLBX   2
diff --git a/target/mips/internal.h b/target/mips/internal.h
index daddb05fd4..f705d6bfa6 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -12,6 +12,7 @@
 #ifdef CONFIG_TCG
 #include "tcg/tcg-internal.h"
 #endif
+#include "cpu.h"
 
 /*
  * MMU types, the first four entries have the same layout as the
diff --git a/target/nios2/mmu.h b/target/nios2/mmu.h
index 4f46fbb82e..d36b8cc86a 100644
--- a/target/nios2/mmu.h
+++ b/target/nios2/mmu.h
@@ -21,6 +21,8 @@
 #ifndef NIOS2_MMU_H
 #define NIOS2_MMU_H
 
+#include "cpu.h"
+
 typedef struct Nios2TLBEntry {
     target_ulong tag;
     target_ulong data;
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index a9a0b363a7..fcb6b7c467 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -22,6 +22,8 @@
 #ifndef RISCV_PMP_H
 #define RISCV_PMP_H
 
+#include "cpu.h"
+
 typedef enum {
     PMP_READ  = 1 << 0,
     PMP_WRITE = 1 << 1,
-- 
2.34.1


