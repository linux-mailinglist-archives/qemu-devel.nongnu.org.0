Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D824B26201F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 22:09:52 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFjw7-0000iH-UI
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 16:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFjoZ-0001Ng-Mv
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:02:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFjoU-0004MJ-Gg
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599595317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBBQHKCaZNmcoT8GjRywod67shGKvN15dsv6PCG16Vk=;
 b=N3BZjpm9fjkspk4na0JehVyagd9TPhVTIuojcv5RY0Y08DNMrGlpXpqDdd/L5wJsQqDoV9
 gGvPK3WF77zIGNSQJBNiY/tZ+P/JxcOcQTKAxJo/H/9ehcx8w0m3V3R8ZZvuMcr4OfXurg
 7uq2/lcjAXgKRXCKHwze2FZo1mVLL/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-h3V2ktocNdaQ5GjNpdrwfw-1; Tue, 08 Sep 2020 16:01:55 -0400
X-MC-Unique: h3V2ktocNdaQ5GjNpdrwfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F21BD80F044;
 Tue,  8 Sep 2020 20:01:53 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B813805CF;
 Tue,  8 Sep 2020 20:01:53 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 21/34] esp: Rename ESP_STATE to ESP
Date: Tue,  8 Sep 2020 16:01:10 -0400
Message-Id: <20200908200123.3402311-22-ehabkost@redhat.com>
In-Reply-To: <20200908200123.3402311-1-ehabkost@redhat.com>
References: <20200908200123.3402311-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 12:54:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the type checking macro name consistent with the TYPE_*
constant.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Message-Id: <20200902224311.1321159-40-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/scsi/esp.h | 2 +-
 hw/dma/sparc32_dma.c  | 2 +-
 hw/m68k/q800.c        | 2 +-
 hw/mips/jazz.c        | 2 +-
 hw/scsi/esp.c         | 6 +++---
 hw/sparc/sun4m.c      | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index f281625dd5..20800dbf5b 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -67,7 +67,7 @@ struct ESPState {
 
 #define TYPE_ESP "esp"
 typedef struct SysBusESPState SysBusESPState;
-DECLARE_INSTANCE_CHECKER(SysBusESPState, ESP_STATE,
+DECLARE_INSTANCE_CHECKER(SysBusESPState, ESP,
                          TYPE_ESP)
 
 struct SysBusESPState {
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index bcd1626fbd..d20a5bc065 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -303,7 +303,7 @@ static void sparc32_espdma_device_realize(DeviceState *dev, Error **errp)
 
     d = qdev_new(TYPE_ESP);
     object_property_add_child(OBJECT(dev), "esp", OBJECT(d));
-    sysbus = ESP_STATE(d);
+    sysbus = ESP(d);
     esp = &sysbus->esp;
     esp->dma_memory_read = espdma_memory_read;
     esp->dma_memory_write = espdma_memory_write;
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1ca482ad81..ce4b47c3e3 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -290,7 +290,7 @@ static void q800_init(MachineState *machine)
     /* SCSI */
 
     dev = qdev_new(TYPE_ESP);
-    sysbus_esp = ESP_STATE(dev);
+    sysbus_esp = ESP(dev);
     esp = &sysbus_esp->esp;
     esp->dma_memory_read = NULL;
     esp->dma_memory_write = NULL;
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 82a6e3220e..47723093b6 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -309,7 +309,7 @@ static void mips_jazz_init(MachineState *machine,
 
     /* SCSI adapter */
     dev = qdev_new(TYPE_ESP);
-    sysbus_esp = ESP_STATE(dev);
+    sysbus_esp = ESP(dev);
     esp = &sysbus_esp->esp;
     esp->dma_memory_read = rc4030_dma_read;
     esp->dma_memory_write = rc4030_dma_write;
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 405f8b7cbc..b84e0fe33e 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -929,7 +929,7 @@ static const struct SCSIBusInfo esp_scsi_info = {
 
 static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
 {
-    SysBusESPState *sysbus = ESP_STATE(opaque);
+    SysBusESPState *sysbus = ESP(opaque);
     ESPState *s = &sysbus->esp;
 
     switch (irq) {
@@ -945,7 +945,7 @@ static void sysbus_esp_gpio_demux(void *opaque, int irq, int level)
 static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    SysBusESPState *sysbus = ESP_STATE(dev);
+    SysBusESPState *sysbus = ESP(dev);
     ESPState *s = &sysbus->esp;
 
     sysbus_init_irq(sbd, &s->irq);
@@ -967,7 +967,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 
 static void sysbus_esp_hard_reset(DeviceState *dev)
 {
-    SysBusESPState *sysbus = ESP_STATE(dev);
+    SysBusESPState *sysbus = ESP(dev);
     esp_hard_reset(&sysbus->esp);
 }
 
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 256033b9a0..947b69d159 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -335,7 +335,7 @@ static void *sparc32_dma_init(hwaddr dma_base,
                                    OBJECT(dma), "espdma"));
     sysbus_connect_irq(SYS_BUS_DEVICE(espdma), 0, espdma_irq);
 
-    esp = ESP_STATE(object_resolve_path_component(OBJECT(espdma), "esp"));
+    esp = ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
     sysbus_mmio_map(SYS_BUS_DEVICE(esp), 0, esp_base);
     scsi_bus_legacy_handle_cmdline(&esp->esp.bus);
 
-- 
2.26.2


