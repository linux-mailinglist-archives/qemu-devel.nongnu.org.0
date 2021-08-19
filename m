Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCC3F1DF3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:36:32 +0200 (CEST)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGl1r-000542-OX
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzy-0002G2-Kn
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzx-0005tO-4D
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KRt8FFWQDNryBvxaWuh5UmPga4sUXhUn48F2GiPqnI=;
 b=SXVwcAbvv3mTaiFWzjB9W4NG4xOQZqQyC14F63uPJ+74LSk+Y+QXD83RwCVncEswK02dzs
 GYVFFdzpwTfoEtSJpU2vlATPDtELY6YbunG902UOquebyE30bpnorKuj5bfQphtcPYlL7E
 JVDLIIDZUMinxv5bmfIaEGfolKAbMgk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-RsJ6vSI8PBaemeDRPxSuqA-1; Thu, 19 Aug 2021 12:34:31 -0400
X-MC-Unique: RsJ6vSI8PBaemeDRPxSuqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 10-20020a05600c024a00b002e6bf2ee820so3677029wmj.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KRt8FFWQDNryBvxaWuh5UmPga4sUXhUn48F2GiPqnI=;
 b=UYPZRK3Hz4as5WiVlcm1/uB5Aam8aUi9uMN2tnvE2CI2OWjurfiEPyTQd8hlKBdbrn
 o2MKQ2hGsbPb8Gfhdlj/BGGgtFy7o1qejUTAToO5cAyebLrIsPQcdLXRc+jzdzpbyCaK
 xqApJ3Im/mIyBJIV5Ll98PLsihRJofBvGjnOxKa2mLRRdOb1yutXa4vbhtqzOodhLjHJ
 oULAZDI4h5MENImT2jUyRJtiwB+AC16ydDOBbBnYAA978xpKZ2+ntprf+7JfhG+DAISU
 A5+uufYVQ3YR2b4A2mmk88a0HxvXENLxF7JaSumcR8k40RWKg2IJK4enmmSOf0AgUReI
 Z1FA==
X-Gm-Message-State: AOAM530IaWrrJeAg+L5THZZ0XTPI/VTPHMe7BRdsHADdI51CZEYsDQYi
 DE2/0xb63PUIGjDOZn9OOwTe/uQE53RFZ+8t7/ZEGqB6Z5RKKzfOH5+iTxEK9DoI5xXIYi+u+nM
 kBM506DgvjfEkUGri2fZrkg7RB5o9krTEFQYMmfpyiJpmtsPqXopNS7JydHSWCJj7
X-Received: by 2002:a7b:c922:: with SMTP id h2mr14674983wml.186.1629390869358; 
 Thu, 19 Aug 2021 09:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqKcNY1FOh0ukMsOtP0UhSpQZFxtKmP96wwq0bTs5RqvwNgO4p2IMMQHtiYfiUoDJ7+kGTSQ==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr14674964wml.186.1629390869134; 
 Thu, 19 Aug 2021 09:34:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g12sm3428397wru.85.2021.08.19.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/arm/xlnx-zynqmp: Realize qspi controller *after*
 qspi_dma
Date: Thu, 19 Aug 2021 18:34:19 +0200
Message-Id: <20210819163422.2863447-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
References: <20210819163422.2863447-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we link QOM object (a) as a property of QOM object (b),
we must set the property *before* (b) is realized.

Move QSPI realization *after* QSPI DMA.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4de..9724978761b 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -570,26 +570,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         g_free(bus_name);
     }
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
-
-    for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
-        gchar *bus_name;
-        gchar *target_bus;
-
-        /* Alias controller SPI bus to the SoC itself */
-        bus_name = g_strdup_printf("qspi%d", i);
-        target_bus = g_strdup_printf("spi%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->qspi), target_bus);
-        g_free(bus_name);
-        g_free(target_bus);
-    }
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dp), errp)) {
         return;
     }
@@ -646,8 +626,26 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
-    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
-                             OBJECT(&s->qspi_dma), errp);
+
+    if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                                  OBJECT(&s->qspi_dma), errp)) {
+         return;
+    }
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
+        g_autofree gchar *bus_name = g_strdup_printf("qspi%d", i);
+        g_autofree gchar *target_bus = g_strdup_printf("spi%d", i);
+
+        /* Alias controller SPI bus to the SoC itself */
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->qspi), target_bus);
+    }
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.31.1


