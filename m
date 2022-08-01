Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B650F586F81
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 19:27:04 +0200 (CEST)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIZC3-0002CI-5E
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 13:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4q-0004bs-4l
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:19:37 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4o-0006gD-Eo
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:19:35 -0400
Received: by mail-pl1-x62d.google.com with SMTP id x10so10365960plb.3
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6HwTTB4kGOSoYgajrQG31veA65eVdUHorSp6UUP5DXw=;
 b=MOHtWKUDEcAvR+mScTyDWjMdmwsnLyOLyKktiHxlXQN/0U13lG5RSFxJaUj65p/7Bx
 TI+Ivl/lD6B+4BHZrPEYvJ+fGYFLJ6S8+7bUz5REgr9cKyyhQJkOEmtGDWpfyenUjxeZ
 6Dfsh70g3SGIi2QdmwRtTjN3/3RESmhilcyho4ksT9h4WP+U0Z10TjWHAvrO9+SXfwIM
 KzwXy20MbrHIy6f+if9n4tnprZ3Y7OmKChZMF+LHa22hvyoq2I3BA64EdJ9d7RK8+Igf
 zgOwfaczb5i+BswT94Q1bbbF01LFn6+kE21K4ZD1iIQ1OhXmbKiXFN5IQt8pj+6Xr8ZG
 2FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6HwTTB4kGOSoYgajrQG31veA65eVdUHorSp6UUP5DXw=;
 b=bkbt2tE4QWORrQvbTv5HMOTvDxNGSLiY9hDidJk0lEZNqRLfC341EE1A9xJLh1ltaN
 wB1dChMt8p8jsL5DDVQ0yFK8kquMdCa/NqTUOC+ctRjy1Q1459hucC6v1ISHF22AiOrx
 izUeUk8FaX9xPz+yUJ6xJmlgwR1L3TsF0zjb+s1V+QZYpnwnTDwBWslfDSoPM6Jkcw9x
 Abfv2sid139H82x8c0TOmtVpOTHEh1Vkmzq2EROhTbIWR004i5dwO4JTAUKs4GMSLdNs
 Be5KtmizVq83cb5SoUMm9Io4Np69emPK6Fl+dIycSk1DI2Hp8vT/yowG5nN0EFgVXjTN
 wAIQ==
X-Gm-Message-State: ACgBeo1NsbR0VzOiNPTXl1FhlLDY17paY7umdWOSrkHkti02ntn1veaz
 9gPZqdsh19GxE3xzc1kZZ8rMqKHlnfj3YA==
X-Google-Smtp-Source: AA6agR5pYJ3V1STNhLc6OkdTzgWuyBhQc1PDqZBjwOtpC1baMcGX+2BokDLvbjUCM5CBqySBRpE2xg==
X-Received: by 2002:a17:90a:e7c7:b0:1f2:bea3:37df with SMTP id
 kb7-20020a17090ae7c700b001f2bea337dfmr21019824pjb.133.1659374372476; 
 Mon, 01 Aug 2022 10:19:32 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.176.236.198])
 by smtp.googlemail.com with ESMTPSA id
 i10-20020a056a00004a00b0052ab602a7d0sm1709942pfk.100.2022.08.01.10.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:19:31 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v7 2/4] target/riscv: smstateen check for h/senvcfg
Date: Mon,  1 Aug 2022 22:48:41 +0530
Message-Id: <20220801171843.72986-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801171843.72986-1-mchitale@ventanamicro.com>
References: <20220801171843.72986-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

Accesses to henvcfg, henvcfgh and senvcfg are allowed only if
corresponding bit in mstateen0/hstateen0 is enabled. Otherwise an
illegal instruction trap is generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 roms/opensbi       |  2 +-
 target/riscv/csr.c | 83 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 77 insertions(+), 8 deletions(-)

diff --git a/roms/opensbi b/roms/opensbi
index 4489876e93..48f91ee9c9 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 4489876e933d8ba0d8bc6c64bae71e295d45faac
+Subproject commit 48f91ee9c960f048c4a7d1da4447d31e04931e38
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ad1642fb9b..011d6c5976 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -40,6 +40,38 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
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
@@ -1715,6 +1747,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
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
@@ -1723,15 +1762,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
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
@@ -1740,6 +1791,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
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
@@ -1753,6 +1810,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
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
@@ -1762,9 +1826,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
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
 
@@ -1796,7 +1865,7 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1843,7 +1912,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
@@ -1892,7 +1961,7 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
@@ -1943,7 +2012,7 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
@@ -2002,7 +2071,7 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
-    uint64_t wr_mask = SMSTATEEN_STATEEN;
+    uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
-- 
2.25.1


