Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EE326061
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:44:32 +0100 (CET)
Received: from localhost ([::1]:60412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZfj-00018w-3q
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTf-0004jm-3g
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:03 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTd-0003I9-Ko
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:32:02 -0500
Received: by mail-ed1-x52c.google.com with SMTP id g3so10098176edb.11
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ndNHIjd6TF9c5nxg85XBUljhFy/CTklP1ztSI8OoV5Q=;
 b=lTaJoTgs4nIEe0/30Pw5Z5c/zqamgLcV5QK2qKx0xmD/I4oIgaWaeFj5T97VTJYC7L
 YH6Vsmij5y4VkcDsoz6+wVLbqkt5cUwV1sa1E8VE4kTACgjZb3aFBshcpdeiWyoyjQVV
 72+6lLO7YZk6kyyd56RgwC80z3S1kPUxDYwfdPPRmUAR3kXL/5mmVw9Jg4ALjrQ0pSzA
 Ojfw2jssGghRNGDUNBis1vMf1vhtrFj7FIvgUFtbLj9gR4lzna1mxsp3wOkeSIqUBjeB
 htJbfnWoM2R7L080+asfnkQij5Jw4v++7Z4spdRjwnKwojYYdTGpJaYfV+vKHXCa2t49
 E49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ndNHIjd6TF9c5nxg85XBUljhFy/CTklP1ztSI8OoV5Q=;
 b=rB3tgyd9yprEuExBV+bHs8Qbt2LWZvRJIweDuh4vh9i/bQOnOHFRo+IhQLtVNPpczo
 f48A2Si0QewTiNRil5YJn1Vrm4jlFDMSlFKlQWAALDqxvKJMCQPxZK7LZotiB8diQl3I
 zbGBO4saApjOMLD3v0y/tU2GUzemRdyaetNQxQYCV1oPh1PVd8UXybiciIkMYykdZsvT
 6iklk/iRtrEPaI6NQ2FLCVK4OVW22i5lfnS7XP2Y226BIFt2pijqMdBOq4jF894scdSw
 ZppgK/HyivVT3uqnd7CmrXjR0Hkvi12E6nu54PVN1Ic5jQkVJUesWbvgV/elhTIr5sns
 eXOw==
X-Gm-Message-State: AOAM533ka790swSLo/pCFQXfUiLwJ0Gobx5R02jTzUw3e8J+nbBoN+MK
 5VgIqBVbvyz/fW60alwxvBx/TB9dXQs=
X-Google-Smtp-Source: ABdhPJy5sCIXl33U3Mis1CESonNouknvW3F6KXPQ2Pu6lU9buGZYsrJd7wB/0fHP3a7fOUK1kO4DDg==
X-Received: by 2002:a05:6402:50c6:: with SMTP id
 h6mr2240711edb.117.1614331920163; 
 Fri, 26 Feb 2021 01:32:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q11sm4821837ejr.36.2021.02.26.01.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/13] target/mips: Rename decode_opc_mxu() as
 decode_ase_mxu()
Date: Fri, 26 Feb 2021 10:31:06 +0100
Message-Id: <20210226093111.3865906-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index df4868ebb95..afdb42a3dd4 100644
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


