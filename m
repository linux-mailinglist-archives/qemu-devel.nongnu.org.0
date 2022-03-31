Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C944ED0AF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:07:32 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiLb-0001l0-AU
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:07:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFy-0004zV-Oa
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: from [2607:f8b0:4864:20::1031] (port=41797
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFx-0005U5-1S
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so1922726pjm.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gDbHwKwxtrtA4jGmGdtT6CXmvVat9X7nhJ/2q8dc90=;
 b=ra6QVmkDop74yDuTBPgZ3Z5DV8A2FF7yump60mHtKvfF1ULzQlI9UEr6KGfAT9KfGy
 h+CezZA7rYEu3AmmIBMgZp3NuqbeuDJa46C6THtme/eAsSyOY/9TwrPPIaFjL1gi/QeF
 2exM4GSxRnR8gD5KtRIjmiyvxf1Mcie4sTrF28Bp8WyND/UHs099VT5URHsRQid0aM7i
 LzR+gzbBwlpKnRKQPQagNQOiSSbAYgz8TRAGJmPkQhADSllo13JhNXn727o8rU7onwTC
 vButcrxd4Y6oFayK35qjadnUwzlah3bvJo7MP6HMYl48KsfQAPa8trhP1ekM0Cvqyfpj
 jSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gDbHwKwxtrtA4jGmGdtT6CXmvVat9X7nhJ/2q8dc90=;
 b=RZkQW9Tl8yknRNLc6rZWcqLPTNe8e2d9Bmgbch5piPgiqnfESBHhMa6LvgQAwjgIUM
 FvX7QZ4WVI9cxxRWDgI9lG5zgqVznC2A2RoKUjMwSc1N9+tKY+6MBjULaySGPg7NaNRV
 PaNpPhGnHwmN1+J5kC4EgitXw80UI3XmE1Msnmum63coyRRanssL1nsazTaYKRJqL9ox
 6KNMnbD8xeDctccT9q0FAI/ida+IhBaBlSqMBEJQjflekLYWdwPbbp3HRXyInJUSIst3
 VPr0svPKeq6ipqkv5rkyPPFxYs7PRU6kgzpySZkz6BAsjMWb2vKT8JyAnIEh3wKJtNGk
 VJLg==
X-Gm-Message-State: AOAM533yt/6q2LHmq5OMhJVo4O2myg2/LUgGG+dzuh+A3L+RlD+D4ror
 DKOCcUNJbFD3NJmESie/uPiwtveD8TfFCg==
X-Google-Smtp-Source: ABdhPJwYvSGrseg24S2jsPS6T4I5YxXp0TOdnLAGtudRpL0r3PeLNqICHSLig/ps0DhMgagFXPXXqA==
X-Received: by 2002:a17:90b:f82:b0:1c6:58b9:bd36 with SMTP id
 ft2-20020a17090b0f8200b001c658b9bd36mr2678172pjb.141.1648684899465; 
 Wed, 30 Mar 2022 17:01:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Wed, 30 Mar 2022 17:01:16 -0700
Message-Id: <20220331000127.2107823-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 254bab3715b7..914b3f96ef67 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -77,6 +77,57 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.25.1


