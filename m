Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66EC552817
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 01:19:38 +0200 (CEST)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3QgD-0003ne-6S
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 19:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd2-000100-CP
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:16:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qcz-0006Rj-Dy
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:16:20 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x4so5155193pfq.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhVvdBd12NEQSMutLuwbHomEWaNhvrXLYUt832LQCRY=;
 b=Y/O9hz3w2JtbdBnOYkqnRtGY+kgxU4gLqNhvOJhHzx8Ndt7rWLrJwcvziEcV3DQpcy
 cBwZw5QSrWZeBsylqK9sj7gPlYgt5nwxNBm2LCPo2dPvfXdAn7avsqaum45l+XVXxs41
 YRozmBKGfty8BYVa2zI54hGmkDqufGBUUbRV7R66cvEnGWSI6e8KAaVcnK8gRcj4lIuQ
 9ktv2aB0cB6mg7+1MCOw5sVgv7npI64W/PtuKi4PRNpHuCGp8ic5IH/phzrW84EwDtoY
 M1fWmSUXlEZVG3ZtpvRi4Tdc9plDXP8BCXljz1BRG7ODpD+mmZeUhYztEuNoo2p+WhZL
 q7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KhVvdBd12NEQSMutLuwbHomEWaNhvrXLYUt832LQCRY=;
 b=yCBWwR0e3O6Jfn6YXd1LXtrXUi82aVpISsf07bB4BI2mW90BufBxbztX8euiyz3fU9
 PsJfvm1rTjGE3IZdQo0M8cIawG9E3Nk0jw+Q/vygdW1QGrEoG2Z/LiaImHur8fOjg5+0
 e67M2u0bXSC544rHABsmuuGANsmDDSTR/VWCvqFFADqlpRVjyoYE0J7xutESLDJQJn9r
 uU9DHgnlCExQx50mJ1PDgkydO8QSWEnTArVQvWoDd7y8RoqbJXLJiQ7a0Jh8Owt56U4v
 cylDOYImTs8qJxLvlMdyLCJZTGPfqRFKpreWq6ubrTbt2vOHD9OrhC/nGL64ISEy+61+
 mFPg==
X-Gm-Message-State: AJIora/AuFXn4X4jU0fISM+CBH/fxC5jnYuQ0skmXs0tfwoHFLdVNxA5
 v0oKdBJwTjaBj61WiWsi5ONP4t7ISDPu4A==
X-Google-Smtp-Source: AGRyM1u72PMrPZ20XyYtapiUnbMTigs+IKGaVUPQezMpx6El257fzeYSFB2bJgHPzccz4xiDz+EdgA==
X-Received: by 2002:a05:6a00:e0e:b0:522:990c:ab60 with SMTP id
 bq14-20020a056a000e0e00b00522990cab60mr27206101pfb.8.1655766974528; 
 Mon, 20 Jun 2022 16:16:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 01/12] target/riscv: Fix PMU CSR predicate function
Date: Mon, 20 Jun 2022 16:15:51 -0700
Message-Id: <20220620231603.2547260-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 6dbe9b541fd8..46bd417cc182 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -72,6 +72,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
@@ -99,8 +100,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
@@ -126,8 +128,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
2.25.1


