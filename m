Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE3254EFE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:44:59 +0200 (CEST)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNpS-000093-2m
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNU7-00085J-Bq
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNU5-0000WS-FS
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6l7pYC7+QtYMsb5r0CsBHD03u43gUzWBb4OYxTCohQ4=;
 b=IfMxK0MjD/fUhAww+tvIVcGwMFHLGVdSpGFoFBx0GBHtKcFovBnYcfANb+J6Xjz0Wlyrhu
 mfbZ82q/wqOWNXyuBD5XIAMe8JcqxINDRKyt06uppRPT5XOujWkQzyqYIFmNrXBkvFDblZ
 B42fvwkAt+yec2DDYbQKcc151/42J8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-OyoKre2SOoaHpHm5Lga8Hg-1; Thu, 27 Aug 2020 15:22:48 -0400
X-MC-Unique: OyoKre2SOoaHpHm5Lga8Hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3944A18A2252;
 Thu, 27 Aug 2020 19:22:47 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F18B119C71;
 Thu, 27 Aug 2020 19:22:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 38/53] pxa2xx: Move QOM macros to header
Date: Thu, 27 Aug 2020 15:21:07 -0400
Message-Id: <20200827192122.658035-39-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make future conversion to OBJECT_DECLARE* easier.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200825192110.3528606-40-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/arm/pxa.h | 13 +++++++++++++
 hw/arm/pxa2xx.c      |  7 -------
 hw/pcmcia/pxa2xx.c   |  4 ----
 hw/sd/pxa2xx_mmci.c  |  3 ---
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index d99b6192da..09c1336071 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -86,7 +86,10 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
 void pxa2xx_lcd_vsync_notifier(PXA2xxLCDState *s, qemu_irq handler);
 
 /* pxa2xx_mmci.c */
+#define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
 typedef struct PXA2xxMMCIState PXA2xxMMCIState;
+#define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
+
 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 hwaddr base,
                 qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma);
@@ -94,7 +97,11 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
                 qemu_irq coverswitch);
 
 /* pxa2xx_pcmcia.c */
+#define TYPE_PXA2XX_PCMCIA "pxa2xx-pcmcia"
 typedef struct PXA2xxPCMCIAState PXA2xxPCMCIAState;
+#define PXA2XX_PCMCIA(obj) \
+    OBJECT_CHECK(PXA2xxPCMCIAState, obj, TYPE_PXA2XX_PCMCIA)
+
 PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base);
 int pxa2xx_pcmcia_attach(void *opaque, PCMCIACardState *card);
@@ -119,8 +126,14 @@ PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
                 qemu_irq irq, uint32_t page_size);
 I2CBus *pxa2xx_i2c_bus(PXA2xxI2CState *s);
 
+#define TYPE_PXA2XX_I2C "pxa2xx_i2c"
 typedef struct PXA2xxI2SState PXA2xxI2SState;
+#define PXA2XX_I2C(obj) \
+    OBJECT_CHECK(PXA2xxI2CState, (obj), TYPE_PXA2XX_I2C)
+
+#define TYPE_PXA2XX_FIR "pxa2xx-fir"
 typedef struct PXA2xxFIrState PXA2xxFIrState;
+#define PXA2XX_FIR(obj) OBJECT_CHECK(PXA2xxFIrState, (obj), TYPE_PXA2XX_FIR)
 
 typedef struct {
     ARMCPU *cpu;
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 20fa201dd5..76975d17a4 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1251,10 +1251,6 @@ typedef struct PXA2xxI2CSlaveState {
     PXA2xxI2CState *host;
 } PXA2xxI2CSlaveState;
 
-#define TYPE_PXA2XX_I2C "pxa2xx_i2c"
-#define PXA2XX_I2C(obj) \
-    OBJECT_CHECK(PXA2xxI2CState, (obj), TYPE_PXA2XX_I2C)
-
 struct PXA2xxI2CState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -1787,9 +1783,6 @@ static PXA2xxI2SState *pxa2xx_i2s_init(MemoryRegion *sysmem,
 }
 
 /* PXA Fast Infra-red Communications Port */
-#define TYPE_PXA2XX_FIR "pxa2xx-fir"
-#define PXA2XX_FIR(obj) OBJECT_CHECK(PXA2xxFIrState, (obj), TYPE_PXA2XX_FIR)
-
 struct PXA2xxFIrState {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index 5f4bf22a90..fcca7e571b 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -18,10 +18,6 @@
 #include "hw/pcmcia.h"
 #include "hw/arm/pxa.h"
 
-#define TYPE_PXA2XX_PCMCIA "pxa2xx-pcmcia"
-#define PXA2XX_PCMCIA(obj) \
-    OBJECT_CHECK(PXA2xxPCMCIAState, obj, TYPE_PXA2XX_PCMCIA)
-
 struct PXA2xxPCMCIAState {
     SysBusDevice parent_obj;
 
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 04f0a98f81..3a47b380dd 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -22,9 +22,6 @@
 #include "qemu/module.h"
 #include "trace.h"
 
-#define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
-#define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
-
 #define TYPE_PXA2XX_MMCI_BUS "pxa2xx-mmci-bus"
 #define PXA2XX_MMCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
 
-- 
2.26.2


