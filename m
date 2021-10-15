Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074942FC38
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:34:59 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSyp-0006gQ-49
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStm-0008Jk-Ou; Fri, 15 Oct 2021 15:29:46 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbSti-0008PV-J1; Fri, 15 Oct 2021 15:29:45 -0400
Received: by mail-lf1-x129.google.com with SMTP id y26so46057747lfa.11;
 Fri, 15 Oct 2021 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh0iqXUy8y/Ubp2h94AICbKWAgloggmfwv7+BDo9syA=;
 b=e3ZNE99mXzLpKjDX705QMrCGfImQMVUErFJ6qG6VeqnB5tuneDG4McElGswUhxNSKq
 LOknxLptGZ/8i1h2gk/2f4Q2sQxmyXH08tuh0bXU7W8Zjo7etAXV8QH+9b9w2PSvXbgs
 k1nCEB/xSITmjKFtvrmMzW5BmmhuB2aeJRvDjqjeDTTUE3XA/M86TDNWDaPP7hZopLyZ
 pqEJ9L8A8wBiKYKX3A+x7iBfpAXbthOwl9+2NciFT+0shm/vTInQrgxlvvKZaOTLga+l
 a5KZ1Obtk5xd1DMC6wQdsap/Q/0TnWrOFPKlH59XbjQmkw2xsCIsrzikKSAZa8lAsQmu
 Cy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nh0iqXUy8y/Ubp2h94AICbKWAgloggmfwv7+BDo9syA=;
 b=MaUdHm9YF1MhbX76QLPyD1NZDocwHtr2eJOAEtROm5pJzFQoayrdWqnBcZlsFp3h+C
 peCXxc2ycuKKebE2yFUDv3ZrqMSuooF8x4+UV/bMzBHsJtQMPYu4TN4CHi0e5/wk5sEd
 6fMIkqK905YWZQCedhwGgglFkeaS1DdTGM7j/IJj0LztfbTbMlHpsY3ewa7pG8roNBhM
 iJyEtRJ+LBCauky0q+f/FcPVdE+jXdqTZgREYUftF1b+7VrCF/KzukhqGo6jI2BJDcqy
 Bw991ZWnYWBPq3U6Q658K8+9w0U98Y60wnR6WPoq1oW6rh6k5ySCF8W01imDNp8sebwf
 a9QA==
X-Gm-Message-State: AOAM533tRdguuOEpVkJG7/m57l3skHEQw9o1P0sBZZnmODAtZy9wS37D
 7gnuThUOGkd4bBiri8HHeo4=
X-Google-Smtp-Source: ABdhPJw7HWmoFv80kDLyIwAFrnKD92OsC+DssW9VaJzvtowqPOZi9/yp/1gNhI4QgmIjvb2CcV10pg==
X-Received: by 2002:a2e:82c7:: with SMTP id n7mr14357215ljh.352.1634326180720; 
 Fri, 15 Oct 2021 12:29:40 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:40 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v13 2/7] [RISCV_PM] Add CSR defines for RISC-V PM extension
Date: Fri, 15 Oct 2021 22:29:26 +0300
Message-Id: <20211015192931.227387-3-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 96 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..1a3767804a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -334,6 +334,38 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
+/*
+ * User PointerMasking registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_UMTE            0x4c0
+#define CSR_UPMMASK         0x4c1
+#define CSR_UPMBASE         0x4c2
+
+/*
+ * Machine PointerMasking registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_MMTE            0x3c0
+#define CSR_MPMMASK         0x3c1
+#define CSR_MPMBASE         0x3c2
+
+/*
+ * Supervisor PointerMaster registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_SMTE            0x1c0
+#define CSR_SPMMASK         0x1c1
+#define CSR_SPMBASE         0x1c2
+
+/*
+ * Hypervisor PointerMaster registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_VSMTE           0x2c0
+#define CSR_VSPMMASK        0x2c1
+#define CSR_VSPMBASE        0x2c2
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -531,4 +563,68 @@ typedef enum RISCVException {
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* General PointerMasking CSR bits*/
+#define PM_ENABLE       0x00000001ULL
+#define PM_CURRENT      0x00000002ULL
+#define PM_INSN         0x00000004ULL
+#define PM_XS_MASK      0x00000003ULL
+
+/* PointerMasking XS bits values */
+#define PM_EXT_DISABLE  0x00000000ULL
+#define PM_EXT_INITIAL  0x00000001ULL
+#define PM_EXT_CLEAN    0x00000002ULL
+#define PM_EXT_DIRTY    0x00000003ULL
+
+/* Offsets for every pair of control bits per each priv level */
+#define XS_OFFSET    0ULL
+#define U_OFFSET     2ULL
+#define S_OFFSET     5ULL
+#define M_OFFSET     8ULL
+
+#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
+#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
+#define U_PM_INSN    (PM_INSN    << U_OFFSET)
+#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
+#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
+#define S_PM_INSN    (PM_INSN    << S_OFFSET)
+#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
+#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
+#define M_PM_INSN    (PM_INSN    << M_OFFSET)
+
+/* mmte CSR bits */
+#define MMTE_PM_XS_BITS     PM_XS_BITS
+#define MMTE_U_PM_ENABLE    U_PM_ENABLE
+#define MMTE_U_PM_CURRENT   U_PM_CURRENT
+#define MMTE_U_PM_INSN      U_PM_INSN
+#define MMTE_S_PM_ENABLE    S_PM_ENABLE
+#define MMTE_S_PM_CURRENT   S_PM_CURRENT
+#define MMTE_S_PM_INSN      S_PM_INSN
+#define MMTE_M_PM_ENABLE    M_PM_ENABLE
+#define MMTE_M_PM_CURRENT   M_PM_CURRENT
+#define MMTE_M_PM_INSN      M_PM_INSN
+#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_INSN | \
+                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_INSN | \
+                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_INSN | \
+                      MMTE_PM_XS_BITS)
+
+/* (v)smte CSR bits */
+#define SMTE_PM_XS_BITS     PM_XS_BITS
+#define SMTE_U_PM_ENABLE    U_PM_ENABLE
+#define SMTE_U_PM_CURRENT   U_PM_CURRENT
+#define SMTE_U_PM_INSN      U_PM_INSN
+#define SMTE_S_PM_ENABLE    S_PM_ENABLE
+#define SMTE_S_PM_CURRENT   S_PM_CURRENT
+#define SMTE_S_PM_INSN      S_PM_INSN
+#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_INSN | \
+                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_INSN | \
+                      SMTE_PM_XS_BITS)
+
+/* umte CSR bits */
+#define UMTE_U_PM_ENABLE    U_PM_ENABLE
+#define UMTE_U_PM_CURRENT   U_PM_CURRENT
+#define UMTE_U_PM_INSN      U_PM_INSN
+#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
+
 #endif
-- 
2.30.2


