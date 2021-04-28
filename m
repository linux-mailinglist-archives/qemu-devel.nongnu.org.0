Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB236D7D0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:56:25 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjjs-0007Tq-Fp
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfJ-0002QM-D6
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfF-0001zc-0a
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3XFOlA3I9QKIsvcRP2TeV85rvw51gE7XQXiQybRpMg=;
 b=jTPnVF6Ql9JHFFNnTDcIfai4453w7tm6KlFS1GJfNUAMhkH7AYdQToNa07ly8qipOJ9jbM
 Np2n7Y5ieotEkqqUXLHGuy2tf8TfpQ+WF5L8B/6iZJeWdzDVU93K0m92qCQeEgAKiUh711
 TugPqqq0nbWoxUERxqjq2L1EzatRQdo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-lWp3yCvWM7GeZFSDDkr1Nw-1; Wed, 28 Apr 2021 08:51:32 -0400
X-MC-Unique: lWp3yCvWM7GeZFSDDkr1Nw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so5127166wmb.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3XFOlA3I9QKIsvcRP2TeV85rvw51gE7XQXiQybRpMg=;
 b=RbdDaBP3dyJQL4ZWhGxEVBXdgUiX8bf3RWhy5z4jBkPeMobD7YNLJnGAG/L9RYasHi
 46VaKQf2HQyKF+ahItU3RrpcVD/fhI2HyLupwOKZNNgaLtcFPE+Iw6VLSYApuRhojNNb
 qWdVWdNY7ebPvxtrFVjymKFMCviWijk4k0f8Qq4/53IZFSvqSZhxPULI57EUkkc5ugOw
 1+DHh7bSb/aDr1eSzTkitFLrdAYrq27XAz92tzE8jY4SBLQpJVA6Fdy5rVIVaw1Fw94T
 6xC8gzlqZ/T9r+HUfx+y6cNePkVu5idyvYhRgXgZlh21X2u5UZFgRIodg8XWnCejO/WZ
 dpxg==
X-Gm-Message-State: AOAM533M92il/9mA8YNj5e5Lht3k+onW6PRZKk01cktsrONK8SDFtXfn
 CcOraqBHuv90d3mk5mBkI2fUVQvKv5NqQhZfKXS0JN4BFDUpF91H2zKmEkXh5OgGGN4DUCMsONT
 fxg0D5zlrTsBBtAw=
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr36842929wrg.110.1619614291531; 
 Wed, 28 Apr 2021 05:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxal0BpoVgZGIdazub/2hJhbtucdKY9So77/ftiKcKqiyzV8hv4BhT7XJ6n77pQYEwhtR+B5g==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr36842907wrg.110.1619614291362; 
 Wed, 28 Apr 2021 05:51:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v17sm8121185wrd.89.2021.04.28.05.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/block/fdc: Add sysbus_fdc_init_drives() method
Date: Wed, 28 Apr 2021 14:51:01 +0200
Message-Id: <20210428125104.358535-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428125104.358535-1-philmd@redhat.com>
References: <20210428125104.358535-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FDCtrlSysBus's FDCtrl state is a private field. However it is
accessed by the public fdctrl_init_sysbus() and sun4m_fdctrl_init()
methods. To be able to move them out of fdc-sysbus.c, first add
the sysbus_fdc_init_drives() method and use it in these 2 functions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/block/fdc.h |  2 ++
 hw/block/fdc-sysbus.c  | 23 ++++++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 1ecca7cac7f..52e45c53078 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -3,6 +3,7 @@
 
 #include "exec/hwaddr.h"
 #include "qapi/qapi-types-block.h"
+#include "hw/sysbus.h"
 
 /* fdc.c */
 #define MAX_FD 2
@@ -10,6 +11,7 @@
 #define TYPE_ISA_FDC "isa-fdc"
 
 void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
+void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds);
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds);
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 71755fd6ae4..1163e53165d 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -94,6 +94,15 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
     trace_fdctrl_tc_pulse(level);
 }
 
+void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds)
+{
+    FDCtrlSysBus *fdc;
+
+    fdc = SYSBUS_FDC(dev);
+
+    fdctrl_init_drives(&fdc->state.bus, fds);
+}
+
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds)
 {
@@ -111,23 +120,23 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
     sysbus_connect_irq(sbd, 0, irq);
     sysbus_mmio_map(sbd, 0, mmio_base);
 
-    fdctrl_init_drives(&sys->state.bus, fds);
+    sysbus_fdc_init_drives(sbd, fds);
 }
 
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc)
 {
     DeviceState *dev;
-    FDCtrlSysBus *sys;
+    SysBusDevice *sbd;
 
     dev = qdev_new("sun-fdtwo");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sys = SYSBUS_FDC(dev);
-    sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
-    sysbus_mmio_map(SYS_BUS_DEVICE(sys), 0, io_base);
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, io_base);
     *fdc_tc = qdev_get_gpio_in(dev, 0);
 
-    fdctrl_init_drives(&sys->state.bus, fds);
+    sysbus_fdc_init_drives(sbd, fds);
 }
 
 static void sysbus_fdc_common_initfn(Object *obj)
-- 
2.26.3


