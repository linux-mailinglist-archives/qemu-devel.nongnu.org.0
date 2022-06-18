Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F5550426
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:07:25 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WIO-0007aZ-NW
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDW-0007jc-Bm; Sat, 18 Jun 2022 07:02:14 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDU-0005eK-PB; Sat, 18 Jun 2022 07:02:14 -0400
Received: by mail-oi1-x230.google.com with SMTP id v4so8262636oiv.1;
 Sat, 18 Jun 2022 04:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sjQ1PEwzNrRmTof4HPK2BqFxFXmrYidB2rpovzMR6g=;
 b=V31fQxUc1dwhbiRBeg84ecEnhvrNwUtPousqozfxcxjQP4ClvuN9KWKhTz7eAD1KSD
 EolkqbEFRCiYOeM34Z6f+ADmZaw0Ci3Bl7W3DwzGkao+4WbdWgLX5Zwzzqp6rA/trNZC
 7nNX+lOIKjEeOsEgPqB1GUi6agS8obKkU0Rm0T6irDPa/aoqf3S7AUhOY1aSW5fnN40u
 w6lJfarf4ubIFexts4k3dUtSgwDhrJghgrczuZG84g3cinh1YOvCt0HXa52/5Cs/L5k8
 9uUX8CKpV8PCujf46cS8RPUpOUKEJUoQkZerD/18/KkPmQNHUQtrbnEpNCMkC8+u9KaO
 EF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sjQ1PEwzNrRmTof4HPK2BqFxFXmrYidB2rpovzMR6g=;
 b=y3tHdog/amjljG4gRVXDzChqEs/VYvnN/wU8MCg3sy5GKlYezGRq6wPI3MCLD3wYYG
 /qotg0ygeW3bSbvUL2KJ5rqOGJXArJwm1fvSx8cPUd5iwiVNDC2GP8BoLqH45db4+40J
 0wSXciHjeeDMmlFD7HpVj6Goqov2sKthbWuy1VxsQeb+BN3MX10MM1M6hOuzG7vVN5E5
 uBymuAl10Ze4i0mROAvlZUV9pGdkCu8Ge3yxLHi5BB5yEq/wldw5uH1UdKMbgPsvByLz
 WDdwgG2zrdqdkeuHGy7BWah6FoWF49XGC1z/o/lP216bdJY2RcizccJlnNbLa3WyGkee
 w0UQ==
X-Gm-Message-State: AJIora8jsyZkT73VSp7STBQKwuwzQFHlBHOQWY7FdhV1mtKa4z0Rn0Lv
 3bCLbpPkINCNzUHeIHlQrN1kw8h0XBg=
X-Google-Smtp-Source: AGRyM1uzqWc1Dla/1PXl2448IsG5N/Dlmrci15Z8/KaeRiqrbrf8sE2CG91pPc9seOUGSG3H6lWkdw==
X-Received: by 2002:a05:6808:bce:b0:332:9584:dfd4 with SMTP id
 o14-20020a0568080bce00b003329584dfd4mr2741501oik.216.1655550131079; 
 Sat, 18 Jun 2022 04:02:11 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 1/9] ppc/pnv: move root port attach to pnv_phb4_realize()
Date: Sat, 18 Jun 2022 08:01:54 -0300
Message-Id: <20220618110202.87735-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

Creating a root port is something related to the PHB, not the PEC. It
also makes the logic more in line with what pnv-phb3 does.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 4 ++++
 hw/pci-host/pnv_phb4_pec.c | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6594016121..23ad8de7ee 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1547,6 +1547,7 @@ static void pnv_phb4_instance_init(Object *obj)
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
@@ -1583,6 +1584,9 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
+    /* Add a single Root port if running with defaults */
+    pnv_phb_attach_root_port(pci, pecc->rp_model);
+
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs = PNV_PHB4_MAX_INTs;
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8b7e823fa5..c9aaf1c28e 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -130,9 +130,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
-
-    /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
-- 
2.36.1


