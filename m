Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCD63F0F1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:56:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iQC-0004WH-70; Thu, 01 Dec 2022 07:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPs-0004Fr-St
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPl-0008D7-Kw
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pURPJ8TNbB3lFBdmzy5ka69deY03W+cS5xx4sJp8TDE=;
 b=NAWVWhsCuHhoQVPA4+Sc8X6CbmT2yhrSb9Otb/S1+3BXPGIu0WHhgVkw4ZRJg5qx086E6e
 4cm/Bp2wY5Z/5sbenljzsV6m2MUU17zHc9plDXtwV3iGrg5Tj1IPHLM+7BCenU1bdimkjd
 fsEhCWPX/ju8xWVcfnRw8fGHhP4M8+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-H5zj7IcQPkWBOTZjQcL_hw-1; Thu, 01 Dec 2022 07:11:37 -0500
X-MC-Unique: H5zj7IcQPkWBOTZjQcL_hw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E96485A588;
 Thu,  1 Dec 2022 12:11:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3180C4A9254;
 Thu,  1 Dec 2022 12:11:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCE0121E6930; Thu,  1 Dec 2022 13:11:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 01/13] pci: Clean up a few things checkpatch.pl would flag
 later on
Date: Thu,  1 Dec 2022 13:11:21 +0100
Message-Id: <20221201121133.3813857-2-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix a few style violations so that checkpatch.pl won't complain when I
move this code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..53ed447115 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1851,10 +1851,12 @@ static PciBridgeInfo *qmp_query_pci_bridge(PCIDevice *dev, PCIBus *bus,
     range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
 
     if (dev->config[PCI_SECONDARY_BUS] != 0) {
-        PCIBus *child_bus = pci_find_bus_nr(bus, dev->config[PCI_SECONDARY_BUS]);
+        PCIBus *child_bus = pci_find_bus_nr(bus,
+                                            dev->config[PCI_SECONDARY_BUS]);
         if (child_bus) {
             info->has_devices = true;
-            info->devices = qmp_query_pci_devices(child_bus, dev->config[PCI_SECONDARY_BUS]);
+            info->devices = qmp_query_pci_devices(child_bus,
+                                            dev->config[PCI_SECONDARY_BUS]);
         }
     }
 
@@ -2612,8 +2614,9 @@ static void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
                    pci_get_word(d->config + PCI_SUBSYSTEM_ID));
     for (i = 0; i < PCI_NUM_REGIONS; i++) {
         r = &d->io_regions[i];
-        if (!r->size)
+        if (!r->size) {
             continue;
+        }
         monitor_printf(mon, "%*sbar %d: %s at 0x%"FMT_PCIBUS
                        " [0x%"FMT_PCIBUS"]\n",
                        indent, "",
-- 
2.37.3


