Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F540B214
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:51:21 +0200 (CEST)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9mK-0000vk-FO
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-00069q-MI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MH-0005LX-Jw
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso2733733wme.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fqwWGJNfdFrIuKBkB90SJ27CXrBjDpDxVfvD5zH9+o=;
 b=ikX0MxOG6IAUlITtLbcw4wbSyLIcc0o+qrwMwLPwRMKTCBMmqMDZltQ5vcTOKft6Jm
 +QZhudG4dvnOHpvFaM4T8k5jglDjZ4bFskzMBrk7WJzdTG7OhfWVtM1njBgDVFK8gkeN
 2Gu3lfF599L8vYP1gRtPVC9NcyR5w8ln9gLPeltLQ2U0AYOGQdQCDfPlgpg6DwkfvUb9
 w1icE341tuY+ZlazSxdv0JClL0EVP4L5DAwucqsNrF3GtCqdPognOOofAzHPl0QTSklq
 LDyShFmgbE6eENMpOvBWzqQtBM8zcgd+IwXiGbh8bZlyzKM/4i1VcoOGZzgZLv82oAQP
 hN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fqwWGJNfdFrIuKBkB90SJ27CXrBjDpDxVfvD5zH9+o=;
 b=fE6e0BtPvzOx/kSLDN2r0lyopv5LxnRAelAMmEG+VgUYN4FE5nl00/bGcdHEv9jf6d
 n4Gmam5v1LGerseBrmC9OrALwRlK9ByJrntnxb6bj49/bzCdkE9RN6cQS3xZPpRtRSx2
 2L/lN9d+Jnw5VRs0z1v6Ia8zQZtqPLE6zba5iqN7M/tm96beSh/4j6uL8Q8cA9Zeg/UO
 tb16SS2l18H+ZUJMQWHU3Nh3Ck+OOZDzVgzK+YJ6CJUR3al/qb0CBM7eGPn+CS+LZKf/
 p63q4z+keRGoFkkZvT8ayB7M6Rn8wvI7YO5R+FlyJqGJxsd9gsVyhmPojdYZeW7+Bicp
 orlQ==
X-Gm-Message-State: AOAM533QTEFpnCrPVryW6fxXz2qeLU2GnfFxKURVftvNg+mUxJZKLEUB
 o+lrYvpVQPM1gNRsYreqPH7PU7zR30/C+w==
X-Google-Smtp-Source: ABdhPJyZSbBPWs5oXa1j8xOjAgNpHh2cYCX3/48rw/cJz1igar8szFRc6Wnhxcy4wdAsjvphsp+cQw==
X-Received: by 2002:a1c:9a85:: with SMTP id c127mr2507326wme.174.1631629463129; 
 Tue, 14 Sep 2021 07:24:23 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 02/10] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Date: Tue, 14 Sep 2021 15:19:57 +0100
Message-Id: <20210914142004.2433568-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ebe9d1726f..23c2e1aaf2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -928,6 +929,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 78fdd1b935..8b04a1d53a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_HW_REDUCED
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
-- 
2.33.0


