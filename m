Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173874CD54B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:37:45 +0100 (CET)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ87s-0005R0-6C
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:37:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ7ol-0002SD-6f
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:18:01 -0500
Received: from [2607:f8b0:4864:20::434] (port=42873
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ7oi-0006vV-6N
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:17:58 -0500
Received: by mail-pf1-x434.google.com with SMTP id a5so7606018pfv.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BfIi+wwBcTEf9JXnlqHUv6W4/J1QDWuX1YeTSZOW1rY=;
 b=3N9MRAer+eyakTIlDcXuM0vFXi1Dv/biDb7MVRsIJJHnC9JSntaTAny0U2BH+L834U
 dStWqTWuX1MD1i5WrGRLPuCY42p1l7uE+9/ayK+S7sSFzv6doezq2jme2njDLaouDL2f
 eHluQsjgbDna6CJmLmqmttchgWMhya46c/wbUFV4o7q7zq9/nUpBLFJFWD3/leELX5ed
 UQiuIYMo4MSsvBxJOt2ttbPaR5JhosA5vSXvNdIA8krPaveauj5aVjIXy+sV1ubTtKLJ
 sKDwHgI03tbhKiJ0hc0MI5lR5XY1XCbAqx9814p1quPtlOIy0iU/XqCCFwyXZzZnJZmB
 Kr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BfIi+wwBcTEf9JXnlqHUv6W4/J1QDWuX1YeTSZOW1rY=;
 b=cjRpNum0NmoxkkCzAXMSCRfMCBB21znVhMSRIZi8RekwNt44bsPg7t7Y3Zcf918TrQ
 GsIW2lCUDFHs8R/aeDmPntnuRjkVKx8aBrU74VV5rHWdN7/gxnJm3Gt+YS3MTOqS7wQJ
 caObzHNSCeV1KtugnvSe3OF0sKlrWT4baTZ5KCZs3VFlHh5YaFMfR7UtwOcNDFObY1aQ
 Qbta4AFZFPuzP293DUI75jL3W6HH3Me407r6qSPjg94QvgBWb+PnBs4TD4uxsBbkiqFt
 oQEbaHljs5mkkw1ku8i2TsFyMsXu9dBP2BhzNPhcvQhOb3QHBiuRAUB0wBDOHA1fZUkE
 VAJw==
X-Gm-Message-State: AOAM530Zf7ywcOXhJ4XBAl/hjeMMxd3BQfmER168jAG7CysgLiIlOCCG
 sy+N5vzHMen4SIpWfS+wKW0gNM3TKPFaqg==
X-Google-Smtp-Source: ABdhPJzeo8drtlZB3KLD6P8fAWAiLLoRzG1CvYMgciNQjkIzZmOYX9Ry8H36vHsdbVcXwShakhvAbA==
X-Received: by 2002:a05:6a00:13aa:b0:4f1:1e5f:1c39 with SMTP id
 t42-20020a056a0013aa00b004f11e5f1c39mr43190625pfg.24.1646399874280; 
 Fri, 04 Mar 2022 05:17:54 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm11089424pju.8.2022.03.04.05.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:17:53 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH] hw/acpi/microvm: turn on 8042 bit in FADT boot architecture
 flags if present
Date: Fri,  4 Mar 2022 18:47:41 +0530
Message-Id: <20220304131741.1847229-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The second bit of IAPC_BOOT_ARCH in FADT table indicates the presence of
keyboard controller implemented as 8042 or equivalent micro controller. This
change enables this flag for microvms if such a device exists (for example,
when added explicitly from the QEMU commandline). Change
1f810294bb31bf6ac ("hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT table")
enabled this flag for i386 q35 based machines. The reason for doing the same
for micro-vms is to make sure we provide the correct tables to the guest OS
uniformly in all cases when an i8042 device is present. When this bit is not
enabled, guest OSes has to find other indirect methods to detect the device
which we would like to avoid.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-microvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 68ca7e7fc2..12452cb2e5 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -37,6 +37,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/usb/xhci.h"
 #include "hw/virtio/virtio-mmio.h"
+#include "hw/input/i8042.h"
 
 #include "acpi-common.h"
 #include "acpi-microvm.h"
@@ -187,6 +188,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
             .address = GED_MMIO_BASE_REGS + ACPI_GED_REG_RESET,
         },
         .reset_val = ACPI_GED_RESET_VALUE,
+        /*
+         * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
+         * Flags, bit offset 1 - 8042.
+         */
+        .iapc_boot_arch = i8042_present() ? 0x1 << 1 : 0x0,
     };
 
     table_offsets = g_array_new(false, true /* clear */,
-- 
2.25.1


