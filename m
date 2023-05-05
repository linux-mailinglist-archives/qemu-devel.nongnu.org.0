Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26A6F7A8F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:17:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuj-0007PI-Ea; Thu, 04 May 2023 21:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuJ-0006rw-DT
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuD-0007rG-LR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:45 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-24df161f84bso867584a91.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248799; x=1685840799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+fk9boX5qCCAYEaNmLumPg5ElbWwbOh4WqzIoOmRZQ=;
 b=P8K73q6E3oLB+pE41WmgfMoPlUb1naIVSpA4FZHbQdAet3ySKIkEbbvcziBsXfhL9j
 7nBw14qoWlurOQ4VxdxKF9l5r+xpczYqi2Y1iqH/A8S3YPSSjh1ac55D5pLwIpMi1Wh7
 c5MVVTkJN/1TUVmsj3I0olPxm7WhB6Dyb9QePSC0l6WbkNzBa54oNa/yfp3hkGQD6Rq6
 Qk40EAUXUO+I0ZaNmYtH4OB+E/1XVLrfXJEq9Qmf/MYowFlBIoX01USLj+/bZygLuaMZ
 N2S1hQMkWyJlecamo4LiEapDO5wbLc8NoP2l+G6ME/PNqRvLhOR9Md16ANK/jefZyP2w
 KIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248799; x=1685840799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+fk9boX5qCCAYEaNmLumPg5ElbWwbOh4WqzIoOmRZQ=;
 b=MQWFGR6epOpMIRDNWyFZObi+KCEdVEcKaWaFOWEs/1nvOC2+D4MJdcXUbEfHC3Daem
 /dXumkC0lfIgoeQjEucEua2zjVx9oLBr1nHn+CyGHqf/NdDD+nmnF/uYq704969wVW39
 yw/foaeCiw6S4ZmyN7HoLcry41gWipyRPpu+u3anlaIYyWPCpC1M1eFQhIZvyt1tdlhE
 uc0djQRsycf+K0CHXKzoQPXUI+2lMPf/faNEBPAlrzYLcafzsPEOlTqOGj66194RIWpT
 ZedUIspil8C0h5SuICsM1+kK6zs5yw+WL+Zn34swQCvwAv108YgEwq/nLkAzngKnD+2S
 uLsw==
X-Gm-Message-State: AC+VfDzI3kDZqaX5IWhbSelFBoXVQeSzsHfeLwUB4dVXOvs3tpun/klD
 oPmQebAvISwJ6rKA7dr7/enXrxX4tOSILg==
X-Google-Smtp-Source: ACHHUZ5pBgQzw0HK+TN+FA4v/CRKhvPEANkVxPe3TI98KmOutFCWZJekAAGBp3Ku8Ems/8+xWgB13A==
X-Received: by 2002:a17:90a:2bc7:b0:24b:290a:fb2e with SMTP id
 n7-20020a17090a2bc700b0024b290afb2emr3751025pje.36.1683248798828; 
 Thu, 04 May 2023 18:06:38 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:38 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 59/89] target/riscv: Add a general status enum for extensions
Date: Fri,  5 May 2023 11:02:11 +1000
Message-Id: <20230505010241.21812-60-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

The pointer masking is the only extension that directly use status.
The vector or float extension uses the status in an indirect way.

Replace the pointer masking extension special status fields with
the general status.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
[rth: Add a typedef for the enum]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-3-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-3-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h      |  8 ++++++++
 target/riscv/cpu_bits.h | 12 ++++--------
 target/riscv/cpu.c      |  2 +-
 target/riscv/csr.c      | 14 +++++++-------
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index aa53d0e256..ba11279716 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -97,6 +97,14 @@ enum {
     TRANSLATE_G_STAGE_FAIL
 };
 
+/* Extension context status */
+typedef enum {
+    EXT_STATUS_DISABLED = 0,
+    EXT_STATUS_INITIAL,
+    EXT_STATUS_CLEAN,
+    EXT_STATUS_DIRTY,
+} RISCVExtStatus;
+
 #define MMU_USER_IDX 3
 
 #define MAX_RISCV_PMPS (16)
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a16bfaf43f..fb63b8e125 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -9,6 +9,9 @@
                  (((uint64_t)(val) * ((mask) & ~((mask) << 1))) & \
                  (uint64_t)(mask)))
 
+/* Extension context status mask */
+#define EXT_STATUS_MASK     0x3ULL
+
 /* Floating point round mode */
 #define FSR_RD_SHIFT        5
 #define FSR_RD              (0x7 << FSR_RD_SHIFT)
@@ -735,13 +738,6 @@ typedef enum RISCVException {
 #define PM_ENABLE       0x00000001ULL
 #define PM_CURRENT      0x00000002ULL
 #define PM_INSN         0x00000004ULL
-#define PM_XS_MASK      0x00000003ULL
-
-/* PointerMasking XS bits values */
-#define PM_EXT_DISABLE  0x00000000ULL
-#define PM_EXT_INITIAL  0x00000001ULL
-#define PM_EXT_CLEAN    0x00000002ULL
-#define PM_EXT_DIRTY    0x00000003ULL
 
 /* Execution enviornment configuration bits */
 #define MENVCFG_FIOM                       BIT(0)
@@ -781,7 +777,7 @@ typedef enum RISCVException {
 #define S_OFFSET     5ULL
 #define M_OFFSET     8ULL
 
-#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
 #define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
 #define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
 #define U_PM_INSN    (PM_INSN    << U_OFFSET)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fab38859ec..32c04214a1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -759,7 +759,7 @@ static void riscv_cpu_reset_hold(Object *obj)
         i++;
     }
     /* mmte is supposed to have pm.current hardwired to 1 */
-    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
+    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
     riscv_cpu_update_mask(env);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2271da137..92ad54411b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3548,7 +3548,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
 
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
-    env->mmte = wpri_val | PM_EXT_DIRTY;
+    env->mmte = wpri_val | EXT_STATUS_DIRTY;
     riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -3628,7 +3628,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3656,7 +3656,7 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3684,7 +3684,7 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3708,7 +3708,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3736,7 +3736,7 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3764,7 +3764,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
-- 
2.40.0


