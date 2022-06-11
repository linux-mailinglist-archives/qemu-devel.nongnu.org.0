Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA045473FB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:54:40 +0200 (CEST)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzylL-0005rZ-12
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRv-0003k2-5C
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRt-0006Ge-Ad
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p10so1448361wrg.12
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sr6Q8Miis0Zz95uadtdvLHNB1UhMHAgNTb9kegUEzSE=;
 b=b1hg76HOZowhzRv3Vb3mcskZacy6WJs3qXQpSgB5aE9LIEquAFMQR2L4O9MRaYlDSS
 dp7xDEkpUTOwMi/5xXs21rekucikrKp81+ttv04rMp0Ww0DYN2N9FPhr5AcGQkEcNdfS
 9qlPc0frF20eSegFnCPzQpU3048Rk5uvANzxPE8dU0zuc8eMc431oru+wfMK8tqkVXvp
 6NsB5wKJy85HNVFFWClCh+V7V1EeoJirqLdO+Lq8TMdz08JrqhkCgCdvl/WJ3AWyvSi/
 +6XVi7mpXhjIKhmmnQro9bi0N44rTeZgwaC/wTpJ8X9FFFzD20vTujlbCGGUWGME0/KJ
 F7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sr6Q8Miis0Zz95uadtdvLHNB1UhMHAgNTb9kegUEzSE=;
 b=UIuHBep28HnytpPjln9cblboUiTKg3cbX6hg7CZz4ecXEK01DLnba9R++Z6pdfIal4
 2MPUeebmS4IF9yErcNr5X63Wmd4RSLUBriC6cAE2PuWNDsvWl+S7jEWUHrWo9638ixIe
 073Pe1JTpaBpYgOg0Ibo/qvj8t2qrVNsGke090Kk9PDwAMHqS286cvZZBiHX5w0HNh0m
 OkR+i0Kor3cVvs+YyuHoLM7T+ipgi/G9EpZzk89ju2E1eTGt8a6i1ITZWUxLGCbYgwL8
 n4BeHgUAf7ECHjhJDSgljPtva/t9R1rQfSPmPvgGh0vIjd9Qi3JdbrTGjzLPKOWBRC3/
 xmkw==
X-Gm-Message-State: AOAM531kJpNfEOoX9QGnSfsmyBF0eCO+OmSNRPbOTPQ+r5sctDA2m4gA
 wr5U+QiXyhAn2KcThrcbNb7kDtRsDCY=
X-Google-Smtp-Source: ABdhPJxpNoYzHQb/jMTUlZjMTC4u81FsGhXV6I48dCwjpXTdHEu6k8Jz6+osgaBsY+Y/hABvKdc3bw==
X-Received: by 2002:a05:6000:1786:b0:217:c304:9f6b with SMTP id
 e6-20020a056000178600b00217c3049f6bmr34049556wrg.323.1654943671730; 
 Sat, 11 Jun 2022 03:34:31 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b00219c46089f6sm2143409wrt.64.2022.06.11.03.34.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 15/49] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
Date: Sat, 11 Jun 2022 12:32:38 +0200
Message-Id: <20220611103312.67773-16-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

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

Fixes: 1430759ec3 ("hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220505101842.2757905-1-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/fdc-sysbus.c  | 16 +++++++++++-----
 hw/mips/jazz.c         |  2 +-
 include/hw/block/fdc.h |  3 +--
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 57fc8773f1..86ea51d003 100644
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
index 6598d7dddd..96dc6ab32d 100644
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
diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 1ecca7cac7..35248c0837 100644
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
 
-- 
2.36.1


