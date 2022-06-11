Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCFA5473DC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:40:50 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyXx-0002B7-1N
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyR2-0001l4-2l
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyR0-0006AC-Kh
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id n185so621092wmn.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1VVOBQ8vQMV6sQsstcumZsHOhdXzv9pz97cTwTA93UQ=;
 b=WjcCWNymjSW+GufpHDiQiFnQ1OYFjnwEYJy4E/7aO2fgZg7dtPpRL251rXXP6ntup2
 dJ/OlWCyjTcOlOU3gAFJ1nMS/H3U/N1lcqxsKnI+Y2X4ZkJ956eBJ1KkOD1NWr/vIn3I
 MtGdbLMvlUwYS3qYhLF3I7odVdI/n9x/dZR9dlVzVfBlyazfAOdReLicX5rQtRpF8BS3
 s6OZhvN0gSI4GNJdPvGDLF5XZrpeIhDJlDiAaYQ8zFWsFWJohaGC9Jv83EpwQs/08bDl
 GmQrm8XX11A4Bxbl0g8PINO/XuKgyf24PJI+XwV3ITXU4qWUZxW6WeDSklY2x6nPO3Gn
 1grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VVOBQ8vQMV6sQsstcumZsHOhdXzv9pz97cTwTA93UQ=;
 b=TsfxEuAazIJGkIuTdsbkXDuooVM/kczF2KDkVXhEaI/gc07ArudGtqA/X8QmWnSfCj
 uyof4xbSB+a0VS8yYSPayCmq1eWAHF1vTT+5jv+h+Kx4W808bMSiVGtIRwi8F2Cv90ep
 2Jenb9pSall6GXoW87zQeCan94bLrUsJ1Qswb96zZoicsGQyi+KHlqj/pLPMPWMYd2mI
 8oxuNECa4lfKVQBH2n9JxpgFI4ainRibmKpyeS9lVBK8gDTez5J3zQEQkhzUBMY0UnGL
 CneGYmTy6AfAxBj/9WgqscvZDx5lwIUECKXCp3ul9gCl60tQ05QUso7m5JmQKoFFBfwt
 iD5w==
X-Gm-Message-State: AOAM533yw4IELce0oG34q99ldO/7XxPw/2U5AIlGBVWEpWAPeQEv7L6z
 hysGGiRuHzLxtS3L2qLB1qWpguMCdVU=
X-Google-Smtp-Source: ABdhPJxy2VIMBnsCU4bQZCUPLo3vX0a2SdV3IyIJtG1Rp2zkbuWPRpr57Oa0ZL/H55R+T/My40FBrw==
X-Received: by 2002:a05:600c:1c10:b0:39c:4708:648d with SMTP id
 j16-20020a05600c1c1000b0039c4708648dmr4212322wms.85.1654943615646; 
 Sat, 11 Jun 2022 03:33:35 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 p21-20020a1c5455000000b0039c2e2d0502sm6131471wmi.4.2022.06.11.03.33.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ni Hui <shuizhuyuanluo@126.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 04/49] target/mips: Fix msa checking condition in
 trans_msa_elm_fn()
Date: Sat, 11 Jun 2022 12:32:27 +0200
Message-Id: <20220611103312.67773-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

From: Ni Hui <shuizhuyuanluo@126.com>

Fix issue that condition of check_msa_enabled(ctx) is reversed
that causes segfault when msa elm_fn op encountered.

Fixes: 2f2745c81a ("target/mips: Convert MSA COPY_U opcode to decodetree")
Fixes: 97fe675519 ("target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree")
Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220503130708.272850-3-shuizhuyuanluo@126.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index aa45bae0aa..92ccc6f921 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -599,7 +599,7 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
         return false;
     }
 
-    if (check_msa_enabled(ctx)) {
+    if (!check_msa_enabled(ctx)) {
         return true;
     }
 
-- 
2.36.1


