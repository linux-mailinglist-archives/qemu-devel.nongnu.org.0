Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB2751BD53
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:35:52 +0200 (CEST)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYpr-0005TK-Q7
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWn-0005CF-Dy
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWl-0003JU-1A
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso3670512wmq.0
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RGoRBcklgW4bJquVq1HVnNxC0lCcDz2r+Ent1cSjiow=;
 b=Bd5T2xG5WGZINCoCQxJNO0PuTvDedEJoypoyE5V5SOr6qBqI6OuS48lcZgr+q2w1nP
 o1jr3rTjn9+0OQh0hDbQaX/ApPRLwQQvnDbbH03v2yR2VBWwXwF3Tyi5UvXwY1GYjA2F
 zZYsC9CZEkd7VuuckN3nv3QaPMpdiXv9BV/NJ8OM/0+78qAedXDaJBDvAzyesjStGSbu
 dUmtpHnr2BN+1InO9WqjTqFd0XOPgZaZawyy/3LcuIYUztnvo4LBk+a9kSQmD+f13aN2
 pYskQivX99chLEysRJHq0jSS8Aavix/HRs/mCvcczqI4Xhx6Ke+fj0Sf6ENkTkAvc8YQ
 rEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RGoRBcklgW4bJquVq1HVnNxC0lCcDz2r+Ent1cSjiow=;
 b=R5ttYUNeakUI9y04+vRNTzZS1wOUzq/pm3W0rmcAFwbbHzFx2JPxvXtEkeYJ6M+ytu
 ER3aIPvhcVL6W942qV5G7dQyFqQtGLfB0w/4r2mGpLFf6VIJ+51VFmQOvISbDSZojG0X
 4Yxx4IyfV72p0wf4SW5YTxkOgpc8VZmQKdAh03njNlzf1Hkn3w/cfgwqUBIBrfTyCbez
 vCr/bXBbI1jlYwrvd+M/7D88k5TEVGfnYvMeNVgdyslrST1Rw9flERmJuLU7TGpZ0aoe
 7SqCuSAC71gsIWkqYIvFd9jgB1gEghmclt+Rd34yk6nZLyUjGE2VKJGQcxkqJRamSsLg
 jVBg==
X-Gm-Message-State: AOAM531yNAqXMJ5ehf58rCFRFfpdUpoPFErcPMXFeVOTbT/unG4p+VA5
 GQ26K1+pliglj0OK2cbIrL1g1Lxh6Wz4bQ==
X-Google-Smtp-Source: ABdhPJyfJCXaEGHRb5RPggIG4Hw9g3oRafusw7iZ1L7OyDsvXcky/MlTVIFBtLiA1tpU0ApCHoWCpg==
X-Received: by 2002:a7b:c24d:0:b0:393:fac9:3015 with SMTP id
 b13-20020a7bc24d000000b00393fac93015mr3545227wmj.186.1651741921514; 
 Thu, 05 May 2022 02:12:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] target/arm: Store cpregs key in the hash table directly
Date: Thu,  5 May 2022 10:11:36 +0100
Message-Id: <20220505091147.2657652-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Cast the uint32_t key into a gpointer directly, which
allows us to avoid allocating storage for each key.

Use g_hash_table_lookup when we already have a gpointer
(e.g. for callbacks like count_cpreg), or when using
get_arm_cp_reginfo would require casting away const.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c     |  4 ++--
 target/arm/gdbstub.c |  2 +-
 target/arm/helper.c  | 41 ++++++++++++++++++-----------------------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a7cd692010c..602c060fff7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1090,8 +1090,8 @@ static void arm_cpu_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
-    cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
-                                         g_free, cpreg_hashtable_data_destroy);
+    cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                         NULL, cpreg_hashtable_data_destroy);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index f01a126108f..f5b35cd55f0 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -273,7 +273,7 @@ static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
 static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                                         gpointer p)
 {
-    uint32_t ri_key = *(uint32_t *)key;
+    uint32_t ri_key = (uintptr_t)key;
     ARMCPRegInfo *ri = value;
     RegisterSysregXmlParam *param = (RegisterSysregXmlParam *)p;
     GString *s = param->s;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 70dc1482dd7..2bc81dbc5ec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -214,11 +214,8 @@ bool write_list_to_cpustate(ARMCPU *cpu)
 static void add_cpreg_to_list(gpointer key, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
-    uint64_t regidx;
-    const ARMCPRegInfo *ri;
-
-    regidx = *(uint32_t *)key;
-    ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+    uint32_t regidx = (uintptr_t)key;
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
     if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
@@ -230,11 +227,9 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
 static void count_cpreg(gpointer key, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
-    uint64_t regidx;
     const ARMCPRegInfo *ri;
 
-    regidx = *(uint32_t *)key;
-    ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+    ri = g_hash_table_lookup(cpu->cp_regs, key);
 
     if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
@@ -243,8 +238,8 @@ static void count_cpreg(gpointer key, gpointer opaque)
 
 static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
 {
-    uint64_t aidx = cpreg_to_kvm_id(*(uint32_t *)a);
-    uint64_t bidx = cpreg_to_kvm_id(*(uint32_t *)b);
+    uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
+    uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
 
     if (aidx > bidx) {
         return 1;
@@ -5915,15 +5910,16 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
     for (i = 0; i < ARRAY_SIZE(aliases); i++) {
         const struct E2HAlias *a = &aliases[i];
         ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
-        uint32_t *new_key;
         bool ok;
 
         if (a->feature && !a->feature(&cpu->isar)) {
             continue;
         }
 
-        src_reg = g_hash_table_lookup(cpu->cp_regs, &a->src_key);
-        dst_reg = g_hash_table_lookup(cpu->cp_regs, &a->dst_key);
+        src_reg = g_hash_table_lookup(cpu->cp_regs,
+                                      (gpointer)(uintptr_t)a->src_key);
+        dst_reg = g_hash_table_lookup(cpu->cp_regs,
+                                      (gpointer)(uintptr_t)a->dst_key);
         g_assert(src_reg != NULL);
         g_assert(dst_reg != NULL);
 
@@ -5936,14 +5932,14 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
         /* Create alias before redirection so we dup the right data. */
         new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
 
         new_reg->name = a->new_name;
         new_reg->type |= ARM_CP_ALIAS;
         /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
         new_reg->access &= PL2_RW | PL3_RW;
 
-        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+        ok = g_hash_table_insert(cpu->cp_regs,
+                                 (gpointer)(uintptr_t)a->new_key, new_reg);
         g_assert(ok);
 
         src_reg->opaque = dst_reg;
@@ -8509,7 +8505,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     /* Private utility function for define_one_arm_cp_reg_with_opaque():
      * add a single reginfo struct to the hash table.
      */
-    uint32_t *key = g_new(uint32_t, 1);
+    uint32_t key;
     ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
@@ -8576,10 +8572,10 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
             r2->cp = CP_REG_ARM64_SYSREG_CP;
         }
-        *key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
-                                  r2->opc0, opc1, opc2);
+        key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
+                                 r2->opc0, opc1, opc2);
     } else {
-        *key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
+        key = ENCODE_CP_REG(r2->cp, is64, ns, r2->crn, crm, opc1, opc2);
     }
     if (opaque) {
         r2->opaque = opaque;
@@ -8621,8 +8617,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * requested.
      */
     if (!(r->type & ARM_CP_OVERRIDE)) {
-        ARMCPRegInfo *oldreg;
-        oldreg = g_hash_table_lookup(cpu->cp_regs, key);
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
         if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
             fprintf(stderr, "Register redefined: cp=%d %d bit "
                     "crn=%d crm=%d opc1=%d opc2=%d, "
@@ -8632,7 +8627,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
             g_assert_not_reached();
         }
     }
-    g_hash_table_insert(cpu->cp_regs, key, r2);
+    g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
 
@@ -8864,7 +8859,7 @@ void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
 
 const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp)
 {
-    return g_hash_table_lookup(cpregs, &encoded_cp);
+    return g_hash_table_lookup(cpregs, (gpointer)(uintptr_t)encoded_cp);
 }
 
 void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


