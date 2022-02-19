Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207634BC381
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 01:35:31 +0100 (CET)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLDik-0000UA-4u
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 19:35:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZv-00087E-Au
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:23 -0500
Received: from [2607:f8b0:4864:20::c35] (port=40623
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZA-0006xp-7m
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:22 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so5535365ooi.7
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 16:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWdPBgFPd5OdpI5BydIr2KjDq2q84k4RMsJ72Aie9z0=;
 b=L0UDUOclyCTvg55FzKrMLSKoCAigKe7MWIPEi1Pj5iUcVVoc3WrS270AoX3i/jhtpo
 KZszXxzzo4a981uHn0be4U+516oNgS9ISbuBejT6UL5MKvH67fkmrz7AkjXnAAazzjb9
 5xg6qX0tmbBCleBrTP+DYIGhDazw/DMMBV17Dv2mi49NYn+gKo+d/hQZPIIz5FB3TA05
 ZV/NQh6TGEol9x3eTnzLUYcaj+/4tKYkIQGtaP7aj80n7jm6uIJZTAAwygxAQQP0AfTV
 NxsqYNTtFlgYNPzMhm5srKXYKvrdr5vAFMQALomRaCUn1g/yCEHJPfFLMOYbZKy89vhf
 55Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWdPBgFPd5OdpI5BydIr2KjDq2q84k4RMsJ72Aie9z0=;
 b=y+RaQgHu09Lzqduo0kkXZBSmkR5juaIedy/sB+C63ch6yRU5RD19j6PxEtPNsBwykW
 ABqp14HI1aISeIHG/sIqsD6jGicBAnd2nkIGOihuaO2pvGA4CNauAixI/WT9WUsQm2DG
 BD6k5dtvhans1/TbjPg8+mdYwIEQhdz7ylI1nJXnuSU4pNYmbmWptj3mIE2MXrQBVk+t
 TC8FbI7bTB9fH7HIqdGqW4kZOjlKa2HmQ6o3kMB2Y5VSfYz2j8jYp9Ds+rf6tmv8nxvJ
 drQ7f5EXzVsqVos/ueubmqJl4V4scBmgBkAHQ50ijYePhM9L33wY60NIU0w9ZRkYVyJb
 vNgw==
X-Gm-Message-State: AOAM530wWdRaQAVW29vVsPWccUBMKJZJOZG03Rg/vQb4jBSJiXzVgli+
 Nkz5mKRnmZV1BbzBtgF+vaeKDofHziyucZYv
X-Google-Smtp-Source: ABdhPJxjOwA1eH8Di09HpXI02eI2Ux7fQtE74To3QX1aSOK0+KxmNS9DkS9AUzUfRalDQEsSn5qqZw==
X-Received: by 2002:a05:6870:51ce:b0:d3:d65f:ad6f with SMTP id
 b14-20020a05687051ce00b000d3d65fad6fmr2756806oaj.234.1645230334937; 
 Fri, 18 Feb 2022 16:25:34 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/12] target/riscv: Fix PMU CSR predicate function
Date: Fri, 18 Feb 2022 16:25:07 -0800
Message-Id: <20220219002518.1936806-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc35.google.com
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
 target/riscv/csr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b16881615997..3799ee850087 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -94,8 +94,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
@@ -121,8 +122,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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


