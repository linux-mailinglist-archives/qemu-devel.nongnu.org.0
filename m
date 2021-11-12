Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E449244E56A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:11:53 +0100 (CET)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUTJ-00062x-2N
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUR2-0003dq-Ox
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUR0-0006L2-RX
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i05v79tYqnw8BmiYaLJERL6iIligb+LsXvEFjBAwtn8=;
 b=OoZeMydnlnVAvo0PZ0L00WnqM8rE01Ai18m7XRrqX3Vgt7Y1ZfLLdOzHe2XGVCPjGT9iBK
 nb7YL/yGqKw3LCavNc6FbxXjy1bCGKLP4aFHlRNulk8zHAAOpk22fKWOzVxhQqOiMEtOeb
 O1k0Ib1lS0aT37UkdcbCfDmCXsH0EM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-sE4tDO8HNxqb5X2UAdOCzA-1; Fri, 12 Nov 2021 06:09:24 -0500
X-MC-Unique: sE4tDO8HNxqb5X2UAdOCzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389A9102C7EC;
 Fri, 12 Nov 2021 11:09:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4431B5C1D0;
 Fri, 12 Nov 2021 11:09:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v3 1/5] pcie: rename 'native-hotplug' to
 'x-native-hotplug'
Date: Fri, 12 Nov 2021 06:08:53 -0500
Message-Id: <20211112110857.3116853-2-imammedo@redhat.com>
In-Reply-To: <20211112110857.3116853-1-imammedo@redhat.com>
References: <20211112110857.3116853-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mapfelba@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-stable@nongnu.org, kraxel@redhat.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark property as experimental/internal adding 'x-' prefix.

Property was introduced in 6.1 and it should have provided
ability to turn on native PCIE hotplug on port even when
ACPI PCI hotplug is in use is user explicitly sets property
on CLI. However that never worked since slot is wired to
ACPI hotplug controller.
Another non-intended usecase: disable native hotplug on slot
when APCI based hotplug is disabled, which works but slot has
'hotplug' property for this taks.

It should be relatively safe to rename it to experimental
as no users should exist for it and given that the property
is broken we don't really want to leave it around for much
longer lest users start using it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
CC: qemu-stable@nongnu.org
---
 hw/i386/pc_q35.c   | 2 +-
 hw/pci/pcie_port.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 797e09500b..fc34b905ee 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
                                           NULL);
 
     if (acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
+        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
                                    "false", true);
     }
 
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index da850e8dde..e95c1e5519 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
-    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
+    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.27.0


