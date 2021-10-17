Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3A430CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:58:13 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF6a-00033E-5k
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1o-0003Q1-Ah
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1m-00006B-Kw
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 y16-20020a05600c17d000b0030db7a51ee2so4950287wmo.0
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWW6jaAc1xuKmuHwt0Vz/fW3KIsJVwuG8QDNEQr3f7g=;
 b=RZSODLe+syIUlFYLRz+oPdliMxQcyA5tQ4bFBkXNGhgw/jPeqU6pwm5ZakSBDSza4/
 kFunzYPh0bJNeTSX0rJzAp5c6jxV+bSQx4w1HKHAYFkBQDtFsl7JOAKQE5kNhBW/TIx2
 WmJcJebIDcxAEKeB4xS0RLzBGa7POAF9FM5fcobvB68aLGYhxTDPLVQmeV2uuvkkFxLf
 cVe6eD/0lIgfSDDlVSG7A8yI4EEcYaMztftqDUi9bCtRHxHIr0WJrOrxkBRb20cRP6p2
 nh2XBGs7muIgM3osmh8uDzxJS5xhjpmq3aqpp6I/rnDsp5Mge5IqSF/ilbW3EN24Id9E
 TjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qWW6jaAc1xuKmuHwt0Vz/fW3KIsJVwuG8QDNEQr3f7g=;
 b=q+I25quC2/a5aNAr1QwbqO9qOlJ8K5hDw0cTIMpUJXgr0efvJKQ7lQ4xpxUcVz1b30
 6xTPeRs/NeN3DjwteUNyvQCHfEkCioG013XLXC5nN+C6PzhHtA0UhMsAMF303W39uytV
 6v3lBZDXK4FeHPb0SuFehvJ/ZikY8eE0EZ/XwBwIq7jZCKkoY2uuorMq1jg6C4nZ9ZHt
 5CAjzb+6qNQKMiFRUq6+39hQ9PbWvDXcoJFy9C4IHc5KxmKJ3HMayDtbISi2VNVyLOnz
 51gR/vL42/1/NFX11hOwEmZ1ojDLsNk/KrpOI6329/gcAlUTtvd7CqulxVzqM82BoeFQ
 G2Aw==
X-Gm-Message-State: AOAM532DdBNYf5jL70l9lcEfoKpYWWhBa79o7dE7w/m3HV8VAA0xhC8w
 I7pxNWlZV7u4nbX6hIq8uEFLCPgkzE0=
X-Google-Smtp-Source: ABdhPJxUreoZ8svBH9LF6ksCA/G1iZdAsrk8Wlhv6qxsUnzQlesUt/xFinaqvD+d0xM86LRlIpBdVw==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr27633481wmk.22.1634511193075; 
 Sun, 17 Oct 2021 15:53:13 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z6sm11193001wro.25.2021.10.17.15.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] target/mips: Remove unused register from MSA 2R/2RF
 instruction format
Date: Mon, 18 Oct 2021 00:52:33 +0200
Message-Id: <20211017225245.2618892-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commits cbe50b9a8e7 ("target-mips: add MSA VEC/2R format instructions")
and 3bdeb68866e ("target-mips: add MSA 2RF format instructions") added
the MSA 2R/2RF instructions. However these instructions don't use any
target vector register, so remove the unused TCG temporaries.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211003175743.3738710-2-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 8170a8df26b..ee6424126f7 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1942,13 +1942,11 @@ static void gen_msa_2r(DisasContext *ctx)
 {
 #define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0x7 << 18)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
     uint8_t wd = (ctx->opcode >> 6) & 0x1f;
     uint8_t df = (ctx->opcode >> 16) & 0x3;
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
     TCGv_i32 tdf = tcg_const_i32(df);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
@@ -2018,7 +2016,6 @@ static void gen_msa_2r(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
     tcg_temp_free_i32(tdf);
 }
 
@@ -2026,13 +2023,11 @@ static void gen_msa_2rf(DisasContext *ctx)
 {
 #define MASK_MSA_2RF(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0xf << 17)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
     uint8_t wd = (ctx->opcode >> 6) & 0x1f;
     uint8_t df = (ctx->opcode >> 16) & 0x1;
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
     /* adjust df value for floating-point instruction */
     TCGv_i32 tdf = tcg_const_i32(df + 2);
 
@@ -2089,7 +2084,6 @@ static void gen_msa_2rf(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
     tcg_temp_free_i32(tdf);
 }
 
-- 
2.31.1


