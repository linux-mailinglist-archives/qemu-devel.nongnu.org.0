Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9D24ABDE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:14:18 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YDh-0006Sq-Ec
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCJ-0004kW-9H
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:12:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28241
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCH-0002Gj-8y
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFC5Ta9ElLwybqXucgB5qcIRMmG2tlubzU8nOK5aTH4=;
 b=ZDgw4jcY8dft6oGv303NGkWYsmWflMKmhMA709BG7JdYf0q8gIacp5UhlL9eiSy5ASOI7y
 pQMuCkEO0hOk29vJlPsk7AQ1zpbhWWT/NCeoT9TJxQPDzzbmNNnPX7Gbdx+GJdVuwScUOx
 7dDUsAsfM4yJsF79wZqGTNKuTUcVsKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Y8asYPsYPve_dJ7uvkOSuw-1; Wed, 19 Aug 2020 20:12:44 -0400
X-MC-Unique: Y8asYPsYPve_dJ7uvkOSuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 079351DDFD;
 Thu, 20 Aug 2020 00:12:43 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C76A10027A6;
 Thu, 20 Aug 2020 00:12:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/58] megasas: Rename QOM class cast macros
Date: Wed, 19 Aug 2020 20:11:40 -0400
Message-Id: <20200820001236.1284548-3-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 18:27:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Hannes Reinecke <hare@suse.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the MEGASAS_DEVICE_CLASS() and MEGASAS_DEVICE_GET_CLASS()
macros to be consistent with the MEGASAS() instance cast macro.

This will allow us to register the type cast macros using
OBJECT_DECLARE_TYPE later.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none

---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Hannes Reinecke <hare@suse.com>
Cc: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/scsi/megasas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 5cfd1bf22e..390c2f2edb 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -134,9 +134,9 @@ typedef struct MegasasBaseClass {
 #define MEGASAS(obj) \
     OBJECT_CHECK(MegasasState, (obj), TYPE_MEGASAS_BASE)
 
-#define MEGASAS_DEVICE_CLASS(oc) \
+#define MEGASAS_CLASS(oc) \
     OBJECT_CLASS_CHECK(MegasasBaseClass, (oc), TYPE_MEGASAS_BASE)
-#define MEGASAS_DEVICE_GET_CLASS(oc) \
+#define MEGASAS_GET_CLASS(oc) \
     OBJECT_GET_CLASS(MegasasBaseClass, (oc), TYPE_MEGASAS_BASE)
 
 #define MEGASAS_INTR_DISABLED_MASK 0xFFFFFFFF
@@ -733,7 +733,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
 {
     PCIDevice *pci_dev = PCI_DEVICE(s);
     PCIDeviceClass *pci_class = PCI_DEVICE_GET_CLASS(pci_dev);
-    MegasasBaseClass *base_class = MEGASAS_DEVICE_GET_CLASS(s);
+    MegasasBaseClass *base_class = MEGASAS_GET_CLASS(s);
     struct mfi_ctrl_info info;
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
@@ -1999,7 +1999,7 @@ static uint64_t megasas_mmio_read(void *opaque, hwaddr addr,
 {
     MegasasState *s = opaque;
     PCIDevice *pci_dev = PCI_DEVICE(s);
-    MegasasBaseClass *base_class = MEGASAS_DEVICE_GET_CLASS(s);
+    MegasasBaseClass *base_class = MEGASAS_GET_CLASS(s);
     uint32_t retval = 0;
 
     switch (addr) {
@@ -2322,7 +2322,7 @@ static const struct SCSIBusInfo megasas_scsi_info = {
 static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
 {
     MegasasState *s = MEGASAS(dev);
-    MegasasBaseClass *b = MEGASAS_DEVICE_GET_CLASS(s);
+    MegasasBaseClass *b = MEGASAS_GET_CLASS(s);
     uint8_t *pci_conf;
     int i, bar_type;
     Error *err = NULL;
@@ -2506,7 +2506,7 @@ static void megasas_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
-    MegasasBaseClass *e = MEGASAS_DEVICE_CLASS(oc);
+    MegasasBaseClass *e = MEGASAS_CLASS(oc);
     const MegasasInfo *info = data;
 
     pc->realize = megasas_scsi_realize;
-- 
2.26.2


