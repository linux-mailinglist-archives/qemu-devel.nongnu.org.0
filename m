Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD4545BA5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:24:50 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzX8b-000629-5p
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWy0-0003Nw-7f
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxy-0007c4-HA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so1176616pjb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 22:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b8suD+KlRNISOrVxOA1LK6g6AqsctsKZwbip8bLZz0M=;
 b=laO8iV0+VvzmLyQBFUDCMYaX1Z5UPaPFtSigK0bE2fLbyOF3mbk7ERNT58kUDVaZvp
 sX2Khp7bUmjlXDA+DbtGDCZz52TDgFqk6aCHbVoBhr1Nw1rueph19grbud+gzh8Jok5q
 octXrnEUgjOtf64mOsHj6x6e4UsAr666/nLcZB/5YVUoc2f/HCh0G22YCqJ8kUG4BcDq
 QJSLSvp0lmJ8670XxSIsIvWOu4zVvocCnAGJ8bZMBHBBIdafVZgWz6Wa6boXXH/yuGXp
 vojLnKbsMDVRb2lgKPWX5hvT/w0mHKJ/+zf5yHr1+y01ruVkgQlpo10DtlVHz4u1Vyr1
 hJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b8suD+KlRNISOrVxOA1LK6g6AqsctsKZwbip8bLZz0M=;
 b=ddXv1HU/R7d5lMTOiGbG+0jlg7pw+VLKkeDl68gxLDvkByj+n86fijM8TZIxnKrEJP
 f2e2Wnda9CRiCTfeNT4jNfw2J32A95RctBlXgMLO1MTBkcGbgQFg5TooMz3l0OBz3EQo
 LcEOoUQ0z+oDoTjNpKyNyH+lZnfYkZkRZS4/cVLgEzvV/RqYN7ce3WoWN1J/gfY5CQDr
 9w1ffLnIXKNxvlNWsAUk7d904UzUfJRcXeGh8O+TQ5EWq6ALqcLZHbSr7zk/r6OD+wTz
 zcO8VKvi7Ww4VvKBhzUlcvo5egDpmfc6ciMFdWWgghBPBMHkiX9VJsmRM2OhEt4sb/od
 Dt+w==
X-Gm-Message-State: AOAM531g47ZJIOkCBAVHFOQg+7PLZNXTWIE4ipwdncsRbp4FRiNKZdnj
 t8LGEqSxAv8TGNYLeiQyjVQzbRsMDjM+XQ==
X-Google-Smtp-Source: ABdhPJy+rS8AE1Ek0Rr97s2kucUSKZhaiTq7ZeebzmVeAYn6DOXpfMTMXTX7rzpT35O8vs/sbskY6g==
X-Received: by 2002:a17:90a:6847:b0:1ea:7b6b:cd2f with SMTP id
 e7-20020a17090a684700b001ea7b6bcd2fmr1779755pjm.185.1654838028893; 
 Thu, 09 Jun 2022 22:13:48 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 5/9] target/riscv: debug: Introduce tinfo CSR
Date: Fri, 10 Jun 2022 13:13:22 +0800
Message-Id: <20220610051328.7078-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Frank Chang <frank.chang@sifive.com>

tinfo.info:
  One bit for each possible type enumerated in tdata1.
  If the bit is set, then that type is supported by the currently
  selected trigger.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      |  8 ++++++++
 target/riscv/debug.c    | 10 +++++++---
 target/riscv/debug.h    |  2 ++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4d04b20d06..666b4d69ca 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -331,6 +331,7 @@
 #define CSR_TDATA1          0x7a1
 #define CSR_TDATA2          0x7a2
 #define CSR_TDATA3          0x7a3
+#define CSR_TINFO           0x7a4
 
 /* Debug Mode Registers */
 #define CSR_DCSR            0x7b0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 005ae31a01..823b6bd520 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2800,6 +2800,13 @@ static RISCVException write_tdata(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_tinfo(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = tinfo_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -3588,6 +3595,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
     [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
     [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
+    [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
 
     /* User Pointer Masking */
     [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 296192ffc4..1668b8abda 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -37,9 +37,7 @@
  * - tdata1
  * - tdata2
  * - tdata3
- *
- * We don't support writable 'type' field in the tdata1 register, so there is
- * no need to implement the "tinfo" CSR.
+ * - tinfo
  *
  * The following triggers are implemented:
  *
@@ -369,6 +367,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
     }
 }
 
+target_ulong tinfo_csr_read(CPURISCVState *env)
+{
+    /* assume all triggers support the same types of triggers */
+    return BIT(TRIGGER_TYPE_AD_MATCH);
+}
+
 void riscv_cpu_debug_excp_handler(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 76146f373a..9f69c64591 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -95,6 +95,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong val);
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 
+target_ulong tinfo_csr_read(CPURISCVState *env);
+
 void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
-- 
2.36.1


