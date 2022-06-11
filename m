Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5235473F4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:49:49 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzygd-0006BS-TM
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRM-0002BV-2o
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRK-0006D0-Kf
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id s1so1462580wra.9
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nIafIEbZr/KYiHZODOx9BpkQO+OqaLzsBcQX1foBSQQ=;
 b=Kx309NEk76DNojuqy060Xg7gow206kQgTFrdBpwm2WbHb+4JTRzlDV/vN+efc2zjm2
 8vmmpqzIZIoSSrhWm4hawoZhaFS+xDMnxuHN/dPaYC0yvgAUJn+ZqDvSagtW5BSWPK6X
 HSA9MxZy8JCImKqBY06P3tvUE5c3rb1dVpl8GpIQbfeFLUYJQW2r+ALyeki4vE/ptcCA
 W4B70nCrqSMD6vQDWDDeiHc6nhW5hAbZqOybHvbblK2hoy0QInd94ccqQ6WhzAq8oJTu
 v+PD24R2Hs9FfQ0iJxLTlzDcAbPm2WycgGJ+FITWbXU1dvDi6Bg/Q9jQKGflygtXrAuU
 VIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nIafIEbZr/KYiHZODOx9BpkQO+OqaLzsBcQX1foBSQQ=;
 b=3wHTqQE7HNP4edoQaqR2ypwsfIN0GtkgdqqNEaRJRKe4PfUum6qXsyoF/kOas24Tcr
 d8tQPsntGMV0AGvzTskaoSUvON/hvY+AoiPzaCQgf2SVpjAHmdV9NSag4FFhLxXb0sLY
 OKV4xjtjmguDljUlSMxVnFGMOVr9yFgEcnpELqkHAeQyUrEPtehDkEwx7KywWApUTNeg
 K6EpvVFMuDMH/eklrZDa5f/I87gVV84cYtwv2FwkKKdlakgM0OnUQGSFJS9RZ6QORf6V
 BIN4zwlrn1Ov70uwEZ4Q8zDIe+hRSWfT1LRAdKTuDoxNqDC0Ci0jIH1zrXaOKMUqdHaY
 ql6g==
X-Gm-Message-State: AOAM532T9v+AjUr8kkmQwwt947f1pxk1r5V1z7opy6bVH3Oxu0bIL8ey
 itFKtw9+Q0ydV6vVcMUJS4ld88YVLo8=
X-Google-Smtp-Source: ABdhPJwQuVYsLs0CkbRzQMHygG3U4YCEsmwOlDZJcuHv2qZkrTlvbRW+UBd9Ov0yr/rc/OnaXJPweA==
X-Received: by 2002:a05:6000:178d:b0:20f:e84c:2f46 with SMTP id
 e13-20020a056000178d00b0020fe84c2f46mr47912515wrg.646.1654943636101; 
 Sat, 11 Jun 2022 03:33:56 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 a10-20020a056000100a00b0020d106c0386sm2072927wrx.89.2022.06.11.03.33.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/49] target/mips: Fix emulation of nanoMIPS MTHLIP instruction
Date: Sat, 11 Jun 2022 12:32:31 +0200
Message-Id: <20220611103312.67773-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

From: Stefan Pejic <stefan.pejic@syrmia.com>

The field ac in nanoMIPS instruction MTHLIP rs, ac is specified in
nanoMIPS documentation as opcode[15..14] (2 bits). However, in the
current QEMU code, the corresponding argument passed to the helper
gen_helper_mthlip() has the value of opcode[15..11] (5 bits). Right
shift the value of this argument by three bits to fix this.

Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504110403.613168-2-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 916cece4d2..58ae35a156 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1597,7 +1597,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
         check_dsp(ctx);
         switch (extract32(ctx->opcode, 12, 2)) {
         case NM_MTHLIP:
-            tcg_gen_movi_tl(t0, v2);
+            tcg_gen_movi_tl(t0, v2 >> 3);
             gen_helper_mthlip(t0, v0_t, cpu_env);
             break;
         case NM_SHILOV:
-- 
2.36.1


