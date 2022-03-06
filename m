Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F24CEBB9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:30:48 +0100 (CET)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqyF-0007B1-Sy
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:30:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWk-0002F4-8x
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:23 -0500
Received: from [2a00:1450:4864:20::32e] (port=38880
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWi-0004G0-Kd
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so8610625wms.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zos8Zctwf8FAmhXfOYhKKv/SQMI8Dq/LQDH08PxfbjM=;
 b=IaWawRR4/UpEzfN+6w1LaTZHp7vd0PzJVkPWAemlT+lUQFQecX0il/MKql5Bmry4TO
 ROfn5f1sdnZscAc+c5ArTgT+dxrxtHtFHSUs0p/XXaIJdv4hcTuXX2a88W0LyxGxl4lH
 iIjtMRR0Qk0W/6GEJuXTtkXzUftSSav729g2av2J1vJ/LFPHfhGQi0cVSykJvNTamRea
 KlhloAENs8wA+DPtB1PAvwprbos1lce6TK+dZ2J/ztxBfLW2oVe1TaDPZgR66yWAK/3o
 K+bF8W6dHH6KwsjDddxo2lMtpfoYdKT3D3EzFmo1xy4BQkqPkZBTDdESc+I3PIWcNIeN
 QNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zos8Zctwf8FAmhXfOYhKKv/SQMI8Dq/LQDH08PxfbjM=;
 b=TojqLYU8QHV35FaVzQQRbsf7Xsh0j3GOAw8gB7jCoz1sKQKXUXSsVfQMlqKuF7aAHQ
 5YlalThxcP2HccmP7HFgLK1eTKKW0DciWO7Ma7MofTkGo1YPccXotKE8PXo2Nuf4cBwc
 27z7xLFcsPwVTAfgikSOf52Of3gvLa1iridAXteYvzUjAN36BfJIliehaf+EpIb9uveL
 gJyJaerX1oJYqN4sqkm45u84Jtnj1VlASlaJSsG2IeiYMrGJoxgjxsauci4E+kNZbAQa
 oPM8RFN89TThubuZwKW8MLKviDnB1KHouig3jTt/KoNOXiKdoBncJFnYu7XPxBUwsZZ0
 kyXw==
X-Gm-Message-State: AOAM532MEZXzY6150oOwkq56fJ6rHEKzV8navlZlaTYnw07ipgyMCnVz
 7EFPCmkeTaIqKXLe36NMhW8zq10VbaU=
X-Google-Smtp-Source: ABdhPJzrKs3+MF1ILgujIBFO55ebMu7DZHOXzgPeUyUgY4Hjsert38+VyYlsP5vBZeEvqSgEeOcB2w==
X-Received: by 2002:a05:600c:1c13:b0:389:a475:9ed5 with SMTP id
 j19-20020a05600c1c1300b00389a4759ed5mr1151567wms.86.1646571738634; 
 Sun, 06 Mar 2022 05:02:18 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm9774924wra.65.2022.03.06.05.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] target: Include missing 'cpu.h'
Date: Sun,  6 Mar 2022 13:59:53 +0100
Message-Id: <20220306130000.8104-27-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-10-f4bug@amsat.org>
---
 target/microblaze/mmu.h | 2 ++
 target/mips/internal.h  | 1 +
 target/nios2/mmu.h      | 2 ++
 target/riscv/pmp.h      | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index b6b4b9ad603..1068bd2d52b 100644
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
index daddb05fd43..f705d6bfa61 100644
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
index b7785b46c01..5b085900fbf 100644
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
index a9a0b363a77..fcb6b7c4677 100644
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
2.35.1


