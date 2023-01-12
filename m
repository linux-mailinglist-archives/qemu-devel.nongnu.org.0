Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ECB667459
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:06:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBK-0002Fv-5t; Thu, 12 Jan 2023 09:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-00026U-4V
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005si-E2
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IB+X9dds/VOg4iiQyWXLhAaedV6degi+N/6BBVa3SKo=;
 b=VWCFKXW83BA6Zl3em+t3QI0qTHfQ2pRSevaVGGFyJOXf0R1hURKfM+gtWNhx6DVPMl5Jpj
 w6F/WHUALOMb9XUf2BEjFvCvM/VErXNQOFcqsHB3mw0vD92N/BbxHh9jNdTPJh/6Pv/kqC
 Lkno58dxpC8fmlmIcW7//oh6aqO2Byk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-7u28QRWbMUaZpwP2dOiyGg-1; Thu, 12 Jan 2023 09:03:21 -0500
X-MC-Unique: 7u28QRWbMUaZpwP2dOiyGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FEA03C2275C;
 Thu, 12 Jan 2023 14:03:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC0E94085721;
 Thu, 12 Jan 2023 14:03:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 02/40] tests: acpi: cleanup arguments to make them more
 readable
Date: Thu, 12 Jan 2023 15:02:34 +0100
Message-Id: <20230112140312.3096331-3-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 no functional change

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Thomas Huth <thuth@redhat.com>
CC: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 8608408213..08b8aee76b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -951,8 +951,7 @@ static void test_acpi_q35_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1",
-                  &data);
+    test_acpi_one("-device pci-bridge,chassis_nr=1", &data);
     free_test_data(&data);
 }
 
@@ -962,14 +961,12 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
-    test_acpi_one("-device pcie-root-port,id=pcie-root-port-0,"
-                  "multifunction=on,"
-                  "port=0x0,chassis=1,addr=0x2,bus=pcie.0 "
-                  "-device pcie-root-port,id=pcie-root-port-1,"
-                  "port=0x1,chassis=2,addr=0x3.0x1,bus=pcie.0 "
-                  "-device virtio-balloon,id=balloon0,"
-                  "bus=pcie.0,addr=0x4.0x2",
-                  &data);
+    test_acpi_one(
+        " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
+        " -device pcie-root-port,id=rp0,multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x2"
+        " -device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1",
+        &data);
     free_test_data(&data);
 }
 
-- 
2.31.1


