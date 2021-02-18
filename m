Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6331F326
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:38:03 +0100 (CET)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsry-0000LC-F8
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjI-0007ZU-J7
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:29:06 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsjG-00038P-A3
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:29:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l12so4799653wry.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oylI3wFZAxZOnCSrB2Lv4VednOQz6GcXzyENdSLrLcw=;
 b=ic7ahWeOAtpbZt8zVbft0bdTtGNXWpnhO12TdXItvZfvkEExCZpI54Jb7SgADOm0Jo
 kcNr0as6t+Bm/NUyEeol4+5su1ucyRQ0w9OkTVuoT9cNNPp9v+3H1yCMDRoDSOppmV4i
 LlELQBDHewZiR8JqXQ8gSYIrBnyQes9ulhshDthnBQeTA5jeKLuohqe2Fc+TQsT3lz0D
 1A26H8/ydHYsnhsWdhA/ele05P85wuH1uk2g+QbEppA/KqfEOr9apUYeRDUCBIZLkl+e
 QyprBUgAt2kiPeZvG5yX/mAzZkcV/EjnGSXrS5Ich4PIS1t9aXRMVXIJ+qpNW+t6UVGU
 KuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oylI3wFZAxZOnCSrB2Lv4VednOQz6GcXzyENdSLrLcw=;
 b=Ok+KRICBPLWMf6k7RuPP791NNMJFvBfaxH4bIpbqWDuQSoiMoOPfmNITfOUYY0/u3X
 9elY5Oj+T+CYr886U+4hh+jGgvj5XD9lEiy/doDjzwCFoud1c1qp8ZsXyk63bJ0pGjHG
 +hQ4sZMpvROEQBSqXK93kRX1Ook0oTOCqOTW6dRSy+ui5xGFuedzTyKuXzE/kyDef0Eb
 J+rit8RN1vvwx7XTn6GsOFqRoaeS8lP6wrvkxNgUJACKau+8LwJNyYcud8dS7giSzNy4
 Lk2uu1eHc+RVGhjqJDmAJ1eTYuX/XTmfEaU+O2J7lNi9g/G/kjdc1t+kzVOBlYOhX/jA
 dUXw==
X-Gm-Message-State: AOAM533Pe/4P/dVQ/binOP5W+3zpb59C3otWUcGnKIGrRJYXAgnaS2+M
 HWKD/xgm3caiXBXOtVAjb2vVGxo6d2U=
X-Google-Smtp-Source: ABdhPJwbRn5nQtfcJoRGiaKO3I2jfUv1tdB4QG/ZxuoYCQ8+p10EvpMM9hGs/QsMms9RQTF+O65TNw==
X-Received: by 2002:adf:9504:: with SMTP id 4mr6327667wrs.306.1613690940729;
 Thu, 18 Feb 2021 15:29:00 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z5sm11108651wrn.8.2021.02.18.15.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 15:29:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/5] tcg/tci: Merge identical cases in generation (conditional
 opcodes)
Date: Fri, 19 Feb 2021 00:28:39 +0100
Message-Id: <20210218232840.1760806-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218232840.1760806-1-f4bug@amsat.org>
References: <20210218232840.1760806-1-f4bug@amsat.org>
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 4/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tci/tcg-target.c.inc | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4a86a3bb466..f9893b9539e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -417,15 +417,18 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         set_jmp_reset_offset(s, args[0]);
         break;
+
     case INDEX_op_br:
         tci_out_label(s, arg_label(args[0]));
         break;
-    case INDEX_op_setcond_i32:
+
+    CASE_32_64(setcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
+
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
         /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
@@ -436,13 +439,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
         break;
-#elif TCG_TARGET_REG_BITS == 64
-    case INDEX_op_setcond_i64:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        break;
 #endif
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -505,14 +501,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[4]);
         break;
 
-#if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_brcond_i64:
+    CASE_32_64(brcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-#endif /* TCG_TARGET_REG_BITS == 64 */
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
@@ -556,12 +550,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[3]);
         break;
 #endif
-    case INDEX_op_brcond_i32:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        break;
+
     case INDEX_op_qemu_ld_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
-- 
2.26.2


