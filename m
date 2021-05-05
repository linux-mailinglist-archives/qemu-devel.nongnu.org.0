Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96489374C07
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:38:58 +0200 (CEST)
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR6X-0003kX-AE
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsl-0000TH-5l
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:43 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsi-0000cg-Ov
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257080; x=1651793080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pBBAC61+EEfqzPyFG9Ss2AtmUcGJb3aUIYDnVeOutq0=;
 b=Rdvvyu8gxZvPgZrtiY5whXnYWafvCYJuSgO2uHEgeAxbCv+agy/hMVVj
 ZYAOvQT+5H1cprCefwiHPWNUT9jeKLwT4WgACQ471f7+LYhYmy5nsHskK
 hLvSfEiko4onD+U6ZEHHR23Oya5oSVxIdw8FaNl4+65HwrYdJZAUt+zzh
 hDSvkXs7kjo9DnA8REISnBYQZhP5bRS/Vmc8LJZOKjnkv0xFjyB5uNEd4
 7a9tB8Ds+cVfaIxuoC2LQUVKZdVw/sdKVHzKnRYPQF53Ict7USlYMtjJM
 VpJdoM/inM8sDfxsD9FKLSA23pDy7iD8jKwytWsIGlKkyUkjEao7DE71Y w==;
IronPort-SDR: BfiI9aWGzCyN4BczF/mktbWYWmh9TCeRrm9+V6O3QoDgm+kzMkbO5rDFvumEmDysYEYLUVw4k1
 deU7glOqC+ibDrnIIZJrp4qKyfoALvIOOs5f51fVceFSIStfPmRBEcrcUVV4px4FMfLHyNfE2R
 2NPwOVOYHONNHQHOeY44nLH/+a/uYe04WPisgMg7xrpTa3hueYPn8SeBrQNODrx3QKqM7jJZs/
 6swUKaL/I86xwAmxcVFMqsssxzpXyWj+KD5I/p3VkC6eCCw0pCs5QAWoZQfrTMTBlFtDibjKm6
 I4M=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585955"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:39 +0800
IronPort-SDR: cAdPkJfdZQs412JmA17FNJuOm/wziZjAIIsKRTXzi1kfCvt46c4d/4SzZe++/u/UhI/p5ReCAC
 9WLFnTOGdQTgehL+6l8BxflZIqKBxYBQ0MdTi/JYCf534MXb/IMFDtfkMp6UlzSC6vC27q9TfJ
 5+qePST0qctIOVi5H30ycKgNPrcPeT5ItRpH40EkGE3DkwkaNeELVwP+pJN51WkM5AGUuZwh3m
 IRoytQ+Gt6irJybQ91AWn2/rNpG/cMHSp7HyqY7gnOYquCpSXk+tM6eEz6N62G/HRz7Nfh0D+l
 duOe28diwP6a/JkQwP71PX1v
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:19 -0700
IronPort-SDR: r3j5nrECWcTjVdhESWatgb14bhrHhe/9kQWFmAn68ECHRl1ZG+oixb86A4Nqg5OqX5V0ypYxX2
 f/qK/RAJibAsfmiBNqCGApmsUbkkShx4VnRKq9NgOh44KR6n7+nJgIBPTLlTvqcUTz9fJDtmx3
 aaeMiCYv+N/sodECp1L1p91BUsSAX3p/V4yvjPy2hZYD2zbH4X6/NkSPGe0iKqOynaY5lp0Cr7
 x7Hl/wrbQ5w/ELg67HuRG2ih2rEvQpBuYGT2Ri/UD0QJ5GhX5SXrBeIhNLpLp1Bfvt/p2FrOvx
 i3c=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 24/42] target/riscv: Implementation of enhanced PMP (ePMP)
Date: Thu,  6 May 2021 09:22:54 +1000
Message-Id: <20210505232312.4175486-25-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

This commit adds support for ePMP v0.9.1.

The ePMP spec can be found in:
https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: fef23b885f9649a4d54e7c98b168bdec5d297bb1.1618812899.git.alistair.francis@wdc.com
[ Changes by AF:
 - Rebase on master
 - Update to latest spec
 - Use a switch case to handle ePMP MML permissions
 - Fix a few bugs
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 154 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 146 insertions(+), 8 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e35988eec2..e1f5776316 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -90,11 +90,42 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
 static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 {
     if (pmp_index < MAX_RISCV_PMPS) {
-        if (!pmp_is_locked(env, pmp_index)) {
-            env->pmp_state.pmp[pmp_index].cfg_reg = val;
-            pmp_update_rule(env, pmp_index);
+        bool locked = true;
+
+        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+            /* mseccfg.RLB is set */
+            if (MSECCFG_RLB_ISSET(env)) {
+                locked = false;
+            }
+
+            /* mseccfg.MML is not set */
+            if (!MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
+                locked = false;
+            }
+
+            /* mseccfg.MML is set */
+            if (MSECCFG_MML_ISSET(env)) {
+                /* not adding execute bit */
+                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
+                    locked = false;
+                }
+                /* shared region and not adding X bit */
+                if ((val & PMP_LOCK) != PMP_LOCK &&
+                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
+                    locked = false;
+                }
+            }
         } else {
+            if (!pmp_is_locked(env, pmp_index)) {
+                locked = false;
+            }
+        }
+
+        if (locked) {
             qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
+        } else {
+            env->pmp_state.pmp[pmp_index].cfg_reg = val;
+            pmp_update_rule(env, pmp_index);
         }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -217,6 +248,32 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
+    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (MSECCFG_MMWP_ISSET(env)) {
+            /*
+             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
+             * so we default to deny all, even for M-mode.
+             */
+            *allowed_privs = 0;
+            return false;
+        } else if (MSECCFG_MML_ISSET(env)) {
+            /*
+             * The Machine Mode Lockdown (mseccfg.MML) bit is set
+             * so we can only execute code in M-mode with an applicable
+             * rule. Other modes are disabled.
+             */
+            if (mode == PRV_M && !(privs & PMP_EXEC)) {
+                ret = true;
+                *allowed_privs = PMP_READ | PMP_WRITE;
+            } else {
+                ret = false;
+                *allowed_privs = 0;
+            }
+
+            return ret;
+        }
+    }
+
     if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
         /*
          * Privileged spec v1.10 states if HW doesn't implement any PMP entry
@@ -294,13 +351,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
 
         /*
-         * If the PMP entry is not off and the address is in range, do the priv
-         * check
+         * Convert the PMP permissions to match the truth table in the
+         * ePMP spec.
          */
+        const uint8_t epmp_operation =
+            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
+            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
+            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
+            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
+
         if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
-            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
-            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
-                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
+            /*
+             * If the PMP entry is not off and the address is in range,
+             * do the priv check
+             */
+            if (!MSECCFG_MML_ISSET(env)) {
+                /*
+                 * If mseccfg.MML Bit is not set, do pmp priv check
+                 * This will always apply to regular PMP.
+                 */
+                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
+                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
+                }
+            } else {
+                /*
+                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
+                 */
+                if (mode == PRV_M) {
+                    switch (epmp_operation) {
+                    case 0:
+                    case 1:
+                    case 4:
+                    case 5:
+                    case 6:
+                    case 7:
+                    case 8:
+                        *allowed_privs = 0;
+                        break;
+                    case 2:
+                    case 3:
+                    case 14:
+                        *allowed_privs = PMP_READ | PMP_WRITE;
+                        break;
+                    case 9:
+                    case 10:
+                        *allowed_privs = PMP_EXEC;
+                        break;
+                    case 11:
+                    case 13:
+                        *allowed_privs = PMP_READ | PMP_EXEC;
+                        break;
+                    case 12:
+                    case 15:
+                        *allowed_privs = PMP_READ;
+                        break;
+                    }
+                } else {
+                    switch (epmp_operation) {
+                    case 0:
+                    case 8:
+                    case 9:
+                    case 12:
+                    case 13:
+                    case 14:
+                        *allowed_privs = 0;
+                        break;
+                    case 1:
+                    case 10:
+                    case 11:
+                        *allowed_privs = PMP_EXEC;
+                        break;
+                    case 2:
+                    case 4:
+                    case 15:
+                        *allowed_privs = PMP_READ;
+                        break;
+                    case 3:
+                    case 6:
+                        *allowed_privs = PMP_READ | PMP_WRITE;
+                        break;
+                    case 5:
+                        *allowed_privs = PMP_READ | PMP_EXEC;
+                        break;
+                    case 7:
+                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+                        break;
+                    }
+                }
             }
 
             ret = ((privs & *allowed_privs) == privs);
-- 
2.31.1


