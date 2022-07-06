Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A256938E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:48:07 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BwM-0007Bt-1l
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BM4-0000Z1-Gp; Wed, 06 Jul 2022 16:10:36 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BM2-0003FR-HL; Wed, 06 Jul 2022 16:10:36 -0400
Received: by mail-ua1-x932.google.com with SMTP id l7so6256918ual.9;
 Wed, 06 Jul 2022 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Ir+VQFZYYpGHpLN1dvT4BXvs/3Xgvc//jBmwVbrHRo=;
 b=MY32wd+mj2n2fSFfR1zdU6CMUTBZD2gr/QbHdJhF0SLp+XTPiCweGf5v9920xwadVr
 ByyE2XUvldX6C/MoClbdMAGeg3UJyaCsuw3JD1sSWjV5nj6hqKbrk2qafK9FxBmbi4rF
 JYt1O39PrUYsdEmltlgzS9vnqDMiLoYxudpRGos523yz6YYcftdZ1txChhe/CwddyAZB
 n0BWK/63yMKlFHLY0lX6ce+SaLKWkshY5s1Ob/aUFVY+LCFr3myW54w+CFDjzLdPJKvH
 dzr+9opfujc83MDJqhxWxWPhfpzUPeMf3SzPCR5kjw1KG643tbhYUx4aivIm94lwGqIU
 hEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Ir+VQFZYYpGHpLN1dvT4BXvs/3Xgvc//jBmwVbrHRo=;
 b=Ehah3HW9zD1bc5Yg1StjriS3v76DVyRd8q86muek5YxVJuHewPO7pphNv9Lvrelhgi
 l5OsZ8jSeZxRY4Pw/XKG3RkPAm9wNHYu2v+yPaQqA4ojGmNF2pY6TFDgEpHwgzfg0QTd
 kDv9kCvuWIGgu1o/RsSkZR1E8/ScfMAlXACY7tTCTjuhjOqBAl8XRepuZPJwsUiv3dOJ
 AkTDJkZ+7zZkSJX20LbU2lEiIJ917j6tOlvMprqF2aotiZ1iHzBFzuiGOmEWXdtK+Ji8
 wuy7ioQ+gIEbfnYb3YNA+94EJ6Foxxjif92FCoEF/AeboXCaSRK8HKrKDx15pC6nmjO6
 O0UA==
X-Gm-Message-State: AJIora+ANfkpOqBzwORWeiHchaav5I0t7CLtDhCS2fw7g6yEGIBahw6L
 vMRXMDG0JC2x1sGMZgWtJ1zFvcz05EU=
X-Google-Smtp-Source: AGRyM1tgUy24tQc32XGr+lkDpHK4/PSi806zx9husbhF9Z8wlhzzJbldOybOGTDa7aimd3zAF0nSZQ==
X-Received: by 2002:ab0:5b56:0:b0:37f:1d8c:1f99 with SMTP id
 v22-20020ab05b56000000b0037f1d8c1f99mr19783596uae.110.1657138232503; 
 Wed, 06 Jul 2022 13:10:32 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 21/34] target/ppc: Fix insn32.decode style issues
Date: Wed,  6 Jul 2022 17:09:33 -0300
Message-Id: <20220706200946.471114-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Some lines in insn32.decode have inconsistent alignment when compared
to others.
Fix this by changing the alignment of some lines, making it more
consistent throughout the file.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220629162904.105060-2-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 65a6a42f78..1a425ab28f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -21,11 +21,11 @@
 @A              ...... frt:5 fra:5 frb:5 frc:5 ..... rc:1       &A
 
 &D              rt ra si:int64_t
-@D              ...... rt:5 ra:5 si:s16                 &D
+@D              ...... rt:5 ra:5 si:s16                         &D
 
 &D_bf           bf l:bool ra imm
-@D_bfs          ...... bf:3 - l:1 ra:5 imm:s16          &D_bf
-@D_bfu          ...... bf:3 - l:1 ra:5 imm:16           &D_bf
+@D_bfs          ...... bf:3 . l:1 ra:5 imm:s16                  &D_bf
+@D_bfu          ...... bf:3 . l:1 ra:5 imm:16                   &D_bf
 
 %dq_si          4:s12  !function=times_16
 %dq_rtp         22:4   !function=times_2
@@ -38,7 +38,7 @@
 @DQ_TSXP        ...... ..... ra:5 ............ ....             &D si=%dq_si rt=%rt_tsxp
 
 %ds_si          2:s14  !function=times_4
-@DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
+@DS             ...... rt:5 ra:5 .............. ..              &D si=%ds_si
 
 %ds_rtp         22:4   !function=times_2
 @DS_rtp         ...... ....0 ra:5 .............. ..             &D rt=%ds_rtp si=%ds_si
@@ -49,10 +49,10 @@
 
 &DX             rt d
 %dx_d           6:s10 16:5 0:1
-@DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
+@DX             ...... rt:5  ..... .......... ..... .           &DX d=%dx_d
 
 &VA             vrt vra vrb rc
-@VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......    &VA
+@VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......            &VA
 
 &VC             vrt vra vrb rc:bool
 @VC             ...... vrt:5 vra:5 vrb:5 rc:1 ..........        &VC
@@ -61,7 +61,7 @@
 @VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
 
 &VX             vrt vra vrb
-@VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
+@VX             ...... vrt:5 vra:5 vrb:5 .......... .           &VX
 
 &VX_bf          bf vra vrb
 @VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
@@ -76,13 +76,13 @@
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_rc
 
 &VX_uim4        vrt uim vrb
-@VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
+@VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........          &VX_uim4
 
 &VX_tb          vrt vrb
-@VX_tb          ...... vrt:5 ..... vrb:5 ...........    &VX_tb
+@VX_tb          ...... vrt:5 ..... vrb:5 ...........            &VX_tb
 
 &X              rt ra rb
-@X              ...... rt:5 ra:5 rb:5 .......... .      &X
+@X              ...... rt:5 ra:5 rb:5 .......... .              &X
 
 &X_rc           rt ra rb rc:bool
 @X_rc           ...... rt:5 ra:5 rb:5 .......... rc:1           &X_rc
@@ -107,7 +107,7 @@
 @X_t_bp_rc      ...... rt:5 ..... ....0 .......... rc:1         &X_tb_rc rb=%x_frbp
 
 &X_bi           rt bi
-@X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
+@X_bi           ...... rt:5 bi:5 ..... .......... .             &X_bi
 
 &X_bf           bf ra rb
 @X_bf           ...... bf:3 .. ra:5 rb:5 .......... .           &X_bf
@@ -122,7 +122,7 @@
 @X_bf_uim_bp    ...... bf:3 . uim:6 ....0 .......... .          &X_bf_uim rb=%x_frbp
 
 &X_bfl          bf l:bool ra rb
-@X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
+@X_bfl          ...... bf:3 . l:1 ra:5 rb:5 .......... .        &X_bfl
 
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
-- 
2.36.1


