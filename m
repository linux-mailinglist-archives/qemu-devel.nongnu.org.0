Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649B3D10E1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:09:40 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cup-0001Ri-Lc
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m6Ct1-00077K-BO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:07:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m6Csz-0000pO-NG
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:07:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so4072623pju.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/Pyv8xmzSyGNnmJMgLPs9mjTQ+qkTHq+qOUuumqWjg=;
 b=FNSRxlIiyDN+4cQIpk9Tje7KDQ35pvOx5FAntSsHScE+22TTmvo3eUW0lrUrHSl2o0
 wOZg2IO5cpXT+w6khxGiLi4FcLFunGXp4RzD0I91Sqh5l/VEsvXTCNabRcDzG6P0S6UV
 kNZ5Y9hjHs8oTgoMhEiT9qNMZelTd2urA8lO8DZ58DVdceHSmaMMHLS/NPQNxDEMRpXp
 N/zgS+1wsAZOpHWmlGVRZQG/bzgfWr7edTjvbqDh7iygEO5r5ufDjbvLZ+ZMp5DAwq8v
 wjGuYVCn3OegE5CFuBvfSe5FZXybWDpD9wgnQcpUCjNgrMdOIgBYOkjRDnOBi3Za7rwV
 cEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/Pyv8xmzSyGNnmJMgLPs9mjTQ+qkTHq+qOUuumqWjg=;
 b=MStbGG1YoWS57zrQLyzzfGFQk5WC8MQTpIlEqWGim7N5rRxcgn4B44+bd9k6arkFTJ
 4tnHZodr0DhMZvtUBweU8d/BRufeNJX0oakBCZC1vMylAJRDHNVoUm0UWOA9wedWvPcV
 IJi5CrSISkj5qm4SRAiV9ujg879RMyaI2EcCNeig6DXvo+va+Nt9TEXCD8h8BwCSZGag
 vpyfPfEguASkO2juVo3OGG2T7kJ3Lf+Rtl5XKJ1rj4F/udeuvVjIRn97Iu9c4YVRsUVF
 m0pm16qlYqLpZNxHfdq/Cwb2NM9CUaZoNKNQLaJZRJXd+0bPB5ZoxJroA4MaF1G4F8OD
 SEhA==
X-Gm-Message-State: AOAM530Qa5UjPr6cPiYE73ihGMJ/4WAaHLA1iEjItyWAFvFj4Ca9ePX6
 rgbL99I2GsVTqEGBO9LgGy8BCmgqGrQ2Xg==
X-Google-Smtp-Source: ABdhPJzpHQoAFrJNMgIK/tvw1P4frBxCQzuvbMPL0wsPvFScj+zzAhc1biUWQQgqsy5Zy8ypPv31HA==
X-Received: by 2002:a17:902:bcc3:b029:11c:5ffb:61fb with SMTP id
 o3-20020a170902bcc3b029011c5ffb61fbmr27835255pls.18.1626876463314; 
 Wed, 21 Jul 2021 07:07:43 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.113.1])
 by smtp.googlemail.com with ESMTPSA id u15sm30085305pgf.77.2021.07.21.07.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 07:07:42 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi: some cosmetic improvements to existing code
Date: Wed, 21 Jul 2021 19:37:14 +0530
Message-Id: <20210721140714.138638-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
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
 Ani Sinha <anirban.sinha@nokia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <anirban.sinha@nokia.com>

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


