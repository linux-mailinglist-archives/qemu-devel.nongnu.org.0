Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D9508559
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:00:14 +0200 (CEST)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh789-0006ai-E1
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh75T-0005BA-Ez
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:57:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh75R-00016C-3Y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 05:57:26 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso1512384pjk.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTprkEYlA1e+6K8+Mv+GxHs6vsO79SS53vFjjDAuPuE=;
 b=mVXLmFmuSfeN/mSxvwjKV7L+Wx5D3GexCGc/2mLRfEafjljECbxlU6cBaFy2RGMWaQ
 VyzS3dCTcYgx4EDiYa+yOiS+7AgeKJrIlnONyD1eH0YrL68L1gEJAfVfYSQciqkNBrgN
 4RdrxaAw2i5Ymyl3UtCyv7BKLkUK3XxExzowQhqBRY5ZCNFmpucQmibYT2JBbLLeBklD
 N+J3TQKjXusGxdr2SKxflrx/SSipnlkcoOj5P6jpqTtA+wKODnRrBlmxeq2V5EUWLDM7
 xE4jnHafFdS3Euc3UtFBTPhM+kjb7o4gfNP9xNtASNjHKzp9DvHbICB9/bRXCKvcG4FX
 mKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTprkEYlA1e+6K8+Mv+GxHs6vsO79SS53vFjjDAuPuE=;
 b=iH/vMLLLIwDACJVbbCxlO93g0TKDHI2PAerCWpWX3tp1JfRvltJ8N6bYHgqyakLPNa
 esbKrnFDpcQrIOK14uQ/fGoPjzG4JfLX35+2TM0gnjsFYQ6PbJrPOp2k9lkUd3xRFrp3
 8kVhdtoJoSkgP8sHZ4phVZoy8zWtEt/caTJLHzOJHenAxBCSJuzWWclvPvEM7ZG+zHig
 SdaTeA0ivBg5lCPa6brxmGobMmGpd9tyGKR5+u6unH0tjuFJPIsmE1J9DigILjmx1cYP
 shxvjFsI+9tAY371KJGaaHcBe/dDVFFD65fxYKQFBLjuQ0CKIWXq0xHl/llohM90u0tQ
 ShiA==
X-Gm-Message-State: AOAM531qmY0lkOG72OS0U6NdwtqaKNNCMjPadXM2pYMhtQvebZ7zZr8k
 ll/43HB+1xIBM4JlVywpUC8Q7n9JUIDDSsH/
X-Google-Smtp-Source: ABdhPJwJfw8A01G4z8b7NsWkdYg5huBBDevY2PeXw1KiAR/A/ZxlLu2PwD7m+KjPH4GC/ULrJv7tVw==
X-Received: by 2002:a17:903:120b:b0:154:c9f2:207b with SMTP id
 l11-20020a170903120b00b00154c9f2207bmr19888615plh.153.1650448642763; 
 Wed, 20 Apr 2022 02:57:22 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056a0010d500b004fd9ee64134sm20015057pfu.74.2022.04.20.02.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 02:57:22 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
Date: Wed, 20 Apr 2022 17:57:17 +0800
Message-Id: <20220420095718.26392-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Allow user to set core's marchid, mvendorid, mipid CSRs through
-cpu command line option.

The default values of marchid and mipid are built with QEMU's version
numbers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c |  9 +++++++++
 target/riscv/cpu.h |  4 ++++
 target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..84c3ff745a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,11 @@
 
 /* RISC-V CPU definitions */
 
+#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
+                             (QEMU_VERSION_MINOR << 8)  | \
+                             (QEMU_VERSION_MICRO))
+#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -786,6 +791,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
+    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
+
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..3ab92deb4b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -370,6 +370,10 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
 
+    uint32_t mvendorid;
+    uint64_t marchid;
+    uint64_t mipid;
+
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 341c2e6f23..9a02038adb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -603,6 +603,36 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    *val = cpu->cfg.mvendorid;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_marchid(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    *val = cpu->cfg.marchid;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mipid(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    *val = cpu->cfg.mipid;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
 
     /* Machine Information Registers */
-    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
-    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
-    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
-    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
+    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
+    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
+    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
 
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
-- 
2.35.1


