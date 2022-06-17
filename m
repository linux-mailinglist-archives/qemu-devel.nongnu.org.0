Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87C54F7B5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:38:54 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BFV-0004gu-5o
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o2B8u-0006p7-CQ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o2B8r-0007f0-BZ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655469119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ODYP43ZwUbA0J+DBYalhSlFoxW77NJVyQhSYpKZDsTM=;
 b=gsNsSqy35954324E/48ruRIGEziETIo25Awz/joEN673vETTWiolZWWyllETC12pM2Iocj
 jYKsJlxC7Nd7PxVotp8ceQ9KEAS+q2KyLW2Swja46FVCrEtUgHvF/jitY+cs7I9SZ+QqCy
 +QAyd/7c3pZCodMXoLPWa145kPVXE4Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-8rk3PAmPMCmSprRD9bSLOA-1; Fri, 17 Jun 2022 08:31:57 -0400
X-MC-Unique: 8rk3PAmPMCmSprRD9bSLOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65F59384F80B;
 Fri, 17 Jun 2022 12:31:56 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 022A040CFD0B;
 Fri, 17 Jun 2022 12:31:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v1] MAINTAINERS: Collect memory device files in "Memory
 devices"
Date: Fri, 17 Jun 2022 14:31:51 +0200
Message-Id: <20220617123151.103033-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xiao Guangrong doesn't have enough time to actively review or contribute
to our NVDIMM implementation. Let's dissolve the "NVDIMM" section, moving
relevant ACPI parts to "ACPI/SMBIOS" and moving memory device stuff into a
new "Memory devices" section. Make that new section cover other memory
device stuff as well.

We can now drop the "hw/mem/*" rule from "ACPI/SMBIOS". Note that
hw/acpi/nvdimm.c is already covered by "ACPI/SMBIOS".

The following files in hw/mem don't fall into the TYPE_MEMPORY_DEVICE
category:
* hw/mem/cxl_type3.c is CXL specific and belongs to "Compute Express Link"
* hw/mem/sparse-mem.c is already covered by "Device Fuzzing"
* hw/mem/npcm7xx_mc.c is already covered by "Nuvoton NPCM7xx"

Thanks Xiao for your work on NVDIMM!

Cc: Ben Widawsky <ben.widawsky@intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Julia Suvorova <jusual@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaa649a50d..909e8dbb1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1840,7 +1840,6 @@ R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
-F: hw/mem/*
 F: hw/acpi/*
 F: hw/smbios/*
 F: hw/i386/acpi-build.[hc]
@@ -1851,6 +1850,7 @@ F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
 F: docs/specs/acpi_cpu_hotplug.rst
 F: docs/specs/acpi_mem_hotplug.rst
+F: docs/specs/acpi_nvdimm.rst
 F: docs/specs/acpi_pci_hotplug.rst
 F: docs/specs/acpi_hw_reduced_hotplug.rst
 
@@ -2158,15 +2158,6 @@ F: qapi/rocker.json
 F: tests/rocker/
 F: docs/specs/rocker.txt
 
-NVDIMM
-M: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
-S: Maintained
-F: hw/acpi/nvdimm.c
-F: hw/mem/nvdimm.c
-F: include/hw/mem/nvdimm.h
-F: docs/nvdimm.txt
-F: docs/specs/acpi_nvdimm.rst
-
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
@@ -2588,6 +2579,7 @@ M: Ben Widawsky <ben.widawsky@intel.com>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
 S: Supported
 F: hw/cxl/
+F: hw/mem/cxl_type3.c
 F: include/hw/cxl/
 
 Dirty Bitmaps
@@ -2704,6 +2696,19 @@ F: softmmu/physmem.c
 F: include/exec/memory-internal.h
 F: scripts/coccinelle/memory-region-housekeeping.cocci
 
+Memory devices
+M: David Hildenbrand <david@redhat.com>
+M: Igor Mammedov <imammedo@redhat.com>
+R: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
+S: Supported
+F: hw/mem/memory-device.c
+F: hw/mem/nvdimm.c
+F: hw/mem/pc-dimm.c
+F: include/hw/mem/memory-device.h
+F: include/hw/mem/nvdimm.h
+F: include/hw/mem/pc-dimm.h
+F: docs/nvdimm.txt
+
 SPICE
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
-- 
2.35.3


