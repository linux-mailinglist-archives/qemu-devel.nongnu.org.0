Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B311A5A86C7
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:33:13 +0200 (CEST)
Received: from localhost ([::1]:60250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTSa-0001gU-Sl
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSop-0003rc-SI; Wed, 31 Aug 2022 14:52:07 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoo-00084D-0p; Wed, 31 Aug 2022 14:52:07 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so22383867fac.11; 
 Wed, 31 Aug 2022 11:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YVJx/YJibJezj2keQ6FjYIkyeqU5qK9zs9WvbqeLXfw=;
 b=THvHnKGbtgG0+KCc4yzbF+XmFBbbkWnLnMwlq4RMXc/SCqTIQBflzQP2sXvjhhor6J
 3AUb88P835ScQ1CXGNQmaOWOvasn3gQUh/lubxhdA5y0owXSnN0YC/AS1z02RkK/Yrik
 W2RqGtXsjuKsxinRsDyTUG32glxoZ1mOTda9YP5+62RE2UTK5j6gdi9/cGzOQzfYdtlC
 cx7uD0XJyuRwkAak83riQtrdgQ4fkb0KaEBnTE/YlmzJwzW6THlLMyk6Cm3XhDoaTl69
 BhjOGAPwBJM8aapmqapjNKUGmoEkaIoFNasgmKy5H3RgNfg4bcbS2sDZW9OKKrI6uoSI
 ifzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YVJx/YJibJezj2keQ6FjYIkyeqU5qK9zs9WvbqeLXfw=;
 b=3kwKAGTt+KtbcImSs+ksx1Rvlry+f5jzpMXQmZK1BBd2WhkGBquqfo60NZiMN3LNuN
 gk9S8e2XRh3I2jVL0lIHdJL1gO9IkoAy8AplBl3ko7VeRRBkaltbMc5LB++rJlMuJm7M
 ZaeR9DkNHZKmPGXAwo6SxZhLKXR8DfW8KjfWZF+eB3yjljPXL6wk69UuOAE8UnE6CYkU
 /IMqefvKnT295xsgx+BqBS/FEVj24PpFt/k76SIzZxdw/VrqnPF+HyNKHUu6PJq3XG8R
 Hdtb0gs7sw6y3Et5tu/v39v7W0qpfhVXYVX7zC7pEGDaOoig9RnBCcUcYUXHdT3IBUyG
 yACw==
X-Gm-Message-State: ACgBeo3UXqwE1cLD3BzILp9IV107ufp4LjSNCuxH98WCVhiSkm5NIyTD
 ZU0817sUsixPJNZuLEd6YYXocuQfcFY=
X-Google-Smtp-Source: AA6agR4vTu2L0BnzY2d1pCreYTI2fQUp2YTkBxEvEApauhJ3CsmPvRUe+aBIQbhBBAjIndwsBsCvgw==
X-Received: by 2002:a05:6870:6086:b0:10b:8905:14c3 with SMTP id
 t6-20020a056870608600b0010b890514c3mr2032794oae.255.1661971924781; 
 Wed, 31 Aug 2022 11:52:04 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 29/60] ppc/pnv: fix QOM parenting of user creatable root ports
Date: Wed, 31 Aug 2022 15:50:03 -0300
Message-Id: <20220831185034.23240-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

User creatable root ports are being parented by the 'peripheral' or the
'peripheral-anon' container. This happens because this is the regular
QOM schema for sysbus devices that are added via the command line.

Let's make this QOM hierarchy similar to what we have with default root
ports, i.e. the root port must be parented by the pnv-root-bus. To do
that we change the qom and bus parent of the root port during
root_port_realize(). The realize() is shared by the default root port
code path, so we can remove the code inside pnv_phb_attach_root_port()
that was adding the root port as a child of the bus as well.

After all that, remove pnv_phb_attach_root_port() and create the root
port explictly in the 'default_enabled()' case of pnv_phb_realize().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220819094748.400578-3-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 47 ++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 4ea33fb6ba..7b11f1e8dd 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -62,29 +62,6 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
     return true;
 }
 
-/*
- * Attach a root port device.
- *
- * 'index' will be used both as a PCIE slot value and to calculate
- * QOM id. 'chip_id' is going to be used as PCIE chassis for the
- * root port.
- */
-static void pnv_phb_attach_root_port(PCIHostState *pci)
-{
-    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    const char *dev_id = DEVICE(root)->id;
-    g_autofree char *default_id = NULL;
-    int index;
-
-    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
-    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
-
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
-}
-
 /*
  * User created devices won't have the initial setup that default
  * devices have. This setup consists of assigning a parent device
@@ -180,11 +157,11 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    if (!defaults_enabled()) {
-        return;
-    }
+    if (defaults_enabled()) {
+        PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
 
-    pnv_phb_attach_root_port(pci);
+        pci_realize_and_unref(root, pci->bus, errp);
+    }
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -259,6 +236,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     int chip_id, index;
 
+    /*
+     * 'index' will be used both as a PCIE slot value and to calculate
+     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+     * root port.
+     */
     chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
     index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
 
@@ -266,6 +248,17 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint8(dev, "chassis", chip_id);
     qdev_prop_set_uint16(dev, "slot", index);
 
+    /*
+     * User created root ports are QOM parented to one of
+     * the peripheral containers but it's already at the right
+     * parent bus. Change the QOM parent to be the same as the
+     * parent bus it's already assigned to.
+     */
+    if (!pnv_parent_fixup(OBJECT(bus), BUS(bus), OBJECT(dev),
+                          index, errp)) {
+        return;
+    }
+
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.37.2


