Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067C3D1131
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:21:24 +0200 (CEST)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6D6B-0000xy-2G
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m6D1u-0005zQ-GU
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:16:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m6D1r-00071E-OP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:16:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id d5so754678pfq.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QdO7OdBIizpD4Gxd+4qWfg0rzFXQ7ElPChBSQFS6aiw=;
 b=ovJFBEoUdIhxJAWcfD9bs3bcGS/1BELSc2E0ERm5SU32KNTjUu0Ftd7qSWgWBS0BXD
 tD82k78nd82RiTtCVNrQStEA/xmTotjtVzbgKDhMnZTzjf8bTdpe5JXgu0+DPflNeVWv
 oQRSXqZqD797ARfPW8++rvEKwkZlrDC0Il2pxicUTSIXPfF+X/LsBQiFNWcSGopqRwoJ
 rW0y3hs17cxdGgcWumTgbGhLKzz0TJ8OKZr2tpsDdaGItELpfGJ481JLxGI4eZOo644t
 UTOUMP1rZCkb8xogcPk5xCzJ284azrCb3kN6RCj4A6IgRsjjBJFna4dTyKVLX0iWJkhv
 EWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QdO7OdBIizpD4Gxd+4qWfg0rzFXQ7ElPChBSQFS6aiw=;
 b=a0eDPlo/3hLvPFuu2JchZE9wYon9PHQucIwAMEmEAvhElGXBHhGUXx9OPibyTBuwlV
 6rrNWzlTQFCrjRVH51wIrIXqrdEarG/s7/rTNIZaELfW+R/uvMP0I8njir3kVqvIFTvL
 1NPkks9PumWElOkafnRtRldNKdwgIyaPAfDL5q5ov27t1NwbwXc4nAwZJuV3IQZICgeA
 oHJrEOMQx4wRdnpWVPBlzHylMEDzuTcu3usv/ndVmAvB+5zKYkTPKJnyNBilioXA65gO
 MN0bPmERtUQNtUnWcwagyZ9KnuQ1iDTb6sY6uWqJWWsOEjnM+hBPH9kafATBXY98He6V
 POkQ==
X-Gm-Message-State: AOAM532qG7Z8GOpOpzjjpSNWCegzDtbv+I6kUXaOTL/toVUKaPos13Fr
 vb3vP18lB/vhfK9wCXmEK+lIS5j8C+JrLw==
X-Google-Smtp-Source: ABdhPJyxdJ+QHlkFczgRl4dz4EK9k6jGYWHmnEAeo6tnkrTGkvgvVGVeMQbwObThcQNcCtoJH32sTQ==
X-Received: by 2002:a63:c147:: with SMTP id p7mr36561225pgi.415.1626877014045; 
 Wed, 21 Jul 2021 07:16:54 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.236.27])
 by smtp.googlemail.com with ESMTPSA id
 202sm29694338pfy.198.2021.07.21.07.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 07:16:53 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi: some cosmetic improvements to existing code
Date: Wed, 21 Jul 2021 19:46:10 +0530
Message-Id: <20210721141610.139310-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 jusual@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All existing code using acpi_get_i386_pci_host() checks for a non-null
return from this function call. This change brings the same check to
acpi_pcihp_disable_root_bus() function. Also adds a comment describing
why we unconditionally pass a truth value to the last argument when calling
acpi_pcihp_reset() from ich9 platform.

Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/ich9.c  | 1 +
 hw/acpi/pcihp.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 778e27b659..58d8430eb9 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -281,6 +281,7 @@ static void pm_reset(void *opaque)
     pm->smi_en_wmask = ~0;
 
     if (pm->use_acpi_hotplug_bridge) {
+        /* on root PCIE bus, we always use native or SHPC based hotplug */
         acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
     }
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f4d706e47d..856c6e1b47 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -136,6 +136,11 @@ static void acpi_pcihp_disable_root_bus(void)
         return;
     }
 
+    if (!host) {
+        root_hp_disabled = true;
+        return;
+    }
+
     bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
-- 
2.25.1


