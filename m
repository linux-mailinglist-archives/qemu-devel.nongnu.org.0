Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66C557888C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:36:23 +0200 (CEST)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUfO-0003G3-LE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSB-0007qj-R2; Mon, 18 Jul 2022 13:22:45 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS7-0001np-Sc; Mon, 18 Jul 2022 13:22:43 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10c0430e27dso25533150fac.4; 
 Mon, 18 Jul 2022 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLFxcjQN2SbHaIgjOt/ARXomHBw7Avrk1GienFRJ37M=;
 b=EjDRMhhIXYNjr2CSrK0XL23EjTKEtcBYcWom90VRYaz5zZC82ASYRDXV5MsI8gD79p
 Lb0xVeUiKVoynPfEzPvdr4F8K4SjHWeBow3Yp3Sc90DD1LR6/uaFLvvC62UZwmgGRd6t
 8vQNQDMzyg4A/GyZTxlstmYUaAVMPZbq1vTJ/E0PZlaxzDqe3N4OTFbjNhqi3II0Li2e
 wRWvuX8fvbYMx57sbRsPtejdquvlZ7X14G51+xnSDVj4LcFgztsBOY0skf2/fEte4rBO
 8Uk6Xl5WT0LlX4pDZzu917RVbsVCdGQQzbZeWwlvd+u6LdUV4sMcts4OTfF2s2KXcQZ/
 0p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLFxcjQN2SbHaIgjOt/ARXomHBw7Avrk1GienFRJ37M=;
 b=nbt4O0nD7Rs7OHelbJ2F1z3Qq+OThf/dvyz7Q3za72No1F77G9W+4vTK6Q46NFVgeq
 t6iIsABrpdXm6RnkvtDlCm2QmZeqgqypFFd8DcC6siQ6pklDGt//l/THCZwii3BcYpj+
 kKSni3DlW3eyB0IPmHjDSjO/WoHpNiAi3TLbgaI0HdshfbjufOSQPHMiwJYfaOZFcVGc
 Vvu90pLue/SUhIRgtPx0zB2Fw7+ziuVt4w+ZJdq7hLgGA1NkxEzjejP6ETHJdVfV0PGB
 RyaVnd8W3eKvdpaLp5ihqkFsY/H1wP8f6xVSlDcijxKOLWOm9CgT7hQNVLH44pA/F0hO
 ChLQ==
X-Gm-Message-State: AJIora9t/Bm3VGvpOepSO+HwPFBeqmRnFy/5OV70Liazj59Rq/Yj8ati
 5Zj0rkulHS7Bf6b6vAAANjLfq5EbGtw=
X-Google-Smtp-Source: AGRyM1tr4je4QDzzzOoKt3QQI3uUNI92HgUi+ecXc+3CZ7a2WvFuyDHEO6zSjsFXO045sSW2Rh6gRA==
X-Received: by 2002:a05:6870:b292:b0:10c:8b96:ed3d with SMTP id
 c18-20020a056870b29200b0010c8b96ed3dmr15788539oao.171.1658164957928; 
 Mon, 18 Jul 2022 10:22:37 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 10/30] target/ppc: remove mfdcrux and mtdcrux
Date: Mon, 18 Jul 2022 14:21:48 -0300
Message-Id: <20220718172208.1247624-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The only PowerPC implementations with these insns were the 460 and 460F,
which had their definitions removed in [1].

[1] 7ff26aa6c657 ("target/ppc: Remove unused PPC 460 and 460F definitions")

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220627141104.669152-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h       |  6 ++----
 target/ppc/translate.c | 18 ------------------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9b8d001f1c..a4c893cfad 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2214,8 +2214,6 @@ enum {
     PPC_DCR            = 0x1000000000000000ULL,
     /* DCR extended accesse                                                  */
     PPC_DCRX           = 0x2000000000000000ULL,
-    /* user-mode DCR access, implemented in PowerPC 460                      */
-    PPC_DCRUX          = 0x4000000000000000ULL,
     /* popcntw and popcntd instructions                                      */
     PPC_POPCNTWD       = 0x8000000000000000ULL,
 
@@ -2239,8 +2237,8 @@ enum {
                         | PPC_405_MAC | PPC_440_SPEC | PPC_BOOKE \
                         | PPC_MFAPIDI | PPC_TLBIVA | PPC_TLBIVAX \
                         | PPC_4xx_COMMON | PPC_40x_ICBT | PPC_RFMCI \
-                        | PPC_RFDI | PPC_DCR | PPC_DCRX | PPC_DCRUX \
-                        | PPC_POPCNTWD | PPC_CILDST)
+                        | PPC_RFDI | PPC_DCR | PPC_DCRX | PPC_POPCNTWD \
+                        | PPC_CILDST)
 
     /* extended type values */
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d7e5670c20..30dd524959 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5907,22 +5907,6 @@ static void gen_mtdcrx(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* mfdcrux (PPC 460) : user-mode access to DCR */
-static void gen_mfdcrux(DisasContext *ctx)
-{
-    gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env,
-                        cpu_gpr[rA(ctx->opcode)]);
-    /* Note: Rc update flag set leads to undefined state of Rc0 */
-}
-
-/* mtdcrux (PPC 460) : user-mode access to DCR */
-static void gen_mtdcrux(DisasContext *ctx)
-{
-    gen_helper_store_dcr(cpu_env, cpu_gpr[rA(ctx->opcode)],
-                         cpu_gpr[rS(ctx->opcode)]);
-    /* Note: Rc update flag set leads to undefined state of Rc0 */
-}
-
 /* dccci */
 static void gen_dccci(DisasContext *ctx)
 {
@@ -6958,8 +6942,6 @@ GEN_HANDLER(mfdcr, 0x1F, 0x03, 0x0A, 0x00000001, PPC_DCR),
 GEN_HANDLER(mtdcr, 0x1F, 0x03, 0x0E, 0x00000001, PPC_DCR),
 GEN_HANDLER(mfdcrx, 0x1F, 0x03, 0x08, 0x00000000, PPC_DCRX),
 GEN_HANDLER(mtdcrx, 0x1F, 0x03, 0x0C, 0x00000000, PPC_DCRX),
-GEN_HANDLER(mfdcrux, 0x1F, 0x03, 0x09, 0x00000000, PPC_DCRUX),
-GEN_HANDLER(mtdcrux, 0x1F, 0x03, 0x0D, 0x00000000, PPC_DCRUX),
 GEN_HANDLER(dccci, 0x1F, 0x06, 0x0E, 0x03E00001, PPC_4xx_COMMON),
 GEN_HANDLER(dcread, 0x1F, 0x06, 0x0F, 0x00000001, PPC_4xx_COMMON),
 GEN_HANDLER2(icbt_40x, "icbt", 0x1F, 0x06, 0x08, 0x03E00001, PPC_40x_ICBT),
-- 
2.36.1


