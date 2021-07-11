Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846723C3F67
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:08:20 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ggV-0000sw-Ho
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZi-0007Ka-Au
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZg-0000vY-9k
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r11so16822786wro.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LPkKd/bGwI5hB12Pdrnj0cRDWsw/8wL9DWSbjxiM6ac=;
 b=Se6ngAvCvvrDp5ImtUKRlrr3Jg+oun2i9urIle1hifLndUhcAB1OOrx/rKTgk2pJuO
 RwVPAD/fNeA7CHCnOFvsg4TvCTHLeUwFm107mfryZT2dCwajh5pBfSMnKpqLyt07j8bZ
 uVDm0UZektzxUBeafclZ62TjOq4DdlnaZMz6gzHvQaXhWTGkokCmC5o+xrmxipKRjcqF
 wKf6T9Qp3KQofY9JtUbAEvwnRxU0QNmuy41zLt9pmZQQFx5zTmmkQBSG3+tmCTr0cdh+
 d9aMQlP2EBIVyupEfp5wPmKxMIX5UsRpQm/a39onC55otCNUf93oLa4ACZ+AlXWNvBMt
 1diQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LPkKd/bGwI5hB12Pdrnj0cRDWsw/8wL9DWSbjxiM6ac=;
 b=IrCVr257kqKf5GDQiWkwZfqT0SGnkz0cxMPt+Y44tmVwZyUk5xjxnv8o8nnJtH0nso
 71tXcXTv5OBrUjrFmeS48/qYiDjsBQoHCULz6LUN1Yv1QNHJw6hUdfFI+CJu/pBzSyW0
 xno4RHQ361X2ccKU7dgaxvoMRKyl9gd8bz0VMg6S+Dn+M8Uq8s5ZEPqZeMQozitERz4P
 rY7XLO3X5rSLbgTdFil67YY/9NDCqAAF9ZCfDDtYFmzCXLXf1nR7HKfHnb9V2ecqbcJp
 DtCEKntHyAcEVtLMHtrLZHB49/uJ2R1mRBtNnn0XK0yR5ImY7aeWWhLVG/bpU1WBUx5M
 nMWw==
X-Gm-Message-State: AOAM530D58wBlG2+1+oQ7IJnCWtLeCMbVdtI2Fl33+nV+dHjwgdNfB10
 kLYbl35y9b56OJ19Xuj3W5emgsxG1Eo/FSe2
X-Google-Smtp-Source: ABdhPJyT8WWwGGfKrkDaeOoRJJ7XxDgXPhdvuEhJ3xTNJvZ1DeiU9uKVaYuvxL8ruSt0W4moU5zD7g==
X-Received: by 2002:a5d:4a4c:: with SMTP id v12mr28580227wrs.256.1626037274845; 
 Sun, 11 Jul 2021 14:01:14 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l22sm3697964wmp.41.2021.07.11.14.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] target/mips/tx79: Introduce PROT3W opcode (Parallel
 Rotate 3 Words)
Date: Sun, 11 Jul 2021 23:00:07 +0200
Message-Id: <20210711210016.2710100-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Introduce the PROT3W opcode (Parallel Rotate 3 Words).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-25-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  1 +
 target/mips/tcg/tx79_translate.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 653910371d2..2f65dce2431 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -54,6 +54,7 @@ PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
 PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
 PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
+PROT3W          011100 00000 ..... ..... 11111 001001   @rt_rd
 
 # MMI3
 
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 90c33d26a9f..402790249f3 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -593,3 +593,31 @@ static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Rotate 3 Words Left */
+static bool trans_PROT3W(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+
+    tcg_gen_mov_i64(ax, cpu_gpr_hi[a->rt]);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], ax, cpu_gpr[a->rt], 0, 32);
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt], ax, 0, 32);
+    tcg_gen_rotri_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], 32);
+
+    tcg_temp_free(ax);
+
+    return true;
+}
-- 
2.31.1


