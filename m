Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6920A6F7A90
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:18:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujww-0002ML-CM; Thu, 04 May 2023 21:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvr-0001oL-SW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:31 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvn-0008BM-Ue
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:22 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-52c6f81193cso808609a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248896; x=1685840896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnaDtYju5dqRq5XZLlBygStOKuvR4eRJ5p4wSfjTUvM=;
 b=rGNExJN/yZHKP4GKj+Hs48ry5PeT4g97hqDhL8nmcac06mGlvQDeI3HNpTNHUWrLed
 Kv0izyGEOommvES7nTqqjb7IXC5OoKRwdm1ifie1qQCS3l1/hq5MHF/fobW+eUR3bZLg
 2GE91FUSqEyY2vw4xvoNIzw2pulcqwlkTasj+YT/eGbIB/BnQcHaKWXUCZjfL7jsdLjf
 3M3Ufr9STddeCyDGIg/LB+wyYCrxy7Orh4xveaOvm8N5Mm3K/jzEzCwR1Fd8ZjFMpU0g
 AJF6YYoEDfrt/fHA/g77sKJr8fIpvkAQ99VGGpuN+WeDftcMHbTpHNdsUSsQU0/zXtfF
 BEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248896; x=1685840896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnaDtYju5dqRq5XZLlBygStOKuvR4eRJ5p4wSfjTUvM=;
 b=Ga4ldch3szXjP82Nqm3IeNflgJeUziQngPfOxXs7CKtiNKioKMaPDrYVnTM5LqLeMa
 x2Yra+W86SIxY+AOHAQCvORoCSCabvHfM61x48NpMzplJ+BSR8o54CbRMqESmU+G66C6
 Zw0YGuo885L/sfcjix4izdBSsj+m5WzJG9L1LMMKEjz1wJvywgnFqGtW7u7iJh5udIEf
 W2crp7eCuBe7kBoPZHQxGSqmkGvaa3bx738RmUaD3/RsShehbh3jHY/JaT0Okw94Ew8y
 yK0qGOPt2Nl0AIvvlnNeW9DoeVR6nvWHKKKY5UeJG+qELZXGcVdk4ogh1wxiVJ9OTmZm
 2ANg==
X-Gm-Message-State: AC+VfDy/t3B2rW3ikeRDurRYOpff3VCMPRTHPKTWOiEbVM7iHCyh3iXb
 UiVav87Ur475Ca6BZYGwvu0A+T5Q4Es+wA==
X-Google-Smtp-Source: ACHHUZ5y5AMiQk5ddxl8g3qaROfAJv+H64m8mfVR8Ds5IeCwY4BM9JF1icZVLBvXTeLD0D6dznXtLA==
X-Received: by 2002:a17:902:c403:b0:1a6:a8e5:9240 with SMTP id
 k3-20020a170902c40300b001a6a8e59240mr7098291plk.4.1683248896391; 
 Thu, 04 May 2023 18:08:16 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:15 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Fei Wu <fei2.wu@intel.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 86/89] target/riscv: Restore the predicate() NULL check behavior
Date: Fri,  5 May 2023 11:02:38 +1000
Message-Id: <20230505010241.21812-87-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

When reading a non-existent CSR QEMU should raise illegal instruction
exception, but currently it just exits due to the g_assert() check.

This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617.
Some comments are also added to indicate that predicate() must be
provided for an implemented CSR.

Reported-by: Fei Wu <fei2.wu@intel.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20230417043054.3125614-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 865ee9efda..4451bd1263 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3826,6 +3826,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* ensure CSR is implemented by checking predicate */
+    if (!csr_ops[csrno].predicate) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     /* privileged spec version check */
     if (env->priv_ver < csr_min_priv) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -3843,7 +3848,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
      * illegal instruction exception should be triggered instead of virtual
      * instruction exception. Hence this comes after the read / write check.
      */
-    g_assert(csr_ops[csrno].predicate != NULL);
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
@@ -4032,7 +4036,10 @@ static RISCVException write_jvt(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-/* Control and Status Register function table */
+/*
+ * Control and Status Register function table
+ * riscv_csr_operations::predicate() must be provided for an implemented CSR
+ */
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
     [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },
-- 
2.40.0


