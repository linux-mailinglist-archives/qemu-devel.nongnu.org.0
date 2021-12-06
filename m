Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA246976F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:47:53 +0100 (CET)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muELQ-0002pP-D6
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:47:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muEGq-0004ns-Nf
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muEGn-0003CU-D7
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638798184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LO4FQi9TgUuDxP/ItAKSBtBYehb7pEZ2vlDAuVWviuM=;
 b=corDkCJS7+4q+hk2qpXS64DS4q/lxrt3T2GHMIRXhfudi4NDKh44LwQBcL2G/C7zjb6WVR
 oCcXm3lQnLn5puT9z9spp+DfaAynQ2bEHm6lLYZtwEJp3LZ9jHNZn4j5aYJHI0EKyJb4w5
 lQFIOKqiyNHlXCELQVa13qzpxPPa9UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-pfQUdU0nOHufM3wr5WCHLQ-1; Mon, 06 Dec 2021 08:43:01 -0500
X-MC-Unique: pfQUdU0nOHufM3wr5WCHLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F26F28749A3;
 Mon,  6 Dec 2021 13:42:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0072D45D6A;
 Mon,  6 Dec 2021 13:42:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-7.0] hw/i386/pc: Add missing property descriptions
Date: Mon,  6 Dec 2021 14:42:55 +0100
Message-Id: <20211206134255.94784-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running "qemu-system-x86_64 -M pc,help" I noticed that some
properties were still missing their description. Add them now so
that users get at least a slightly better idea what they are all
about.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc..837f2bff4e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1734,15 +1734,23 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
         pc_machine_get_smbus, pc_machine_set_smbus);
+    object_class_property_set_description(oc, PC_MACHINE_SMBUS,
+        "Enable/disable system management bus");
 
     object_class_property_add_bool(oc, PC_MACHINE_SATA,
         pc_machine_get_sata, pc_machine_set_sata);
+    object_class_property_set_description(oc, PC_MACHINE_SATA,
+        "Enable/disable Serial ATA bus");
 
     object_class_property_add_bool(oc, PC_MACHINE_PIT,
         pc_machine_get_pit, pc_machine_set_pit);
+    object_class_property_set_description(oc, PC_MACHINE_PIT,
+        "Enable/disable Intel 8254 programmable interval timer emulation");
 
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
+    object_class_property_set_description(oc, "hpet",
+        "Enable/disable high precision event timer emulation");
 
     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
-- 
2.27.0


