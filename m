Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40427310FC7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:22:19 +0100 (CET)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85kI-00040f-5n
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84lJ-0001N9-Jn
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84lH-0003cG-TQ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTYlec3DE5eyW7rWtGioEjbN02m0/2QBAjfap4CY4WI=;
 b=Xz4yN0zfHT6dKZQ/8HZs65zZQ5p0Au/AS7wR9AMTzfEee7kyfafCb0woHXtnC1AtdMNT4T
 mI/a07pK8dWm82lLwAquO2+MWb/kb66K43u5NeBLVMVv9GNm33Ch9iKZ7T9cnGDU5800NK
 IdWNJ+UA0Z8uLY+0p1gMOQIwDkwK97U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-zBMNSPoENWGVhBFl7G0WcQ-1; Fri, 05 Feb 2021 12:19:12 -0500
X-MC-Unique: zBMNSPoENWGVhBFl7G0WcQ-1
Received: by mail-ed1-f69.google.com with SMTP id y6so7346323edc.17
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTYlec3DE5eyW7rWtGioEjbN02m0/2QBAjfap4CY4WI=;
 b=ijkAQLPoGkmConD6Cj4X/EJCQfTLZCSJj+11zErsiA2LRDYVWco6Rd0HnshCzS67ff
 ruOUk+jSCpkmL9f/yPT4QKltm+QnVfUgPbqSJXsGYlsoD8a99wGG4aCwZi0b8I22VOQr
 O5r3muogdauJatMcgh99tteZh9Zsn52NoPbf3lC2WJwOL/xc39SzgITYZ0Hta+vm3Lh8
 0sXLpW1opGcBq5gMrmUFzqjCbKhS6Rn4egRopc/8ggVPul6Opc8ZsXDBcPuAKJB2HF6v
 9WVkc24qh5a+AVLiX194jT2Lp7RFppxl1/YPnXiUSIkK4X1c5HG3EjFxfM5Hu9+XnmF+
 ijnQ==
X-Gm-Message-State: AOAM531XJAX52S2kMz1ni5wSpjqOt5ZD/niAR1Co5tR2WBcic3M2IG3l
 ljk53uInjDRZRmjlziggkzuBeNeGs/z77af1rXFDINohLo1gwUHsZB+VSO5dWBdlz8H+vIBAaPF
 g8zRByG+KOEEpU5ih1+KgJyAkAFgs7liU4WHqDjG7WhkY7zjuboQSNdM/bpngjd3G
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr4945659eje.109.1612545549349; 
 Fri, 05 Feb 2021 09:19:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhSmRMkYjO1R0jbAtS+p1wKUp0IRLnnPdDa+hLPZwjzozngFxtV1EClU4OCtJpmLSTECu7IQ==
X-Received: by 2002:a17:906:17d5:: with SMTP id
 u21mr4945623eje.109.1612545549091; 
 Fri, 05 Feb 2021 09:19:09 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y13sm24601eds.25.2021.02.05.09.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:19:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] hw/vfio/pci-quirks: Replace the word 'blacklist'
Date: Fri,  5 Feb 2021 18:18:17 +0100
Message-Id: <20210205171817.2108907-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/vfio/pci.h        |  2 +-
 hw/vfio/pci-quirks.c | 14 +++++++-------
 hw/vfio/pci.c        |  4 ++--
 hw/vfio/trace-events |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 1574ef983f8..64777516d16 100644
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
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index fc8d63c8504..81c3e30df77 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -43,19 +43,19 @@
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
index f74be782091..759a3b1abf4 100644
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
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index c0e75f24b76..079f53acf28 100644
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
-- 
2.26.2


