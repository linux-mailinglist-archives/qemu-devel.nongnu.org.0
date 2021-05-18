Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0C38809D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:40:57 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5aF-0003LK-Gc
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5T9-0001Pl-GP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5Su-0007H3-JQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621366393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ktb/E9EO0a25OO2SuCF411Xiw3RFQnNg5asaFxGDPs=;
 b=QcvJIWOLxq2hD7/1ox4pUfVDBWoP+b+6EFTDqaHZvfaFozMGvZa+uKuFIsUyqwwvcTrHGT
 2oMRo7u6jGhpbZVl8tSqyeb+4od96P1YtfoHk+cXPDy7NyV6wDG/Z4BMz6JN6goUr+Irno
 pByfJPxDMH+fqeVAV6LhrV8D0Z7MS14=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-vEHBSPsXNqy5wJSKS_EjDQ-1; Tue, 18 May 2021 15:33:12 -0400
X-MC-Unique: vEHBSPsXNqy5wJSKS_EjDQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso6303772edz.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ktb/E9EO0a25OO2SuCF411Xiw3RFQnNg5asaFxGDPs=;
 b=YF8RBdJUVYbbO3pX0FYhknJKCZ+kffI3f427gGbb41IUsAMdhQEmp/+F85TZ2BJb0b
 gT8VVzJyBjy1EGIU7N44e1a6rxz7QsXqhHJ6VM740hfKPUGhIRDmCyhHC3r15cUjSZS9
 9om/Xek5WEbcJ/bA5zTT5yatpMCM4Rrwx2udGtzGUb0imTuibbXL3r808YblzYrMtI3H
 51ad/pNBBH8rXcef3J8iE+Eh/fZa41096FMRvRWsL53nxYf9VfKJ+MOda9re3emL0764
 O2sfoWA3303at0EHp6CGyNRd/VaRl7+i11UZeyFUvinldEhPpIK7DTciHTz2umjHpnGV
 eVNQ==
X-Gm-Message-State: AOAM532Iydf2Y93XIxGj2pBhD6KIMdtZHM0jMHvXUGR1D+YfFwkRNZ8z
 qgAMpXCp5AI6tNgcdmdPvEY5jJq1H3N+cOAjMLZ4Ca7A8Nmf/vZb/dXnwQNvJ7/MtJ3tW8ksnba
 iK4LKN1ONLy3WFR1GLooFGcTifODIyIVJuR64lGzeVSaQtCNojlm4pFkTV390uqFW
X-Received: by 2002:a05:6402:3594:: with SMTP id
 y20mr9038467edc.63.1621366390177; 
 Tue, 18 May 2021 12:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8/QIl2FKm7DQLhOXO6Vi6b57VNjydjN0U5MxNslFyu+tmA5cQQkacpvcfjx34/VI+yfvoqw==
X-Received: by 2002:a05:6402:3594:: with SMTP id
 y20mr9038451edc.63.1621366389957; 
 Tue, 18 May 2021 12:33:09 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t2sm11023385edd.58.2021.05.18.12.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:33:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v5 6/6] hw/block/fdc: Add sysbus_fdc_init_drives() method
Date: Tue, 18 May 2021 21:32:39 +0200
Message-Id: <20210518193239.1725624-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518193239.1725624-1-philmd@redhat.com>
References: <20210518193239.1725624-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FDCtrlSysBus's FDCtrl state is a private field. However it is
accessed by the public fdctrl_init_sysbus() and sun4m_fdctrl_init()
methods. To be able to move them out of fdc-sysbus.c, first add
the sysbus_fdc_init_drives() method and use it in these 2 functions.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
index c6308f53004..e4105407280 100644
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
 
 static void sysbus_fdc_common_instance_init(Object *obj)
-- 
2.26.3


