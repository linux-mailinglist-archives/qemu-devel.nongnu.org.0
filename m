Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150AC450A0B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:48:46 +0100 (CET)
Received: from localhost ([::1]:35110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf9x-00053X-4X
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:48:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0S-0003XJ-1S
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0Q-0005I9-1I
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g++bwUMm88irLRB02LM9vDTYphSEUI2sCRSx57kjueo=;
 b=KaID4/BK2If2VwX3JNocG7d+GacEldqCW75MVIgimyu8JXVGledcG6xCU3Qy1dmKbla6DR
 zX3z9m26JrhjwcWGRBvUt72snoECrSAylZ0FMaFWABVoqkiWQx7pFwr2I9SIWyABqPdTQO
 9JXsDgMqVL1pYPxf9i04ZwHk3Po/l10=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-xFH6HxUjP_Wbw_5n0vPvZA-1; Mon, 15 Nov 2021 11:38:52 -0500
X-MC-Unique: xFH6HxUjP_Wbw_5n0vPvZA-1
Received: by mail-ed1-f72.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so2099026edx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g++bwUMm88irLRB02LM9vDTYphSEUI2sCRSx57kjueo=;
 b=Ahhr7nlCOaBaGGgz6v9QDDw67d6aPs6lSth6fZ8EoCRbsgAXfZuX1lAnnNu7s7YoFz
 JVIPxCgQA3AKb3S9n7kNvrAz/cLs21cxBJg4E+g/H4BS1BvT1pK2I7y9vve7O467ECE7
 RMLFF9m00U45Vz7kn4mnii3pCoeIAz8bdqlyr96dZ7LeqB6nhoev8EVeFoXdXIG6Dxae
 cQxwgVaVJGz50YOm12WR3Cbfv+kKDUQH8okYBHn7+X7faTnk5l4A2XcQ25z6asCGpdZY
 BZ/ksXtsWytWD3Jw0ALEsuawVW7QT3qPsRJQWxiVyDw4sdtA7+ISZ8dZN2ssPaxmli5L
 mUEw==
X-Gm-Message-State: AOAM53288jjlzBoLJ8cdAMJ40fkTJGiKmVnUu/KH6mDD5OP/i7dsfeKX
 fvP8EbC12nGU15WktDjwzeI+N5h/fFjpH5A5813SjK+e/++cBMiaSgeU80e1se/0LWn2ybR1KDS
 VZJVQ+ZWoSDd2fYqGp7GnX0etqUByHwQBvw3ytMeGZVvJuS5fLUzxyxtPiDM/
X-Received: by 2002:a17:907:1dd5:: with SMTP id
 og21mr364193ejc.233.1636994330434; 
 Mon, 15 Nov 2021 08:38:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvY6oFQ88VFmJXUHFvzbhSE3Q68o6rjieDAwV8hECAMCiPb6BMQDFfpipW6TQrMUleHpSylQ==
X-Received: by 2002:a17:907:1dd5:: with SMTP id
 og21mr364153ejc.233.1636994330173; 
 Mon, 15 Nov 2021 08:38:50 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id yc16sm1943720ejb.122.2021.11.15.08.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:49 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] pci: implement power state
Message-ID: <20211115163607.177432-16-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

This allows to power off pci devices.  In "off" state the devices will
not be visible.  No pci config space access, no pci bar access, no dma.

Default state is "on", so this patch (alone) should not change behavior.

Use case:  Allows hotplug controllers implement slot power.  Hotplug
controllers doing so should set the inital power state for devices in
the ->plug callback.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211111130859.1171890-2-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h |  2 ++
 hw/pci/pci.c         | 25 +++++++++++++++++++++++--
 hw/pci/pci_host.c    |  6 ++++--
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5c4016b995..e7cdf2d5ec 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,7 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
+    bool has_power;
 
     /* PCI config space */
     uint8_t *config;
@@ -908,5 +909,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_set_power(PCIDevice *pci_dev, bool state);
 
 #endif
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a84e478ce..e5993c1ef5 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1380,6 +1380,9 @@ static void pci_update_mappings(PCIDevice *d)
             continue;
 
         new_addr = pci_bar_address(d, i, r->type, r->size);
+        if (!d->has_power) {
+            new_addr = PCI_BAR_UNMAPPED;
+        }
 
         /* This bar isn't changed */
         if (new_addr == r->addr)
@@ -1464,8 +1467,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
     if (range_covers_byte(addr, l, PCI_COMMAND)) {
         pci_update_irq_disabled(d, was_irq_disabled);
         memory_region_set_enabled(&d->bus_master_enable_region,
-                                  pci_get_word(d->config + PCI_COMMAND)
-                                    & PCI_COMMAND_MASTER);
+                                  (pci_get_word(d->config + PCI_COMMAND)
+                                   & PCI_COMMAND_MASTER) && d->has_power);
     }
 
     msi_write_config(d, addr, val_in, l);
@@ -2182,6 +2185,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_qdev_unrealize(DEVICE(pci_dev));
         return;
     }
+
+    pci_set_power(pci_dev, true);
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
@@ -2853,6 +2858,22 @@ MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
     return msg;
 }
 
+void pci_set_power(PCIDevice *d, bool state)
+{
+    if (d->has_power == state) {
+        return;
+    }
+
+    d->has_power = state;
+    pci_update_mappings(d);
+    memory_region_set_enabled(&d->bus_master_enable_region,
+                              (pci_get_word(d->config + PCI_COMMAND)
+                               & PCI_COMMAND_MASTER) && d->has_power);
+    if (!d->has_power) {
+        pci_device_reset(d);
+    }
+}
+
 static const TypeInfo pci_device_type_info = {
     .name = TYPE_PCI_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index cf02f0d6a5..7beafd40a8 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -74,7 +74,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
     /* non-zero functions are only exposed when function 0 is present,
      * allowing direct removal of unexposed functions.
      */
-    if (pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) {
+    if ((pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) ||
+        !pci_dev->has_power) {
         return;
     }
 
@@ -97,7 +98,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
     /* non-zero functions are only exposed when function 0 is present,
      * allowing direct removal of unexposed functions.
      */
-    if (pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) {
+    if ((pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) ||
+        !pci_dev->has_power) {
         return ~0x0;
     }
 
-- 
MST


