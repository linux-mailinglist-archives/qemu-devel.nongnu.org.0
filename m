Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D842032D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:00:01 +0200 (CEST)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5mK-0004do-6b
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kH-0002YN-Vj
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:57:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kF-0003GQ-Kp
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:57:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 g198-20020a1c20cf000000b0030d60cd7fd6so2730888wmg.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l/rdeP+spIdDQqIh+wJEBCFICiFkl7U81t6jAZeqrt0=;
 b=IVyerHTT0VCQqvddoVXjqHnagM4Pd0Se+ZDSmQ3DyD9994+zWYKzdacsrXpbUI5Thk
 r2I2jrNCcYQ4yv+otw/sZBnw+9h8VIYj6xvIIiLQBTX49wqJ9AOSQxvzRTsp9Gbx/W10
 JnM80W6B1xE2d7CrBMKjI7BkANanx52Q9RV78qn/EXViOiRff37VrBe1LYbK3dK28W49
 FJo6VYr35oDMR6jEDUxYBwXQB1rq23fZnmjJ6SwxfEFKd9RFpuAH5rJTxEEBzvpAKz5L
 9qihwGrBmQUZw9VDkJwJNBSaHDbUGB9eD/cWuD0gK727wW9I7l2Ibs4aMWCHiu1GHC88
 L97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l/rdeP+spIdDQqIh+wJEBCFICiFkl7U81t6jAZeqrt0=;
 b=F/DD8HuJVYn3JWyd2CmKq2ZqsJ50cU3mzHK7aGkgTYPUkAls+K+VIi7Mscn5AirYOu
 18GikOCHq4PFVo1g6PIwypMslwVce4XZvRQUOW9LmGTF/sZSJDefAhwhJLY3Rw00Jov4
 atGnWHIeOH7CAnrt+KRObYqNJ9e6+hyXucwWGJvBBu7qg663KMuAPFZxjYCnFR6i+ibv
 W3vOW4w0H5SmxQORBdvMsPmS42eWULKYH8/AEtazcmBIWmiuXbIv5m0JPjIhqXfyxjCF
 qDVMSGzCDobfOadfTCRAEEbhobHvgD3vW7Ji8pJEmVvt6/TxQP/AdKaqJtrKgIj+rMOh
 ZDIw==
X-Gm-Message-State: AOAM532N/z16aI9Vj4K9iibmdcStHdDczZYe1gFffTFgx8fUUG2h7A1l
 n73unSL/SlRBUZ/xFRBMBWbkNutlUFs=
X-Google-Smtp-Source: ABdhPJwobKwnGAaDESJAVMFn9/4BTR2DuQBOsm48oMFxGb3fG0/WN2bolX2PfusiIJ0zienHkw/c9Q==
X-Received: by 2002:a7b:c307:: with SMTP id k7mr12706920wmj.170.1633283869861; 
 Sun, 03 Oct 2021 10:57:49 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z12sm12230540wrv.31.2021.10.03.10.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:57:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/mips: Remove unused register from MSA 2R/2RF
 instruction format
Date: Sun,  3 Oct 2021 19:57:36 +0200
Message-Id: <20211003175743.3738710-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commits cbe50b9a8e7 ("target-mips: add MSA VEC/2R format instructions")
and 3bdeb68866e ("target-mips: add MSA 2RF format instructions") added
the MSA 2R/2RF instructions. However these instructions don't use any
target vector register, so remove the unused TCG temporaries.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Reworded, removing the Fixes: tag.
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


