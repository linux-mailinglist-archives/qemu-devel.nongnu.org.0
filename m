Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEAA578887
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:35:10 +0200 (CEST)
Received: from localhost ([::1]:55522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUeD-0001M5-7i
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSd-0008Ex-53; Mon, 18 Jul 2022 13:23:11 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSa-0001iF-NL; Mon, 18 Jul 2022 13:23:10 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so9715790otu.4; 
 Mon, 18 Jul 2022 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6SEOpqb8davCwSRBuqykmOmBKMno39IJNk4PyJJUgg=;
 b=Fdh8RRC0uKr+Hln9plF8D5g/yxuCK1HE79IGsxGBQXhM+I10jvZfN6vp0U/aAN8Rfk
 a5N9SM6uOUPEOJAQloU/yKH7IXOwgk78YvlkQGkay6VkTWR8elJVklhY+Sn+fhOQ65M/
 axWgPdB0dUx1X1GrnHs4etNsPeZ5C9oT8kjb4pnJGDIrh1XDDInmfqpZVHLSUyR6XlSO
 P8OGLGdF4gKoxpZXvHS0e+SFO1O0oLg5dN1EyD0Xep0XOrpCNLg5+H+o7lfBJkvvrO7B
 npwhygEfGHj/wBNHuJ4We0jYtKMZafT1eoCfkAqPth88QLU8vZDwDXiNuX/5yDJ7P0Ez
 i+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6SEOpqb8davCwSRBuqykmOmBKMno39IJNk4PyJJUgg=;
 b=xNnV1noi8TSl8IkjMq5o5+9RktGv6ntBBdSAbX2tKEF0nDBU5SE69Sxsf7wRFGvPKn
 aKE2MN4NTpL6w3Xc+TSGXLHnUWZdMvK0pBXPFBN/lqy+m7iJ2/ror3KmFVVnMHEJGaC+
 KdYFvONHHIFCSx6kciwGDo36XlAEGN8ltbfFvF7VqvJTeq0iyRWJV3XRMyB9Ad5vOUOm
 rCjzIsdubm3clEtqyfif6JfKjZK1X6Vj6BHmIGAiMAbsADyQsZWhacUSRhkUjfWDIX6O
 fHfOvbEduIL6P/2nPzO7WAQ1uTb5bpCeG+gKsT11ZHqKBx1IVUj8jWL+GV5d/laT8L2H
 Zv2w==
X-Gm-Message-State: AJIora9O6WyURTibwUPq15f4rKoU09SHQnC8XbeDPAk/YOYdpVyuuI4b
 u1fGMwaA9wJIGTlVvBBnoOQfijXRGuM=
X-Google-Smtp-Source: AGRyM1stEOHDPHBvO17UK88F9agwCyopEK9LgHh+uJ1dHtiucURjQQDnkYcxfYd1mW/XyFTpXntOfw==
X-Received: by 2002:a9d:2663:0:b0:61c:7ef9:c117 with SMTP id
 a90-20020a9d2663000000b0061c7ef9c117mr8426451otb.170.1658164978030; 
 Mon, 18 Jul 2022 10:22:58 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 18/30] target/ppc: Move slbie to decodetree
Date: Mon, 18 Jul 2022 14:21:56 -0300
Message-Id: <20220718172208.1247624-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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
Message-Id: <20220701133507.740619-4-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  7 +++++++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 13 -------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 294ef1396b..7c93037257 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -681,7 +681,7 @@ DEF_HELPER_2(load_slb_esid, tl, env, tl)
 DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(slbia, TCG_CALL_NO_RWG, void, env, i32)
-DEF_HELPER_FLAGS_2(slbie, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(slbieg, TCG_CALL_NO_RWG, void, env, tl)
 #endif
 DEF_HELPER_FLAGS_2(load_sr, TCG_CALL_NO_RWG, tl, env, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 092e01113f..0fe6c33805 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -146,6 +146,9 @@
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
 
+&X_rb           rb
+@X_rb           ...... ..... ..... rb:5 .......... .            &X_rb
+
 &X_uim5         xt uim:uint8_t
 @X_uim5         ...... ..... ..... uim:5 .......... .           &X_uim5 xt=%x_xt
 
@@ -857,6 +860,10 @@ VMODUD          000100 ..... ..... ..... 11011001011    @VX
 VMODSQ          000100 ..... ..... ..... 11100001011    @VX
 VMODUQ          000100 ..... ..... ..... 11000001011    @VX
 
+## SLB Management Instructions
+
+SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index da9fe99ff8..03f71a82ec 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -197,7 +197,7 @@ static void __helper_slbie(CPUPPCState *env, target_ulong addr,
     }
 }
 
-void helper_slbie(CPUPPCState *env, target_ulong addr)
+void helper_SLBIE(CPUPPCState *env, target_ulong addr)
 {
     __helper_slbie(env, addr, false);
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e373c39fc8..244eefd965 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5466,18 +5466,6 @@ static void gen_slbia(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* slbie */
-static void gen_slbie(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_slbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* slbieg */
 static void gen_slbieg(DisasContext *ctx)
 {
@@ -6894,7 +6882,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
-GEN_HANDLER(slbie, 0x1F, 0x12, 0x0D, 0x03FF0001, PPC_SLBI),
 GEN_HANDLER_E(slbieg, 0x1F, 0x12, 0x0E, 0x001F0001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF801, PPC_NONE, PPC2_ISA300),
 #endif
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 467c390888..3fa64be067 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -23,6 +23,20 @@
 
 #include "mmu-book3s-v3.h"
 
+static bool trans_SLBIE(DisasContext *ctx, arg_SLBIE *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SLBI);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIE(cpu_env, cpu_gpr[a->rb]);
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


