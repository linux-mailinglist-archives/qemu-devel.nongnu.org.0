Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD1559608
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:08:57 +0200 (CEST)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fJA-0007aH-Nm
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0f-0002HE-MA; Fri, 24 Jun 2022 04:49:51 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:44970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0d-0000DC-Lp; Fri, 24 Jun 2022 04:49:48 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-101e1a33fe3so2865316fac.11; 
 Fri, 24 Jun 2022 01:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6tobjUbMb29uwSnXni9OsSycNwK5t9rHZx8r0rP3SZc=;
 b=ahayYoGfFy+x5oukpr5STG3Q/d7Lnl5a43v8W8tmM+uPdD2lZlwVE/DikMQOZMOzGH
 Pr4l7HsyAdUbryAyl0k0xaDwmEnKI0qu6vuogev0xX7/rm1IhI5m4bTfFWlPL0s8okFc
 QBHPiB5uHDVLaAktWGqm1OrE2bk5ApWV+ThkW/FO7icgj7PpHcmm0apk0dpYoIZb2Rnu
 XAo9q4HInzfat2cmrT+0zHUsQwUG4Qkper6C2ryh/eyXkcFFI9m4+ZoR70IvQBkFXnub
 tw0lelgKrAolxmXBgGQPDQbXQ29Xw/GCrTdsozhWxiWFRkcP1WHEiA+1DDSjbugiyHLl
 kyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6tobjUbMb29uwSnXni9OsSycNwK5t9rHZx8r0rP3SZc=;
 b=M2RvL9pnmTf/VzuaiH/YLGsx3jDjr+z6Vb1TxeynTZiR7ZeC8pRp0ru4XCtAxowSi1
 f47+1r3PO8qbI05D9R7so+T185JBU0z3hyVRXueslWf5qgcOtbcX8ErFMj5/My7QICLF
 MUeB+68DtTXZyyYAGNmiEChi9bhcyBh8p0ASGgKYydPtMPUcx0wngNEutVHx7gE2UupR
 PwoXG5jWQ2kBnSRs17oZe9cq/K4yB7nM+7ilOjiogctWQIuhc6Ggtx8Z3YtijONqH1FT
 vFbCWxk9SwMAK0nDHjtCDjV5+VFiAETh3z/fJQZU94BNHuWByPvHaF9A6/645eO2e19O
 OH9w==
X-Gm-Message-State: AJIora/b3Jwg9tdbTZFXa85dv5xrYNF8Fmk0To09ufMx5GiDwrXaqcZ0
 YVv727IVQEdCsjKeu1vyQX7Z/hf82lU=
X-Google-Smtp-Source: AGRyM1sYnExJDBb/y1eMNfDsYFufPBtLVyE8cd4xTvB0mWrfZ2niK3l3+rKWC+79Quv/Qqd27W6s5g==
X-Received: by 2002:a05:6870:e2ce:b0:101:a7c3:49cb with SMTP id
 w14-20020a056870e2ce00b00101a7c349cbmr1339011oad.197.1656060585730; 
 Fri, 24 Jun 2022 01:49:45 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 09/12] ppc/pnv: remove root port name from
 pnv_phb_attach_root_port()
Date: Fri, 24 Jun 2022 05:49:18 -0300
Message-Id: <20220624084921.399219-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

We support only a single root port, PNV_PHB_ROOT_PORT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 7 +------
 hw/ppc/pnv.c          | 9 +++++----
 include/hw/ppc/pnv.h  | 3 +--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index da729e89e7..cc15a949c9 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -24,7 +24,6 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     PnvPHB *phb = PNV_PHB(dev);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     g_autofree char *phb_typename = NULL;
-    g_autofree char *phb_rootport_typename = NULL;
 
     if (!phb->version) {
         error_setg(errp, "version not specified");
@@ -34,15 +33,12 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     switch (phb->version) {
     case 3:
         phb_typename = g_strdup(TYPE_PNV_PHB3);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 5:
         phb_typename = g_strdup(TYPE_PNV_PHB5);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     default:
         g_assert_not_reached();
@@ -73,8 +69,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    pnv_phb_attach_root_port(pci, phb_rootport_typename,
-                             phb->phb_id, phb->chip_id);
+    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 159899103e..5b7cbfc699 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1199,11 +1199,12 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
  * QOM id. 'chip_id' is going to be used as PCIE chassis for the
  * root port.
  */
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
-                              int index, int chip_id)
+void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
 {
-    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
+    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
+    g_autofree char *default_id = g_strdup_printf("%s[%d]",
+                                                  TYPE_PNV_PHB_ROOT_PORT,
+                                                  index);
     const char *dev_id = DEVICE(root)->id;
 
     object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 33b7b52f45..fbad11d6a7 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -190,8 +190,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
-                              int index, int chip_id);
+void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.36.1


