Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31A4CCA68
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 01:04:35 +0100 (CET)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPvQw-0005Aw-S5
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 19:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHa-0003W9-VP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: from [2607:f8b0:4864:20::f35] (port=38566
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHY-0003ZJ-1f
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: by mail-qv1-xf35.google.com with SMTP id d3so5421333qvb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 15:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TIYzNk5T+eiuGTHCthMhPwxF2cED3vmDWiJr1s7zHwc=;
 b=GRJB6Q+7CYpwqz/9Go+b05LlaV9TD0TUFa7/7kPBC/xj9PNM5AHDYhTwnhmjQ3RDne
 UXDO/ZOULLYejfVtDfSDgvKU8HhL/BUb/H+IVuhbXGhMCHjHXYz6EaavRUXxKcPtooNz
 e2HXQQmLrKQSqwvcTUoPG+UG1nG1QRmUJbwYrXLfL/Ljr6zbfI77OhiTzv7wNo25L0fh
 hFJeL7g/1dCMm17JRvbRTSVUBF3pNTItygVCkvzAIaLV/Toh+bdHHsx1Gs4PReRz5Vuc
 HVkEmwYSSmfsaMa/HHwXwRiA9pKybOA+bflvgsxdechUjNycAKOhasld11wrrAbXUDZH
 qaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TIYzNk5T+eiuGTHCthMhPwxF2cED3vmDWiJr1s7zHwc=;
 b=3C4BAhbKml2nCFuH/UAvtSKNUoe7e6DargjX6Gdx9wFdyBA3zNfPnRFfBCm/WX7W66
 j7DOenUsaGobC9MKkD+I4yyXaS+8FOqbt9QP/0zXKy+YfJ33IfnVQoqiUPdcVNb8DVuQ
 AZmH20Aw8vNFq9UotxDosk0kI0zRXqTsqmEX+JInuC6DHVseEKl1kJiNeWWPvyJDNrqe
 yhwtSXxesPIRI4lQfWxJI4buteahReR9dZoaYhHaXcXKcY5eHqoEaGVzJRHDQ+5/RTjf
 nUH/PKDPfv/vbzeXPMwim0Ny8wnO6WaWRXDtDtdWcwCPHFI+BEsjJCbfgj9YILUvx5cd
 sxbQ==
X-Gm-Message-State: AOAM530/AE2EArxosxTq93hOG8yrvapddNlxmjLWdOTMsewRPSVGwYRO
 VQUQODcTYJ8B0+btP+hwQNlH67LDYrJKFA==
X-Google-Smtp-Source: ABdhPJz+Ej7s4ZeFemjz20qyRq4plUkD8r9Ti+LLDByVYztcOVIM4i126dfuLwK7uEIsUceJkNiSnA==
X-Received: by 2002:a05:6214:5293:b0:432:3071:e947 with SMTP id
 kj19-20020a056214529300b004323071e947mr26201112qvb.62.1646351688055; 
 Thu, 03 Mar 2022 15:54:48 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:54:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/12] target/riscv: Fix PMU CSR predicate function
Date: Thu,  3 Mar 2022 15:54:29 -0800
Message-Id: <20220303235440.638790-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf35.google.com
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

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault")

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b1876b3b6466..6102d5e7e24f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -69,6 +69,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
@@ -96,8 +97,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -123,8 +125,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.30.2


