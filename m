Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4EA36D7DA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:59:03 +0200 (CEST)
Received: from localhost ([::1]:53366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjmQ-0002o2-V4
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfU-0002Vc-Uk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfS-00025N-Ro
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcHyHRkA0AT3lRWO6fsZ2qVIgtA34Zy4SRqfNJ6ObfA=;
 b=OEsqNNd1BTHuaNBZXTXl9n2CbC8PpC0LfamPQS45uuocGF4CAhyz/Kiv+SD0oWaWYPPc31
 YNB7+1ZxGJYUwwIax9m60M3pJOFlahTC4YbrDSeGeUYfKM2KGO12logb5yVzZ1/00QzJTR
 MH+fE1ycqEwgZymlhee87icxaj7yQ2I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-X1n_5n_YOleDRWJcX00fOw-1; Wed, 28 Apr 2021 08:51:46 -0400
X-MC-Unique: X1n_5n_YOleDRWJcX00fOw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c76-20020a1c9a4f0000b02901429c95d1c8so2450909wme.9
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EcHyHRkA0AT3lRWO6fsZ2qVIgtA34Zy4SRqfNJ6ObfA=;
 b=bnocU9R5FH17SkkmBPhMJQ23YDmYOQU6YDFFNZkLq7zcDz/WFJxh5b+NUsr5V/tMgn
 mgVJOIC1QZ1QO+nvEnGsrPU8gyiSiVChM1ahpDR3mG8Y+AUhScrwn/TDEw4JvjR8Csb3
 eg93i3n07BVb9OTsfC+XgDPFPZN46SpHmAd2287e5v9ASSdTCvX2Y6mvoqY8Xa8AdRnZ
 KsSzRTiN7fOp/nChOEkn1WmMXHze3sSJktTKIsqpH708/uwNyPs2dqZFr3zTAapa9A9W
 7Z2bS1GqsOsFLl77Dw8SG12YmgbwomDb62SOloVaiHZ9U9Cwz0zNFhpyrfbk9x6cnN19
 o6sw==
X-Gm-Message-State: AOAM532GEINe+l/2LNbODje13vuIjRVIpcPPV3ieDwZBslWjuhrTi9ef
 N3EppYif5+VkoRS1u3jj/Qh73Gmdy2+Y3iRbvIuO3j9v5uB1pZtkcyiKEXfIa8PcVDiK39dtTix
 b7iPS4nmhlkujQ0g=
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr37209902wre.140.1619614305497; 
 Wed, 28 Apr 2021 05:51:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwQAa7kcnfZvbDvgr1IzJr04cAGqO5ZWnQOHrUaFhLEp3xidNgJz8rIUiO/9ZPAhsaWjhRVw==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr37209893wre.140.1619614305387; 
 Wed, 28 Apr 2021 05:51:45 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s83sm3725839wms.16.2021.04.28.05.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] hw/mips/jazz: Inline fdctrl_init_sysbus()
Date: Wed, 28 Apr 2021 14:51:04 +0200
Message-Id: <20210428125104.358535-9-philmd@redhat.com>
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

There is only one call site for fdctrl_init_sysbus(), and this
function is specific to the jazz machines, not part of the
SYSBUS_FDC API. Move it locally with the machine code, and
remove its declaration in "hw/block/fdc.h".

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/block/fdc.h |  3 ---
 hw/block/fdc-sysbus.c  | 16 ----------------
 hw/mips/jazz.c         | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 06612218630..ac99d6bcaa0 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -1,7 +1,6 @@
 #ifndef HW_FDC_H
 #define HW_FDC_H
 
-#include "exec/hwaddr.h"
 #include "qapi/qapi-types-block.h"
 #include "hw/sysbus.h"
 
@@ -12,8 +11,6 @@
 
 void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
 void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds);
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds);
 
 FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i);
 int cmos_get_fd_drive_type(FloppyDriveType fd0);
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 74c7c8f2e01..5c7e49bcc3f 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -103,22 +103,6 @@ void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds)
     fdctrl_init_drives(&fdc->state.bus, fds);
 }
 
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds)
-{
-    DeviceState *dev;
-    SysBusDevice *sbd;
-
-    dev = qdev_new("sysbus-fdc");
-    qdev_prop_set_int32(dev, "dma-channel", dma_chann);
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_connect_irq(sbd, 0, irq);
-    sysbus_mmio_map(sbd, 0, mmio_base);
-
-    sysbus_fdc_init_drives(sbd, fds);
-}
-
 static void sysbus_fdc_common_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1a0888a0fd5..34fb6a3de9b 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -144,6 +144,22 @@ static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
+static void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
+                               hwaddr mmio_base, DriveInfo **fds)
+{
+    DeviceState *dev;
+    SysBusDevice *sbd;
+
+    dev = qdev_new("sysbus-fdc");
+    qdev_prop_set_int32(dev, "dma-channel", dma_chann);
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, mmio_base);
+
+    sysbus_fdc_init_drives(sbd, fds);
+}
+
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
 {
-- 
2.26.3


