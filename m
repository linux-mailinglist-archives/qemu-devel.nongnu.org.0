Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B996398327
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:38:32 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLSR-0002eB-5v
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQN-0008CQ-Ik
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQJ-0003jh-VJ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJjiZDbmhBrgYjtHVZM4jmrfW26bvpyJnh8bF5/m+s4=;
 b=akE8zNjApoOl4AEMUNIEqaEtxCpxRf3UQFHXsbMKZ3M3XzepEOS+9m1dTKvrTUOAapE78p
 B0D+QRFwGnPtzLFETUqVqDdMUainDj6w+V1TzPbsvboTs6S0qdIkUhlBIPUwiQpHBKW6Bt
 ABxso79V2NFGGkPWmLv5AH8PWuVN97w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-I3sJSZAoMi-xzyVaAIfxig-1; Wed, 02 Jun 2021 03:36:13 -0400
X-MC-Unique: I3sJSZAoMi-xzyVaAIfxig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F7B801B13;
 Wed,  2 Jun 2021 07:36:12 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1234A5C737;
 Wed,  2 Jun 2021 07:36:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/17] docs: fix references to docs/devel/tracing.rst
Date: Wed,  2 Jun 2021 09:35:50 +0200
Message-Id: <20210602073606.338994-2-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit e50caf4a5c ("tracing: convert documentation to rST")
converted docs/devel/tracing.txt to docs/devel/tracing.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/tracing.txt/tracing.rst/ $(git grep -l docs/devel/tracing.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210517151702.109066-2-sgarzare@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                     | 2 +-
 accel/kvm/trace-events          | 2 +-
 accel/tcg/trace-events          | 2 +-
 audio/trace-events              | 2 +-
 authz/trace-events              | 2 +-
 backends/tpm/trace-events       | 2 +-
 backends/trace-events           | 2 +-
 block/trace-events              | 2 +-
 chardev/trace-events            | 2 +-
 crypto/trace-events             | 2 +-
 hw/9pfs/trace-events            | 2 +-
 hw/acpi/trace-events            | 2 +-
 hw/adc/trace-events             | 2 +-
 hw/alpha/trace-events           | 2 +-
 hw/arm/trace-events             | 2 +-
 hw/audio/trace-events           | 2 +-
 hw/block/dataplane/trace-events | 2 +-
 hw/block/trace-events           | 2 +-
 hw/char/trace-events            | 2 +-
 hw/display/trace-events         | 2 +-
 hw/dma/trace-events             | 2 +-
 hw/gpio/trace-events            | 2 +-
 hw/hppa/trace-events            | 2 +-
 hw/i2c/trace-events             | 2 +-
 hw/i386/trace-events            | 2 +-
 hw/i386/xen/trace-events        | 2 +-
 hw/ide/trace-events             | 2 +-
 hw/input/trace-events           | 2 +-
 hw/intc/trace-events            | 2 +-
 hw/isa/trace-events             | 2 +-
 hw/mem/trace-events             | 2 +-
 hw/misc/macio/trace-events      | 2 +-
 hw/misc/trace-events            | 2 +-
 hw/net/trace-events             | 2 +-
 hw/nvram/trace-events           | 2 +-
 hw/pci-host/trace-events        | 2 +-
 hw/pci/trace-events             | 2 +-
 hw/ppc/trace-events             | 2 +-
 hw/rdma/trace-events            | 2 +-
 hw/rdma/vmw/trace-events        | 2 +-
 hw/rtc/trace-events             | 2 +-
 hw/s390x/trace-events           | 2 +-
 hw/scsi/trace-events            | 2 +-
 hw/sd/trace-events              | 2 +-
 hw/sparc/trace-events           | 2 +-
 hw/sparc64/trace-events         | 2 +-
 hw/timer/trace-events           | 2 +-
 hw/tpm/trace-events             | 2 +-
 hw/usb/trace-events             | 2 +-
 hw/vfio/trace-events            | 2 +-
 hw/virtio/trace-events          | 2 +-
 hw/watchdog/trace-events        | 2 +-
 hw/xen/trace-events             | 2 +-
 io/trace-events                 | 2 +-
 linux-user/trace-events         | 2 +-
 migration/trace-events          | 2 +-
 monitor/trace-events            | 2 +-
 nbd/trace-events                | 2 +-
 net/trace-events                | 2 +-
 qapi/trace-events               | 2 +-
 qom/trace-events                | 2 +-
 scripts/simpletrace.py          | 2 +-
 scsi/trace-events               | 2 +-
 softmmu/trace-events            | 2 +-
 target/arm/trace-events         | 2 +-
 target/hppa/trace-events        | 2 +-
 target/i386/kvm/trace-events    | 2 +-
 target/i386/trace-events        | 2 +-
 target/mips/trace-events        | 2 +-
 target/ppc/trace-events         | 2 +-
 target/s390x/trace-events       | 2 +-
 target/sparc/trace-events       | 2 +-
 trace-events                    | 2 +-
 ui/trace-events                 | 2 +-
 util/trace-events               | 2 +-
 75 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f55404f2f..5d195a9d95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2692,7 +2692,7 @@ F: scripts/tracetool.py
 F: scripts/tracetool/
 F: scripts/qemu-trace-stap*
 F: docs/tools/qemu-trace-stap.rst
-F: docs/devel/tracing.txt
+F: docs/devel/tracing.rst
 T: git https://github.com/stefanha/qemu.git tracing
 
 TPM
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 72a01320a1..399aaeb0ec 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # kvm-all.c
 kvm_ioctl(int type, void *arg) "type 0x%x, arg %p"
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 6eefb37f5d..59eab96f26 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # TCG related tracing
 # cpu-exec.c
diff --git a/audio/trace-events b/audio/trace-events
index 6aec535763..957c92337b 100644
--- a/audio/trace-events
+++ b/audio/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # alsaaudio.c
 alsa_revents(int revents) "revents = %d"
diff --git a/authz/trace-events b/authz/trace-events
index e62ebb36b7..9c255dafb6 100644
--- a/authz/trace-events
+++ b/authz/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # base.c
 qauthz_is_allowed(void *authz, const char *identity, bool allowed) "AuthZ %p check identity=%s allowed=%d"
diff --git a/backends/tpm/trace-events b/backends/tpm/trace-events
index 0a2591fb2d..3298766dd7 100644
--- a/backends/tpm/trace-events
+++ b/backends/tpm/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # tpm_passthrough.c
 tpm_passthrough_handle_request(void *cmd) "processing command %p"
diff --git a/backends/trace-events b/backends/trace-events
index 59058f7630..652eb76a57 100644
--- a/backends/trace-events
+++ b/backends/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # dbus-vmstate.c
 dbus_vmstate_pre_save(void)
diff --git a/block/trace-events b/block/trace-events
index 31062ed437..574760ba9a 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # ../block.c
 bdrv_open_common(void *bs, const char *filename, int flags, const char *format_name) "bs %p filename \"%s\" flags 0x%x format_name \"%s\""
diff --git a/chardev/trace-events b/chardev/trace-events
index 5ea4408207..027107b0c1 100644
--- a/chardev/trace-events
+++ b/chardev/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # wctablet.c
 wct_init(void) ""
diff --git a/crypto/trace-events b/crypto/trace-events
index 798b6067ab..bccd0bbf29 100644
--- a/crypto/trace-events
+++ b/crypto/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # tlscreds.c
 qcrypto_tls_creds_load_dh(void *creds, const char *filename) "TLS creds load DH creds=%p filename=%s"
diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
index 10188daf7f..6c77966c0b 100644
--- a/hw/9pfs/trace-events
+++ b/hw/9pfs/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # 9p.c
 v9fs_rcancel(uint16_t tag, uint8_t id) "tag %d id %d"
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index dcc1438f3a..974d770e8b 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # memory_hotplug.c
 mhp_acpi_invalid_slot_selected(uint32_t slot) "0x%"PRIx32
diff --git a/hw/adc/trace-events b/hw/adc/trace-events
index 4c3279ece2..456f21c8f4 100644
--- a/hw/adc/trace-events
+++ b/hw/adc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # npcm7xx_adc.c
 npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
diff --git a/hw/alpha/trace-events b/hw/alpha/trace-events
index 5b8315f27f..952a816407 100644
--- a/hw/alpha/trace-events
+++ b/hw/alpha/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pci.c
 alpha_pci_iack_write(void) ""
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index b79a91af5f..2dee296c8f 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # virt-acpi-build.c
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index 432e10712f..e0e71cd9b1 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # cs4231.c
 cs4231_mem_readl_dreg(uint32_t reg, uint32_t ret) "read dreg %d: 0x%02x"
diff --git a/hw/block/dataplane/trace-events b/hw/block/dataplane/trace-events
index 843cc4e7b1..38fc3e7507 100644
--- a/hw/block/dataplane/trace-events
+++ b/hw/block/dataplane/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # virtio-blk.c
 virtio_blk_data_plane_start(void *s) "dataplane %p"
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 646917d045..70bed9ddb7 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # fdc.c
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2e6e6b119a..1436fb462d 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # parallel.c
 parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s] addr 0x%02x val 0x%02x"
diff --git a/hw/display/trace-events b/hw/display/trace-events
index e47264af5d..f03f6655bc 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # jazz_led.c
 jazz_led_read(uint64_t addr, uint8_t val) "read addr=0x%"PRIx64": 0x%x"
diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 44893995f6..3c47df54e4 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # rc4030.c
 jazzio_read(uint64_t addr, uint32_t ret) "read reg[0x%"PRIx64"] = 0x%x"
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 46ab9323bd..f0b664158e 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # npcm7xx_gpio.c
 npcm7xx_gpio_read(const char *id, uint64_t offset, uint64_t value) " %s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
diff --git a/hw/hppa/trace-events b/hw/hppa/trace-events
index 3ff620319a..3f42be9056 100644
--- a/hw/hppa/trace-events
+++ b/hw/hppa/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pci.c
 hppa_pci_iack_write(void) ""
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 82f19e6a2d..7d8907c1ee 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # core.c
 
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index e48bef2b0d..5bf7e52bf5 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # x86-iommu.c
 x86_iommu_iec_notify(bool global, uint32_t index, uint32_t mask) "Notify IEC invalidation: global=%d index=%" PRIu32 " mask=%" PRIu32
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index ca3a4948ba..5d6be61090 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # xen_platform.c
 xen_platform_log(char *s) "xen platform: %s"
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 6e357685f9..15d7921f15 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # core.c
 # portio
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 109bdf7a18..e0bfe7f3ee 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # adb-kbd.c
 adb_device_kbd_no_key(void) "Ignoring NO_KEY"
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 626bb554b2..e56e7dd3b6 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # i8259.c
 pic_update_irq(bool master, uint8_t imr, uint8_t irr, uint8_t padd) "master %d imr %"PRIu8" irr %"PRIu8" padd %"PRIu8
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index 641d69eedf..b8f877e1ed 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # isa-superio.c
 superio_create_parallel(int id, uint16_t base, unsigned int irq) "id=%d, base 0x%03x, irq %u"
diff --git a/hw/mem/trace-events b/hw/mem/trace-events
index 9f6b52acd7..8b6b02b5bf 100644
--- a/hw/mem/trace-events
+++ b/hw/mem/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pc-dimm.c
 mhp_pc_dimm_assigned_slot(int slot) "%d"
diff --git a/hw/misc/macio/trace-events b/hw/misc/macio/trace-events
index e4a1cc0d24..ad4b9d1c08 100644
--- a/hw/misc/macio/trace-events
+++ b/hw/misc/macio/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # cuda.c
 cuda_delay_set_sr_int(void) ""
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 0752217636..ede413965b 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # allwinner-cpucfg.c
 allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, reset_addr 0x%" PRIu32
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 1704bb0664..c28b91ee1a 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # allwinner-sun8i-emac.c
 allwinner_sun8i_emac_mii_write_reg(uint32_t reg, uint32_t value) "MII write: reg=0x%" PRIx32 " value=0x%" PRIx32
diff --git a/hw/nvram/trace-events b/hw/nvram/trace-events
index e023193295..5e33b24d47 100644
--- a/hw/nvram/trace-events
+++ b/hw/nvram/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # ds1225y.c
 nvram_read(uint32_t addr, uint32_t ret) "read addr %d: 0x%02x"
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index dac86ad3f0..f4b3a50cb0 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index def4b3926d..fc777d0b5e 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pci.c
 pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index b4bbfbb013..0ba3e40353 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # spapr_pci.c
 spapr_pci_msi(const char *msg, uint32_t ca) "%s (cfg=0x%x)"
diff --git a/hw/rdma/trace-events b/hw/rdma/trace-events
index 2022a820cb..9accb14973 100644
--- a/hw/rdma/trace-events
+++ b/hw/rdma/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # rdma_backend.c
 rdma_check_dev_attr(const char *name, int max_bk, int max_fe) "%s: be=%d, fe=%d"
diff --git a/hw/rdma/vmw/trace-events b/hw/rdma/vmw/trace-events
index 323fca8456..a6c77e1e10 100644
--- a/hw/rdma/vmw/trace-events
+++ b/hw/rdma/vmw/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pvrdma_main.c
 pvrdma_regs_read(uint64_t addr, uint64_t val) "pvrdma.regs[0x%"PRIx64"]=0x%"PRIx64
diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
index 8bdcf74264..ebb311a5b0 100644
--- a/hw/rtc/trace-events
+++ b/hw/rtc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # allwinner-rtc.c
 allwinner_rtc_read(uint64_t addr, uint64_t value) "addr 0x%" PRIx64 " value 0x%" PRIx64
diff --git a/hw/s390x/trace-events b/hw/s390x/trace-events
index 8156693749..8b9213eab9 100644
--- a/hw/s390x/trace-events
+++ b/hw/s390x/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # css.c
 css_enable_facility(const char *facility) "CSS: enable %s"
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 1c331fb189..1a27e141ae 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # scsi-bus.c
 scsi_req_alloc(int target, int lun, int tag) "target %d lun %d tag %d"
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index e185d07a1d..3cc2ef89ba 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # allwinner-sdhost.c
 allwinner_sdhost_set_inserted(bool inserted) "inserted %u"
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index d3a30a816a..00b0212c3b 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # sun4m.c
 sun4m_cpu_set_irq_raise(int level) "Raise CPU IRQ %d"
diff --git a/hw/sparc64/trace-events b/hw/sparc64/trace-events
index b85d14c30c..3eb4bacf79 100644
--- a/hw/sparc64/trace-events
+++ b/hw/sparc64/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # sun4u.c
 ebus_isa_irq_handler(int n, int level) "Set ISA IRQ %d level %d"
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 029fb56280..5234c0ea9e 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # slavio_timer.c
 slavio_timer_get_out(uint64_t limit, uint32_t counthigh, uint32_t count) "limit 0x%"PRIx64" count 0x%x0x%08x"
diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index 6005ecb5da..f17110458e 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # tpm_crb.c
 tpm_crb_mmio_read(uint64_t addr, unsigned size, uint32_t val) "CRB read 0x%016" PRIx64 " len:%u val: 0x%" PRIx32
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 38e05fc7f4..b8287b63f1 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # core.c
 usb_packet_state_change(int bus, const char *port, int ep, void *p, const char *o, const char *n) "bus %d, port %s, ep %d, packet %p, state %s -> %s"
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 079f53acf2..0ef1b5f4a6 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pci.c
 vfio_intx_interrupt(const char *name, char line) " (%s) Pin %c"
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index c62727f879..8ed19e9d0c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # vhost.c
 vhost_commit(bool started, bool changed) "Started: %d Changed: %d"
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 3124ca1f1b..c3bafbffa9 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # cmsdk-apb-watchdog.c
 cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index e6885bc751..3da3fd8348 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # ../../include/hw/xen/xen_common.h
 xen_default_ioreq_server(void) ""
diff --git a/io/trace-events b/io/trace-events
index d7bc70b966..c5e814eb44 100644
--- a/io/trace-events
+++ b/io/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # task.c
 qio_task_new(void *task, void *source, void *func, void *opaque) "Task new task=%p source=%p func=%p opaque=%p"
diff --git a/linux-user/trace-events b/linux-user/trace-events
index 0296133dae..1ec0d11ee3 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # signal.c
 signal_table_init(int i) "number of unavailable signals: %d"
diff --git a/migration/trace-events b/migration/trace-events
index 668c562fed..860c4f4025 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # savevm.c
 qemu_loadvm_state_section(unsigned int section_type) "%d"
diff --git a/monitor/trace-events b/monitor/trace-events
index 348dcfca9b..032d1220e1 100644
--- a/monitor/trace-events
+++ b/monitor/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # hmp.c
 handle_hmp_command(void *mon, const char *cmdline) "mon %p cmdline: %s"
diff --git a/nbd/trace-events b/nbd/trace-events
index a955918e97..c4919a2dd5 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # client.c
 nbd_send_option_request(uint32_t opt, const char *name, uint32_t len) "Sending option request %" PRIu32" (%s), len %" PRIu32
diff --git a/net/trace-events b/net/trace-events
index bfaff7891d..d7a17256cc 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # announce.c
 qemu_announce_self_iter(const char *id, const char *name, const char *mac, int skip) "%s:%s:%s skip: %d"
diff --git a/qapi/trace-events b/qapi/trace-events
index 3cabe912ae..cccafc07e5 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # qapi-visit-core.c
 visit_free(void *v) "v=%p"
diff --git a/qom/trace-events b/qom/trace-events
index 945205bd10..b2e9f4a712 100644
--- a/qom/trace-events
+++ b/qom/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # object.c
 object_dynamic_cast_assert(const char *type, const char *target, const char *file, int line, const char *func) "%s->%s (%s:%d:%s)"
diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index d61fb0bd87..1f6d1ae1f3 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -7,7 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 #
-# For help see docs/devel/tracing.txt
+# For help see docs/devel/tracing.rst
 
 import struct
 import inspect
diff --git a/scsi/trace-events b/scsi/trace-events
index 6dbfeae790..baf924fa89 100644
--- a/scsi/trace-events
+++ b/scsi/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # pr-manager.c
 pr_manager_execute(int fd, int cmd, int sa) "fd=%d cmd=0x%02x service action=0x%02x"
diff --git a/softmmu/trace-events b/softmmu/trace-events
index b80ca042e1..5262828b8d 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # balloon.c
 # Since requests are raised via monitor, not many tracepoints are needed.
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 41c63d7570..2a0ba7bffc 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # helper.c
 arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
diff --git a/target/hppa/trace-events b/target/hppa/trace-events
index 0731ce7ce1..8931517890 100644
--- a/target/hppa/trace-events
+++ b/target/hppa/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # mem_helper.c
 disable hppa_tlb_flush_ent(void *env, void *ent, uint64_t va_b, uint64_t va_e, uint64_t pa) "env=%p ent=%p va_b=0x%lx va_e=0x%lx pa=0x%lx"
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index b4e2d9e4ea..7c369db1e1 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # kvm.c
 kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %" PRIu32
diff --git a/target/i386/trace-events b/target/i386/trace-events
index a22ab24e21..f5ecbe24bb 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # sev.c
 kvm_sev_init(void) ""
diff --git a/target/mips/trace-events b/target/mips/trace-events
index ba87fe6062..0c55e0bbad 100644
--- a/target/mips/trace-events
+++ b/target/mips/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # translate.c
 mips_translate_c0(const char *instr, const char *rn, int reg, int sel) "%s %s (reg %d sel %d)"
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index bc0d4e6f8b..c88cfccf8d 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # kvm.c
 kvm_failed_spr_set(int spr, const char *msg) "Warning: Unable to set SPR %d to KVM: %s"
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index fda1ee8220..e661a81e3a 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # mmu_helper.c
 get_skeys_nonzero(int rc) "SKEY: Call to get_skeys unexpectedly returned %d"
diff --git a/target/sparc/trace-events b/target/sparc/trace-events
index 75e7093d5f..de9833283d 100644
--- a/target/sparc/trace-events
+++ b/target/sparc/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # mmu_helper.c
 mmu_helper_dfault(uint64_t address, uint64_t context, int mmu_idx, uint32_t tl) "DFAULT at 0x%"PRIx64" context 0x%"PRIx64" mmu_idx=%d tl=%d"
diff --git a/trace-events b/trace-events
index ac7cef9335..765fe251e6 100644
--- a/trace-events
+++ b/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 #
 # This file is processed by the tracetool script during the build.
 #
diff --git a/ui/trace-events b/ui/trace-events
index c86542e2b6..1b5f87bc09 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # console.c
 console_gfx_new(void) ""
diff --git a/util/trace-events b/util/trace-events
index bac0924899..806cac14a7 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -1,4 +1,4 @@
-# See docs/devel/tracing.txt for syntax documentation.
+# See docs/devel/tracing.rst for syntax documentation.
 
 # aio-posix.c
 run_poll_handlers_begin(void *ctx, int64_t max_ns, int64_t timeout) "ctx %p max_ns %"PRId64 " timeout %"PRId64
-- 
2.27.0


