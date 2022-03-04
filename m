Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A44CD7D8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:32:39 +0100 (CET)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9v4-0002Ix-Mb
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9X8-0004te-I1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:56 -0500
Received: from [2607:f8b0:4864:20::52d] (port=45891
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9X7-0003lU-0y
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:54 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z4so7728630pgh.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ID9ZZRj4P74EuP2MhIWTtzIMoOckfhqbGZm7DoiN+7k=;
 b=Aq/WNR89gyUfAdLK7+B7lYtRwgkEbQw3dNG7zit7Elzl8Th1AuEvr/8BikiPUsjiw9
 ZdTSPhfg0x/uIJ5WstYFcXXicn1k1ChfiEnQjM2PbHd1NbjsSiIAyLe/CMhPpCHdfwXC
 VHbHA3px/xdxsRuKAPaIgecYX4OuTajgO3SWqS7NqkVtfpBjvXHEYKeSuYy2ZongcAKp
 iL2bQNBXmshLaVbArIe7Z80xQc8/Mi+dHEAfSRz55B8/FQgi+3zTiwj7OOOAUeLbRXSR
 SbT5+WczIVi27+GV0HgYh+UgRkeABU1W8tvfAo7eWERJf0Nt+1wSuF2iQ9SVilIx5an+
 rklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ID9ZZRj4P74EuP2MhIWTtzIMoOckfhqbGZm7DoiN+7k=;
 b=rt/EjMdFtPvgvf389lCNWe8abLgYy0Rlc2juDMfyxuFY6Cld0tF8t8Z8NdXA10tkZ3
 PmHysWkCO/peONw7wS2c8WyjKqca7q2Ogp59AOIIp0ilbkNBnjZToKJqfXGTS+JGgbYY
 141ueTG71tjhznc5UUYZOgsdEySh86Im28BcxW8/sDc7mpjza6TwYVfBZtK9UH2q0aHC
 /ZrI6qB6EZspnfo62KQSYqi9fODy5atU0BJAi+b7W+15ebOI4KFkO/0aZ461QwOF2nx0
 1juJxP8ETCyISEDRhAkui1VGZh5oemOvb+UUnDPBmhW3n81RqYYQvn3Y3sVAQ7d+0ReX
 vrLg==
X-Gm-Message-State: AOAM530B9jMzyaBKYxv+fPrlhHGibscW2yiN6QLf5ocRJlYf8OsfFr7P
 v9dohHQee8AJMHFQvIftVvOk5bBS3+CVqg==
X-Google-Smtp-Source: ABdhPJx6/e8YhzNpWia0rM9Uoq0gueAMh2yi15W4Lov4ZuxnOfbp62xpgd0be6+vqtUAFMDbAlngKQ==
X-Received: by 2002:a05:6a00:2402:b0:4e1:3df2:5373 with SMTP id
 z2-20020a056a00240200b004e13df25373mr43397287pfh.40.1646406471288; 
 Fri, 04 Mar 2022 07:07:51 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 nr22-20020a17090b241600b001bef1964ec7sm8278861pjb.21.2022.03.04.07.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:07:50 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 4/4] hw/acpi/microvm: turn on 8042 bit in FADT boot
 architecture flags if present
Date: Fri,  4 Mar 2022 20:37:22 +0530
Message-Id: <20220304150722.2069132-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304150722.2069132-1-ani@anisinha.ca>
References: <20220304150722.2069132-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52d.google.com
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


