Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775733A0C9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:55:23 +0100 (CET)
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAM6-0004Ro-GJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGg-0007vw-0E
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGd-0007Er-BQ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j7so3611529wrd.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b5JSmOY5tI24VF6HR0/6YEBu9VRNCCc/o2zwYA8b8zI=;
 b=o+Am7oaxBRaMTHeJqxAcZIEsYhJckbWVsQA6WX+PDWD0uGuov7AbolP3Xc/3sb9qld
 Qwuxtx3ovCaz4PrAoNmB3QcB9vWAvkXR0AE8zMGf28FBiV8/bYvsdmqS5Gw17rB8s0JK
 9/uF5d13OpDRKiFaZt6OXBivKKfP+g7+0yDUGakAyGHGTk4dzi6fyezVX6yksMzO6S3f
 os4dsQnAO/L4lLPPEIZUoVdKm1KFXrGoF6La8N8IhmSa8M+2w0N+OWutZJy2t160mmI0
 5TtevOa5nisET1MqcQ/ORCiZbwS+EpbGShiRzb/TJaoD2aPk08qtu4U0nkXWakxwq4lk
 eYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b5JSmOY5tI24VF6HR0/6YEBu9VRNCCc/o2zwYA8b8zI=;
 b=J84uCLevH/wT4nJ/CkNMCIA80HSX9wlVLb+pabbppYa0FNBTAQbXE4nH7UvaL8awri
 T+oj/Fg0dSgIVeuvPGqUkzrvTrIYM/FUaQ8I3cOFVWoDY727OIg+Rj1dG2R76QJltSBp
 p3M1T+YdNikPvmp8+FgqThdBC6E3qrMRfgerHI/J3Ig6AxpoW7ausnsX/zOFAMDJ5hL4
 TZnlHayaoympJwz/2CQjABUSbIHqExzQ98wXW/0jJsvux+u0vHg76+VcvyHwrQApDCdT
 nU66OqplQUM4/Xy39e6SieTagVHjSwz8E5Wvsi/WeSb48Aoat1r6mw6p6fFeKjb48+P6
 YrTQ==
X-Gm-Message-State: AOAM533ZrTCiDOCFxmNm+zeFlMStGKRUmNPrTxKNpYM70jM2gAOK3JaH
 cngqgfwM6m2gPOivvdOTKYiuYdM0FSjItQ==
X-Google-Smtp-Source: ABdhPJyX3bzAkhgm4xpFD08nCqIXMupgt7IeSPaCcvD5lsrvu/UlhG+qLy9uV5V5rIa/Y8Q2PcDkFQ==
X-Received: by 2002:a05:6000:221:: with SMTP id
 l1mr19931613wrz.370.1615664981881; 
 Sat, 13 Mar 2021 11:49:41 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s12sm7355839wmj.28.2021.03.13.11.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/27] target/mips: Rename decode_opc_mxu() as decode_ase_mxu()
Date: Sat, 13 Mar 2021 20:48:16 +0100
Message-Id: <20210313194829.2193621-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use "decode_{isa,ase,ext}_$name()" function name pattern for
public decodetree entrypoints.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 17cf608d0bd..5c1909f0ba4 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25779,7 +25779,7 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
+static void decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
@@ -26984,7 +26984,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
                 gen_arith(ctx, OPC_MUL, rd, rs, rt);
             } else {
-                decode_opc_mxu(ctx, ctx->opcode);
+                decode_ase_mxu(ctx, ctx->opcode);
             }
             break;
         }
-- 
2.26.2


