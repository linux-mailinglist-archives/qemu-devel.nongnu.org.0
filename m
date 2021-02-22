Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E02321A25
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:22:41 +0100 (CET)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC6i-0000Yc-TG
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzq-0003LA-7o; Mon, 22 Feb 2021 09:15:34 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzl-0001AR-0P; Mon, 22 Feb 2021 09:15:30 -0500
Received: by mail-ej1-x632.google.com with SMTP id t11so29586599ejx.6;
 Mon, 22 Feb 2021 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9hmeNcCuV50+4mklzG6lWCfHgecZ1fCI3uUrwmRLWxc=;
 b=ET6xO0M6IVLiy08b4hX1Abe+AfP3kvEOGkw17hjXYHhTjZPYBpWx4xe2TfIU2GYmdX
 54m5rvBNS9ojHz2t8/CfELxhPWILLdphaXOwl95xeRPS1zetwirqqJqlV/HTb2gttKtn
 krZUZ9pKelG66B2B+kwjU2JxW1S2lDLHD6zBKxhrG2xeKoR2rPw4ff5uThTDWEZEmfdp
 X9SYLXsvPGrItfxlkUmvGIcZ0x9JF1nPpXsQj0Uq7Ebf//WVTCADG6fgseLTImPUc8tZ
 fPX8pyWv2T0Efiplj4y5beTidsBkP5Umc5homtd/4f2Z/gbw69w/XSaX0EAQADuRxi/y
 fJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9hmeNcCuV50+4mklzG6lWCfHgecZ1fCI3uUrwmRLWxc=;
 b=bHzxaCM4Q4k6OM1d/8v0JowYTS/fAH97DlJa9kYfTDuPyRVJ9dMe/01ghkVOHHxB9h
 tzcYKSo4qad3CuQy/KXDNudChTZq3ShQd4OXQi7fvuSuRM8+XNu0UIEwTp7vCE+XO72R
 lzUOr2HoIoMqjzM0ujB75BhSJOovvVxzp1csarpcmzK63X7lQ3TpmM2Fm4lZ8iBy86rW
 g1IqA7s+f7kzpnFd6OBAzCJF8mNdZvIzB6DvODDplnEIPJkjQnj7Lvy9M6LtU9W1dyOy
 M6MQAmPRlzx4p0UST1HcRP3Ejjfg9iMveU18/l8O+uERNfXz3PUK3e/MztY+3SR+Asca
 o/Kw==
X-Gm-Message-State: AOAM5306zMyK6fl38pmfvhnJ56v3NelLx2EeNJvwlzaqitggRS/3k+lp
 2vOHAoyDC87h4KXZsObrDgZ95k/78fE=
X-Google-Smtp-Source: ABdhPJwjpU2FeKnKcWr5oiJIAVTCf6/YZHwAaTdtgQJQcPXJzy72rEfolw1rLp8Ej8cazr3oMWG9Fw==
X-Received: by 2002:a17:906:5453:: with SMTP id
 d19mr18610360ejp.150.1614003326990; 
 Mon, 22 Feb 2021 06:15:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v13sm12381457ede.5.2021.02.22.06.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/8] hw/sh4: Add missing Kconfig dependency on SH7750 for
 the R2D board
Date: Mon, 22 Feb 2021 15:15:08 +0100
Message-Id: <20210222141514.2646278-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

r2d_init() calls sh7750_init() so depends on SH7750.Harmless
at the moment because nothing actually uses CONFIG_SH7750
(hw/sh4/meson.build always compiles sh7750.c and sh7750_regnames.c
unconditionally).

Fixes: 7ab58d4c841 ("sh4-softmmu.mak: express dependencies with Kconfig")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed5..0452b4624ae 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -10,6 +10,7 @@ config R2D
     select PCI
     select SM501
     select SH4
+    select SH7750
 
 config SHIX
     bool
-- 
2.26.2


