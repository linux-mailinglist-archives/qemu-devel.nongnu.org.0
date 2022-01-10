Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC295489B8E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:47:54 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vxh-0004f7-WA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkY-0002Mv-OW; Mon, 10 Jan 2022 09:34:18 -0500
Received: from [2607:f8b0:4864:20::92c] (port=45946
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkW-0007Rh-N2; Mon, 10 Jan 2022 09:34:18 -0500
Received: by mail-ua1-x92c.google.com with SMTP id x33so22416217uad.12;
 Mon, 10 Jan 2022 06:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqH+TJKUyTY8pGe2wkpb5CKKG+nyDWsKCWuYAvV1Fr8=;
 b=kqsPMDnvifIZTKyj5r5nriXsxjvMexnySlievOadWu+uM6iIk5sComcsd6AVioP1CB
 TULMz0Id9/irBK41/kY9Poc1phkDLLQ2p1eI5VqXEwRsEmTyiu/kHJx7Br36uB/tbJL1
 Qr68dxRfiBjSch2uJQVD6C1hRcStG/DUQb6hfGI8+br1kopp67xdMxlHONzYT5QM9l/W
 2sAIbaTiN9RdcTBoItROPoXUqZjrW3k11yVLMWku9fR9yf71x49nAvVOGW7lh22/rVzu
 IVJE+hd1F9UJuUdbx6DV+v+f4hYgZO75NTP8+tuGOYbrpNKEz2Tl6rbk6NgBRDb6yqvC
 qXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqH+TJKUyTY8pGe2wkpb5CKKG+nyDWsKCWuYAvV1Fr8=;
 b=AH7fZroN+YinFFzFhpwfgldBprQaCdJprykYLm9o7ydYSEc4a2CoieJOere5wT0tHo
 5q5YY+aG59wj/xG02+tV8OQz4TtH+6q8eO52HqppS0hzI86cBmuUKv7snC+HPlzdZZPV
 bHTM3s/FiiN5Ew4tbzGSw9b1X70SeqL66gxUmhmkmDne6X/sjw4Bv7GRCx8FH8eOfK83
 vMztHM+L3rrqHNELoT9qNzlhhse4WWFBl0cUcWhFtsxhCjkcOpIEyR/xQ9kIQlPZbkbT
 MK0Cr7w8asG/NzWzPXfFjYcLGBXBL2NzhvGiBaZUnS1DQLO7JQu3Ci3E4GIQPHkQhXno
 mgFQ==
X-Gm-Message-State: AOAM533G3sQk7JZxVWmuyih+wCZ4i2I60iAKKHwX9DHSKyIhnQXihnaC
 /95UMYsB1d3Zhe0D2mwwLVZjds5SbQmwS/+/
X-Google-Smtp-Source: ABdhPJxDsC5+wbtNC77TaNGFzabTD0+/Zua1ASSIhLh2GZoL/P04NCbciOOAr39fe3LVNRK9KXWNow==
X-Received: by 2002:a05:6102:c94:: with SMTP id
 f20mr1688594vst.39.1641825255131; 
 Mon, 10 Jan 2022 06:34:15 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:14 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/10] pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
Date: Mon, 10 Jan 2022 11:33:46 -0300
Message-Id: <20220110143346.455901-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to what was happening with pnv-phb3 buses,
TYPE_PNV_PHB4_ROOT_BUS set to "pnv-phb4-root-bus" is a bit too long for
a default root bus name. The usual default name for theses buses in QEMU
are 'pcie', but we want to make a distinction between pnv-phb4 buses and
other PCIE buses, at least as far as default name goes, because not all
PCIE devices are attachable to a pnv-phb4 root-bus type.

Changing the default to 'pnv-phb4-root' allow us to have a shorter name
while making this bus distinct, and the user can always set its own bus
naming via the "id" attribute anyway.

This is the 'info qtree' output after this change, using a powernv9
domain with 2 sockets and default settings enabled:

qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
     -smp 2,sockets=2,cores=1,threads=1

  dev: pnv-phb4, id ""
    index = 5 (0x5)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.11
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.6
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(..)
  dev: pnv-phb4, id ""
    index = 5 (0x5)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.5
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""
(...)
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root.0
      type pnv-phb4-root
      dev: pnv-phb4-root-port, id ""

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 2fb5e119c4..b9537b8da7 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -47,7 +47,7 @@ typedef struct PnvPhb4DMASpace {
 /*
  * PHB4 PCIe Root port
  */
-#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root-bus"
+#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
 #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
 
 typedef struct PnvPHB4RootPort {
-- 
2.33.1


