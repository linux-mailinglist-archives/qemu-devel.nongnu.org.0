Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC230E127
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:35:54 +0100 (CET)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7M4H-00085B-Sx
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7LoU-00040q-VW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7LoM-0003ob-PV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612372764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mS2iiYfkU+El1jnMxzqbCAxDgXZTs0yt94ufHYCtePc=;
 b=Sh4e9Zke5yp5Q2q6/jKLMimAWcN4+NB4hgqBKKBxtrFJHakQDzC1buGFI1LcIEVhdh698f
 Gbm3zAzAoIliKeXsI62BvqgKKa4hDaTKdQZdyLFjV/BtLqQMCKAKUihgPSfF5iMkhI6JqJ
 1MBOgjoF52nGF7PpcYL/rbKgiumEO2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-lS2H5egKNy65s0-Fs2uI8Q-1; Wed, 03 Feb 2021 12:19:22 -0500
X-MC-Unique: lS2H5egKNy65s0-Fs2uI8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C6B8030B9;
 Wed,  3 Feb 2021 17:19:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E91AE5C238;
 Wed,  3 Feb 2021 17:19:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/4] hw/i386: Remove the deprecated pc-1.x machine types
Date: Wed,  3 Feb 2021 18:18:29 +0100
Message-Id: <20210203171832.483176-2-thuth@redhat.com>
In-Reply-To: <20210203171832.483176-1-thuth@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They have been deprecated since QEMU v5.0, time to remove them now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst       |  6 --
 docs/system/removed-features.rst |  6 ++
 hw/i386/pc_piix.c                | 94 --------------------------------
 3 files changed, 6 insertions(+), 100 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 6ac757ed9f..2fcac7861e 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -322,12 +322,6 @@ The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
 System emulator machines
 ------------------------
 
-``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (since 5.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-These machine types are very old and likely can not be used for live migration
-from old QEMU versions anymore. A newer machine type should be used instead.
-
 Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 88b81a6156..c8481cafbd 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -136,6 +136,12 @@ mips ``fulong2e`` machine alias (removed in 6.0)
 
 This machine has been renamed ``fuloong2e``.
 
+``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+These machine types were very old and likely could not be used for live
+migration from old QEMU versions anymore. Use a newer machine type instead.
+
 Related binaries
 ----------------
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6188c3e97e..2904b40163 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -359,18 +359,6 @@ static void pc_compat_1_4_fn(MachineState *machine)
     pc_compat_1_5_fn(machine);
 }
 
-static void pc_compat_1_3(MachineState *machine)
-{
-    pc_compat_1_4_fn(machine);
-}
-
-/* PC compat function for pc-1.0 to pc-1.2 */
-static void pc_compat_1_2(MachineState *machine)
-{
-    pc_compat_1_3(machine);
-    x86_cpu_change_kvm_default("kvm-pv-eoi", NULL);
-}
-
 static void pc_init_isa(MachineState *machine)
 {
     pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
@@ -772,88 +760,6 @@ static void pc_i440fx_1_4_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v1_4, "pc-i440fx-1.4", pc_compat_1_4_fn,
                       pc_i440fx_1_4_machine_options);
 
-static void pc_i440fx_1_3_machine_options(MachineClass *m)
-{
-    X86MachineClass *x86mc = X86_MACHINE_CLASS(m);
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.3.0")
-        { "usb-tablet", "usb_version", "1" },
-        { "virtio-net-pci", "ctrl_mac_addr", "off" },
-        { "virtio-net-pci", "mq", "off" },
-        { "e1000", "autonegotiation", "off" },
-    };
-
-    pc_i440fx_1_4_machine_options(m);
-    m->hw_version = "1.3.0";
-    m->deprecation_reason = "use a newer machine type instead";
-    x86mc->compat_apic_id_mode = true;
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_3, "pc-1.3", pc_compat_1_3,
-                      pc_i440fx_1_3_machine_options);
-
-
-static void pc_i440fx_1_2_machine_options(MachineClass *m)
-{
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.2.0")
-        { "nec-usb-xhci", "msi", "off" },
-        { "nec-usb-xhci", "msix", "off" },
-        { "qxl", "revision", "3" },
-        { "qxl-vga", "revision", "3" },
-        { "VGA", "mmio", "off" },
-    };
-
-    pc_i440fx_1_3_machine_options(m);
-    m->hw_version = "1.2.0";
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_2, "pc-1.2", pc_compat_1_2,
-                      pc_i440fx_1_2_machine_options);
-
-
-static void pc_i440fx_1_1_machine_options(MachineClass *m)
-{
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.1.0")
-        { "virtio-scsi-pci", "hotplug", "off" },
-        { "virtio-scsi-pci", "param_change", "off" },
-        { "VGA", "vgamem_mb", "8" },
-        { "vmware-svga", "vgamem_mb", "8" },
-        { "qxl-vga", "vgamem_mb", "8" },
-        { "qxl", "vgamem_mb", "8" },
-        { "virtio-blk-pci", "config-wce", "off" },
-    };
-
-    pc_i440fx_1_2_machine_options(m);
-    m->hw_version = "1.1.0";
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_1, "pc-1.1", pc_compat_1_2,
-                      pc_i440fx_1_1_machine_options);
-
-static void pc_i440fx_1_0_machine_options(MachineClass *m)
-{
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.0")
-        { TYPE_ISA_FDC, "check_media_rate", "off" },
-        { "virtio-balloon-pci", "class", stringify(PCI_CLASS_MEMORY_RAM) },
-        { "apic-common", "vapic", "off" },
-        { TYPE_USB_DEVICE, "full-path", "no" },
-    };
-
-    pc_i440fx_1_1_machine_options(m);
-    m->hw_version = "1.0";
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_0, "pc-1.0", pc_compat_1_2,
-                      pc_i440fx_1_0_machine_options);
-
-
 typedef struct {
     uint16_t gpu_device_id;
     uint16_t pch_device_id;
-- 
2.27.0


