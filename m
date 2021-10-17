Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C941430CD1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:03:40 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFBr-00014l-Go
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2Q-0004v6-Vg
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2P-0000ca-FL
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3094581wmc.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5ecwZIjQPcMPlzfLcDdSG9JAyAH90tSzn0afe0CfSU=;
 b=B0sC1bdFDafsOKiyBTmDdm9zG6voIEC3p2b71eebdmhHzwZB4dfH1lrTSFVisFehql
 hNo0TKCUuv+1ehp0AI9XnjCPV2bSs+bZ2nHcWubzGjTdPAl8Nel2tn5SixHOxbQ+d9FD
 HbfICIzbAwfDLUvoRR8f7i3Sbqf522tZ9K9dYB0kaC4Kgp0hvsxHMx5koNbPpTqn13fY
 WGGclx36o6EBoMkqJMvDSMNegEr1s8SZplrT1QkgYut5r8Z6hYniW5pDEFN6qEcb61GK
 HQirJ4iHGrpk2/AkZa/NTEBKxk/Xl7TzLRF0xS3IOlgu1HtVE9BVbzke7+uzwHauW7jD
 uB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V5ecwZIjQPcMPlzfLcDdSG9JAyAH90tSzn0afe0CfSU=;
 b=eTLA5D5Jq7Kn+PMrHnLfmBfsI2Y1OJfDBtABNVDIJHhLG5/4R3Tt7AL9TMiaGQgpXm
 79WseSierk097gwJZDequU2k8Q59qoP5SRCkzYSdUBec3zntE3TefOKoxemTFMhMLLgp
 HY2oKoNSX7J9mAF658dcPvGmylU0FQCcXyydwRHJVLxnje1VvoDd+M/eKqi1XKTo2ceg
 0M62TQrocfcmXgesKqv2swB6hpxS43DYEj0A6r3QrMOXaOIDK8TgMnd9NtW9VKc3Rnrt
 CNmhiz5eKGnhmJeLdoCXgCWzamt75IDT7dTMLu5UomysaQsr+U4hdZuGisudZ6/fkoLu
 5BIg==
X-Gm-Message-State: AOAM530+JZ47gIB7HeLR0Q4vgfOLH3D0H0VEh1FcPcVpfNwfOU9FHYSp
 zkUK8JLaDzsEynH9Q6PmWM9OthvLp3g=
X-Google-Smtp-Source: ABdhPJzvONWNmHBldQ5b1SBDJKHVPma3Mz06TFfFfwc9YPXMNo2yEp54ZJKC93x0jCNGBYuHBpuvzw==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr27737476wmc.94.1634511231893; 
 Sun, 17 Oct 2021 15:53:51 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id p18sm10303859wmq.4.2021.10.17.15.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] target/mips: Remove unused TCG temporary in
 gen_mipsdsp_accinsn()
Date: Mon, 18 Oct 2021 00:52:41 +0200
Message-Id: <20211017225245.2618892-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

Since gen_mipsdsp_accinsn() got added in commit b53371ed5d4
("target-mips: Add ASE DSP accumulator instructions"), the
'v2_t' TCG temporary has never been used. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211014224551.2204949-1-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 519b00121f6..47db35d7dd9 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13616,7 +13616,6 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
     TCGv t0;
     TCGv t1;
     TCGv v1_t;
-    TCGv v2_t;
     int16_t imm;
 
     if ((ret == 0) && (check_ret == 1)) {
@@ -13627,10 +13626,8 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
     t0 = tcg_temp_new();
     t1 = tcg_temp_new();
     v1_t = tcg_temp_new();
-    v2_t = tcg_temp_new();
 
     gen_load_gpr(v1_t, v1);
-    gen_load_gpr(v2_t, v2);
 
     switch (op1) {
     case OPC_EXTR_W_DSP:
@@ -13830,7 +13827,6 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
     tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 /* End MIPSDSP functions. */
-- 
2.31.1


