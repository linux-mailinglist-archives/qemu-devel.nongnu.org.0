Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A10578900
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:57:34 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUzt-0001Lu-QF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSu-0008Tt-L9; Mon, 18 Jul 2022 13:23:34 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:42505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSr-0001uH-Jx; Mon, 18 Jul 2022 13:23:28 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 k25-20020a056830169900b0061c6f68f451so9702467otr.9; 
 Mon, 18 Jul 2022 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Sgj+wP7my0Z/goW9hRxD8U0CXqln5HpAVJwAYRmxrE=;
 b=B+3k8y257GnuRszduSCoU7hjoWrHtzVK6Tp/fCzn0pco+D6H4gD1JGlN/goxPM0fAr
 UaSzV+Ywy7o7Jdeuywww4esXfjP4ebhu0bV7phuoKEj38g2+sNpgzMwSZ5qSCjbxFIWM
 jqU7tRvRoqtALp9jVYB7NMFr4yTDJDOQHnKay5+FkgCVhZz2M3CIqw2qz3IS6657YK0y
 tVEH81MMD1Cc3TxB1NvzT+kfvNo2cYc2U1Gr5roN661E7rc3UmMB6Qxk+WWL51yvGxVy
 /ouyDqZobb94FIKCiqvAY0BxTlj4OGtcDCCCWxuYAwH27X6eEedn39MRMb7YEA9keIXg
 6inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Sgj+wP7my0Z/goW9hRxD8U0CXqln5HpAVJwAYRmxrE=;
 b=M9Y2OtaV1GaOhBj53k8HMAQebWdZ65dAIKduEDt8ZKRZPmesAQ2X3itra1d2Kl1jCK
 n+4nBq8ubwN3ZccOFSEyzKW7jBONI9OvnEZsIF90mfWiAK6vQ91ZMFHJPiLezZ7+BU+J
 mnigX8Cv0dZ4/EGTADaP7m+2FOCKoGQUum6kif7t9rOnDhOiyyUXCJfKzSSa32YJRXiX
 6fR1uCCHKGdbYxQLEjoUZdsecFXjKhKjKpauESWh0ro2XkuKs8ScaLFJVTjqQ9xC4/yd
 rKNr8mSlGEHX0zcXX8mjC+pXhy6eh6TFrsNFtq2gS+rGl2lygMRh5Sc8sk4+C1KAcDiz
 TqSQ==
X-Gm-Message-State: AJIora/bePoyiXmKMWiPcGdKYbHmGNSO8WjwuhWlD61prCjjJFQW9z7H
 p9CbyM2JsgxDbbU8/k7KsdIh7UzUOPw=
X-Google-Smtp-Source: AGRyM1ufaiz/jIg6lxdlJ30NSTbWqa/J4G8Lj7PQZY0bipcdtC2f9ij1vP0ACs1C5WR+L9uy3h5U8A==
X-Received: by 2002:a05:6830:61cd:b0:618:d560:b787 with SMTP id
 cc13-20020a05683061cd00b00618d560b787mr11946675otb.154.1658164995549; 
 Mon, 18 Jul 2022 10:23:15 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 25/30] target/ppc: Move slbsync to decodetree
Date: Mon, 18 Jul 2022 14:22:03 -0300
Message-Id: <20220718172208.1247624-26-danielhb413@gmail.com>
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
Message-Id: <20220701133507.740619-11-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode                     |  2 ++
 target/ppc/translate.c                       | 17 -----------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5049c98691..781051e993 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -877,6 +877,8 @@ SLBMFEE         011111 ..... ----- ..... 1110010011 -   @X_tb
 
 SLBFEE          011111 ..... ----- ..... 1111010011 1   @X_tb
 
+SLBSYNC         011111 ----- ----- ----- 0101010010 -
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d7a785164b..5a18ee577f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5388,20 +5388,6 @@ static void gen_tlbsync(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-#if defined(TARGET_PPC64)
-/* slbsync */
-static void gen_slbsync(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-    gen_check_tlb_flush(ctx, true);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-#endif  /* defined(TARGET_PPC64) */
-
 /***                              External control                         ***/
 /* Optional: */
 
@@ -6787,9 +6773,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
  * different ISA versions
  */
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
-#if defined(TARGET_PPC64)
-GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF801, PPC_NONE, PPC2_ISA300),
-#endif
 GEN_HANDLER(eciwx, 0x1F, 0x16, 0x0D, 0x00000001, PPC_EXTERN),
 GEN_HANDLER(ecowx, 0x1F, 0x16, 0x09, 0x00000001, PPC_EXTERN),
 GEN_HANDLER2(tlbld_6xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_6xx_TLB),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index d7e2bb185f..5c569a3c75 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -141,6 +141,20 @@ static bool trans_SLBFEE(DisasContext *ctx, arg_SLBFEE *a)
     return true;
 }
 
+static bool trans_SLBSYNC(DisasContext *ctx, arg_SLBSYNC *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_check_tlb_flush(ctx, true);
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


