Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35757326020
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:37:38 +0100 (CET)
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZZ3-00014u-6M
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTa-0004dE-NI
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:59 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTY-0003Ez-Kw
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:58 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s8so10142378edd.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C1aUWGq2Vt/v4Zrq6A6kpo+S8HpvdVbBW/gCNv1EpSk=;
 b=UsKTCs17jlL5Geb9ETkjXKadtyg6uF2hOYiEyf+bm4/MNvH2osvEeGtVYZOGBoFjqU
 bua91bSbi4wmFwcFqR1AwoUxYlnJKzA++Vw63dywK9/eXu7JKrUomUtLcFZzIB0xC8ZV
 7pWCSHN669Xfxj7j7QWD2xrW4ShARiOjImK4RX+Y/uwPvMjEgpHE++jZLpvEkHxALaOB
 KWre4bTD2WUqbRW+lK5UY0nSnEkCHAgvn79pZsrFCut2dkiPRRK9KDCPlBepW6EoezHF
 UM5OWG89bZBsAjiHrZFLZFMAMfKvqsCfy6cw4SGKt5spDy4PqED3ApaVJNybP7JDu6Z0
 JI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C1aUWGq2Vt/v4Zrq6A6kpo+S8HpvdVbBW/gCNv1EpSk=;
 b=SatfCxTeKBVYhJsyrrbHlD+kcl8ktWRxzneP8o2/KDLPPucU30zLtda00s+yYyojcl
 1xN0oXt0dDSRdI8cbaHU3xlkwRX4fDlP9WYZyDn048a5AOfqBBTHsbSGFF2sUoKfI8Y2
 3MWcEPgrCmMPWtWQBAnqw22TN7y0Y2eLtdYusdlw8vt2yVBWljGf3LvWzf3RFqcqj+Pt
 vKtNMJHT452ycghanRRwfKyNNE74PBGT9vu896i8j/ItTTaWm5IO8M/N/X7qeGBYYIPB
 mUZzlmhzx8lriETn79SIzwIryKjJcd2YWdMW/8Ay1Z5KWE9eYh+eS7Rmf1K9h3bc5AuS
 Fa+A==
X-Gm-Message-State: AOAM53009tav5D1P8M4ckebXqh+gXQxwkxE8ADd9fOnkc11iH8Ob/54B
 c0UyJ0G3nzfY/MWGixaOT5CBqMFiaxU=
X-Google-Smtp-Source: ABdhPJwz8U2Wm8rB4DfpObXqifLgqbR8kcB/O9g1dyuJgtK+/v2Zd2mV+j8ts0rScYkBQJrj8FhX5A==
X-Received: by 2002:a05:6402:3075:: with SMTP id
 bs21mr2272504edb.274.1614331915069; 
 Fri, 26 Feb 2021 01:31:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kb13sm4598535ejb.7.2021.02.26.01.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/13] target/mips: Move MUL opcode check from decode_mxu()
 to decode_legacy()
Date: Fri, 26 Feb 2021 10:31:05 +0100
Message-Id: <20210226093111.3865906-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
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

Move the check for MUL opcode from decode_opc_mxu() callee
to decode_opc_legacy() caller, so we can simplify the ifdef'ry
and elide the call in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2d8ddbad112..df4868ebb95 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25783,19 +25783,6 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (MASK_SPECIAL2(insn) == OPC_MUL) {
-        uint32_t  rs, rt, rd, op1;
-
-        rs = extract32(insn, 21, 5);
-        rt = extract32(insn, 16, 5);
-        rd = extract32(insn, 11, 5);
-        op1 = MASK_SPECIAL2(insn);
-
-        gen_arith(ctx, op1, rd, rs, rt);
-
-        return;
-    }
-
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
         return;
@@ -26994,7 +26981,11 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(ctx, ctx->opcode);
+            if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
+                gen_arith(ctx, OPC_MUL, rd, rs, rt);
+            } else {
+                decode_opc_mxu(ctx, ctx->opcode);
+            }
             break;
         }
 #endif
-- 
2.26.2


