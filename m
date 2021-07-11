Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49F3C3F66
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:08:14 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ggP-0000n3-90
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZO-0006hW-53
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZM-0000j8-FR
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so10012565wms.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5XKU4Tkdv/SSZ1Urbjy7D1rDO0a00fPrTd38NNFwCE8=;
 b=aZ/eE8GIIQNHi7+Ql+nI5eDmsET0LtOD6AbcmtjFRBtALCzEPQlesDwp9zSslK98xw
 LCDb9UzMeC6nfj0gDVf8BRcC7HYwbfviLU3UB/KZ1Yid6sgh+xcecwc7vZNYVYDLvU6G
 gGMw1qms3EgipkLub8/Bd3JN59SOR3WP4dn2D7hEgtkJtCVaDVA320TjiOYOSuXU5ftt
 g0e2BZcueIAg3CiLsDgM4yOC5ei3zVYSjc01m8V89kimaltMjsNmkgV5YMHo2jUNsAzo
 Ipsu4ImEHYnb4NPNOW9/s65PYelMS8OUWN0Q2rv0ujcrVI9Hl5QGXHCOfKONL6TN1LLv
 ue+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5XKU4Tkdv/SSZ1Urbjy7D1rDO0a00fPrTd38NNFwCE8=;
 b=NNDisJo8YskvOpv8SI59/Zniv8oqvrUhxY8VPMFc5OkVOsdHnw+m0KCSUOkaZ/DrS9
 iyMpCaak1CluUAcnVu0V/vx9j617H372NTlTHRmyCe7ZCAdoGbhWXt9DFQ5Jbj0enSgX
 bHVqCDPaFC++rf9VjPB7rdLy+/U5t40jTeu+58jCpy7I8V+9PiAnwFKaaCg5ohiSq55z
 +9BInhr+uMQHfj2fqztUacWtlH2W6h2L/foQYMUZotySP4Htq3v4roJ4Zfj1yP45UYtT
 piuU9TI7zd1CWdXKys/LfmDUfOJmq31tzjN5Tq72mErI8sx9V/g4N30YPKTmONh2hhyF
 zeWQ==
X-Gm-Message-State: AOAM530Dw5m3dnoYakmo5BH4W59blDVM81JWoEG98UvpKwld4wO9uK+L
 FwEZv4Hy9sVXqSh1CaWL+XSOS95Fy9T145Wv
X-Google-Smtp-Source: ABdhPJzU1xwEdzki7aTxLcuHhUWEIHxNClpOcTu0YZLij98gG5yn2+jnOPGPVLDCk/qAunEI3wEQew==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr11028790wml.49.1626037254939; 
 Sun, 11 Jul 2021 14:00:54 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id x19sm10899259wmi.10.2021.07.11.14.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] target/mips/tx79: Introduce PEXTL[BHW] opcodes (Parallel
 Extend Lower)
Date: Sun, 11 Jul 2021 23:00:03 +0200
Message-Id: <20210711210016.2710100-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'Parallel Extend Lower' opcodes:

 - PEXTLB (Parallel Extend Upper from Byte)
 - PEXTLH (Parallel Extend Upper from Halfword)
 - PEXTLW (Parallel Extend Upper from Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210309145653.743937-13-f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  3 ++
 target/mips/tcg/tx79_translate.c | 75 ++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index ead5f8281e5..98f21d33e3f 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -34,6 +34,9 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
+PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
+PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
 # MMI1
 
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 68c56affc4c..c4656a4c21d 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -297,6 +297,81 @@ static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
     tcg_gen_deposit_i64(dh, a, b, 0, 32);
 }
 
+static bool trans_PEXTLx(DisasContext *ctx, arg_rtype *a, unsigned wlen)
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+
+    /* Lower half */
+    for (int i = 0; i < 64 / (2 * wlen); i++) {
+        tcg_gen_deposit_i64(cpu_gpr[a->rd],
+                            cpu_gpr[a->rd], bx, 2 * wlen * i, wlen);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd],
+                            cpu_gpr[a->rd], ax, 2 * wlen * i + wlen, wlen);
+        tcg_gen_shri_i64(bx, bx, wlen);
+        tcg_gen_shri_i64(ax, ax, wlen);
+    }
+    /* Upper half */
+    for (int i = 0; i < 64 / (2 * wlen); i++) {
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd],
+                            cpu_gpr_hi[a->rd], bx, 2 * wlen * i, wlen);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd],
+                            cpu_gpr_hi[a->rd], ax, 2 * wlen * i + wlen, wlen);
+        tcg_gen_shri_i64(bx, bx, wlen);
+        tcg_gen_shri_i64(ax, ax, wlen);
+    }
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
+/* Parallel Extend Lower from Byte */
+static bool trans_PEXTLB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_PEXTLx(ctx, a, 8);
+}
+
+/* Parallel Extend Lower from Halfword */
+static bool trans_PEXTLH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_PEXTLx(ctx, a, 16);
+}
+
+/* Parallel Extend Lower from Word */
+static bool trans_PEXTLW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    gen_pextw(cpu_gpr[a->rd], cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /* Parallel Extend Upper from Word */
 static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
 {
-- 
2.31.1


