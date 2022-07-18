Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1305788F0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:55:31 +0200 (CEST)
Received: from localhost ([::1]:39824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUxu-0006v1-M4
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSe-0008GE-77; Mon, 18 Jul 2022 13:23:12 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSa-0001rv-Mh; Mon, 18 Jul 2022 13:23:11 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 g19-20020a9d1293000000b0061c7bfda5dfso9361211otg.1; 
 Mon, 18 Jul 2022 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNmrV14lXrTZBlLMXgEh75SGPZ8v7pCcjk424OplMj4=;
 b=dSUKOhmnrtmcq6iVeP2iAlc7FiDjr6MIGyqGrs40DE5Qshb2pU6jO3J78maNpKREe2
 ur7YSzIJv7fzesvp/rpR8WZf7MEXlzGetrNqbgNZCB5V/uxSCtL7AN9ycQMVUTwo3C7I
 8/tp/oElnIx10Eh9xkbsiUiH40ZcdV/XfkzH6cNvFL6pVYn17FJ7jER+gATcFBtUvqPa
 ufqPuPT960yQkbCgkNeQL1/jvJVxOYjw4RR6HZbd6J5JOPERgLIqOBu7AspZfzZ9HsVs
 n9uUjvm9oD3Fe0N8dbVE9IeANsQpta2Oq/nwSzrCdqfrmxeeT+cIwC/d3IpERkPDp79f
 nTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNmrV14lXrTZBlLMXgEh75SGPZ8v7pCcjk424OplMj4=;
 b=2OyVnIoM+GGbnVDJDCMcu8IkWQCgp+Iw7I9ZpW00/f+Gsk9cxwnV4b00jIf6z4yZiN
 zZqeGpY5GPrHreCZfptXnEN3MjIUW3BH7skQEBDQKC+KaD8h6Ka4WXKndj979pLC1/mO
 bahsWyjrawNHCjdLG8CDv0sFic2IzxkDXSR/zD6njSewFHRM1MKKyTk9vSPY2inX8wSZ
 UtmJw1w6bcrXG7ROkWdcfaPJ0b7Kt6g8PHy1im/TyvsX2TPA2nD76MBwvbqbhYn7ZIEE
 tR1MLBGQ2z2TtbWVskX2om1VtJ276ep4d2+wSner51Sw9VK9br+yDc1Sj4TirezeKGHM
 nAcw==
X-Gm-Message-State: AJIora/2syJDjexmyjlOC5sF9ghlsfqzhQPkjP+2GCZN+bzt87TSidXx
 hglbrkpc6nzxLRk7RuC66BNyJwbAiCg=
X-Google-Smtp-Source: AGRyM1u8WEZmUb8mTcP7v8rzYfZh+hcWMhX+JFN+MiYXpqB+X/p4uiBxsGWI+ht/bmUCwKU1SD5vNg==
X-Received: by 2002:a05:6830:6613:b0:61c:acf8:8e41 with SMTP id
 cp19-20020a056830661300b0061cacf88e41mr1084311otb.298.1658164985281; 
 Mon, 18 Jul 2022 10:23:05 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 21/30] target/ppc: Move slbmte to decodetree
Date: Mon, 18 Jul 2022 14:21:59 -0300
Message-Id: <20220718172208.1247624-22-danielhb413@gmail.com>
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
Message-Id: <20220701133507.740619-7-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  2 ++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 14 --------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index c243d9550a..98d6c40ac0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -676,7 +676,7 @@ DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
         env, tl, tl, i32)
-DEF_HELPER_FLAGS_3(store_slb, TCG_CALL_NO_RWG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(SLBMTE, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
 DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0e214b359c..2fc6e9cb27 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -870,6 +870,8 @@ SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
 SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
 
+SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index dd2c7e588f..1922960608 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -309,7 +309,7 @@ static int ppc_find_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
     return 0;
 }
 
-void helper_store_slb(CPUPPCState *env, target_ulong rb, target_ulong rs)
+void helper_SLBMTE(CPUPPCState *env, target_ulong rb, target_ulong rs)
 {
     PowerPCCPU *cpu = env_archcpu(env);
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4435865388..169e97a706 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5351,19 +5351,6 @@ static void gen_mtsrin_64b(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* slbmte */
-static void gen_slbmte(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_store_slb(cpu_env, cpu_gpr[rB(ctx->opcode)],
-                         cpu_gpr[rS(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 static void gen_slbmfee(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
@@ -6841,7 +6828,6 @@ GEN_HANDLER2(mfsrin_64b, "mfsrin", 0x1F, 0x13, 0x14, 0x001F0001,
 GEN_HANDLER2(mtsr_64b, "mtsr", 0x1F, 0x12, 0x06, 0x0010F801, PPC_SEGMENT_64B),
 GEN_HANDLER2(mtsrin_64b, "mtsrin", 0x1F, 0x12, 0x07, 0x001F0001,
              PPC_SEGMENT_64B),
-GEN_HANDLER2(slbmte, "slbmte", 0x1F, 0x12, 0x0C, 0x001F0001, PPC_SEGMENT_64B),
 GEN_HANDLER2(slbmfee, "slbmfee", 0x1F, 0x13, 0x1C, 0x001F0001, PPC_SEGMENT_64B),
 GEN_HANDLER2(slbmfev, "slbmfev", 0x1F, 0x13, 0x1A, 0x001F0001, PPC_SEGMENT_64B),
 GEN_HANDLER2(slbfee_, "slbfee.", 0x1F, 0x13, 0x1E, 0x001F0000, PPC_SEGMENT_64B),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index c454ce8c7f..47d672d29a 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -65,6 +65,20 @@ static bool trans_SLBIA(DisasContext *ctx, arg_SLBIA *a)
     return true;
 }
 
+static bool trans_SLBMTE(DisasContext *ctx, arg_SLBMTE *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SEGMENT_64B);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBMTE(cpu_env, cpu_gpr[a->rb], cpu_gpr[a->rt]);
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


