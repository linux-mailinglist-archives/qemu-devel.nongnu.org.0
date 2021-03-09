Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364E332ACA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:43:04 +0100 (CET)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeVj-0007fH-4u
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoQ-0005S2-UM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:20 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoL-0002ng-LZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:15 -0500
Received: by mail-ed1-x536.google.com with SMTP id m9so20704153edd.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EFev0xpBsV5H5TKF4K6fxj2ixqQb9yQhNMoCl0p0/v8=;
 b=I681143VIsStlXfYkV9JPISQ4nRaqietwcD8V5lpA+aFcUQguaKpe2zYphjy/yVGme
 PHYkWMJ+i+T5EGfslpz9wQBCKNFnfCDMqoDGe7ZZuke/GELJzp7XEOXEUPBJTkS5Y+d9
 cSIPXsc7RprBOdJu0FA1EnAWkscq+OA5BbceYOHJhkb9w1D6/or5rNUBcKzzj4RcLtcx
 fUCJkw9iuu1i6MllR6tPe4AWkJwe4Ln0M4Rqx05DL5foGyKexSodbBII7SAM7sJO9yZW
 DcwUZY2UCRWz3yN+TADU/ZOQooRBbsrK24/kD9BbTlETCLfZe6T1q9oF5WFjRRfc/UVS
 Y0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EFev0xpBsV5H5TKF4K6fxj2ixqQb9yQhNMoCl0p0/v8=;
 b=KIjSYNp77StLcbEig6sx97IELd9KnH4Md5Kw7H/i6BXt+Rfsf+D7XsJDKVEMPbuAlP
 Jalkw7XHfiidGap8cL+b3CBzqP9oGyQCuIDCLzDHUuikIH7tM4EJagBEL3ykAihNoStR
 o0j3jpzLnk/1XwnTX955KWAHU/Qv/RVNwKyduoNR7aNdUYJHWqj358CCsdVc85/yuXz3
 JcBV1kx4CRgeMhZGTOxnJV990eJpR0zL9p7lJrErGT+ZtCAkAb6WipPdH0pq0wPVMA8w
 Dd2Wv2j5+MuDdm0/4HPgey1zYSXvbvzk42FkztNR/okWwdQsD7LDDY0izQLRHLp/zZl5
 sFHw==
X-Gm-Message-State: AOAM533xkyxT6E+HqYA9H8JvxNZOaK+gylrSTnD7DjyJkbVuVHsTZmOT
 6sOEhJIUVvlLZS3VCnGj3O9x9z6mfZE=
X-Google-Smtp-Source: ABdhPJx9Hb4Ys6P1Iqys9ELgg8PQn8E51C716rG5BZ25UFdVvjqxHUsZy4mkXH0Ml2ya9aCJuN8bmw==
X-Received: by 2002:a05:6402:2076:: with SMTP id
 bd22mr4501726edb.378.1615301892093; 
 Tue, 09 Mar 2021 06:58:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i10sm8423791ejv.106.2021.03.09.06.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 15/22] target/mips/tx79: Introduce PPACW opcode
 (Parallel Pack to Word)
Date: Tue,  9 Mar 2021 15:56:46 +0100
Message-Id: <20210309145653.743937-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PPACW opcode (Parallel Pack to Word).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-22-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 63fbe9694bb..653910371d2 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -38,6 +38,7 @@ PCGTH           011100 ..... ..... ..... 00110 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
 PCGTB           011100 ..... ..... ..... 01010 001000   @rs_rt_rd
 PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
+PPACW           011100 ..... ..... ..... 10011 001000   @rs_rt_rd
 PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
 PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index f0e3d8c0b66..90c33d26a9f 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -374,6 +374,36 @@ static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
+/* Parallel Pack to Word */
+static bool trans_PPACW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 a0, b0, t0;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    a0 = tcg_temp_new_i64();
+    b0 = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+
+    gen_load_gpr(a0, a->rs);
+    gen_load_gpr(b0, a->rt);
+
+    gen_load_gpr_hi(t0, a->rt); /* b1 */
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], b0, t0, 32, 32);
+
+    gen_load_gpr_hi(t0, a->rs); /* a1 */
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], a0, t0, 32, 32);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(b0);
+    tcg_temp_free(a0);
+
+    return true;
+}
+
 static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
 {
     tcg_gen_deposit_i64(dl, b, a, 32, 32);
-- 
2.26.2


