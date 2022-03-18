Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4174DDB94
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:23:03 +0100 (CET)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDVO-0003rg-Ri
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:23:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5w-00068I-Ko
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5u-00085K-W9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647611802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9G6f/YBRXcX1Is0sHQibN+w4bGQ1wgyVJLNfRULjr4=;
 b=V3MbvGJp4inUKUAjXoxmCPa0uv2T+OSRK7WsTJRhkOsIyyD/I+gdJJpOKEq9OTTJpEEA2J
 jsLGFDi+FI8ErpiN5h3HpoyV+Q+gYASHy4cLeyALDXQ2H9kO/YfLbxtCkGM7HsvNAPx9mK
 4w4whLcLvON5fghyWtPJW36KCWhbGSA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-A-Kwp_qjNBKe8H3M03Pkig-1; Fri, 18 Mar 2022 09:56:39 -0400
X-MC-Unique: A-Kwp_qjNBKe8H3M03Pkig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8881F89B846;
 Fri, 18 Mar 2022 13:56:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CFB040885AB;
 Fri, 18 Mar 2022 13:56:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CCA818003B6; Fri, 18 Mar 2022 14:56:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] hw/display/cirrus_vga: Clean up indentation in
 pci_cirrus_vga_realize()
Date: Fri, 18 Mar 2022 14:56:32 +0100
Message-Id: <20220318135634.2851040-5-kraxel@redhat.com>
In-Reply-To: <20220318135634.2851040-1-kraxel@redhat.com>
References: <20220318135634.2851040-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Most of the code in this function had been indented with 5 spaces instead
of 4. Since 4 is our preferred style, remove one space in the bad lines here.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220317083027.16688-2-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 55 +++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index fdca6ca659f9..7da1be3e122e 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2940,27 +2940,28 @@ void cirrus_init_common(CirrusVGAState *s, Object *owner,
 
 static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
 {
-     PCICirrusVGAState *d = PCI_CIRRUS_VGA(dev);
-     CirrusVGAState *s = &d->cirrus_vga;
-     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
-     int16_t device_id = pc->device_id;
+    PCICirrusVGAState *d = PCI_CIRRUS_VGA(dev);
+    CirrusVGAState *s = &d->cirrus_vga;
+    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
+    int16_t device_id = pc->device_id;
 
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
2.35.1


