Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0952927F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:12:17 +0200 (CEST)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi0n-0006FQ-2w
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhi-0006K4-7D
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhg-0006WC-NL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
 b=Son0h5zcnHrMHZViq1KLVD1jldqdz3m9q8wXu8NwvB0suPrZnNY3OY/Fs5zAg3jepBTELA
 2hMougdcI22m+msX6GgMvNn8rSv3itCXs7YeSEoavgDn7MH41J4FFA473HG++ADuOV2Zr0
 S8TKweGq5QlKh8bqzaKplSrRqy92fLo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Y3bj69bsPImT4pz96donTQ-1; Mon, 16 May 2022 16:52:31 -0400
X-MC-Unique: Y3bj69bsPImT4pz96donTQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b14-20020a05640202ce00b0042aa312ff51so3990053edx.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
 b=V9Suyy6zDVu5gvBkSNfxXbXqFLpu9LtohruXNn0v5WvTFQ5nhC5Sgl1Z95QH5kDyQP
 w/3GoF9iB4Gomkyy9HFdZFMHvXbM1aRTcS00BsOJi3PaAuQCopobCDX/tMNg65f/3WTl
 GsI0FqlfWyen5MzhkrRIkocdX2enA3D5NUu9SVgx6Az1DdzwxWiswzhTY4lFJ4ZiFK9e
 VkgX/PQzrSA4r9Dd/wfa129muEkXI+WE94s70DoVvj77wrp0WBrOwsN1En7oEnIAxE8S
 sNqHh81mG3Ec7V7/k6srhwgNUZ9uLy96oDZ9WrHlhkAKDZarOeMLv+rOcuV8ZQho1TD1
 sewA==
X-Gm-Message-State: AOAM533s9E9P6NcwaUXMbAH4QRAlBDuM17qop6bnV7flkTnNDKCeXu6v
 0wXmooHMzWqSIyaPKrTZwXEZu6aU0QRJrsx8yc1Pc1q8hAhB1oGAiamW3/K2enfsCJcCMJ3k/NB
 9qsqKD/2X+fh0i3x8g67cZS5i59Io4aZ+OJ9vi+0iI+PU0Ti9V4EToq4cKAU+
X-Received: by 2002:a17:906:d54b:b0:6f4:cea3:843b with SMTP id
 cr11-20020a170906d54b00b006f4cea3843bmr16374518ejc.40.1652734347338; 
 Mon, 16 May 2022 13:52:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfyj+0Ly4W2/OUE95IKDPU4QwE0pSTiRArTLB1vRRj8GzOCoA904PkplpKsNm7HJ+SSZPSew==
X-Received: by 2002:a17:906:d54b:b0:6f4:cea3:843b with SMTP id
 cr11-20020a170906d54b00b006f4cea3843bmr16373576ejc.40.1652734329690; 
 Mon, 16 May 2022 13:52:09 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 ev6-20020a056402540600b0042aa5a74598sm3270999edb.52.2022.05.16.13.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:06 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Subject: [PULL v2 31/86] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Message-ID: <20220516204913.542894-32-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This adds code to instantiate the slightly extended ACPI root port
description in DSDT as per the CXL 2.0 specification.

Basically a cut and paste job from the i386/pc code.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-30-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 20 +++++++++++++++++---
 hw/arm/Kconfig          |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e7e162a00a..7c7316bc96 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -5,6 +5,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/acpi/cxl.h"
 
 static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
@@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
+            bool is_cxl = pci_bus_is_cxl(bus);
 
             if (!pci_bus_is_root(bus)) {
                 continue;
@@ -154,8 +156,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             }
 
             dev = aml_device("PC%.02X", bus_num);
-            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            if (is_cxl) {
+                struct Aml *pkg = aml_package(2);
+                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+                aml_append(pkg, aml_eisaid("PNP0A08"));
+                aml_append(pkg, aml_eisaid("PNP0A03"));
+                aml_append(dev, aml_name_decl("_CID", pkg));
+            } else {
+                aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            }
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
@@ -175,7 +185,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                             cfg->pio.base, 0, 0, 0);
             aml_append(dev, aml_name_decl("_CRS", crs));
 
-            acpi_dsdt_add_pci_osc(dev);
+            if (is_cxl) {
+                build_cxl_osc_method(dev);
+            } else {
+                acpi_dsdt_add_pci_osc(dev);
+            }
 
             aml_append(scope, dev);
         }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 97f3b38019..219262a8da 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_APEI
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
+    select ACPI_CXL
 
 config CHEETAH
     bool
-- 
MST


