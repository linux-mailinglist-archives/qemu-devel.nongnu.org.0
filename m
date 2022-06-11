Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91A5473F6
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:49:58 +0200 (CEST)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzygm-0006cJ-8R
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRf-000354-2C
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRd-0006DG-IG
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k19so1472802wrd.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MqcxIJN2+Zm3sGgLV3r2BkGN3s/2DTUZOjkjXVU9rE=;
 b=IW8cX0qAPqQs0xCHCPxBfYwyAZfRIKERUFIqHzUx2Ra4YXb/JTeADXl0bvinaJ37tt
 4U8oqDh6K7cMd/qjtMm8NubddbboHeOjXCZgyjgP8YRCmE+i14bM1R48UonFLUqiTfEx
 nJ+TBg5U91JRIfH3Mqff8S6WJptAK+inN9TZRvsznwly3rafO8VIoMEmcqGbOkp/vs9z
 JXCWJJ98K9e1oZo/ClDnBHII14xUMrZSGVd6XXDyagT0ZyaCufKYl1rCD1W/q2t0baTz
 xsQbuzl+EUcGNC78/rvRmL0sDJhAXYXV41E7QFSK4qrcSEhlC47omkvq8wOxd9gURIwI
 89vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MqcxIJN2+Zm3sGgLV3r2BkGN3s/2DTUZOjkjXVU9rE=;
 b=JpsJlwOs9HfkBejcXEeFm8w2LrVcSkDwHRLTeT04dQLEn73dkWgFnPbaqSqcg3E7nb
 p8wvTyYuNYoShH4rWbDwOsCNcveqDIRCVdpfjP0fvTevHJyoKeoljLDSPeAoXJcOyTKG
 1J5IaMuTwHXJ1z+upXLanPYkWlIVUbrT2Q6Por8yHXj9+OHMj4yGZ4hYTKXPXoXawk+D
 B9zWKczZJE1HjrsRTCL2/07Y2PBfCHKEVptLQTtqrTPhhX0VXAFaTknmk8C7aZG3WzNi
 kVtvFaQrGTMqmkRTaOBTwJ0cGNtAQcBPfhODDXBzRsZCXbxedf6Xp+bpzDu9MFXXvBg7
 ndaQ==
X-Gm-Message-State: AOAM531GSyOQsk3Du+IrQJsx2/flUz4VnqZ056ZOlsl8H+b3bflHSSlP
 ddNMIyMW0fWxvG7irK1pQGhSkrBdsFw=
X-Google-Smtp-Source: ABdhPJxhTIC9Ouw093V5Xy93KMJCzBP+7NJfArD2+BZ+4OPUz8FKuX0h9yW5XcuwAsCoaGxyb99zwA==
X-Received: by 2002:adf:ed49:0:b0:210:2b98:a539 with SMTP id
 u9-20020adfed49000000b002102b98a539mr47175423wro.118.1654943656618; 
 Sat, 11 Jun 2022 03:34:16 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 z12-20020a5d44cc000000b00219e758ff4fsm2153067wrr.59.2022.06.11.03.34.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 12/49] target/mips: Fix handling of unaligned memory access for
 nanoMIPS ISA
Date: Sat, 11 Jun 2022 12:32:35 +0200
Message-Id: <20220611103312.67773-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>

nanoMIPS ISA does not support unaligned memory access. Adjust
DisasContext's default_tcg_memop_mask to reflect this.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504110403.613168-6-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 6de5b66650..5f460fb687 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16023,8 +16023,9 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
         ctx->mem_idx = hflags_mmu_index(ctx->hflags);
 #endif
-    ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS_R6 |
-                                  INSN_LOONGSON3A)) ? MO_UNALN : MO_ALIGN;
+    ctx->default_tcg_memop_mask = (!(ctx->insn_flags & ISA_NANOMIPS32) &&
+                                  (ctx->insn_flags & (ISA_MIPS_R6 |
+                                  INSN_LOONGSON3A))) ? MO_UNALN : MO_ALIGN;
 
     /*
      * Execute a branch and its delay slot as a single instruction.
-- 
2.36.1


