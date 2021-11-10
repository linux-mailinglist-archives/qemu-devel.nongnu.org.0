Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F378B44CB21
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 22:14:32 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuvQ-0001ex-4l
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 16:14:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkuss-00043g-VZ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 16:11:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkuso-0002Vl-QB
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 16:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636578708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMC66D+EJ+hrT/UBOk41MdZi04+cRd/w1xnlN0O59wk=;
 b=iyj5StgSNErxOoAQchWHKMwXa+lfzC3AOZAG/6/dTGYifAy4vNK6SOIkgXWMiNCK+Ymc6b
 4C58ikk0bNJf+4aZc9pCBfvG7sbsX+I6tfm7/bW6rMjUjIAZOuGTl/Xkgj3G1GanoybFys
 bY9B8iKDzu5JRbdmPst87RQrm0XzXh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-d09XQ2SYPpW9V-5k4U_4Qw-1; Wed, 10 Nov 2021 16:11:47 -0500
X-MC-Unique: d09XQ2SYPpW9V-5k4U_4Qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F178718D6A2A;
 Wed, 10 Nov 2021 21:11:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 797DE67840;
 Wed, 10 Nov 2021 21:11:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v2 1/5] pcie: rename 'native-hotplug' to
 'x-native-hotplug'
Date: Wed, 10 Nov 2021 16:11:36 -0500
Message-Id: <20211110211140.3057199-2-imammedo@redhat.com>
In-Reply-To: <20211110211140.3057199-1-imammedo@redhat.com>
References: <20211110211140.3057199-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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


