Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45B332AB0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:38:42 +0100 (CET)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeRV-0001Pi-58
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdo2-00056e-QU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:54 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdo1-0002f5-Bv
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:54 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lr13so28514267ejb.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyXaAlW3PTOTDKw2GCNaV+r2g9IJNYZ9Fp9SJUdZdB8=;
 b=eS/JfQTwQFEYsErx+QXovFKx0SEbTF4vlfIoHwbjl8QPWzc0p5bpeURqgV/Wq2BuXE
 2rjz3g0xKf9n+e9FnYKLKlMHLk8cFoOddtDLkClKjsPckBk3Jq0czhHHlmqBT3KLQz81
 LkxsKpj/B3YKBhw3zwr1AyLSC+xcZrYcasOdp2xpMal5J1oQkX7hMQj0tf0fJ94WlvGa
 t+r4dp3YqGURTO+Qhw/L1jhtgiXAhmFeVR6g8xVqSkMMbECUdDS5viWFTWkqcwvDaOjr
 IckH4v4fv90RD1PPDTs31Jxe4Z/lpryLL1IL40oHefLPsIBper6msawOrc/tpJwX8hwH
 ZTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AyXaAlW3PTOTDKw2GCNaV+r2g9IJNYZ9Fp9SJUdZdB8=;
 b=jAiJBJLtFsyW0apZ+zlzZ2GK3/c0Szsvuy3dHstA87nbspwELn6okRE7o/zO7EJjq7
 K8PmBX9NZbrODMHUYHxJrx5XvIQ0n8BByvSbGG3sjY9/SMFXshVQz0hF4DmkLC9Tu5Us
 wJn+ufBg36fzKKasFrHt53P5sFlrNGCdU5YdetSRtJGlbXuV4WfKOZjMjLLxTx1nJ/fs
 QeCnttNokwWHhggIBtHU0rDuP0ULWvXGj7UxST2DcWtkKeyaiqA/kccsF3B/6Qqv8Sre
 1t6AetOR4ZFxXyyNWq6CskBy0vFjZ3hq2cMrF6IFh4YrQTF7h84c7RJYWLAgTJKqvgwy
 NQ2w==
X-Gm-Message-State: AOAM530aZhmjmu0LD1iBQ/sVv6nMd347gMFmEvZsGFUY1LKCBvDt7M8i
 5JkEU89MlScNm6v75K/olgGYTkvGSJU=
X-Google-Smtp-Source: ABdhPJyfFZptmwXJD7Fz5ZIThFG9ZTOPVGkdxj/AxCrD4JzD3LMHPi8e8oO8Nh30LcAOvavOKGedUA==
X-Received: by 2002:a17:906:11d1:: with SMTP id
 o17mr20713843eja.517.1615301871645; 
 Tue, 09 Mar 2021 06:57:51 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o6sm9358367edw.24.2021.03.09.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 11/22] target/mips/tx79: Introduce PEXTUW (Parallel
 Extend Upper from Word)
Date: Tue,  9 Mar 2021 15:56:42 +0100
Message-Id: <20210309145653.743937-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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

Introduce the PEXTUW opcode (Parallel Extend Upper from Word).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Introduce gen_pextw (rth)
---
 target/mips/tx79.decode      |  4 ++++
 target/mips/tx79_translate.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index d1c07c7d901..ead5f8281e5 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -35,6 +35,10 @@ PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
 
+# MMI1
+
+PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
+
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 3abd1d92e70..68c56affc4c 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -290,6 +290,36 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
+static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_deposit_i64(dl, b, a, 32, 32);
+    tcg_gen_shri_i64(b, b, 32);
+    tcg_gen_deposit_i64(dh, a, b, 0, 32);
+}
+
+/* Parallel Extend Upper from Word */
+static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
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
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    gen_pextw(cpu_gpr[a->rd], cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /*
  *     Others (16 instructions)
  *     ------------------------
-- 
2.26.2


