Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D425B6DF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:59:44 +0200 (CEST)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbjD-0000pV-Mz
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbV8-0004QQ-SA
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52675
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbV6-0008WP-Q5
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJFpJl+SZYruiU0RAeWyEIctMmihyR02qqDo8gbE4jI=;
 b=UMsIEGHG9t/LcbIpBQ8oB54RqL/BEWvGkCQWaHbz8b6nUH6vBTxGc2HS3mCDVia/eKWOQt
 6Bytc8p2zB+J+GZ5KYAu5B5ujKTC03Sjn5bd1a+1CSmhIFpCDwyfnkSp8lcUfuoAbWup2j
 exLgXoChT7urJ+yWqfK94eWVAuN/ZeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-ngAqtk1wO7Gz7Uf3-Yidng-1; Wed, 02 Sep 2020 18:45:04 -0400
X-MC-Unique: ngAqtk1wO7Gz7Uf3-Yidng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7585E1005E71;
 Wed,  2 Sep 2020 22:45:02 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7255D9CC;
 Wed,  2 Sep 2020 22:45:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/63] esp: Rename ESP_STATE to ESP
Date: Wed,  2 Sep 2020 18:42:47 -0400
Message-Id: <20200902224311.1321159-40-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 16:25:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, berrange@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the type checking macro name consistent with the TYPE_*
constant.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: qemu-devel@nongnu.org
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
index 3410d8db6c..3ee7ef4590 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -345,7 +345,7 @@ static void *sparc32_dma_init(hwaddr dma_base,
                                    OBJECT(dma), "espdma"));
     sysbus_connect_irq(SYS_BUS_DEVICE(espdma), 0, espdma_irq);
 
-    esp = ESP_STATE(object_resolve_path_component(OBJECT(espdma), "esp"));
+    esp = ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
     sysbus_mmio_map(SYS_BUS_DEVICE(esp), 0, esp_base);
     scsi_bus_legacy_handle_cmdline(&esp->esp.bus);
 
-- 
2.26.2


