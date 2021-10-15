Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE542EA98
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:52:34 +0200 (CEST)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbI13-0005km-EW
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvO-00050n-6O
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:42 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvM-0001k0-K9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6670181pjb.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wu/at50n9I3pTMa+vYdztF1Zh1WOMhcO/j2Xurj2X5A=;
 b=m4x5S9AM8zrGrCK6S5MpVF2NdlbcK8QZzEL/DzbgV3xYnJqCR2/Ky2QwzrRO4mGbsB
 Zu2lOyacIYtMgdyFKECwrxafvCAh8ZeNVrt9uer+dJff63rJSVbn8TRpSNuyqyf5DZm+
 ImvxflCSb80+mmCDbX+W0/erWyYKKnNGKaq936w3FnMvIYDF4eiN5W2q+rw2DtZagPFi
 5x7l8h2xzdQKp41z/Gu4D6ibXi6Fa/xe76wOQ+Zo8+n1EbN7TJzyz56V8NeohHSa3FWk
 odtTTQ1Jrwh3CYtn7/2Q0plxp7ZdINsZL8r6oVTRmiflE85vRNOcuj8WYDkdzauRAl2G
 NnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wu/at50n9I3pTMa+vYdztF1Zh1WOMhcO/j2Xurj2X5A=;
 b=ynVvw3K5ZcraoJf0jHsmyWYnipe5GE3a5Eo/PfmMAn+we+ovUEyES2xr5R2PYJvdLH
 dA/uwmE1Z3BG7noVCIQv9Gmpa6Hcn6jDbcOJGNbYkwXf3bamvkbZrNnRJFoB3sW7pkTz
 Gq442ClnYIqEDRfU82DK4OPl4fU3MUOcrcf1MlzUECRpuXx/JHCbvm9rvS76jD+dxPtu
 aIeFhj2VyHY1P/ksaz7UK4U1gSPvtEb/hb+fMedROW3rhDIUUW0PzR7ssjLMWfLUjk5z
 uUxnKMmSUAeZ2uL2gctBEwpdfYqq7VeXmqRED85UWfwUremy7LMosldH2aedJQ5QE5a3
 TX4g==
X-Gm-Message-State: AOAM533EyCEatT9yrZr+KPNOFOYs4WAjYIEwQD5FFKw+1Jr+Ij1VAHRW
 6YOyoQKsCBLWpe8PDYR50fjSiqCc/24+2MqN
X-Google-Smtp-Source: ABdhPJw0D6uShXEJ4DPSf2ut/a9nnuED6L20rNR2PoaxYD41s/AgCRG3Nx7cLeozqrXFT61+jVBITA==
X-Received: by 2002:a17:902:e984:b0:13f:17c2:8f0a with SMTP id
 f4-20020a170902e98400b0013f17c28f0amr9789041plb.74.1634283999055; 
 Fri, 15 Oct 2021 00:46:39 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:38 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 01/78] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
Date: Fri, 15 Oct 2021 15:45:02 +0800
Message-Id: <20211015074627.3957162-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
commit: c445593, but other TB_FLAGS bits for rvv and rvh were
not shift as well so these bits may overlap with each other when
rvv is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h       | 14 +++++++-------
 target/riscv/translate.c |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d70f63ddfe6..d63a08b6e4c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -380,7 +380,6 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_MMU_MASK   7
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
@@ -389,13 +388,14 @@ typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+FIELD(TB_FLAGS, MEM_IDX, 0, 3)
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
+FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, SEW, 6, 3)
+FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+FIELD(TB_FLAGS, HLSX, 10, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f23bc919c08..a7a66cf9db1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -544,7 +544,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
-    ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
+    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-- 
2.25.1


