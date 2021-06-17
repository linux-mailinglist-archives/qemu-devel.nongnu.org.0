Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E13ABAF1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:55:04 +0200 (CEST)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwEJ-0003q4-Ug
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw8j-0001Uj-GV
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:49:18 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw8i-0004Kq-2G
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:49:17 -0400
Received: by mail-wr1-x433.google.com with SMTP id c5so7709037wrq.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xW3U7g7xe/I6XaUOpOGPcO2/ZapWcqv9gLbJJFxqrU=;
 b=ZVBndOVawyGC+BkA/yY/W7i2azPgbz+0DtIsDu0cPjqpjX2tG3jePVamSjioIEzd+U
 cNi/a4jEoLk0RKbuRO+VUNo36Xz88HUAp92rNHqHalBDLX2PLmWgNuuVsuyQhnH8jYz9
 cVdtq7A9dKDXj+6X2z3TVd9rk8YwEY2QOR0O8/ZZMA2tikTz4jRDfhULLF2m6x6uUdnW
 50rNnFWPRLJRjMAzpBM8rmyuaJ+VcoxxMfShDWYCcfJTO/UOAw3zU2SPzvB/unVBmFdC
 QG/vwNW2PGITS0GJOjg7ptNeV5Is/tihpUjxj62wtanZeqcS26RzeFe9kaAvoswCe+da
 l0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9xW3U7g7xe/I6XaUOpOGPcO2/ZapWcqv9gLbJJFxqrU=;
 b=La8MwhB+rYjUBAAHuzJQKEzvljjRxSBN9WSym4QNgXXIpDZFka0mwSnBLI2UJu5HsO
 DMyRWDkH3GD5cckZAySWodMJ/wJp0vg2jxnykDcFfXMYAlgSCt9tgl/R0mB6d4OZdwZ4
 4YdvDJxviRclscM1H9PKFdZcI2EfiZ8ZZyyfDwBpTQjr1p8UNfQ6ADwxPQV3J5Dd0EAT
 TswEDupDNVlErF8Ggva6PbqdGbmgEmJQjlPYshn4RDH4BDV7Nkf0YIAiUFAeji9sQwMv
 2U2C2/nzMizNYkRTXStSZpmLKT50GplKsB3qi9d4YqXOSmso2TMtAukAeScbHlLfU3hf
 /gGg==
X-Gm-Message-State: AOAM5317BmjaY3oL8PMC2x3jW4k+ITziUtJBJ/Qe0vDYH8oxZGA/hiNo
 7rqHrzg3CGJ07N4HMkiKFhx7Yk7e0S4kJw==
X-Google-Smtp-Source: ABdhPJyk4cNILlcD3//gDjTsuwlTQT7K+u3v0B6bkOwmUoVG5gFALdfzF84l1P40rmem6Ezq3qAGzQ==
X-Received: by 2002:adf:c3d4:: with SMTP id d20mr7216605wrg.183.1623952153988; 
 Thu, 17 Jun 2021 10:49:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z6sm3266944wrl.15.2021.06.17.10.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:49:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/mips: Add declarations for generic TCG helpers
Date: Thu, 17 Jun 2021 19:49:04 +0200
Message-Id: <20210617174907.2904067-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174907.2904067-1-f4bug@amsat.org>
References: <20210617174907.2904067-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

To be able to extract the microMIPS ISA and Code Compaction ASE
translation routines to different source files, declare few TCG
helpers which are also used by translate.c in "translate.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 5 +++++
 target/mips/tcg/translate.c | 9 ++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 61442590340..c25fad597d5 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -146,6 +146,11 @@ void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
 void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
 int get_fp_bit(int cc);
 
+void gen_ldxs(DisasContext *ctx, int base, int index, int rd);
+void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt, int bp);
+void gen_addiupc(DisasContext *ctx, int rx, int imm,
+                 int is_64_bit, int extended);
+
 /*
  * Address Computation and Large Constant Instructions
  */
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 255f97fe9c1..c0ae180969e 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5630,8 +5630,7 @@ static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
     tcg_temp_free(t0);
 }
 
-static void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt,
-                      int bp)
+void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt, int bp)
 {
     gen_align_bits(ctx, wordsz, rd, rs, rt, bp * 8);
 }
@@ -12779,8 +12778,8 @@ static void gen_mips16_restore(DisasContext *ctx,
     tcg_temp_free(t2);
 }
 
-static void gen_addiupc(DisasContext *ctx, int rx, int imm,
-                        int is_64_bit, int extended)
+void gen_addiupc(DisasContext *ctx, int rx, int imm,
+                 int is_64_bit, int extended)
 {
     TCGv t0;
 
@@ -14511,7 +14510,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
     }
 }
 
-static void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
+void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-- 
2.31.1


