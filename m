Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9F4CD864
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:56:47 +0100 (CET)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAIQ-0000Bv-3V
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:56:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQA3C-000458-Aq
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:41:02 -0500
Received: from [2607:f8b0:4864:20::62b] (port=45947
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQA39-00085U-1v
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:41:02 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s1so8037955plg.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIdHbE6ykIml5KAjQxjqLsHwkFzYo1FQ7reN0RwOBhM=;
 b=gC5Ze8gzzfieB9TKDHhteYpwHCw+z2CtjW9sIU+e7Pb0N9N2dcV1wOuGPQylPTug5y
 Lr4ajH/aldnUg8YyU9w9NSIKbhwE4XrQGQZE1FrtEjhGnME7oD4sRSX9SOBDHBoAcbcI
 4JKHqfnACIXNlDEKJbLAQs4PGWxZiLCeSf77JfmtKXfvzoV2zFsJm6rkNGZJeVGn9Evs
 I1I2ITnJ+uOowIkMTgaWcKIEVfC6OGQCPzCgEtVzFPKeFnsTkiJ77os9EhSc7AvLK8Fv
 HtH6em1FCpAh6oEs+BV5ToyGhjPIrB6Ebgfey8Uuh6baTO2FuC3xRMhKTymSqqZYQVDb
 sLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIdHbE6ykIml5KAjQxjqLsHwkFzYo1FQ7reN0RwOBhM=;
 b=aSApmyh5pFnTRb36FTbyywF/Lm/ZA22eg3JXoBjwG21mYAGft8u0TVTaaMJGyyPxDy
 LD/m7Yy8jYjVjk8Q9eweD7vD/9rPsLJin8YGVVNGnJ/rXMs3zm87dbvQVVsGDUU9djJq
 WoSNiKTGi0ffOBJUkBvv4Px+7XJ6kv2jhnLnGA60ZgjDr3W+u/kyhxbOaPDswErspgM9
 Pzd2o/lbmQHlwqAEp9lDX5I9Nku57k9PZGhcVI6SgnbzyF1AkrXV92odPHKx7obhen39
 BuKyb6YFkCW0uS0dRDjNznlduOqDCXp1s9ZsSLr9pvy0dvT9T5rYtZO2jjd27sPjFCwJ
 cyQw==
X-Gm-Message-State: AOAM530+3gkm/BG7LPS9DbxT0jwTTxz5SdvRqZS1fPu2qnNiWy+Mdigi
 rff+N5mVG9shLF7VzfHRQ4Ge/dhIpuk92g==
X-Google-Smtp-Source: ABdhPJw2fi+nf7cKtcrst9WCFFwKB9m5YS/Yz8QyWp73ja/Sq43gFulVrDidczRrrxblEmrELihCGw==
X-Received: by 2002:a17:902:bb02:b0:151:56a8:f80b with SMTP id
 im2-20020a170902bb0200b0015156a8f80bmr29929396plb.30.1646408456854; 
 Fri, 04 Mar 2022 07:40:56 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 ck20-20020a17090afe1400b001bd0494a4e7sm5448366pjb.16.2022.03.04.07.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:40:56 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 4/4] hw/acpi/microvm: turn on 8042 bit in FADT boot
 architecture flags if present
Date: Fri,  4 Mar 2022 21:10:32 +0530
Message-Id: <20220304154032.2071585-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304154032.2071585-1-ani@anisinha.ca>
References: <20220304154032.2071585-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62b.google.com
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
654701e292d98b308b0 ("hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT table")
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
index 68ca7e7fc2..fb09185cbd 100644
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
+        .iapc_boot_arch = iapc_boot_arch_8042(),
     };
 
     table_offsets = g_array_new(false, true /* clear */,
-- 
2.25.1


