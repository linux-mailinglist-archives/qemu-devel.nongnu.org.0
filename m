Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB851BD67
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:43:48 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYxW-0008F4-Uz
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmYZQ-0006Va-4q
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:18:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmYZL-0003KW-Jq
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:18:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so4814345wmj.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 03:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2LiU77D4bB7m0Q3qWw+NtmeiOcDFsmOvUT8V048DimA=;
 b=fP1rKYrv4+meyK5LOKPFeksfsKMXYGzWswXuwvOhK7Jfv/C6KlKQtyEqaBd1iZ0BQH
 MUT8WWa6wYjyxhErcsBm9FwDE2z12MnYVfTQmwYvYA6JrcAXiQhOU9Rdo7Go4bchI3bt
 tpoGuSlOm0HhIjFmSkw2nqqytsMi2BR3B1jwAUqzLOkgPnQYv7Dp6rTysiYD5JhDt26W
 +PL0f2XM1f7z8RGSil2TGTmA00aVWE0Jjt7u5la7lIx39WpQJtdl3RvWdc53F4nNnu3B
 lQqUGZ2uDHTIOLYWh9/Jf4hbZANxNdSxzHVlwEnLLGj+QumE90cPtjzWzIUrOyTAPFzy
 faAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2LiU77D4bB7m0Q3qWw+NtmeiOcDFsmOvUT8V048DimA=;
 b=LZ/akBG4p+DAidh50CQO6xqynXiJboL5aR3WJHMUTp/ZsDn3khpoGmA84gv0TYyDf1
 pz1msKb83KRoAkwSJbFkPFFI6e1oZq4I2C1NRqt+a0xfNVVVP+qGXkQ0C1glEJz9w+JO
 zdGm8Ub+mKyKOkq5XW4Mo9ZbBrf04xuyxooEtU3GFpZ4smQ2Pd9+IvZLETHEMqgLrrYa
 W5J3N4L48lUtmjo4SfQtEp4NdXAlJcuAPHTpjJboM5FXntGrYG+mynQN3OX3DROotbPx
 kn8+FMq8rMj/93AY3tH8DI0x3LY1OSJhcyLxDjZUyxt5bU9bn4aNVpI9ibOwebgr80Fj
 fSxw==
X-Gm-Message-State: AOAM532L64GJmj4IxW/xwVyn4DjJ0FZ5cb93gV1UeH8EUyVvMCnnr24C
 4PBweD4fjkuHQNV2WwFjET9LyfIOf7hkTw==
X-Google-Smtp-Source: ABdhPJymBoVOW3bK0bOInInipZPFOR6AEAPnTZKqaMSaCD3N9azpteX8a2Xrib/ab5V4jkwKQiSJyw==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr3914281wmj.38.1651745925621; 
 Thu, 05 May 2022 03:18:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a056000170b00b0020c5253d8c7sm879531wrc.19.2022.05.05.03.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 03:18:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org
Subject: [PATCH v2] hw/block/fdc-sysbus: Always mark sysbus floppy controllers
 as not having DMA
Date: Thu,  5 May 2022 11:18:42 +0100
Message-Id: <20220505101842.2757905-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
don't support DMA.  The core floppy controller code expects this to
be indicated by setting FDCtrl::dma_chann to -1.  This used to be
done in the device instance_init functions sysbus_fdc_initfn() and
sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
and accidentally lost the setting of dma_chann.

For sysbus-fdc this has no ill effects because we were redundantly
also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
this means that guests which try to enable DMA on the floppy
controller will cause QEMU to crash because FDCtrl::dma is NULL.

Set dma_chann to -1 in the common instance init, and remove the
redundant code in fdctrl_init_sysbus() that is also setting it.

There is a six-year-old FIXME comment in the jazz board code to the
effect that in theory it should support doing DMA via a custom DMA
controller.  If anybody ever chooses to fix that they can do it by
adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
(A QOM link property 'dma-controller' on the sysbus device which can
be set to an instance of IsaDmaClass is probably the way to go.)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
Changes v1->v2: remove now-unused 'fdctrl' local variable
 from fdctrl_init_sysbus()
---
 include/hw/block/fdc.h |  3 +--
 hw/block/fdc-sysbus.c  | 16 +++++++++++-----
 hw/mips/jazz.c         |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 1ecca7cac7f..35248c08379 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -10,8 +10,7 @@
 #define TYPE_ISA_FDC "isa-fdc"
 
 void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds);
+void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds);
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc);
 
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 57fc8773f12..86ea51d0034 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -94,18 +94,14 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
     trace_fdctrl_tc_pulse(level);
 }
 
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds)
+void fdctrl_init_sysbus(qemu_irq irq, hwaddr mmio_base, DriveInfo **fds)
 {
-    FDCtrl *fdctrl;
     DeviceState *dev;
     SysBusDevice *sbd;
     FDCtrlSysBus *sys;
 
     dev = qdev_new("sysbus-fdc");
     sys = SYSBUS_FDC(dev);
-    fdctrl = &sys->state;
-    fdctrl->dma_chann = dma_chann; /* FIXME */
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_connect_irq(sbd, 0, irq);
@@ -138,6 +134,16 @@ static void sysbus_fdc_common_instance_init(Object *obj)
     FDCtrlSysBus *sys = SYSBUS_FDC(obj);
     FDCtrl *fdctrl = &sys->state;
 
+    /*
+     * DMA is not currently supported for sysbus floppy controllers.
+     * If we wanted to add support then probably the best approach is
+     * to have a QOM link property 'dma-controller' which the board
+     * code can set to an instance of IsaDmaClass, and an integer
+     * property 'dma-channel', so that we can set fdctrl->dma and
+     * fdctrl->dma_chann accordingly.
+     */
+    fdctrl->dma_chann = -1;
+
     qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
 
     memory_region_init_io(&fdctrl->iomem, obj,
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6598d7dddd5..96dc6ab32dd 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -353,7 +353,7 @@ static void mips_jazz_init(MachineState *machine,
         fds[n] = drive_get(IF_FLOPPY, 0, n);
     }
     /* FIXME: we should enable DMA with a custom IsaDma device */
-    fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), -1, 0x80003000, fds);
+    fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
 
     /* Real time clock */
     mc146818_rtc_init(isa_bus, 1980, NULL);
-- 
2.25.1


