Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1E569444
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:24:32 +0200 (CEST)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CVa-00033p-Q6
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BME-0000fL-L4; Wed, 06 Jul 2022 16:10:49 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:37818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMC-0003c5-3F; Wed, 06 Jul 2022 16:10:46 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id o13so16218738vsn.4;
 Wed, 06 Jul 2022 13:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wk74dRBm65YejOCfioaKaDaYvcy0g5QyLNJ/DLHUEao=;
 b=fqRJCSSvSlwKhasqfd3mr5sIL7/mFHMUfHLJfq/c/1kkVgsvGa/Tu2QzT3DxLtA+AZ
 J3LQl/koyiaJBOwH28UM1qRrqSX/5q9w/2j/1eZk4NibXMUqq94gWfHTHerwOiePqdra
 AT+Dz4dgZNSLKlnWq/iar3oGiRgYj7mXuQ+F5WOKsuUMtmPL22KqAa4pGw6zAThQcnAD
 QIEhS31DknIErk8h9I3LMl7inSeCNHHziWcf6X7IggcaVMfkkHoEUOE3VaaDtyZ6SCVV
 APThVzHHcSFGlR6p+Ad+WWZ2mZQTxJKhrRllaMYniQBymf6SrRiORbhkrM62xpp6RW6r
 C0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wk74dRBm65YejOCfioaKaDaYvcy0g5QyLNJ/DLHUEao=;
 b=NsEH0qolmc3tGzmmHJuQMhxJxghX8ZvsKbzukZJz37oUjdXz9c1W0DIFGVzK7k1YfG
 ZLJlyZkOSXkH4Uc5U8/Mi6uXi5JUpiFQP2BxoqGsogLToNdX8Ku6CS615L+sP6tnDjSg
 dZJqx1lh4jcBVW8X5qbKrRLHTatlR0/kWTUE5/VZzChtGDB2lNhOJDThmtC615HY5z+7
 BA1Hj7eL8fQT81KTx6F6YTg716km1WAPEVqNt0vnL+GtaLrvbBmoQ9dYkUBs6I6sQFPI
 RlyRNiCg4vivw7sKgO0sSZCkDh8+qGvZr3o35iuLuuwTYPusMQBpihfm9u9IzozoRCVx
 UyEA==
X-Gm-Message-State: AJIora+96B52oNEJF6YXVuoVbRJdU+4mjmZVhm+mXlDJXurqCrWbtJJH
 KXkBGOCexXeedDiO4ZnbcIUkfSIHGro=
X-Google-Smtp-Source: AGRyM1s/QPk1BqT12CbA64JT++j2MqTG9JQrWWeIfWy16/YNRljwnRHVPfyjHKmpUrpMResFQ8GHuQ==
X-Received: by 2002:a67:fbc2:0:b0:356:fd6b:8d09 with SMTP id
 o2-20020a67fbc2000000b00356fd6b8d09mr5772541vsr.45.1657138242220; 
 Wed, 06 Jul 2022 13:10:42 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 26/34] target/ppc: Implement mffscdrn[i] instructions
Date: Wed,  6 Jul 2022 17:09:38 -0300
Message-Id: <20220706200946.471114-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220629162904.105060-7-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  5 ++++
 target/ppc/translate/fp-impl.c.inc | 41 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7d219f000f..e5770bcc16 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -133,6 +133,9 @@
 &X_imm2         rt imm
 @X_imm2         ...... rt:5 ..... ... imm:2 .......... .        &X_imm2
 
+&X_imm3         rt imm
+@X_imm3         ...... rt:5 ..... .. imm:3 .......... .         &X_imm3
+
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
 @X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 xt=%x_xt
@@ -348,7 +351,9 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
 MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
 
 ### Decimal Floating-Point Arithmetic Instructions
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d6231358f8..319513d001 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -696,6 +696,27 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
     return true;
 }
 
+static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
+{
+    TCGv_i64 t1, fpscr;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
+
+    t1 = tcg_temp_new_i64();
+    get_fpr(t1, a->rb);
+    tcg_gen_andi_i64(t1, t1, FP_DRN);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_DRN, t1, 0x0100);
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
     TCGv_i64 t1, fpscr;
@@ -716,6 +737,26 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
     return true;
 }
 
+static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
+{
+    TCGv_i64 t1, fpscr;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
+
+    t1 = tcg_temp_new_i64();
+    tcg_gen_movi_i64(t1, (uint64_t)a->imm << FPSCR_DRN0);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_DRN, t1, 0x0100);
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
-- 
2.36.1


