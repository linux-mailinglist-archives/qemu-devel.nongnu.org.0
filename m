Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436D590419
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:46:16 +0200 (CEST)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBK3-0002Wz-GZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE5-0001Kz-6t; Thu, 11 Aug 2022 12:40:05 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE3-0003Vw-EZ; Thu, 11 Aug 2022 12:40:04 -0400
Received: by mail-vs1-xe31.google.com with SMTP id q15so18889390vsr.0;
 Thu, 11 Aug 2022 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=O97pVC+LXnGk5PNh1e+NwaT3e1S2FbEewKrN94V2Fbs=;
 b=eolLP3Kg2pNiphfnODQyCGSBkch9VbSLdDU7fLYywrYTGImDmddM8lDDaJC+QuNzWj
 +MuE/natKy49KHxDk4Om/GkrEKqzT3CFUWeb/X71N99SUMZNUYNN1iuES/GHx/dqDSB2
 YTTxQOQzxBPUzy8Fvlbv6XDjAVBtOx/Filpt+QM6utTriyQpVXSndFnxMveyUG69ncYj
 pYNVunpihUOr0B36cJfyaoZnZ0ehhrGiIa1dDjYIuyeGO8xC01cx+ienyUD1oCCU4HQm
 lfGFGOKErroVyzQT0pQsEERu4HPFhJAN0ai8z24TmR1mtqrNPeidPdcpi5cio2v8FkGK
 Vd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O97pVC+LXnGk5PNh1e+NwaT3e1S2FbEewKrN94V2Fbs=;
 b=mb3grvTgBLtaTnQWYuzMYIa9wuRz2TuB6bhbLfrJ0gea2kj+dcdVb0h8Xx7EELPeo3
 xWCyXHnwj3PoF8qQK6r2W0YwUiq4AzsQxpY2i5OkWUy151c9ARYMR0n71ZGcRy/WgyON
 3dRFvsfJOqXU73q9+28Bz8OQ/IHOmYW8+jJO7Mx7SVHBE4qOiodlk2UJy0xybrNO4W5c
 QAlzZUxK19wBFT1b3/c15Q1Uze4J+E/lbZvxyDVSP5YKM4vM/CEYL6e/T+FwIr/uhkae
 qQutBWZju0GsJvVL/oD16lIHqn81vjET+0fdRgVhp60mU4lhcJ7Vtm2kY10vYl4YLomT
 vuMA==
X-Gm-Message-State: ACgBeo2xOjgKeqp+f0j8KOE0r4//UtxrR5zFN/9Qiwa6CfnyUsn5CSrU
 261dXVZVA2iDdho7+R66DqDca5MiSw0=
X-Google-Smtp-Source: AA6agR4/EbDpi0iKnIcYHLJc6k8DE2+rekLGCSZCliSGAuIkA8PdHJ4t9yYs4pGThQwX3odBB9WqcQ==
X-Received: by 2002:a67:ca83:0:b0:374:ab95:ed82 with SMTP id
 a3-20020a67ca83000000b00374ab95ed82mr13671783vsl.60.1660236001811; 
 Thu, 11 Aug 2022 09:40:01 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 03/11] ppc/pnv: set root port chassis and slot
 using Bus properties
Date: Thu, 11 Aug 2022 13:39:42 -0300
Message-Id: <20220811163950.578927-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

For default root ports we have a way of accessing chassis and slot,
before root_port_realize(), via pnv_phb_attach_root_port(). For the
future user created root ports this won't be the case: we can't use
this helper because we don't have access to the PHB phb-id/chip-id
values.

In earlier patches we've added phb-id and chip-id to pnv-phb-root-bus
objects. We're now able to use the bus to retrieve them. The bus is
reachable for both user created and default devices, so we're changing
all the code paths. This also allow us to validate these changes with
the existing default devices.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c47ed92462..826c0c144e 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -25,21 +25,19 @@
  * QOM id. 'chip_id' is going to be used as PCIE chassis for the
  * root port.
  */
-static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
+static void pnv_phb_attach_root_port(PCIHostState *pci)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]",
-                                                  TYPE_PNV_PHB_ROOT_PORT,
-                                                  index);
     const char *dev_id = DEVICE(root)->id;
+    g_autofree char *default_id = NULL;
+    int index;
+
+    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
+    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
 
     object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
                               OBJECT(root));
 
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
-    qdev_prop_set_uint16(DEVICE(root), "slot", index);
-
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
@@ -93,7 +91,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
+    pnv_phb_attach_root_port(pci);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -162,9 +160,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
+    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
     PCIDevice *pci = PCI_DEVICE(dev);
     uint16_t device_id = 0;
     Error *local_err = NULL;
+    int chip_id, index;
+
+    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
+    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(dev, "chassis", chip_id);
+    qdev_prop_set_uint16(dev, "slot", index);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
-- 
2.36.1


