Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0103A852D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:51:57 +0200 (CEST)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBM3-0007AL-Sd
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBF1-0005t9-AK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEc-0000xC-PS
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id i94so18825047wri.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zVqxL3AKT7HZ7ZKqxjmZkK1Q7WRetlbNs3djp8Q49oc=;
 b=exA6F2u5xFVLcUOfrXk+GqsHeysJKzjbayqDgOmjKm8IziGMku+wc8skjM3PSSTJRY
 N3Y3bkmSEcJnxlO+qjfJSBVgmX9/1ZibjDkCvDuN+YBuiwylqxXf5nf86wPf2Ww1FwVV
 r97q8ph6I32WrDgx4lvEoIlvUKLGLZhgOicZTL4fGP94h7LSQ2FBOXjJcAKvc8mrCPyT
 oMfpOBJqr2znfq50rnu8DDTB7l0yfttELEJjqSIWwfySI4BQIBpef94y5CEwK81+cRPB
 MRJB2D/PwH23wRYNHuR4gbZCnMtxd92YPIfSEQ9cHn6EgMALj9WjyZuE/COY3IFAplf/
 PLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVqxL3AKT7HZ7ZKqxjmZkK1Q7WRetlbNs3djp8Q49oc=;
 b=RT+CNO8eeriwbLZJMLjvJp6DABCre2y6XD12XJBU+j7sESh9lttr26Sv+enQTaI0YG
 9LqcYm/VPELYe+YBwn6FCnt0y58ece9lWftbokloY2EWAGfqCu2bxsha+dxMyHgXpsA0
 zWeRyhcKOD4FL/cKnzHmQDFUxe9Ak7x7DrIYhVZKNm5RyM9fiq1PMLYNw03e5AaclJk8
 o/IJMcypbiWXwEBACdr6EF3RR/0kUg/hAQPv4A7Hdyu7Tw3BdkzZadc0lXyG1INEFW/6
 R7CCVACj7doaOpF3Q9gas9v2qM1VYQelg1yv/+g6WvCidbimwOodbXDzQTrWRrwyFZaF
 mxsg==
X-Gm-Message-State: AOAM53301bmPv/cWX/UtAQsOwAEEsGqFBfFRKtK4g8E+Lf4KBAUroj7m
 wV1Szpro81nyDUI4IorC76CHuq4leiBslQ==
X-Google-Smtp-Source: ABdhPJwjnHZfUayo6+sIpCY5GyBzCr0whXqHzWyZlcCgETETMIwhBI/UwcyObY3Wnd/3Mw24ZFB/nA==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr26056903wry.395.1623771853487; 
 Tue, 15 Jun 2021 08:44:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] hw/arm: quanta-gbs-bmc add i2c comments
Date: Tue, 15 Jun 2021 16:43:44 +0100
Message-Id: <20210615154405.21399-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

Add a comment and i2c method that describes the board layout.

Tested: firmware booted to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210608193605.2611114-3-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 29026f0847b..bba23e24fae 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -238,6 +238,65 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
     npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
 }
 
+static void quanta_gbs_i2c_init(NPCM7xxState *soc)
+{
+    /*
+     * i2c-0:
+     *     pca9546@71
+     *
+     * i2c-1:
+     *     pca9535@24
+     *     pca9535@20
+     *     pca9535@21
+     *     pca9535@22
+     *     pca9535@23
+     *     pca9535@25
+     *     pca9535@26
+     *
+     * i2c-2:
+     *     sbtsi@4c
+     *
+     * i2c-5:
+     *     atmel,24c64@50 mb_fru
+     *     pca9546@71
+     *         - channel 0: max31725@54
+     *         - channel 1: max31725@55
+     *         - channel 2: max31725@5d
+     *                      atmel,24c64@51 fan_fru
+     *         - channel 3: atmel,24c64@52 hsbp_fru
+     *
+     * i2c-6:
+     *     pca9545@73
+     *
+     * i2c-7:
+     *     pca9545@72
+     *
+     * i2c-8:
+     *     adi,adm1272@10
+     *
+     * i2c-9:
+     *     pca9546@71
+     *         - channel 0: isil,isl68137@60
+     *         - channel 1: isil,isl68137@61
+     *         - channel 2: isil,isl68137@63
+     *         - channel 3: isil,isl68137@45
+     *
+     * i2c-10:
+     *     pca9545@71
+     *
+     * i2c-11:
+     *     pca9545@76
+     *
+     * i2c-12:
+     *     maxim,max34451@4e
+     *     isil,isl68137@5d
+     *     isil,isl68137@5e
+     *
+     * i2c-14:
+     *     pca9545@70
+     */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -282,6 +341,7 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
                           drive_get(IF_MTD, 0, 0));
 
+    quanta_gbs_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.20.1


