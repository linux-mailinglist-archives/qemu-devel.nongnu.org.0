Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D03D59D3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:53:57 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m807I-0006pI-Jz
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m805q-0005RS-NW
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:52:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m805o-0003Zn-Qp
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:52:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id t21so11311535plr.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F1wYxlOf9hTWb/t0NEphNFRymKw1grBMbGFy1xuXcfc=;
 b=aEmIDByZdrL8ml+KqLdW9vLUkk65jXsYZsRmPgHgSzqSV5UClXcbGPc96hLK2gbvoO
 0CTugssNWVIgdicuUYfqpHJN63gP4a4bVBmFTtTwBHgdurtlPPmQ7dOtE570owBuEy7q
 cFiVmAbNWXZYzitBMlbrj5pvB2+6yxsZ/mOltbMYsR3txoVMYlUKhZ+164h7M9G/P/05
 xzBtp4CoysHHN6dloOOkmTnUA6IRkrsLjYOGoijeRcuFzII4x0lA9yPV2uhu1+Wm3gQA
 IeyRMVFiyo1iFGiIxgg+UigHb3RTYpujpe7/PGxg/gKd6JDhPfTgPGSoOYgV7xwvYRSN
 6CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F1wYxlOf9hTWb/t0NEphNFRymKw1grBMbGFy1xuXcfc=;
 b=FqqSSyFiJfvZa7NRRZcRyKxx4xoBzP5kuRRyMXhWpKX5WCGVpic3Vp/LMSpVnRUUHs
 B1cknhLPtr+hMUAwSFLHQURDbq+gjvG6XlyoLA0QBt9F6g4z0ha10YstdCxoHrKSwy/8
 75k3ARW4/8COSmUrcxXcbZtHpJtQ1B0iUREaHjCK8zJj7JZEAgkV84O3w/vC+Fhq/LY0
 dr7a62N8tZfJ1Trj9uI2TWX/qUf4s/YQkmJ1OP7UPWjDNHOXO8P9Xx94YwByggaoANnm
 +XzFoRCgrj7HHEGkfzF4hZegMKBbpQ/kr4P2o7H6YZccLftHs+I81j1I1BwkMTZbExX9
 X66A==
X-Gm-Message-State: AOAM531okszxULStzag8lFGEu3ifsVny5Nldz54+hdkDn3hX1dBeTlh/
 Vx19AfCIVkdjQJTZwYkqxrcRB24Yi+/JCQ==
X-Google-Smtp-Source: ABdhPJyVoh6qz8Xkpwp876+GDT2qNrBE4+hv3vzN5cbDPITR0gBiZgHfzUJEryuLXVecRJGlf1d/VA==
X-Received: by 2002:a65:5a8f:: with SMTP id c15mr11911642pgt.143.1627303942428; 
 Mon, 26 Jul 2021 05:52:22 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.238.202])
 by smtp.googlemail.com with ESMTPSA id m18sm12429721pjq.32.2021.07.26.05.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 05:52:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/acpi: some cosmetic improvements to existing code
Date: Mon, 26 Jul 2021 18:22:09 +0530
Message-Id: <20210726125209.37573-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
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
acpi_pcihp_disable_root_bus() function.

Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 5 +++++
 1 file changed, 5 insertions(+)

changelog:
v1: initial patch
v2: removed comment addition - that can be sent as a separate patch.

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


