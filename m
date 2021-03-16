Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E480033DB0E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:35:11 +0100 (CET)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDb4-00006z-Rf
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9X-0003Wn-3a
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9U-0005Tw-AG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUWx8GJCh4xlzC9gQdSxGUlHI/PpwieNkuHuRkf2ARk=;
 b=b4wtslAocOrFYMomwLZYw3sbNVEZkUjd0utCKGKATyhd2LWvZMQINn0y7KHExFPhz07wkX
 8zTxX2ws2lq+jOMBAoWiAsfuNy6l9MufT+M6G/OUFwzsDSxFEReTxojY+3nEZ3k7wabYyK
 yH1aAfBiRTqAIxvLinwxlSsmPprxJVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-qRoYTSJsMU-OXMXeMPHpbA-1; Tue, 16 Mar 2021 13:06:32 -0400
X-MC-Unique: qRoYTSJsMU-OXMXeMPHpbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E34106F8E2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:06:31 +0000 (UTC)
Received: from rhel8vm.home.shazbot.org (ovpn-115-65.phx2.redhat.com
 [10.3.115.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AFD55D719;
 Tue, 16 Mar 2021 17:06:31 +0000 (UTC)
Subject: [PULL 02/10] hw/vfio/pci-quirks: Replace the word 'blacklist'
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Mar 2021 11:06:32 -0600
Message-ID: <161591439221.135549.13340407909924588099.stgit@rhel8vm.home.shazbot.org>
In-Reply-To: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
References: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210205171817.2108907-9-philmd@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci-quirks.c |   14 +++++++-------
 hw/vfio/pci.c        |    4 ++--
 hw/vfio/pci.h        |    2 +-
 hw/vfio/trace-events |    2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index c5c4c61d0142..b90cf3d37c30 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -44,19 +44,19 @@
 static const struct {
     uint32_t vendor;
     uint32_t device;
-} romblacklist[] = {
+} rom_denylist[] = {
     { 0x14e4, 0x168e }, /* Broadcom BCM 57810 */
 };
 
-bool vfio_blacklist_opt_rom(VFIOPCIDevice *vdev)
+bool vfio_opt_rom_in_denylist(VFIOPCIDevice *vdev)
 {
     int i;
 
-    for (i = 0 ; i < ARRAY_SIZE(romblacklist); i++) {
-        if (vfio_pci_is(vdev, romblacklist[i].vendor, romblacklist[i].device)) {
-            trace_vfio_quirk_rom_blacklisted(vdev->vbasedev.name,
-                                             romblacklist[i].vendor,
-                                             romblacklist[i].device);
+    for (i = 0 ; i < ARRAY_SIZE(rom_denylist); i++) {
+        if (vfio_pci_is(vdev, rom_denylist[i].vendor, rom_denylist[i].device)) {
+            trace_vfio_quirk_rom_in_denylist(vdev->vbasedev.name,
+                                             rom_denylist[i].vendor,
+                                             rom_denylist[i].device);
             return true;
         }
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f74be782091d..759a3b1abf4b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -900,7 +900,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
 
     if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
         /* Since pci handles romfile, just print a message and return */
-        if (vfio_blacklist_opt_rom(vdev) && vdev->pdev.romfile) {
+        if (vfio_opt_rom_in_denylist(vdev) && vdev->pdev.romfile) {
             warn_report("Device at %s is known to cause system instability"
                         " issues during option rom execution",
                         vdev->vbasedev.name);
@@ -927,7 +927,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (vfio_blacklist_opt_rom(vdev)) {
+    if (vfio_opt_rom_in_denylist(vdev)) {
         if (dev->opts && qemu_opt_get(dev->opts, "rombar")) {
             warn_report("Device at %s is known to cause system instability"
                         " issues during option rom execution",
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 1574ef983f8f..64777516d16d 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -197,7 +197,7 @@ void vfio_pci_write_config(PCIDevice *pdev,
 uint64_t vfio_vga_read(void *opaque, hwaddr addr, unsigned size);
 void vfio_vga_write(void *opaque, hwaddr addr, uint64_t data, unsigned size);
 
-bool vfio_blacklist_opt_rom(VFIOPCIDevice *vdev);
+bool vfio_opt_rom_in_denylist(VFIOPCIDevice *vdev);
 void vfio_vga_quirk_setup(VFIOPCIDevice *vdev);
 void vfio_vga_quirk_exit(VFIOPCIDevice *vdev);
 void vfio_vga_quirk_finalize(VFIOPCIDevice *vdev);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index c0e75f24b76d..079f53acf282 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -49,7 +49,7 @@ vfio_pci_emulated_sub_vendor_id(const char *name, uint16_t val) "%s 0x%04x"
 vfio_pci_emulated_sub_device_id(const char *name, uint16_t val) "%s 0x%04x"
 
 # pci-quirks.c
-vfio_quirk_rom_blacklisted(const char *name, uint16_t vid, uint16_t did) "%s %04x:%04x"
+vfio_quirk_rom_in_denylist(const char *name, uint16_t vid, uint16_t did) "%s %04x:%04x"
 vfio_quirk_generic_window_address_write(const char *name, const char * region_name, uint64_t data) "%s %s 0x%"PRIx64
 vfio_quirk_generic_window_data_read(const char *name, const char * region_name, uint64_t data) "%s %s 0x%"PRIx64
 vfio_quirk_generic_window_data_write(const char *name, const char * region_name, uint64_t data) "%s %s 0x%"PRIx64



