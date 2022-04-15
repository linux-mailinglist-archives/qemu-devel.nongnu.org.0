Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7F50277B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 11:38:45 +0200 (CEST)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfIPc-00018e-1u
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nfIOW-0000HM-MS
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:37:36 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nfIOU-0003sU-OC
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:37:36 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so11398916pjb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IUIhYAgNp3ZAaltX+7FMjUGoVw7YVo7fC+jUhc3JwGo=;
 b=NhezoolD3dS+jvQMHuE3iyeuivkbrWptqfPwjoD7sGCW2dLe9nHNyrIR3bB4jY/Jnj
 NYSYbSiQ717+Ensv6Wbbq3eN6fAAQe8rZnxteHno7Jyrk4nMFE0AYJpBiFdA0rErnk59
 sdvJbavVv76U7GQTZh4d/T6v3n3dLqGz1c+5quJ+14e+uPgwthp8d37uTrNVyi/o/fbg
 GvK2dL9v0rJCc0gcvKUE7ihDbkxDZ31eGp1V/0sl8tnZs/Ul0Jh40pjkYOFzZRCkut5d
 VJga7IS7hqLnWLwIMir+elI53veR9KpjepWl9nixIx8T2hXAAMMGAZcFfnzMmzd+kFQZ
 tS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IUIhYAgNp3ZAaltX+7FMjUGoVw7YVo7fC+jUhc3JwGo=;
 b=hHCppsDkXvgkDUrzJx3eYC4ArEPzEtJENnHdh0xY0PicKTf2y3SYoGuOx4DVcoEV4M
 LXfpkz+P5Tmke21rh5cK1q7l+En9tYn2dM7STUX3Wfbr+VrLo5SeCEWUJmo/ez087bkJ
 85/wvPEYYcCECbLKfLoukuFTVxFgQ7P9ifk6qkiThsU0R2sEDnJqKS1ap4/gvTSVN1oV
 7CWiuVADWOiiECC9yt+aPKEPlMg7XH8jOv1/KXKch8vdv/ctkz11yf6J2gcFQPZuROey
 YywB9uqPBf7Z8iPnq9yMhMownJ3MiDUKfIKt3noJnrXDQi8aTHONsWnNobxnB4zrScgs
 WLAQ==
X-Gm-Message-State: AOAM530v+sQFI7HhnGBPgDA94/w+9cXAGaJjB9L+L3N81RYWyAYRnuhT
 GEubyD15YayJR15Zk6je/F4xjMEdhLaMQWuG
X-Google-Smtp-Source: ABdhPJz3rBeYaGEGIxSr8nL54/QVBlSkeePLhsHhY6Lebic3QrDNAqkxfFLSBLF7PfTGKGpzRoW25w==
X-Received: by 2002:a17:90a:d0c5:b0:1c9:ec78:18e5 with SMTP id
 y5-20020a17090ad0c500b001c9ec7818e5mr3216640pjw.53.1650015453034; 
 Fri, 15 Apr 2022 02:37:33 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 u7-20020aa78487000000b00505d9277cb3sm2260275pfn.38.2022.04.15.02.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 02:37:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
Date: Fri, 15 Apr 2022 17:37:16 +0800
Message-Id: <20220415093727.15323-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Allow user to set core's marchid, mvendorid, mipid CSRs through
-cpu command line option.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c |  4 ++++
 target/riscv/cpu.h |  4 ++++
 target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..2eea0f9be7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 0),
+    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, 0),
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


