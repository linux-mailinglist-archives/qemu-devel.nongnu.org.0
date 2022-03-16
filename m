Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAD4DB17D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:29:49 +0100 (CET)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTim-0004Xr-3s
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:29:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTdP-0004PF-59
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTdJ-00045W-Vb
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mp4aRzKIzRce3Gc+gwuuIpWkO66QE9VZYvXJmiuxij4=;
 b=Jp05Jf8Qtmr9+wK46gkNIZah1DKjH0/6jhEUUq+KFyCG71NrNBiZooVadIIw6frNzjjv3m
 3s85M4/Fp8/GD6yKL4M1nUct1v2uE2JhG3B7Cn8H2mvTQX9M5mdE7Eihiy3Sc2nQ2QcxQR
 VrzXMm62z9acfW6FAyFXCvyDnHulxQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-9LhFcVUVOdaGlFnEjpqGqg-1; Wed, 16 Mar 2022 09:24:06 -0400
X-MC-Unique: 9LhFcVUVOdaGlFnEjpqGqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53BB73C14845;
 Wed, 16 Mar 2022 13:24:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304444B8D46;
 Wed, 16 Mar 2022 13:24:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/display/cirrus_vga: Clean up indentation in
 pci_cirrus_vga_realize()
Date: Wed, 16 Mar 2022 14:24:00 +0100
Message-Id: <20220316132402.1190346-2-thuth@redhat.com>
In-Reply-To: <20220316132402.1190346-1-thuth@redhat.com>
References: <20220316132402.1190346-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the code in this function had been indented with 5 spaces instead
of 4. Since 4 is our preferred style, remove one space in the bad lines here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/cirrus_vga.c | 57 +++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index fdca6ca659..7da1be3e12 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2940,27 +2940,28 @@ void cirrus_init_common(CirrusVGAState *s, Object *owner,
 
 static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
 {
-     PCICirrusVGAState *d = PCI_CIRRUS_VGA(dev);
-     CirrusVGAState *s = &d->cirrus_vga;
-     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
-     int16_t device_id = pc->device_id;
-
-     /* follow real hardware, cirrus card emulated has 4 MB video memory.
-       Also accept 8 MB/16 MB for backward compatibility. */
-     if (s->vga.vram_size_mb != 4 && s->vga.vram_size_mb != 8 &&
-         s->vga.vram_size_mb != 16) {
-         error_setg(errp, "Invalid cirrus_vga ram size '%u'",
-                    s->vga.vram_size_mb);
-         return;
-     }
-     /* setup VGA */
-     vga_common_init(&s->vga, OBJECT(dev));
-     cirrus_init_common(s, OBJECT(dev), device_id, 1, pci_address_space(dev),
-                        pci_address_space_io(dev));
-     s->vga.con = graphic_console_init(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
-
-     /* setup PCI */
+    PCICirrusVGAState *d = PCI_CIRRUS_VGA(dev);
+    CirrusVGAState *s = &d->cirrus_vga;
+    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
+    int16_t device_id = pc->device_id;
+
+    /*
+     * Follow real hardware, cirrus card emulated has 4 MB video memory.
+     * Also accept 8 MB/16 MB for backward compatibility.
+     */
+    if (s->vga.vram_size_mb != 4 && s->vga.vram_size_mb != 8 &&
+        s->vga.vram_size_mb != 16) {
+        error_setg(errp, "Invalid cirrus_vga ram size '%u'",
+                   s->vga.vram_size_mb);
+        return;
+    }
+    /* setup VGA */
+    vga_common_init(&s->vga, OBJECT(dev));
+    cirrus_init_common(s, OBJECT(dev), device_id, 1, pci_address_space(dev),
+                       pci_address_space_io(dev));
+    s->vga.con = graphic_console_init(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
 
+    /* setup PCI */
     memory_region_init(&s->pci_bar, OBJECT(dev), "cirrus-pci-bar0", 0x2000000);
 
     /* XXX: add byte swapping apertures */
@@ -2968,14 +2969,14 @@ static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
     memory_region_add_subregion(&s->pci_bar, 0x1000000,
                                 &s->cirrus_linear_bitblt_io);
 
-     /* setup memory space */
-     /* memory #0 LFB */
-     /* memory #1 memory-mapped I/O */
-     /* XXX: s->vga.vram_size must be a power of two */
-     pci_register_bar(&d->dev, 0, PCI_BASE_ADDRESS_MEM_PREFETCH, &s->pci_bar);
-     if (device_id == CIRRUS_ID_CLGD5446) {
-         pci_register_bar(&d->dev, 1, 0, &s->cirrus_mmio_io);
-     }
+    /* setup memory space */
+    /* memory #0 LFB */
+    /* memory #1 memory-mapped I/O */
+    /* XXX: s->vga.vram_size must be a power of two */
+    pci_register_bar(&d->dev, 0, PCI_BASE_ADDRESS_MEM_PREFETCH, &s->pci_bar);
+    if (device_id == CIRRUS_ID_CLGD5446) {
+        pci_register_bar(&d->dev, 1, 0, &s->cirrus_mmio_io);
+    }
 }
 
 static Property pci_vga_cirrus_properties[] = {
-- 
2.27.0


