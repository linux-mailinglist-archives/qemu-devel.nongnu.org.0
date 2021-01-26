Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AFA3048C4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:37:21 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4U9Q-0006pF-Tc
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aW4QYAgKCo4ECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5N-0004Xm-Eb
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:09 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:56034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aW4QYAgKCo4ECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5E-00047F-C8
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:33:09 -0500
Received: by mail-pl1-x64a.google.com with SMTP id p19so10254719plr.22
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 11:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=TkPdhZlOcZG5Fdm2RkKNjU1YYrH6WfIpfURge5GDGkw=;
 b=M7P3/XUQeBVG/cW5rJU9Yr0tUJIVMs+ZlqEyePr843mKFj1hmEROk5fi3iXHOli5AE
 buZkLgwPGshDF+jl5HRrjmE3QWURe08ITLkijZ/qa9CR67bRkXQ8Ru87O1iGriGGkbOY
 /3XTJuutE+zHFTcyf0wtgDeqwhOovbx9+hp42D9McQlMq7ZwSY5bznEa7lb3P4Ey5z1K
 QSqI6G5FVzFUW/cNF7a4+BXeHeGJ7cycsLTLxGhsioZFj1INLY+H1qMLGyYvp/08tsk9
 HAo6PWq5U5hc5ovmTCeqiSIJpSR896s7Z9Qb+TMlJN4ILDU61a9Jn/o1jW+92xGRUZWC
 W7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TkPdhZlOcZG5Fdm2RkKNjU1YYrH6WfIpfURge5GDGkw=;
 b=JgH109pJH/j3rRLeA+z3XjZ5PfiOd8Sf7Yx/kRXXJHrI00MCw5UyMv2O95jZRwuB2F
 N7XhUkM0nvufoNXjo9G0SZpgar3clTmXe3dB3/vH568qAsDBWeFDCtpGs5cV+hq/sQ/z
 Mk7vOjhfQZtBEODk7wY/fLl0+IAJE2z6SXvjfFHj9GNucP7HfZvE7jp1CR25W6DRekBL
 e/oZy2awhJZ+8p9vwb7HDJpS6I4i/JlLFMHZAj73MiS1fCLb/KXaWpIm+GTIxg19APKf
 Z6Se+/9xn1wgscZe9xo7XmnL+bK8kx2L/Q6sF6ZNRoRck/Do55OR/62RGgyk00GVymYn
 rbRQ==
X-Gm-Message-State: AOAM531ENJGWkFwF8coIhm0q/3niqCmy4G1/4qlX8bn9LB8c0E3F7WKr
 jSHc7hMb8SVy02sh6luxUkgbdlZLtwmw3Q==
X-Google-Smtp-Source: ABdhPJxqNIGmOWP8qI6xUUOIL9gu+E6a0lpMxcxlJK5JtNq8foEE/RS89Eg66M45BLPS0pdI5E4UUKq5cFBG/w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:9888:b029:dc:374:bc8b with SMTP
 id s8-20020a1709029888b02900dc0374bc8bmr7455068plp.60.1611689577066; Tue, 26
 Jan 2021 11:32:57 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:34 -0800
In-Reply-To: <20210126193237.1534208-1-wuhaotsh@google.com>
Message-Id: <20210126193237.1534208-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 3/6] hw/arm: Add I2C device tree for NPCM750 eval board
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3aW4QYAgKCo4ECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

Add an I2C device tree for NPCM750 evaluation board.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 3fdd5cab01..2d82f48848 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -98,6 +98,20 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
     return NPCM7XX(obj);
 }
 
+static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm750_evb_i2c_init(NPCM7xxState *soc)
+{
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -108,6 +122,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm750_evb_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.365.g02bc693789-goog


