Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF849E68C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:46:51 +0100 (CET)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6z4-0003Lc-A3
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6UG-000798-R7
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6UE-0002oe-3d
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXP5tuVGwykoL9UQgs6SzFnBlHVyE4UDkBk1KJ0qVMU=;
 b=SBcvvToHqhI5hym/2flDg4FkvVhmTgF6PeVnbp1GpgGpox45L6kPrscWn5r/dKph3R2B3O
 6rlSd+krgP8L1ZHG8kOOPcLqf2kcfyd0/+6I2S23C4yB+dWGh590xYzdLDA4ig+glsEI5L
 HoebHAOQ4Q4eJ5zlQMITAYpTdx1m9fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-6xbPr22qOXaH2kwpovaFpw-1; Thu, 27 Jan 2022 10:14:54 -0500
X-MC-Unique: 6xbPr22qOXaH2kwpovaFpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CF6964098;
 Thu, 27 Jan 2022 15:14:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 689F170D2D;
 Thu, 27 Jan 2022 15:14:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/38] Remove unnecessary minimum_version_id_old fields
Date: Thu, 27 Jan 2022 16:05:28 +0100
Message-Id: <20220127150548.20595-19-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The migration code will not look at a VMStateDescription's
minimum_version_id_old field unless that VMSD has set the
load_state_old field to something non-NULL.  (The purpose of
minimum_version_id_old is to specify what migration version is needed
for the code in the function pointed to by load_state_old to be able
to handle it on incoming migration.)

We have exactly one VMSD which still has a load_state_old,
in the PPC CPU; every other VMSD which sets minimum_version_id_old
is doing so unnecessarily. Delete all the unnecessary ones.

Commit created with:
  sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
with the one legitimate use then hand-edited back in.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

It missed vmstate_ppc_cpu.
---
 hw/acpi/cpu.c                 | 2 --
 hw/acpi/ich9.c                | 3 ---
 hw/acpi/memory_hotplug.c      | 2 --
 hw/acpi/piix4.c               | 2 --
 hw/acpi/tco.c                 | 1 -
 hw/audio/pcspk.c              | 1 -
 hw/display/macfb.c            | 1 -
 hw/dma/xlnx-zdma.c            | 1 -
 hw/dma/xlnx_csu_dma.c         | 1 -
 hw/gpio/imx_gpio.c            | 1 -
 hw/misc/bcm2835_mbox.c        | 1 -
 hw/net/can/can_kvaser_pci.c   | 1 -
 hw/net/can/can_mioe3680_pci.c | 1 -
 hw/net/can/can_pcm3680_pci.c  | 1 -
 hw/net/can/can_sja1000.c      | 2 --
 hw/net/can/ctucan_core.c      | 2 --
 hw/net/can/ctucan_pci.c       | 1 -
 hw/ppc/ppc.c                  | 1 -
 hw/scsi/megasas.c             | 1 -
 hw/scsi/mptsas.c              | 1 -
 hw/virtio/virtio-mmio.c       | 1 -
 hw/virtio/virtio-pci.c        | 1 -
 hw/virtio/virtio.c            | 1 -
 target/openrisc/machine.c     | 1 -
 target/ppc/machine.c          | 2 --
 target/sparc/machine.c        | 4 ----
 26 files changed, 37 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index b20903ea30..3646dbfe68 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -297,7 +297,6 @@ static const VMStateDescription vmstate_cpuhp_sts = {
     .name = "CPU hotplug device state",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
         VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
         VMSTATE_BOOL(is_removing, AcpiCpuStatus),
@@ -311,7 +310,6 @@ const VMStateDescription vmstate_cpu_hotplug = {
     .name = "CPU hotplug state",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
         VMSTATE_UINT32(selector, CPUHotplugState),
         VMSTATE_UINT8(command, CPUHotplugState),
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index ebe08ed831..bd9bbade70 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -163,7 +163,6 @@ static const VMStateDescription vmstate_memhp_state = {
     .name = "ich9_pm/memhp",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = vmstate_test_use_memhp,
     .fields      = (VMStateField[]) {
         VMSTATE_MEMORY_HOTPLUG(acpi_memory_hotplug, ICH9LPCPMRegs),
@@ -181,7 +180,6 @@ static const VMStateDescription vmstate_tco_io_state = {
     .name = "ich9_pm/tco",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = vmstate_test_use_tco,
     .fields      = (VMStateField[]) {
         VMSTATE_STRUCT(tco_regs, ICH9LPCPMRegs, 1, vmstate_tco_io_sts,
@@ -208,7 +206,6 @@ static const VMStateDescription vmstate_cpuhp_state = {
     .name = "ich9_pm/cpuhp",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = vmstate_test_use_cpuhp,
     .pre_load = vmstate_cpuhp_pre_load,
     .fields      = (VMStateField[]) {
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index d0fffcf787..a581a2183b 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -318,7 +318,6 @@ static const VMStateDescription vmstate_memhp_sts = {
     .name = "memory hotplug device state",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
         VMSTATE_BOOL(is_enabled, MemStatus),
         VMSTATE_BOOL(is_inserting, MemStatus),
@@ -332,7 +331,6 @@ const VMStateDescription vmstate_memory_hotplug = {
     .name = "memory hotplug state",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
         VMSTATE_UINT32(selector, MemHotplugState),
         VMSTATE_STRUCT_VARRAY_POINTER_UINT32(devs, MemHotplugState, dev_count,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index f0b5fac44a..cc37fa3416 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -230,7 +230,6 @@ static const VMStateDescription vmstate_memhp_state = {
     .name = "piix4_pm/memhp",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = vmstate_test_use_memhp,
     .fields      = (VMStateField[]) {
         VMSTATE_MEMORY_HOTPLUG(acpi_memory_hotplug, PIIX4PMState),
@@ -255,7 +254,6 @@ static const VMStateDescription vmstate_cpuhp_state = {
     .name = "piix4_pm/cpuhp",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = vmstate_test_use_cpuhp,
     .pre_load = vmstate_cpuhp_pre_load,
     .fields      = (VMStateField[]) {
diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index cf1e68a539..4783721e4e 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -239,7 +239,6 @@ const VMStateDescription vmstate_tco_io_sts = {
     .name = "tco io device status",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
         VMSTATE_UINT16(tco.rld, TCOIORegs),
         VMSTATE_UINT8(tco.din, TCOIORegs),
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index b056c05387..dfc7ebca4e 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -209,7 +209,6 @@ static const VMStateDescription vmstate_spk = {
     .name = "pcspk",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = migrate_needed,
     .fields      = (VMStateField[]) {
         VMSTATE_UINT8(data_on, PCSpkState),
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 4bd7c3ad6a..2eeb80cc3f 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -616,7 +616,6 @@ static const VMStateDescription vmstate_macfb = {
     .name = "macfb",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .post_load = macfb_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index a5a92b4ff8..4eb7f66e9f 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -806,7 +806,6 @@ static const VMStateDescription vmstate_zdma = {
     .name = TYPE_XLNX_ZDMA,
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, XlnxZDMA, ZDMA_R_MAX),
         VMSTATE_UINT32(state, XlnxZDMA),
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574d..5b62a2f74f 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -663,7 +663,6 @@ static const VMStateDescription vmstate_xlnx_csu_dma = {
     .name = TYPE_XLNX_CSU_DMA,
     .version_id = 0,
     .minimum_version_id = 0,
-    .minimum_version_id_old = 0,
     .fields = (VMStateField[]) {
         VMSTATE_PTIMER(src_timer, XlnxCSUDMA),
         VMSTATE_UINT16(width, XlnxCSUDMA),
diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
index 7a591804a9..c7f98b7bb1 100644
--- a/hw/gpio/imx_gpio.c
+++ b/hw/gpio/imx_gpio.c
@@ -277,7 +277,6 @@ static const VMStateDescription vmstate_imx_gpio = {
     .name = TYPE_IMX_GPIO,
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(dr, IMXGPIOState),
         VMSTATE_UINT32(gdir, IMXGPIOState),
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
index 9f73cbd5e4..04e53c9828 100644
--- a/hw/misc/bcm2835_mbox.c
+++ b/hw/misc/bcm2835_mbox.c
@@ -271,7 +271,6 @@ static const VMStateDescription vmstate_bcm2835_mbox = {
     .name = TYPE_BCM2835_MBOX,
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields      = (VMStateField[]) {
         VMSTATE_BOOL_ARRAY(available, BCM2835MboxState, MBOX_CHAN_COUNT),
         VMSTATE_STRUCT_ARRAY(mbox, BCM2835MboxState, 2, 1,
diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
index 168b3a620d..94b3a534f8 100644
--- a/hw/net/can/can_kvaser_pci.c
+++ b/hw/net/can/can_kvaser_pci.c
@@ -266,7 +266,6 @@ static const VMStateDescription vmstate_kvaser_pci = {
     .name = "kvaser_pci",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, KvaserPCIState),
         /* Load this before sja_state.  */
diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
index 7a79e2605a..29dc696f7c 100644
--- a/hw/net/can/can_mioe3680_pci.c
+++ b/hw/net/can/can_mioe3680_pci.c
@@ -203,7 +203,6 @@ static const VMStateDescription vmstate_mioe3680_pci = {
     .name = "mioe3680_pci",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, Mioe3680PCIState),
         VMSTATE_STRUCT(sja_state[0], Mioe3680PCIState, 0, vmstate_can_sja,
diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index 8ef4e74af0..e8e57f4f33 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -204,7 +204,6 @@ static const VMStateDescription vmstate_pcm3680i_pci = {
     .name = "pcm3680i_pci",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, Pcm3680iPCIState),
         VMSTATE_STRUCT(sja_state[0], Pcm3680iPCIState, 0,
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 34eea684ce..3ba803e947 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -928,7 +928,6 @@ const VMStateDescription vmstate_qemu_can_filter = {
     .name = "qemu_can_filter",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(can_id, qemu_can_filter),
         VMSTATE_UINT32(can_mask, qemu_can_filter),
@@ -952,7 +951,6 @@ const VMStateDescription vmstate_can_sja = {
     .name = "can_sja",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .post_load = can_sja_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(mode, CanSJA1000State),
diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index d171c372e0..f2c3b6a706 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -617,7 +617,6 @@ const VMStateDescription vmstate_qemu_ctucan_tx_buffer = {
     .name = "qemu_ctucan_tx_buffer",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8_ARRAY(data, CtuCanCoreMsgBuffer, CTUCAN_CORE_MSG_MAX_LEN),
         VMSTATE_END_OF_LIST()
@@ -636,7 +635,6 @@ const VMStateDescription vmstate_ctucan = {
     .name = "ctucan",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .post_load = ctucan_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(mode_settings.u32, CtuCanCoreState),
diff --git a/hw/net/can/ctucan_pci.c b/hw/net/can/ctucan_pci.c
index f1c86cd06a..50f4ea6cd6 100644
--- a/hw/net/can/ctucan_pci.c
+++ b/hw/net/can/ctucan_pci.c
@@ -215,7 +215,6 @@ static const VMStateDescription vmstate_ctucan_pci = {
     .name = "ctucan_pci",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, CtuCanPCIState),
         VMSTATE_STRUCT(ctucan_state[0], CtuCanPCIState, 0, vmstate_ctucan,
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index bb5bee9a33..462c87dba8 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1049,7 +1049,6 @@ const VMStateDescription vmstate_ppc_timebase = {
     .name = "timebase",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .pre_save = timebase_pre_save,
     .fields      = (VMStateField []) {
         VMSTATE_UINT64(guest_timebase, PPCTimebase),
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index c9da5ce0b5..203f25d4c4 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2315,7 +2315,6 @@ static const VMStateDescription vmstate_megasas_gen2 = {
     .name = "megasas-gen2",
     .version_id = 0,
     .minimum_version_id = 0,
-    .minimum_version_id_old = 0,
     .fields      = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, MegasasState),
         VMSTATE_MSIX(parent_obj, MegasasState),
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 5181b0c0b0..706cf0df3a 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1363,7 +1363,6 @@ static const VMStateDescription vmstate_mptsas = {
     .name = "mptsas",
     .version_id = 0,
     .minimum_version_id = 0,
-    .minimum_version_id_old = 0,
     .post_load = mptsas_post_load,
     .fields      = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, MPTSASState),
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 72da12fea5..688eccda94 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -592,7 +592,6 @@ static const VMStateDescription vmstate_virtio_mmio = {
     .name = "virtio_mmio",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_END_OF_LIST()
     },
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 750aa47ec1..f9cf9592fd 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -131,7 +131,6 @@ static const VMStateDescription vmstate_virtio_pci = {
     .name = "virtio_pci",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_END_OF_LIST()
     },
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index aae72fb8b7..9e8f51dfb0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2808,7 +2808,6 @@ static const VMStateDescription vmstate_virtio = {
     .name = "virtio",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_END_OF_LIST()
     },
diff --git a/target/openrisc/machine.c b/target/openrisc/machine.c
index 6239725c4f..b7d7388640 100644
--- a/target/openrisc/machine.c
+++ b/target/openrisc/machine.c
@@ -25,7 +25,6 @@ static const VMStateDescription vmstate_tlb_entry = {
     .name = "tlb_entry",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(mr, OpenRISCTLBEntry),
         VMSTATE_UINTTL(tr, OpenRISCTLBEntry),
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 733a22d744..a503e00ddc 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -421,7 +421,6 @@ static const VMStateDescription vmstate_tm = {
     .name = "cpu/tm",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .needed = tm_needed,
     .fields      = (VMStateField []) {
         VMSTATE_UINTTL_ARRAY(env.tm_gpr, PowerPCCPU, 32),
@@ -672,7 +671,6 @@ const VMStateDescription vmstate_ppc_cpu = {
     .name = "cpu",
     .version_id = 5,
     .minimum_version_id = 5,
-    .minimum_version_id_old = 4,
     .pre_save = cpu_pre_save,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
diff --git a/target/sparc/machine.c b/target/sparc/machine.c
index 917375c3a1..44b9e7d75d 100644
--- a/target/sparc/machine.c
+++ b/target/sparc/machine.c
@@ -10,7 +10,6 @@ static const VMStateDescription vmstate_cpu_timer = {
     .name = "cpu_timer",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(frequency, CPUTimer),
         VMSTATE_UINT32(disabled, CPUTimer),
@@ -30,7 +29,6 @@ static const VMStateDescription vmstate_trap_state = {
     .name = "trap_state",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(tpc, trap_state),
         VMSTATE_UINT64(tnpc, trap_state),
@@ -44,7 +42,6 @@ static const VMStateDescription vmstate_tlb_entry = {
     .name = "tlb_entry",
     .version_id = 1,
     .minimum_version_id = 1,
-    .minimum_version_id_old = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(tag, SparcTLBEntry),
         VMSTATE_UINT64(tte, SparcTLBEntry),
@@ -113,7 +110,6 @@ const VMStateDescription vmstate_sparc_cpu = {
     .name = "cpu",
     .version_id = SPARC_VMSTATE_VER,
     .minimum_version_id = SPARC_VMSTATE_VER,
-    .minimum_version_id_old = SPARC_VMSTATE_VER,
     .pre_save = cpu_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gregs, SPARCCPU, 8),
-- 
2.34.1


