Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E355D58D2B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 06:20:23 +0200 (CEST)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLGj8-0004CZ-Nz
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 00:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfu-0006od-IS
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 00:17:02 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfs-0004ZO-Nj
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 00:17:02 -0400
Received: by mail-oi1-x230.google.com with SMTP id c185so12610636oia.7
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 21:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6VS+6hSiE9qBG72L+hE7gB3Y7Tt/y3Jtoyf/Aepz/Iw=;
 b=BlDNhf26JopcSyYRVR1ZZ2tAs21HMJgN5tI92PpsgkehM8+tvuJJdEk/82jX/q024R
 T+46oz/+Hh6Hohjo8Q1WPQtsbvuhgCld3W6y3gSMaxZIZvGuthXLRMi5YimTZvw499KZ
 6WoGt213JA7tq+zjYkJzIdRA6jGjnbEA9n6U7mLfQQlZSVv5N6oa8hUimzGjWoC+ydwZ
 NeIv4xu0X75/j4a36/oXeZIuCwiFKWgzD7TfZT9JV8RGeftK7dp/yt8PeZOFs61tMJdW
 M6rC3f5YKdC/lu3X+pL3SHbenG9gR9TR6krsJBPfG3jY9m7SnTosT44EB61WAg8+vf5s
 YVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6VS+6hSiE9qBG72L+hE7gB3Y7Tt/y3Jtoyf/Aepz/Iw=;
 b=pyOO3sM7QAf2vBC5gSIn28AWL6Th3ZPAVIfQ4H2WXvNKTh5gGDdosh4KbSMjMMGYji
 fniX4/1H4gIRfRrcma2Xblob2Bfklnw8E26AB5j6/5vh1/gF5pRIa5VDP+YQzimI+84n
 D8uahwHQ7kqibkI51JRDHjNaFMn7fH4NL+FR5SEuxhDi2qQdScPBRMPAppkrUS0KzXiU
 qNO1Cm78b9ZpGGESKLTolcTLv5bEuIemEeMBc2ljVNkxHMt62LgHW2YKy0rknHCDa5u/
 V+0Gh5b5D5rG7jn8w5l84OSxORSD/s9jdAZDoPPQkd3loZE/Y5bTlDkaPAp+y2nFzkur
 oeXw==
X-Gm-Message-State: ACgBeo3t9UV49wAz0tLcp0OXNjEep7VFKgZlqyMStHT+jx4RK7C1AMx4
 lJe5u6sRoTdnZgxT56jS+vzaLg4U1cMYRA==
X-Google-Smtp-Source: AA6agR5Wh0pB68HauvJbUxV2ei6a0mjPhV++op2qPyI0/PqaqFi4BgSrIbLfyYrfa+darGEgx67Xew==
X-Received: by 2002:a05:6808:210d:b0:343:1027:2e63 with SMTP id
 r13-20020a056808210d00b0034310272e63mr655801oiw.228.1660018619757; 
 Mon, 08 Aug 2022 21:16:59 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a9d648f000000b0061c9ccb051bsm2712738otl.37.2022.08.08.21.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 21:16:59 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v8 2/4] target/riscv: smstateen check for h/s/envcfg
Date: Tue,  9 Aug 2022 09:46:41 +0530
Message-Id: <20220809041643.124888-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809041643.124888-1-mchitale@ventanamicro.com>
References: <20220809041643.124888-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x230.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accesses to henvcfg, henvcfgh and senvcfg are allowed only if the corresponding
bit in mstateen0/hstateen0 is enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 87 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d5761996ba..d8383c7307 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -40,6 +40,42 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+#if !defined(CONFIG_USER_ONLY)
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+                                       uint64_t bit)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[index] & bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+
+        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
+        if (!(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1719,6 +1755,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1727,15 +1770,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1744,6 +1799,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1757,6 +1818,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1766,9 +1834,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1800,7 +1873,7 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1847,7 +1920,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
@@ -1896,7 +1969,7 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
@@ -1947,7 +2020,7 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
@@ -2006,7 +2079,7 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
-- 
2.25.1


