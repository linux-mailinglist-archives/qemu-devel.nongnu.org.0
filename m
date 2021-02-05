Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0BC310CF7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:09:35 +0100 (CET)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82jm-0000d0-Uj
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eC-0003eJ-O0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82e9-0002tE-Jf
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zwMMO/GhT5P4qg6F1lADPTp5N9LNgrC5HBBNpAooZ60=;
 b=JMm3/v6hHQmW9FqmN1XFAIVzCKyoLAt/YOZKbvuW2LAvubDuiZj+hVF7m0i+EGFhKyp7PA
 UWLH/z1/N49N+R1ZDkR3Jl1ilUEaF0SVr4VthyXIaVI+aYcT6/VHqgawiSr/O6nJD4DEBK
 Q9XJJwZC1xKgQdYDS2p0VlVDh2ex15Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-uENkUOvAMXWdrR37o8F0JA-1; Fri, 05 Feb 2021 10:03:39 -0500
X-MC-Unique: uENkUOvAMXWdrR37o8F0JA-1
Received: by mail-ed1-f72.google.com with SMTP id u26so7064458edv.18
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zwMMO/GhT5P4qg6F1lADPTp5N9LNgrC5HBBNpAooZ60=;
 b=a4n8Bo7zrXt5n6O/Cp2fAHBvhAeG/SEs9F8DzUP81Znwurh+NJ2Xm5yNa4JJ08Qt9k
 gL0QuJ0jHxZLdNBckdUgsOuIOMhW97xFRjghQfIm/PtrRMes7WgHuT75LRezRiIaBV0S
 6NGo3UrovTGVXHoYSccDVeZ9GpENwN5/mHF1u5KyF9TxnK2lcjvPOEaUxNrk47MTX9GH
 FeqD+d7qn+AKTGtaITzWsAeenh3c1675ouvSW9TjpYSEH01C4ZO76ZJPa+99lWB6hn2u
 n9W/APEMCCs/lH8VFTHKhJHwBzXYSCMhTP2eC00vtMQanytVTghssouwTyeY3VWB7jdy
 QK0A==
X-Gm-Message-State: AOAM5310Z5Oi1GxOONboiVTMi2j22kn/Mwzyyo+sqR0lvWbLIHjPkwpr
 7eoJFNnajjlJKcAG+iB/9d2w1LpV6uKTtcX3rhujtZYtXnNhbNO/67iT9ursZ5RTNVld7eMtpzo
 5v/q5HY2OAtIM9ZMhmSA+R/nrXi7YYjVxigVQr4w+KMhl5IEA60OMJ89g4UhE
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr4449854ejc.482.1612537417966; 
 Fri, 05 Feb 2021 07:03:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyszPIeKkwa+10z8LK7e/ZhS/mQJGnrOXUtz/rjTwb1tdREvjR9aq3yiXVn0vxPl25KHrANHw==
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr4449818ejc.482.1612537417767; 
 Fri, 05 Feb 2021 07:03:37 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id d5sm4104521edu.12.2021.02.05.07.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:37 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/16] pci: add romsize property
Message-ID: <20210205150135.94643-3-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

Note that even though romsize is a uint32_t, it has to be between 1
(because empty ROM files are not accepted, and romsize must be greater
than the file) and 2^31 (because values above are not powers of two and
are rejected).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201218182736.1634344-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210203131828.156467-3-pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Acked-by: Laszlo Ersek <lersek@redhat.com>
---
 include/hw/pci/pci.h     |  1 +
 hw/pci/pci.c             | 19 +++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 66db08462f..1bc231480f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -344,6 +344,7 @@ struct PCIDevice {
 
     /* Location of option rom */
     char *romfile;
+    uint32_t romsize;
     bool has_rom;
     MemoryRegion rom;
     uint32_t rom_bar;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 58560c044d..a9ebef8a35 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -69,6 +69,7 @@ static void pcibus_reset(BusState *qbus);
 static Property pci_props[] = {
     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
+    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
@@ -2084,6 +2085,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
+        error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
+        return;
+    }
+
     /* initialize cap_present for pci_is_express() and pci_config_size(),
      * Note that hybrid PCIs are not set automatically and need to manage
      * QEMU_PCI_CAP_EXPRESS manually */
@@ -2349,7 +2355,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         g_free(path);
         return;
     }
-    size = pow2ceil(size);
+    if (pdev->romsize != -1) {
+        if (size > pdev->romsize) {
+            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
+                       pdev->romfile, (uint32_t)size, pdev->romsize);
+            g_free(path);
+            return;
+        }
+    } else {
+        pdev->romsize = pow2ceil(size);
+    }
 
     vmsd = qdev_get_vmsd(DEVICE(pdev));
 
@@ -2359,7 +2374,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
     }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
+    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..03422a8a71 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     }
     fseek(fp, 0, SEEK_SET);
 
+    if (dev->romsize != -1) {
+        if (st.st_size > dev->romsize) {
+            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %u",
+                         rom_file, (long) st.st_size, dev->romsize);
+            goto close_rom;
+        }
+    } else {
+        dev->romsize = st.st_size;
+    }
+
     snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
-    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
+    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
     ptr = memory_region_get_ram_ptr(&dev->rom);
-    memset(ptr, 0xff, st.st_size);
+    memset(ptr, 0xff, dev->romsize);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
         error_report("pci-assign: Cannot read from host %s", rom_file);
-- 
MST


