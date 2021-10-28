Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F3743EA09
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:12:24 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgChD-0000eu-JF
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCdp-0006WH-RB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:08:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCdo-0004Qo-9t
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:08:53 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p14so12414863wrd.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7XKV6+WQA6BTxZieVUejrAJ7DYt4kC6mGO6YlEwHeg=;
 b=e4pYxWbE322RZWlKCmEwIBH+286edAKgidoIC9OP/V8PPHlvFqgbk4AbUaket2qvk4
 XgFe+0sY5bwws2SIoTyzm+OprJj9C8Fk2uudhCTL5QTpxjefRk1qbFuUCALRe3YQnoaM
 Sy5fEh41YEiuluVljWKCbX3VHQhCIJDiv8PfFvDCQG1qa4ZSTRaIs85fPtA6QREDi6nd
 Gu/tDKfxy26z0VKrSdPg/2Eo0ug7wZtG2OpGYBi2qL5EkqiD/SE5KmYf+uDHPg/jLUy6
 GaAQZRYAFZ0tZtDsTSgE5xftKGs8xBb/KrmZhrS/+3n3M7mWhhXS70Qn7ZE66fSiX2uQ
 tN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P7XKV6+WQA6BTxZieVUejrAJ7DYt4kC6mGO6YlEwHeg=;
 b=ZDO0MFPn5+WLCaHajYf8mTDdTZAOlqr4i5QUS++DbHVN5YwE0aYV5jxxReBR+uRCYQ
 seapiRvSLXTaObo5IsoL6frfQgGdtc6hH57+l982T0rIfDKkt/fJLGYZ9D/lwWNxSwaj
 1SU1H/WC5YK7710kuzLWyLztQ7z9BVsVLT5XKPORqp0XqDKfFEPgZYvmReHckzoybFGh
 bZyBvnOWmJKWX0a9E6yTvmg/+V8etSYaa89WgjnJ5B2mAybzEVVhHi4fRt4Sux5EIJm9
 FU/Ox2kXrDMU+kOJSjAodOnmVigyXwiJZOQ6YQdqeVqTceUm2TYiLHjoP/qNxytQUlxP
 eEWA==
X-Gm-Message-State: AOAM530/uZzIbFAa/8Tbv7IYjGPkZHHoaj09QqrtD1IXORNdYP//VmCX
 A87NG8otCR3Lf+4mAXuoGxOEXIruO20=
X-Google-Smtp-Source: ABdhPJwyXF2XAdoPgskpyWstAy0Cjb3n+wS2ZLW15xdMRLEKwu5dWF+4PqsGo89ME9gfq6LlYUalYg==
X-Received: by 2002:a05:6000:187:: with SMTP id
 p7mr9262119wrx.404.1635455330460; 
 Thu, 28 Oct 2021 14:08:50 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l124sm7627355wml.8.2021.10.28.14.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:08:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/32] target/mips: Fix MSA MADDV.B opcode
Date: Thu, 28 Oct 2021 23:08:12 +0200
Message-Id: <20211028210843.2120802-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

The result of the 'Vector Multiply and Add' opcode is incorrect
with Byte vectors. Probably due to a copy/paste error, commit
7a7a162adde mistakenly used the $wt (target register) instead
of $wd (destination register) as first operand. Fix that.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Fixes: 7a7a162adde ("target/mips: msa: Split helpers for MADDV.<B|H|W|D>")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_helper.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index e40c1b70575..d978909527f 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -3231,22 +3231,22 @@ void helper_msa_maddv_b(CPUMIPSState *env,
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
 
-    pwd->b[0]  = msa_maddv_df(DF_BYTE, pwt->b[0],  pws->b[0],  pwt->b[0]);
-    pwd->b[1]  = msa_maddv_df(DF_BYTE, pwt->b[1],  pws->b[1],  pwt->b[1]);
-    pwd->b[2]  = msa_maddv_df(DF_BYTE, pwt->b[2],  pws->b[2],  pwt->b[2]);
-    pwd->b[3]  = msa_maddv_df(DF_BYTE, pwt->b[3],  pws->b[3],  pwt->b[3]);
-    pwd->b[4]  = msa_maddv_df(DF_BYTE, pwt->b[4],  pws->b[4],  pwt->b[4]);
-    pwd->b[5]  = msa_maddv_df(DF_BYTE, pwt->b[5],  pws->b[5],  pwt->b[5]);
-    pwd->b[6]  = msa_maddv_df(DF_BYTE, pwt->b[6],  pws->b[6],  pwt->b[6]);
-    pwd->b[7]  = msa_maddv_df(DF_BYTE, pwt->b[7],  pws->b[7],  pwt->b[7]);
-    pwd->b[8]  = msa_maddv_df(DF_BYTE, pwt->b[8],  pws->b[8],  pwt->b[8]);
-    pwd->b[9]  = msa_maddv_df(DF_BYTE, pwt->b[9],  pws->b[9],  pwt->b[9]);
-    pwd->b[10] = msa_maddv_df(DF_BYTE, pwt->b[10], pws->b[10], pwt->b[10]);
-    pwd->b[11] = msa_maddv_df(DF_BYTE, pwt->b[11], pws->b[11], pwt->b[11]);
-    pwd->b[12] = msa_maddv_df(DF_BYTE, pwt->b[12], pws->b[12], pwt->b[12]);
-    pwd->b[13] = msa_maddv_df(DF_BYTE, pwt->b[13], pws->b[13], pwt->b[13]);
-    pwd->b[14] = msa_maddv_df(DF_BYTE, pwt->b[14], pws->b[14], pwt->b[14]);
-    pwd->b[15] = msa_maddv_df(DF_BYTE, pwt->b[15], pws->b[15], pwt->b[15]);
+    pwd->b[0]  = msa_maddv_df(DF_BYTE, pwd->b[0],  pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_maddv_df(DF_BYTE, pwd->b[1],  pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_maddv_df(DF_BYTE, pwd->b[2],  pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_maddv_df(DF_BYTE, pwd->b[3],  pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_maddv_df(DF_BYTE, pwd->b[4],  pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_maddv_df(DF_BYTE, pwd->b[5],  pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_maddv_df(DF_BYTE, pwd->b[6],  pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_maddv_df(DF_BYTE, pwd->b[7],  pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_maddv_df(DF_BYTE, pwd->b[8],  pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_maddv_df(DF_BYTE, pwd->b[9],  pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_maddv_df(DF_BYTE, pwd->b[10], pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_maddv_df(DF_BYTE, pwd->b[11], pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_maddv_df(DF_BYTE, pwd->b[12], pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_maddv_df(DF_BYTE, pwd->b[13], pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_maddv_df(DF_BYTE, pwd->b[14], pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_maddv_df(DF_BYTE, pwd->b[15], pws->b[15], pwt->b[15]);
 }
 
 void helper_msa_maddv_h(CPUMIPSState *env,
-- 
2.31.1


