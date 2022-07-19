Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB805796CE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:56:03 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjxS-0005cZ-Gn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjuh-0007ol-1J; Tue, 19 Jul 2022 05:53:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjuf-0004KD-EV; Tue, 19 Jul 2022 05:53:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b26so20795993wrc.2;
 Tue, 19 Jul 2022 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y4/sFP7yGzJ3jqQlSQoseckKqf4KKkCLOr1BJ+fGpHA=;
 b=NiA5kdJIBrQhhHKP5Pz1SDxTtEuPKHCqFbGwvaGwffto/va4uVR7X1tIyrLGM/rVoG
 ieDkqH4Y5xtf3yb9Np9KJtPLN5jFMWjWYJIe3+T0KS65pxD2akEDaCL5lhyS3nlWrvPf
 u0kzSyms340PiwLBFDpMY5uYqu8cwQrIaG303LibGe5/I2Xl9ZBYtWpdfwaLgtgmWaJE
 jatoOAthnPk9iKAAzbY7yC97+HcNy9h99A3KWXG/ZhJdqxktPfLA1fweYCCUBgpJk3k5
 cx3FdEkecP8zjbmKPKlhKQDwxjE/Q9ZG/bPXKleWKY17UBohNi7LmTSmMrSsRhRj7l4Z
 3IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y4/sFP7yGzJ3jqQlSQoseckKqf4KKkCLOr1BJ+fGpHA=;
 b=75uxT3lizgE28PqSFra98yAQ2TO9SEg/Jk6fu23jwG3kgVNPyNs/Tw27MA66bJENqy
 j3579/Y1WhgLyF7CYajZ9bfGu5qmL45q3PDWcU1d5Hni5DJXFC/zIulthEmelb9qHjrI
 1SsD0bPopjaU9+6AA03KKC67GRNA6lsIzpL5kGcCJ8iP6jdlIbjogcsGgJyCv6Vj4e9Q
 zICS09Tms0hee+/vP7DJBfdHxrKcuYNMuIbVdpxQeSB15fvNqJroxSyalTyuATsvEhA5
 8ngrg/rVcR1DvBwpEnRTJWYENi5R68p9gW+STgvoM5gvMKJqLuyFVFEYVeYc1j0Q4AqD
 0BbA==
X-Gm-Message-State: AJIora9KPRVdubrSdWWaZN54AWbKX/dAxIjfrsJxh5a60arsBgsOLArb
 2kUd1alLSws9sva/3/HFg3A=
X-Google-Smtp-Source: AGRyM1vd3tfHoeITVOklcMqWv8wbh7shDZwgn5s0c+9FqAkQaXkRv32EDuj/aMK8JDFAtqCjW5UaUQ==
X-Received: by 2002:adf:b650:0:b0:21e:24a1:b839 with SMTP id
 i16-20020adfb650000000b0021e24a1b839mr5621318wre.207.1658224387221; 
 Tue, 19 Jul 2022 02:53:07 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b0021cf31e1f7csm8326667wrr.102.2022.07.19.02.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:53:06 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 6/8] hw/arm/virt: Enable HMAT on arm virt machine
Date: Tue, 19 Jul 2022 10:49:48 +0100
Message-Id: <20220719094950.1049516-7-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/Kconfig           | 1 +
 hw/arm/virt-acpi-build.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..f19b55e486 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
-- 
2.25.1


