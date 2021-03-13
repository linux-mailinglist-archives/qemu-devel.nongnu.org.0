Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A195E33A0E9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:08:59 +0100 (CET)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAZG-0006A4-Lu
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHO-0000Kq-RS
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHM-0007d1-Ns
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 12so741359wmf.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1Cwa2OcYD4r+5VTw6PO/ARs0+y1qGMrO1MaA3wWpg0=;
 b=j3/9zx7faUrpCe7wglzGdBw/oh15ATPOse6nNncBeN3WdnJhZ4PJCkaxIxLkXNBrjB
 VHkWKVSixQLMik+xAIVMUxFFzkxc6b7TQL+1xPSkAKYU+SwInhRQpmzBaR1LDAaikS1q
 6LxrRgSkQAgxUWW6TYQVd1/r61/bE6M2vylg6S9b5cda+G3seMghqwCraYXAHJPbUofh
 Xn0dHOMOzFc2l+B/R6F0Vf1yRZinmStU6LCgRR7OAloVjcsjz+8MTjmWR/IXi3HHQ33l
 sVWXdRvxLiBE3TH4LbVWXJg9o1WcCeE0PTNXulKieM1Vz9fqJQBX9hnCgjYiWCDrQsRN
 CBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L1Cwa2OcYD4r+5VTw6PO/ARs0+y1qGMrO1MaA3wWpg0=;
 b=pevObItoY6f+oI/bzyNv2zNDDZ9QMmq/9uyktV5iwyFf0H18WwjxxT+wVOzn/CMI9U
 vJF0MSqDR/lr6E9D40eymJrrnsCI3hA6aaFx72xOu2aszMT+sbyuij5rDEE7JhI6ScFH
 ILe9gExsiWijFL6Ed+y5yNiZ5qX7h7T/j+iS66maaUxAmPBlnX7xsnALokO+rBJQ/dWY
 tTUuRF+i6DfK+RjuTNPyI5zD7rDI3iRgQQpOeW7xm02Nlh4mGJsY6OHPCBx46KSiE+Y/
 70eBlMYnesF/b8JJWYx36JRTTEia8ltmv9w3MKpRIrCyMznWvGCos/zTkFIKixAI5bMo
 EP7g==
X-Gm-Message-State: AOAM533PWqVLwSl1nr8h/76eB+DteX5c1E20UEVs8/J0oJ3ZKiNi5Paa
 oLLwfBRKhFJOq6tAraIHejOMulpWAHoIJA==
X-Google-Smtp-Source: ABdhPJxIuUQkZzNhkbZVkiz0hxcd2x2VnFVHA9Y86CUW+BxDbRjbN1Cyo6UMrQuqKQT7THOfA2Fc7A==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr18539234wmg.26.1615665027271; 
 Sat, 13 Mar 2021 11:50:27 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m9sm13349948wro.52.2021.03.13.11.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/27] target/mips/translate: Simplify PCPYH using deposit_i64()
Date: Sat, 13 Mar 2021 20:48:25 +0100
Message-Id: <20210313194829.2193621-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

Simplify the PCPYH (Parallel Copy Halfword) instruction by using
multiple calls to deposit_i64() which can be optimized by some
TCG backends.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-11-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index d4316c15d11..1967c12d807 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24091,36 +24091,10 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_movi_i64(cpu_gpr[rd], 0);
         tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
     } else {
-        TCGv_i64 t0 = tcg_temp_new();
-        TCGv_i64 t1 = tcg_temp_new();
-        uint64_t mask = (1ULL << 16) - 1;
-
-        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr[rd], t1);
-
-        tcg_gen_andi_i64(t0, cpu_gpr_hi[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr_hi[rd], t1);
-
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
+        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rt], cpu_gpr[rt], 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rd], cpu_gpr[rd], 32, 32);
+        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt], cpu_gpr_hi[rt], 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rd], cpu_gpr_hi[rd], 32, 32);
     }
 }
 
-- 
2.26.2


