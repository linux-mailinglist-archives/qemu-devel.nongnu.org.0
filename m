Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E287B5788F9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:56:21 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUyi-00009O-OM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSd-0008EG-15; Mon, 18 Jul 2022 13:23:11 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSa-0001rj-K8; Mon, 18 Jul 2022 13:23:10 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 by10-20020a056830608a00b0061c1ac80e1dso9688454otb.13; 
 Mon, 18 Jul 2022 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjShZqF2n+i2Je+Lh6nH+KX2X9UmoAmzczLnKEfWG+A=;
 b=CKujtZVpem5EyI1Kei2ftud1pVCC5C/XCecel7JMUiVu7zCvc1p+eKQ3MQYxKQT/0L
 P3SrC8z2KaDku9o1m4iWJmmKnlCzkA7XC7Lld2hnstI+VogSMOSF12O96XZNmrbtiF8v
 vpgL3GEPFCzB42WjkEMb+uTdTH/uRozhLzA3k6VNp/5d8VxuGHpTvdb4po62NX3TEuoJ
 A145leaVhXhRM+C0ApOq4wLaPrIrWDULy4FJDdPIR0H6L7XrZNg8z1Zvc2hyeV8R0JZG
 YXct728yRukAFybk8LE7+xiEzmeo78j25cGl5a0ECaybsXWoB/CWxloZXvd3NXQtt1zz
 yHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjShZqF2n+i2Je+Lh6nH+KX2X9UmoAmzczLnKEfWG+A=;
 b=n6h7OdIIPTLJ5fOE6M0IOvGRrebmcZNEmAZ1CgjUTCZDVgAJoAnJU+Pwc6oc+w9jX4
 KaFXhmGC6ZAC3jP5gx3kVFJhTB7aBW302j/0dAaBDWLN3w/rQUU2SUBya0+Gh/YB0MkS
 FydKlQp0nV6TF84u7Mlg1jpqeVK1Q0BwSbHp0V3Um/6SLz1Z5ca3Znjo0F/2CenklpV8
 Eerg/tiRPbr+FT911RscToLfbaXsOgxdb5ym2xZwjcBb+WTKKdIWBd/7WqKBDzgLHVJ+
 MZikfZDe/P9DxSLYbidmaj42ZncaQqRJ7O+aHH5m+YLazXO7M3ZF3EKDbcApT73lH0/u
 23Kw==
X-Gm-Message-State: AJIora/wMKAKqYxo9k5iLeea2ptXq50A+T9d2XrQWW/F6Br5cmVnT50R
 QsIMc4gLiIsnUbMe59nspFnkPVBcMqw=
X-Google-Smtp-Source: AGRyM1vaNfZl2dkdAmbfodpMM3OMmr+ntyFbYczJfdnoT0XwKkTqzt1q7Oau+bkKrrhU0WChKPoQ+g==
X-Received: by 2002:a05:6830:b85:b0:605:4e76:f077 with SMTP id
 a5-20020a0568300b8500b006054e76f077mr11120351otv.211.1658164982978; 
 Mon, 18 Jul 2022 10:23:02 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 20/30] target/ppc: Move slbia to decodetree
Date: Mon, 18 Jul 2022 14:21:58 -0300
Message-Id: <20220718172208.1247624-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Message-Id: <20220701133507.740619-6-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  5 +++++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 17 -----------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index e5e59d1924..c243d9550a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -680,7 +680,7 @@ DEF_HELPER_FLAGS_3(store_slb, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
 DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
-DEF_HELPER_FLAGS_2(slbia, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9df73ce30f..0e214b359c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -146,6 +146,9 @@
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
 
+&X_ih           ih:uint8_t
+@X_ih           ...... .. ih:3 ..... ..... .......... .         &X_ih
+
 &X_rb           rb
 @X_rb           ...... ..... ..... rb:5 .......... .            &X_rb
 
@@ -865,6 +868,8 @@ VMODUQ          000100 ..... ..... ..... 11000001011    @VX
 SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
 SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
+SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index a842fbd6f6..dd2c7e588f 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -101,7 +101,7 @@ void dump_slb(PowerPCCPU *cpu)
 }
 
 #ifdef CONFIG_TCG
-void helper_slbia(CPUPPCState *env, uint32_t ih)
+void helper_SLBIA(CPUPPCState *env, uint32_t ih)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     int starting_entry;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 591b6dc817..4435865388 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5450,22 +5450,6 @@ static void gen_tlbsync(DisasContext *ctx)
 }
 
 #if defined(TARGET_PPC64)
-/* slbia */
-static void gen_slbia(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    uint32_t ih = (ctx->opcode >> 21) & 0x7;
-    TCGv_i32 t0 = tcg_const_i32(ih);
-
-    CHK_SV(ctx);
-
-    gen_helper_slbia(cpu_env, t0);
-    tcg_temp_free_i32(t0);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* slbsync */
 static void gen_slbsync(DisasContext *ctx)
 {
@@ -6869,7 +6853,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
  */
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
-GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
 GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF801, PPC_NONE, PPC2_ISA300),
 #endif
 GEN_HANDLER(eciwx, 0x1F, 0x16, 0x0D, 0x00000001, PPC_EXTERN),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index d699a370f5..c454ce8c7f 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -51,6 +51,20 @@ static bool trans_SLBIEG(DisasContext *ctx, arg_SLBIEG *a)
     return true;
 }
 
+static bool trans_SLBIA(DisasContext *ctx, arg_SLBIA *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SLBI);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIA(cpu_env, tcg_constant_i32(a->ih));
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
 static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
 {
 #if defined(CONFIG_USER_ONLY)
-- 
2.36.1


