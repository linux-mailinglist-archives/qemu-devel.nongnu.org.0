Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6F51BBEC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:23:45 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXi5-0000ld-0O
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWi-00051f-Um
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWh-0003HP-5y
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 r1-20020a1c2b01000000b00394398c5d51so2243166wmr.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hSAkfjiq8NHovzsRkuZFZACusQ6Byf9p05IGivYIsEk=;
 b=BnnXWoEls/1ZUJBnUPnoGJEGoOKXhnk/9Ow5zmAyIOlY8sKr4PEIsRP9xJopWGM187
 OD0rFpZHJE20Qj/7UlsYWbFBg6mP2HTpXNtUuzL49fc8ANX/AuC8GctRY35zVNDsBMKE
 ribhN4T3tDVCU5XqNbvRtiXyKKz+xoObpo7E1xeIT7jrHn5buFDFhvTID6LVNEWseL6y
 rgQUVis9hVrHpUqWRETzbBQ0HZMBLGfGkdVTVzv5/D7szD50V9F8PjhNsCV9SnnBoLQZ
 Zpwyhdw/w/fBhnp+0INwwE7A+UB55ka0PjY7fZQMvLdpMz35/04ZqXQJsZ2cm5lSYwSu
 7MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSAkfjiq8NHovzsRkuZFZACusQ6Byf9p05IGivYIsEk=;
 b=m1FCV3wqIi5VKr0jLuwsQlaQpuI+qIyFbz7ONsqprxQ+F5ijy77Z9RG2Um63d+K43a
 y8atYVsfPjZwH3HECyohWCrLem2iOmlUkpjebCiM7kH4X1t16YvxMyf1Lf8jyjN5UuY2
 /XG7iIVvaoth1QzxGtcwxL+1SiIJwioD9eGp4DypMa18/7cQa4Xw6Vol0ftNUyF7PCil
 SUoa9zvzNsOPRedtKasZAZ6n5MX7oFiwFwvABgN9Pyh4E6utC83xnTIqJic92fcdiblr
 20AdZIS7X00rZu9lUjVmBYXpwdy+xO8MRGj6Ap+z2dd27utdFySKsb/XUwfKJey4XMbJ
 D2nw==
X-Gm-Message-State: AOAM533i1Ea4wYho38EgOVk8hgHDppJGG95iKtKkbhAUtSGDljzbipT0
 TCTIAn9ddti1F3SfsQrFJdcweoN7dibKqQ==
X-Google-Smtp-Source: ABdhPJyhiMsq9V4krNmuQHXP7bvS0axIBqbHAaukZt9d1UjYGAegNdl1JCJOd0NytLVyZxGs9YVguQ==
X-Received: by 2002:a7b:ce04:0:b0:394:1f46:213 with SMTP id
 m4-20020a7bce04000000b003941f460213mr3489656wmc.157.1651741917613; 
 Thu, 05 May 2022 02:11:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] target/arm: Avoid bare abort() or assert(0)
Date: Thu,  5 May 2022 10:11:31 +0100
Message-Id: <20220505091147.2657652-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Standardize on g_assert_not_reached() for "should not happen".
Retain abort() when preceeded by fprintf or error_report.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c         | 7 +++----
 target/arm/hvf/hvf.c        | 2 +-
 target/arm/kvm-stub.c       | 4 ++--
 target/arm/kvm.c            | 4 ++--
 target/arm/machine.c        | 4 ++--
 target/arm/translate-a64.c  | 4 ++--
 target/arm/translate-neon.c | 2 +-
 target/arm/translate.c      | 4 ++--
 8 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f84377babe1..06f8864c778 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8740,8 +8740,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
             break;
         default:
             /* broken reginfo with out-of-range opc1 */
-            assert(false);
-            break;
+            g_assert_not_reached();
         }
         /* assert our permissions are not too lax (stricter is fine) */
         assert((r->access & ~mask) == 0);
@@ -10823,7 +10822,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
-            abort();
+            g_assert_not_reached();
         }
     }
     *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
@@ -10944,7 +10943,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
-            abort();
+            g_assert_not_reached();
         }
     }
     if (domain_prot == 3) {
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b11a8b9a189..86710509d20 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1200,7 +1200,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* we got kicked, no exit to process */
         return 0;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     hvf_sync_vtimer(cpu);
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 56a7099e6b9..965a486b320 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -15,10 +15,10 @@
 
 bool write_kvmstate_to_list(ARMCPU *cpu)
 {
-    abort();
+    g_assert_not_reached();
 }
 
 bool write_list_to_kvmstate(ARMCPU *cpu, int level)
 {
-    abort();
+    g_assert_not_reached();
 }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5fc37ac10a5..4339e1cd6e0 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -540,7 +540,7 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
             ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
         if (ret) {
             ok = false;
@@ -575,7 +575,7 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
             r.addr = (uintptr_t)(cpu->cpreg_values + i);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
         ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &r);
         if (ret) {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 135d2420b5c..285e387d2c3 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -661,7 +661,7 @@ static int cpu_pre_save(void *opaque)
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
-            abort();
+            g_assert_not_reached();
         }
 
         /*
@@ -672,7 +672,7 @@ static int cpu_pre_save(void *opaque)
     } else {
         if (!write_cpustate_to_list(cpu, false)) {
             /* This should never fail. */
-            abort();
+            g_assert_not_reached();
         }
     }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a82f5d5984b..b80313670f9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6151,7 +6151,7 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
 
     write_fp_sreg(s, rd, tcg_res);
@@ -6392,7 +6392,7 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
         break;
     }
     default:
-        abort();
+        g_assert_not_reached();
     }
 }
 
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 2e4d1ec87d9..321c17e2c7e 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -679,7 +679,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
     if ((vd + a->stride * (nregs - 1)) > 31) {
         /*
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 050c237b076..4e19191ed5c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5156,7 +5156,7 @@ static void gen_srs(DisasContext *s,
         offset = 4;
         break;
     default:
-        abort();
+        g_assert_not_reached();
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
@@ -5181,7 +5181,7 @@ static void gen_srs(DisasContext *s,
             offset = 0;
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
         tcg_gen_addi_i32(addr, addr, offset);
         gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
-- 
2.25.1


