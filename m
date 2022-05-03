Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95E519068
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:47:44 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0Mx-0003tl-1h
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlywm-0003nx-6Q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlywh-0003YB-La
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bX/kKzh77xlg4GCxClyGvw/kEYrdscmX9tmktjjuMpY=;
 b=bxC9NsP6E92ihWk7JEkUQ/DvsD6bdnQfL20D+5bV70tAnMi5H+FoVclr2OugsFIkbR5S3v
 qCGKALNmyBovhWB2I/S8tbQXiFy/SKTjus+eb+zGFhgso/1C9lip1NjOd/tXU/sGRKSdWd
 vDxmC06d9qTlk5R3jXo/OZSw3khnt/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-uAxt5WAXNXGbmW2rSGtqMw-1; Tue, 03 May 2022 11:42:34 -0400
X-MC-Unique: uAxt5WAXNXGbmW2rSGtqMw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1EE6AE9F02;
 Tue,  3 May 2022 13:13:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6283463E15;
 Tue,  3 May 2022 13:13:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 03/23] tests: move libqtest.h back under qtest/
Date: Tue,  3 May 2022 17:12:36 +0400
Message-Id: <20220503131256.187238-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
libqtest.h is under libqos/ directory, while libqtest.c is still in
qtest/. Move back to its original location to avoid mixing with libqos/.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 docs/devel/qtest.rst                             | 2 +-
 tests/qtest/acpi-utils.h                         | 2 +-
 tests/qtest/boot-sector.h                        | 2 +-
 tests/qtest/fuzz/fuzz.h                          | 2 +-
 tests/qtest/libqos/fw_cfg.h                      | 2 +-
 tests/qtest/libqos/i2c.h                         | 2 +-
 tests/qtest/libqos/libqos.h                      | 2 +-
 tests/qtest/libqos/malloc.h                      | 2 +-
 tests/qtest/libqos/pci.h                         | 2 +-
 tests/qtest/libqos/sdhci-cmd.h                   | 2 +-
 tests/qtest/libqtest-single.h                    | 2 +-
 tests/qtest/{libqos => }/libqtest.h              | 0
 tests/qtest/migration-helpers.h                  | 2 +-
 tests/qtest/tpm-emu.h                            | 2 +-
 tests/qtest/ac97-test.c                          | 2 +-
 tests/qtest/ahci-test.c                          | 2 +-
 tests/qtest/am53c974-test.c                      | 2 +-
 tests/qtest/arm-cpu-features.c                   | 2 +-
 tests/qtest/aspeed_hace-test.c                   | 2 +-
 tests/qtest/boot-order-test.c                    | 2 +-
 tests/qtest/boot-sector.c                        | 2 +-
 tests/qtest/boot-serial-test.c                   | 2 +-
 tests/qtest/cdrom-test.c                         | 2 +-
 tests/qtest/dbus-display-test.c                  | 2 +-
 tests/qtest/dbus-vmstate-test.c                  | 2 +-
 tests/qtest/device-introspect-test.c             | 2 +-
 tests/qtest/device-plug-test.c                   | 2 +-
 tests/qtest/drive_del-test.c                     | 2 +-
 tests/qtest/ds1338-test.c                        | 2 +-
 tests/qtest/e1000-test.c                         | 2 +-
 tests/qtest/eepro100-test.c                      | 2 +-
 tests/qtest/endianness-test.c                    | 2 +-
 tests/qtest/erst-test.c                          | 2 +-
 tests/qtest/es1370-test.c                        | 2 +-
 tests/qtest/fuzz-e1000e-test.c                   | 2 +-
 tests/qtest/fuzz-lsi53c895a-test.c               | 2 +-
 tests/qtest/fuzz-megasas-test.c                  | 2 +-
 tests/qtest/fuzz-sb16-test.c                     | 2 +-
 tests/qtest/fuzz-sdcard-test.c                   | 2 +-
 tests/qtest/fuzz-virtio-scsi-test.c              | 2 +-
 tests/qtest/fuzz-xlnx-dp-test.c                  | 2 +-
 tests/qtest/fuzz/fuzz.c                          | 2 +-
 tests/qtest/fuzz/generic_fuzz.c                  | 2 +-
 tests/qtest/fuzz/i440fx_fuzz.c                   | 2 +-
 tests/qtest/fuzz/qos_fuzz.c                      | 2 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c               | 2 +-
 tests/qtest/fuzz/virtio_net_fuzz.c               | 2 +-
 tests/qtest/fuzz/virtio_scsi_fuzz.c              | 2 +-
 tests/qtest/fw_cfg-test.c                        | 2 +-
 tests/qtest/hd-geo-test.c                        | 2 +-
 tests/qtest/hexloader-test.c                     | 2 +-
 tests/qtest/ide-test.c                           | 2 +-
 tests/qtest/ipoctal232-test.c                    | 2 +-
 tests/qtest/ivshmem-test.c                       | 2 +-
 tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c | 2 +-
 tests/qtest/libqos/ahci.c                        | 2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c       | 2 +-
 tests/qtest/libqos/arm-n800-machine.c            | 2 +-
 tests/qtest/libqos/arm-raspi2-machine.c          | 2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c       | 2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c        | 2 +-
 tests/qtest/libqos/arm-virt-machine.c            | 2 +-
 tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  | 2 +-
 tests/qtest/libqos/e1000e.c                      | 2 +-
 tests/qtest/libqos/fw_cfg.c                      | 2 +-
 tests/qtest/libqos/i2c-imx.c                     | 2 +-
 tests/qtest/libqos/i2c-omap.c                    | 2 +-
 tests/qtest/libqos/i2c.c                         | 2 +-
 tests/qtest/libqos/libqos.c                      | 2 +-
 tests/qtest/libqos/pci-pc.c                      | 2 +-
 tests/qtest/libqos/pci-spapr.c                   | 2 +-
 tests/qtest/libqos/ppc64_pseries-machine.c       | 2 +-
 tests/qtest/libqos/qgraph.c                      | 2 +-
 tests/qtest/libqos/qos_external.c                | 2 +-
 tests/qtest/libqos/rtas.c                        | 2 +-
 tests/qtest/libqos/sdhci-cmd.c                   | 2 +-
 tests/qtest/libqos/sdhci.c                       | 2 +-
 tests/qtest/libqos/tpci200.c                     | 2 +-
 tests/qtest/libqos/usb.c                         | 2 +-
 tests/qtest/libqos/vhost-user-blk.c              | 2 +-
 tests/qtest/libqos/virtio-9p.c                   | 2 +-
 tests/qtest/libqos/virtio-balloon.c              | 2 +-
 tests/qtest/libqos/virtio-blk.c                  | 2 +-
 tests/qtest/libqos/virtio-iommu.c                | 2 +-
 tests/qtest/libqos/virtio-mmio.c                 | 2 +-
 tests/qtest/libqos/virtio-net.c                  | 2 +-
 tests/qtest/libqos/virtio-pci.c                  | 2 +-
 tests/qtest/libqos/virtio-rng.c                  | 2 +-
 tests/qtest/libqos/virtio-scsi.c                 | 2 +-
 tests/qtest/libqos/virtio-serial.c               | 2 +-
 tests/qtest/libqos/virtio.c                      | 2 +-
 tests/qtest/libqos/x86_64_pc-machine.c           | 2 +-
 tests/qtest/libqtest.c                           | 2 +-
 tests/qtest/lpc-ich9-test.c                      | 2 +-
 tests/qtest/m48t59-test.c                        | 2 +-
 tests/qtest/machine-none-test.c                  | 2 +-
 tests/qtest/megasas-test.c                       | 2 +-
 tests/qtest/microbit-test.c                      | 2 +-
 tests/qtest/migration-test.c                     | 2 +-
 tests/qtest/modules-test.c                       | 2 +-
 tests/qtest/ne2000-test.c                        | 2 +-
 tests/qtest/npcm7xx_adc-test.c                   | 2 +-
 tests/qtest/npcm7xx_pwm-test.c                   | 2 +-
 tests/qtest/npcm7xx_sdhci-test.c                 | 2 +-
 tests/qtest/npcm7xx_smbus-test.c                 | 2 +-
 tests/qtest/npcm7xx_watchdog_timer-test.c        | 2 +-
 tests/qtest/numa-test.c                          | 2 +-
 tests/qtest/nvme-test.c                          | 2 +-
 tests/qtest/pca9552-test.c                       | 2 +-
 tests/qtest/pci-test.c                           | 2 +-
 tests/qtest/pcnet-test.c                         | 2 +-
 tests/qtest/pflash-cfi02-test.c                  | 2 +-
 tests/qtest/pnv-xscom-test.c                     | 2 +-
 tests/qtest/prom-env-test.c                      | 2 +-
 tests/qtest/pvpanic-pci-test.c                   | 2 +-
 tests/qtest/pvpanic-test.c                       | 2 +-
 tests/qtest/pxe-test.c                           | 2 +-
 tests/qtest/q35-test.c                           | 2 +-
 tests/qtest/qmp-cmd-test.c                       | 2 +-
 tests/qtest/qmp-test.c                           | 2 +-
 tests/qtest/qom-test.c                           | 2 +-
 tests/qtest/rtas-test.c                          | 2 +-
 tests/qtest/sdhci-test.c                         | 2 +-
 tests/qtest/spapr-phb-test.c                     | 2 +-
 tests/qtest/tco-test.c                           | 2 +-
 tests/qtest/test-filter-mirror.c                 | 2 +-
 tests/qtest/test-filter-redirector.c             | 2 +-
 tests/qtest/test-hmp.c                           | 2 +-
 tests/qtest/tpm-crb-swtpm-test.c                 | 2 +-
 tests/qtest/tpm-tis-device-swtpm-test.c          | 2 +-
 tests/qtest/tpm-tis-swtpm-test.c                 | 2 +-
 tests/qtest/tpm-util.c                           | 2 +-
 tests/qtest/tulip-test.c                         | 2 +-
 tests/qtest/virtio-net-failover.c                | 2 +-
 tests/qtest/virtio-rng-test.c                    | 2 +-
 tests/qtest/virtio-test.c                        | 2 +-
 tests/qtest/vmgenid-test.c                       | 2 +-
 tests/qtest/vmxnet3-test.c                       | 2 +-
 tests/qtest/wdt_ib700-test.c                     | 2 +-
 tests/qtest/xlnx-can-test.c                      | 2 +-
 tests/unit/test-qga.c                            | 2 +-
 scripts/oss-fuzz/output_reproducer.py            | 2 +-
 142 files changed, 141 insertions(+), 141 deletions(-)
 rename tests/qtest/{libqos => }/libqtest.h (100%)

diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
index add293d39700..0455aa06ab28 100644
--- a/docs/devel/qtest.rst
+++ b/docs/devel/qtest.rst
@@ -88,4 +88,4 @@ QTest Protocol
 libqtest API reference
 ----------------------
 
-.. kernel-doc:: tests/qtest/libqos/libqtest.h
+.. kernel-doc:: tests/qtest/libqtest.h
diff --git a/tests/qtest/acpi-utils.h b/tests/qtest/acpi-utils.h
index 261784d25189..0c8678068931 100644
--- a/tests/qtest/acpi-utils.h
+++ b/tests/qtest/acpi-utils.h
@@ -13,7 +13,7 @@
 #ifndef TEST_ACPI_UTILS_H
 #define TEST_ACPI_UTILS_H
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /* DSDT and SSDTs format */
 typedef struct {
diff --git a/tests/qtest/boot-sector.h b/tests/qtest/boot-sector.h
index b339fdee4c84..6ee6bb4d97f4 100644
--- a/tests/qtest/boot-sector.h
+++ b/tests/qtest/boot-sector.h
@@ -14,7 +14,7 @@
 #ifndef TEST_BOOT_SECTOR_H
 #define TEST_BOOT_SECTOR_H
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /* Create boot disk file. fname must be a suitable string for mkstemp() */
 int boot_sector_init(char *fname);
diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
index 3a8570e84c79..c5f0b7227a10 100644
--- a/tests/qtest/fuzz/fuzz.h
+++ b/tests/qtest/fuzz/fuzz.h
@@ -17,7 +17,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 
 /**
  * A libfuzzer fuzzing target
diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
index c6a7cf8cf053..b0456a15df19 100644
--- a/tests/qtest/libqos/fw_cfg.h
+++ b/tests/qtest/libqos/fw_cfg.h
@@ -13,7 +13,7 @@
 #ifndef LIBQOS_FW_CFG_H
 #define LIBQOS_FW_CFG_H
 
-#include "libqtest.h"
+#include "../libqtest.h"
 
 typedef struct QFWCFG QFWCFG;
 
diff --git a/tests/qtest/libqos/i2c.h b/tests/qtest/libqos/i2c.h
index 1341bac1c599..d0322409227c 100644
--- a/tests/qtest/libqos/i2c.h
+++ b/tests/qtest/libqos/i2c.h
@@ -9,7 +9,7 @@
 #ifndef LIBQOS_I2C_H
 #define LIBQOS_I2C_H
 
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qgraph.h"
 
 typedef struct I2CAdapter I2CAdapter;
diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h
index e0b2bfe7caf9..ba7df448cad7 100644
--- a/tests/qtest/libqos/libqos.h
+++ b/tests/qtest/libqos/libqos.h
@@ -1,7 +1,7 @@
 #ifndef LIBQOS_H
 #define LIBQOS_H
 
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "pci.h"
 #include "malloc.h"
 
diff --git a/tests/qtest/libqos/malloc.h b/tests/qtest/libqos/malloc.h
index 4d1a2e2bef4a..bbb8c743cc5a 100644
--- a/tests/qtest/libqos/malloc.h
+++ b/tests/qtest/libqos/malloc.h
@@ -14,7 +14,7 @@
 #define LIBQOS_MALLOC_H
 
 #include "qemu/queue.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 
 typedef enum {
     ALLOC_NO_FLAGS    = 0x00,
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index becb800f9e6a..e705e06598c2 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -13,7 +13,7 @@
 #ifndef LIBQOS_PCI_H
 #define LIBQOS_PCI_H
 
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qgraph.h"
 
 #define QPCI_PIO_LIMIT    0x10000
diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.h
index 64763c5a2ace..9e61dd494464 100644
--- a/tests/qtest/libqos/sdhci-cmd.h
+++ b/tests/qtest/libqos/sdhci-cmd.h
@@ -14,7 +14,7 @@
  * for more details.
  */
 
-#include "libqtest.h"
+#include "../libqtest.h"
 
 /* more details at hw/sd/sdhci-internal.h */
 #define SDHC_BLKSIZE 0x04
diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index b0838b9e0e71..4e7d0ae1dcd3 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -11,7 +11,7 @@
 #ifndef LIBQTEST_SINGLE_H
 #define LIBQTEST_SINGLE_H
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 QTestState *global_qtest __attribute__((common, weak));
 
diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqtest.h
similarity index 100%
rename from tests/qtest/libqos/libqtest.h
rename to tests/qtest/libqtest.h
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index 555adafce129..c7872e84421f 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -12,7 +12,7 @@
 #ifndef MIGRATION_HELPERS_H_
 #define MIGRATION_HELPERS_H_
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 extern bool got_stop;
 
diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index c33d99af3743..712cee9b7a54 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -22,7 +22,7 @@
 #include "qemu/sockets.h"
 #include "io/channel.h"
 #include "sysemu/tpm.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 struct tpm_hdr {
     uint16_t tag;
diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
index e09f2495d24d..b084e31bff5f 100644
--- a/tests/qtest/ac97-test.c
+++ b/tests/qtest/ac97-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index aff5f3f79776..f1e510b0ac00 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include <getopt.h>
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/libqos-pc.h"
 #include "libqos/ahci.h"
 #include "libqos/pci-pc.h"
diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index d214a912b3b4..ed3ac7db20de 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 
 static void test_cmdfifo_underflow_ok(void)
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index f76652143acc..5a145273860c 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -10,7 +10,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 
diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 58aa22014d04..be0dd71df9bd 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -7,7 +7,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/bitops.h"
 
 #define HACE_CMD                 0x10
diff --git a/tests/qtest/boot-order-test.c b/tests/qtest/boot-order-test.c
index f1f59b1261fe..0680d79d6da3 100644
--- a/tests/qtest/boot-order-test.c
+++ b/tests/qtest/boot-order-test.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "libqos/fw_cfg.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "standard-headers/linux/qemu_fw_cfg.h"
 
diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index 9d9825bc8145..44a109abd8f0 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -12,7 +12,7 @@
  */
 #include "qemu/osdep.h"
 #include "boot-sector.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 #define LOW(x) ((x) & 0xff)
 #define HIGH(x) ((x) >> 8)
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index d72a82d6292e..2f99d71cab35 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -14,7 +14,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
 static const uint8_t bios_avr[] = {
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index fdd889a487db..a7766a9e6571 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "boot-sector.h"
 #include "qapi/qmp/qdict.h"
 
diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-test.c
index 81043162dfdd..8be597476315 100644
--- a/tests/qtest/dbus-display-test.c
+++ b/tests/qtest/dbus-display-test.c
@@ -2,7 +2,7 @@
 #include "qemu/dbus.h"
 #include <gio/gio.h>
 #include <gio/gunixfdlist.h>
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "dbus-display1.h"
 
 static GDBusConnection*
diff --git a/tests/qtest/dbus-vmstate-test.c b/tests/qtest/dbus-vmstate-test.c
index a8acab763f5d..74ede651f63d 100644
--- a/tests/qtest/dbus-vmstate-test.c
+++ b/tests/qtest/dbus-vmstate-test.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 #include <gio/gio.h>
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "dbus-vmstate1.h"
 #include "migration-helpers.h"
 
diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index adf39b2518e8..5b0ffe43f5f4 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -21,7 +21,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 const char common_args[] = "-nodefaults -machine none";
 
diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 404a92e1328a..2e3137843e37 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 
diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 0cc18dfa4aae..5e6d58b4dd26 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/virtio.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index c5d46bcc643d..f6ade9a050fb 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/i2c.h"
 
 #define DS1338_ADDR 0x68
diff --git a/tests/qtest/e1000-test.c b/tests/qtest/e1000-test.c
index ea286d179304..c387984ef6d6 100644
--- a/tests/qtest/e1000-test.c
+++ b/tests/qtest/e1000-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/eepro100-test.c b/tests/qtest/eepro100-test.c
index d72ad099f1eb..8dbffff0b81b 100644
--- a/tests/qtest/eepro100-test.c
+++ b/tests/qtest/eepro100-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/endianness-test.c b/tests/qtest/endianness-test.c
index 2f5a88bf4ce5..222d116fae2d 100644
--- a/tests/qtest/endianness-test.c
+++ b/tests/qtest/endianness-test.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/bswap.h"
 
 typedef struct TestCase TestCase;
diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index a0adc35bef7f..4e768a126f6a 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 #include "libqos/libqos-pc.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 #include "hw/pci/pci.h"
 
diff --git a/tests/qtest/es1370-test.c b/tests/qtest/es1370-test.c
index 2fd7fd2d3d30..adccdac1be57 100644
--- a/tests/qtest/es1370-test.c
+++ b/tests/qtest/es1370-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/fuzz-e1000e-test.c b/tests/qtest/fuzz-e1000e-test.c
index 66229e60964a..5052883fb6a8 100644
--- a/tests/qtest/fuzz-e1000e-test.c
+++ b/tests/qtest/fuzz-e1000e-test.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * https://bugs.launchpad.net/qemu/+bug/1879531
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 031d9de2419b..2e8e67859efb 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -6,7 +6,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * This used to trigger the assert in lsi_do_dma()
diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
index 129b182f830c..287fe19fc764 100644
--- a/tests/qtest/fuzz-megasas-test.c
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * This used to trigger the assert in scsi_dma_complete
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index 91fdcd1e8a0f..a65826b94378 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -7,7 +7,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * This used to trigger the assert in audio_calloc
diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index d0f4e0e93c0b..e7fd818148e8 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -7,7 +7,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * https://gitlab.com/qemu-project/qemu/-/issues/450
diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
index c9b6fe21231d..71c91b03568d 100644
--- a/tests/qtest/fuzz-virtio-scsi-test.c
+++ b/tests/qtest/fuzz-virtio-scsi-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * Here a MemoryRegionCache pointed to an MMIO region but had a
diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
index 69eb6c0eb104..51e9a373002c 100644
--- a/tests/qtest/fuzz-xlnx-dp-test.c
+++ b/tests/qtest/fuzz-xlnx-dp-test.c
@@ -7,7 +7,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * This used to trigger the out-of-bounds read in xlnx_dp_read
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 5f77c849837f..a7a5e14fa3bc 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -21,7 +21,7 @@
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
 #include "qemu/rcu.h"
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/qgraph.h"
 #include "fuzz.h"
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index bce83604825e..25df19fd5af3 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -15,7 +15,7 @@
 #include <wordexp.h>
 
 #include "hw/core/cpu.h"
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "fork_fuzz.h"
diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
index 86796bff2bca..b17fc725dfd6 100644
--- a/tests/qtest/fuzz/i440fx_fuzz.c
+++ b/tests/qtest/fuzz/i440fx_fuzz.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu/main-loop.h"
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/pci.h"
 #include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index dc891d838b6a..c856d3d500e8 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -22,7 +22,7 @@
 #include "exec/memory.h"
 #include "qemu/main-loop.h"
 
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/malloc.h"
 #include "tests/qtest/libqos/qgraph.h"
 #include "tests/qtest/libqos/qgraph_internal.h"
diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index 623a756fd472..236d078cc862 100644
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -11,7 +11,7 @@
 
 #include "qemu/osdep.h"
 
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/virtio-blk.h"
 #include "tests/qtest/libqos/virtio.h"
 #include "tests/qtest/libqos/virtio-pci.h"
diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
index 0e873ab8e25f..3df78d9c1c2a 100644
--- a/tests/qtest/fuzz/virtio_net_fuzz.c
+++ b/tests/qtest/fuzz/virtio_net_fuzz.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 
 #include "standard-headers/linux/virtio_config.h"
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/virtio-net.h"
 #include "fuzz.h"
 #include "fork_fuzz.h"
diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
index 6ff6fabe4ad3..b3220ef6cb20 100644
--- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
+++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 
-#include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/virtio-scsi.h"
 #include "tests/qtest/libqos/virtio.h"
 #include "tests/qtest/libqos/virtio-pci.h"
diff --git a/tests/qtest/fw_cfg-test.c b/tests/qtest/fw_cfg-test.c
index 95b3907c18c4..5dc807ba2385 100644
--- a/tests/qtest/fw_cfg-test.c
+++ b/tests/qtest/fw_cfg-test.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "standard-headers/linux/qemu_fw_cfg.h"
 #include "libqos/fw_cfg.h"
 #include "qemu/bswap.h"
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index da9c4c2792de..413cf964c05b 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -18,7 +18,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bswap.h"
 #include "qapi/qmp/qlist.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/fw_cfg.h"
 #include "libqos/libqos.h"
 #include "standard-headers/linux/qemu_fw_cfg.h"
diff --git a/tests/qtest/hexloader-test.c b/tests/qtest/hexloader-test.c
index 561502052a67..8b7aa2d72d0d 100644
--- a/tests/qtest/hexloader-test.c
+++ b/tests/qtest/hexloader-test.c
@@ -10,7 +10,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /* Load 'test.hex' and verify that the in-memory contents are as expected.
  * 'test.hex' is a memory test pattern stored in Hexadecimal Object
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index b7243a17b11d..5bcb75a7e53d 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/libqos.h"
 #include "libqos/pci-pc.h"
 #include "libqos/malloc-pc.h"
diff --git a/tests/qtest/ipoctal232-test.c b/tests/qtest/ipoctal232-test.c
index 65ce10b81bef..53a8c9b13ce5 100644
--- a/tests/qtest/ipoctal232-test.c
+++ b/tests/qtest/ipoctal232-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index 95628a418579..bfc91d1719d2 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -13,7 +13,7 @@
 #include "contrib/ivshmem-server/ivshmem-server.h"
 #include "libqos/libqos-pc.h"
 #include "libqos/libqos-spapr.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 #define TMPSHMSIZE (1 << 20)
 static char *tmpshm;
diff --git a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
index 79631cc7a9ad..c8a3ea11eb40 100644
--- a/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
+++ b/tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "malloc.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index 41c4be5efa93..f53f12aa9965 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -24,7 +24,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "ahci.h"
 #include "pci-pc.h"
 
diff --git a/tests/qtest/libqos/arm-imx25-pdk-machine.c b/tests/qtest/libqos/arm-imx25-pdk-machine.c
index 6692adfa4fcb..54d0c9533044 100644
--- a/tests/qtest/libqos/arm-imx25-pdk-machine.c
+++ b/tests/qtest/libqos/arm-imx25-pdk-machine.c
@@ -19,7 +19,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "malloc.h"
 #include "qgraph.h"
 #include "i2c.h"
diff --git a/tests/qtest/libqos/arm-n800-machine.c b/tests/qtest/libqos/arm-n800-machine.c
index ff2049c3a7eb..ecd46b1dafa0 100644
--- a/tests/qtest/libqos/arm-n800-machine.c
+++ b/tests/qtest/libqos/arm-n800-machine.c
@@ -19,7 +19,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "malloc.h"
 #include "qgraph.h"
 #include "i2c.h"
diff --git a/tests/qtest/libqos/arm-raspi2-machine.c b/tests/qtest/libqos/arm-raspi2-machine.c
index 09ca863c1030..0a2943440b28 100644
--- a/tests/qtest/libqos/arm-raspi2-machine.c
+++ b/tests/qtest/libqos/arm-raspi2-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "malloc.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/arm-sabrelite-machine.c b/tests/qtest/libqos/arm-sabrelite-machine.c
index 72425f0ad404..ec19a01660c0 100644
--- a/tests/qtest/libqos/arm-sabrelite-machine.c
+++ b/tests/qtest/libqos/arm-sabrelite-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "malloc.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/arm-smdkc210-machine.c b/tests/qtest/libqos/arm-smdkc210-machine.c
index 321b8826d4a2..4bff249ee89a 100644
--- a/tests/qtest/libqos/arm-smdkc210-machine.c
+++ b/tests/qtest/libqos/arm-smdkc210-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "malloc.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
index e0f59322845a..2e0beaefb8d7 100644
--- a/tests/qtest/libqos/arm-virt-machine.c
+++ b/tests/qtest/libqos/arm-virt-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "malloc.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
index 56e53c745bff..3be80020a6bc 100644
--- a/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
+++ b/tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "malloc.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index a451f6168f63..f87e0e84b2aa 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "pci-pc.h"
 #include "qemu/sockets.h"
 #include "qemu/iov.h"
diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
index 6b8e1babe51e..89f053ccacbd 100644
--- a/tests/qtest/libqos/fw_cfg.c
+++ b/tests/qtest/libqos/fw_cfg.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "fw_cfg.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/bswap.h"
 #include "hw/nvram/fw_cfg.h"
 
diff --git a/tests/qtest/libqos/i2c-imx.c b/tests/qtest/libqos/i2c-imx.c
index 8f9a7e383146..710cb926d62b 100644
--- a/tests/qtest/libqos/i2c-imx.c
+++ b/tests/qtest/libqos/i2c-imx.c
@@ -21,7 +21,7 @@
 #include "i2c.h"
 
 
-#include "libqtest.h"
+#include "../libqtest.h"
 
 #include "hw/i2c/imx_i2c.h"
 
diff --git a/tests/qtest/libqos/i2c-omap.c b/tests/qtest/libqos/i2c-omap.c
index eb4e453485db..6f98f54820be 100644
--- a/tests/qtest/libqos/i2c-omap.c
+++ b/tests/qtest/libqos/i2c-omap.c
@@ -11,7 +11,7 @@
 
 
 #include "qemu/bswap.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 
 enum OMAPI2CRegisters {
     OMAP_I2C_REV  = 0x00,
diff --git a/tests/qtest/libqos/i2c.c b/tests/qtest/libqos/i2c.c
index ade1bdb40e05..1a54c004eb41 100644
--- a/tests/qtest/libqos/i2c.c
+++ b/tests/qtest/libqos/i2c.c
@@ -8,7 +8,7 @@
  */
 #include "qemu/osdep.h"
 #include "i2c.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 
 void qi2c_send(QI2CDevice *i2cdev, const uint8_t *buf, uint16_t len)
 {
diff --git a/tests/qtest/libqos/libqos.c b/tests/qtest/libqos/libqos.c
index 2251e864efe1..85c7641add1b 100644
--- a/tests/qtest/libqos/libqos.c
+++ b/tests/qtest/libqos/libqos.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include <sys/wait.h>
 
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "libqos.h"
 #include "pci.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/qtest/libqos/pci-pc.c b/tests/qtest/libqos/pci-pc.c
index f97844289f13..e9dd5a57ec55 100644
--- a/tests/qtest/libqos/pci-pc.c
+++ b/tests/qtest/libqos/pci-pc.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "pci-pc.h"
 #include "qapi/qmp/qdict.h"
 #include "hw/pci/pci_regs.h"
diff --git a/tests/qtest/libqos/pci-spapr.c b/tests/qtest/libqos/pci-spapr.c
index 262226985f37..76bf9a855d5c 100644
--- a/tests/qtest/libqos/pci-spapr.c
+++ b/tests/qtest/libqos/pci-spapr.c
@@ -6,7 +6,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "pci-spapr.h"
 #include "rtas.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/ppc64_pseries-machine.c b/tests/qtest/libqos/ppc64_pseries-machine.c
index 24ca1799765f..364e9c689bb9 100644
--- a/tests/qtest/libqos/ppc64_pseries-machine.c
+++ b/tests/qtest/libqos/ppc64_pseries-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qgraph.h"
 #include "pci-spapr.h"
 #include "qemu/module.h"
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 109ff04e1e8f..0a2dddfafa4f 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/queue.h"
 #include "qgraph_internal.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/qos_external.c b/tests/qtest/libqos/qos_external.c
index 10ee0f75b288..b7a0b873a362 100644
--- a/tests/qtest/libqos/qos_external.c
+++ b/tests/qtest/libqos/qos_external.c
@@ -18,7 +18,7 @@
 
 #include "qemu/osdep.h"
 #include <getopt.h>
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qstring.h"
diff --git a/tests/qtest/libqos/rtas.c b/tests/qtest/libqos/rtas.c
index db29d5554dcb..dedbfb4cb3a6 100644
--- a/tests/qtest/libqos/rtas.c
+++ b/tests/qtest/libqos/rtas.c
@@ -4,7 +4,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "rtas.h"
 
 static void qrtas_copy_args(QTestState *qts, uint64_t target_args,
diff --git a/tests/qtest/libqos/sdhci-cmd.c b/tests/qtest/libqos/sdhci-cmd.c
index 2d9e51834114..a6f073ac1ac9 100644
--- a/tests/qtest/libqos/sdhci-cmd.c
+++ b/tests/qtest/libqos/sdhci-cmd.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 #include "sdhci-cmd.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 
 static ssize_t read_fifo(QTestState *qts, uint64_t reg, char *msg, size_t count)
 {
diff --git a/tests/qtest/libqos/sdhci.c b/tests/qtest/libqos/sdhci.c
index 65f0d07fc5ac..71696980f83e 100644
--- a/tests/qtest/libqos/sdhci.c
+++ b/tests/qtest/libqos/sdhci.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qgraph.h"
 #include "pci.h"
 #include "qemu/module.h"
diff --git a/tests/qtest/libqos/tpci200.c b/tests/qtest/libqos/tpci200.c
index 1787b1f188d3..8b0060324728 100644
--- a/tests/qtest/libqos/tpci200.c
+++ b/tests/qtest/libqos/tpci200.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "qgraph.h"
 #include "pci.h"
diff --git a/tests/qtest/libqos/usb.c b/tests/qtest/libqos/usb.c
index 8b45b0298446..446fdb5796c4 100644
--- a/tests/qtest/libqos/usb.c
+++ b/tests/qtest/libqos/usb.c
@@ -12,7 +12,7 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "hw/usb/uhci-regs.h"
 #include "usb.h"
 
diff --git a/tests/qtest/libqos/vhost-user-blk.c b/tests/qtest/libqos/vhost-user-blk.c
index 568c3426ed3a..2f3c9cb5336d 100644
--- a/tests/qtest/libqos/vhost-user-blk.c
+++ b/tests/qtest/libqos/vhost-user-blk.c
@@ -21,7 +21,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "standard-headers/linux/virtio_blk.h"
 #include "vhost-user-blk.h"
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index f51f0635cc0c..70aea8bf6287 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -22,7 +22,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "virtio-9p.h"
diff --git a/tests/qtest/libqos/virtio-balloon.c b/tests/qtest/libqos/virtio-balloon.c
index a3da5c234d49..29b5d175845a 100644
--- a/tests/qtest/libqos/virtio-balloon.c
+++ b/tests/qtest/libqos/virtio-balloon.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "qgraph.h"
 #include "virtio-balloon.h"
diff --git a/tests/qtest/libqos/virtio-blk.c b/tests/qtest/libqos/virtio-blk.c
index 5da02591bcc2..ee4943f32b99 100644
--- a/tests/qtest/libqos/virtio-blk.c
+++ b/tests/qtest/libqos/virtio-blk.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "standard-headers/linux/virtio_blk.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/virtio-iommu.c b/tests/qtest/libqos/virtio-iommu.c
index 18cba4ca36b6..afc7d14e9a60 100644
--- a/tests/qtest/libqos/virtio-iommu.c
+++ b/tests/qtest/libqos/virtio-iommu.c
@@ -12,7 +12,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "qgraph.h"
 #include "virtio-iommu.h"
diff --git a/tests/qtest/libqos/virtio-mmio.c b/tests/qtest/libqos/virtio-mmio.c
index 75efda30299a..a6cca8613b2c 100644
--- a/tests/qtest/libqos/virtio-mmio.c
+++ b/tests/qtest/libqos/virtio-mmio.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "virtio.h"
 #include "virtio-mmio.h"
diff --git a/tests/qtest/libqos/virtio-net.c b/tests/qtest/libqos/virtio-net.c
index 1cae07f60d6c..2ac73ac0b416 100644
--- a/tests/qtest/libqos/virtio-net.c
+++ b/tests/qtest/libqos/virtio-net.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "qgraph.h"
 #include "virtio-net.h"
diff --git a/tests/qtest/libqos/virtio-pci.c b/tests/qtest/libqos/virtio-pci.c
index cd3c0f5bf335..67c2498c84af 100644
--- a/tests/qtest/libqos/virtio-pci.c
+++ b/tests/qtest/libqos/virtio-pci.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "virtio.h"
 #include "virtio-pci.h"
 #include "pci.h"
diff --git a/tests/qtest/libqos/virtio-rng.c b/tests/qtest/libqos/virtio-rng.c
index 2e09dd7c48cb..078e3abaa72a 100644
--- a/tests/qtest/libqos/virtio-rng.c
+++ b/tests/qtest/libqos/virtio-rng.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "qgraph.h"
 #include "virtio-rng.h"
diff --git a/tests/qtest/libqos/virtio-scsi.c b/tests/qtest/libqos/virtio-scsi.c
index 5644e32fc319..c4d046142012 100644
--- a/tests/qtest/libqos/virtio-scsi.c
+++ b/tests/qtest/libqos/virtio-scsi.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "qgraph.h"
diff --git a/tests/qtest/libqos/virtio-serial.c b/tests/qtest/libqos/virtio-serial.c
index ee34afd95ad8..1d689c3e38fc 100644
--- a/tests/qtest/libqos/virtio-serial.c
+++ b/tests/qtest/libqos/virtio-serial.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qemu/module.h"
 #include "qgraph.h"
 #include "virtio-serial.h"
diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index fba918665951..09ec09b655cd 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/bswap.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "virtio.h"
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
diff --git a/tests/qtest/libqos/x86_64_pc-machine.c b/tests/qtest/libqos/x86_64_pc-machine.c
index ad96742a92d6..dce0c9463a47 100644
--- a/tests/qtest/libqos/x86_64_pc-machine.c
+++ b/tests/qtest/libqos/x86_64_pc-machine.c
@@ -17,7 +17,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "../libqtest.h"
 #include "qgraph.h"
 #include "pci-pc.h"
 #include "qemu/module.h"
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5098d71485cc..aaf5ab0ca533 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -20,7 +20,7 @@
 #include <sys/wait.h>
 #include <sys/un.h>
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
diff --git a/tests/qtest/lpc-ich9-test.c b/tests/qtest/lpc-ich9-test.c
index fe0bef998075..8ac95b89f729 100644
--- a/tests/qtest/lpc-ich9-test.c
+++ b/tests/qtest/lpc-ich9-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 static void test_lp1878642_pci_bus_get_irq_level_assert(void)
 {
diff --git a/tests/qtest/m48t59-test.c b/tests/qtest/m48t59-test.c
index 6db3234100a3..b94a1230f7fd 100644
--- a/tests/qtest/m48t59-test.c
+++ b/tests/qtest/m48t59-test.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 #define RTC_SECONDS             0x9
 #define RTC_MINUTES             0xa
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index 8ca18074b9f9..d0f8cd990245 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu/cutils.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 
 
diff --git a/tests/qtest/megasas-test.c b/tests/qtest/megasas-test.c
index eae70ff95f9c..d6796b9bd74d 100644
--- a/tests/qtest/megasas-test.c
+++ b/tests/qtest/megasas-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index 2b255579dfdd..04e199ec33f4 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/hwaddr.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 #include "hw/arm/nrf51.h"
 #include "hw/char/nrf51_uart.h"
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2af36c16a371..cba6023eb500 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/module.h"
diff --git a/tests/qtest/modules-test.c b/tests/qtest/modules-test.c
index c238b3f42216..88217686e14e 100644
--- a/tests/qtest/modules-test.c
+++ b/tests/qtest/modules-test.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 const char common_args[] = "-nodefaults -machine none";
 
diff --git a/tests/qtest/ne2000-test.c b/tests/qtest/ne2000-test.c
index 43cfc4535aab..3fc0e555d5e2 100644
--- a/tests/qtest/ne2000-test.c
+++ b/tests/qtest/ne2000-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 5ce8ce13b3d7..3fa6d9ece0bd 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "qemu/timer.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 
 #define REF_HZ          (25000000)
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index a54fd70d273b..c4a5fdcacd79 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qnum.h"
 
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
index c1f496fb29bb..aa35a77e8d37 100644
--- a/tests/qtest/npcm7xx_sdhci-test.c
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "hw/sd/npcm7xx_sdhci.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqtest-single.h"
 #include "libqos/sdhci-cmd.h"
 
diff --git a/tests/qtest/npcm7xx_smbus-test.c b/tests/qtest/npcm7xx_smbus-test.c
index 6b3038ac596f..a878cdc00142 100644
--- a/tests/qtest/npcm7xx_smbus-test.c
+++ b/tests/qtest/npcm7xx_smbus-test.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "libqos/i2c.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "hw/sensor/tmp105_regs.h"
 
 #define NR_SMBUS_DEVICES    16
diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm7xx_watchdog_timer-test.c
index 3aae5a043813..4773a673b207 100644
--- a/tests/qtest/npcm7xx_watchdog_timer-test.c
+++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 
 #define WTCR_OFFSET     0x1c
diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 90bf68a5b33c..749429dd27e6 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -10,7 +10,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 
diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
index f8bafb5d70fb..008d189b0faf 100644
--- a/tests/qtest/nvme-test.c
+++ b/tests/qtest/nvme-test.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
 #include "include/block/nvme.h"
diff --git a/tests/qtest/pca9552-test.c b/tests/qtest/pca9552-test.c
index 42a131266512..d80ed93cd3a5 100644
--- a/tests/qtest/pca9552-test.c
+++ b/tests/qtest/pca9552-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/qgraph.h"
 #include "libqos/i2c.h"
 #include "hw/misc/pca9552_regs.h"
diff --git a/tests/qtest/pci-test.c b/tests/qtest/pci-test.c
index e15d4d94d1d0..4b2092b94973 100644
--- a/tests/qtest/pci-test.c
+++ b/tests/qtest/pci-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/pcnet-test.c b/tests/qtest/pcnet-test.c
index 7583aeb3c38f..900944fa7e34 100644
--- a/tests/qtest/pcnet-test.c
+++ b/tests/qtest/pcnet-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index 6168edc821a8..7fce614b6412 100644
--- a/tests/qtest/pflash-cfi02-test.c
+++ b/tests/qtest/pflash-cfi02-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /*
  * To test the pflash_cfi02 device, we run QEMU with the musicpal machine with
diff --git a/tests/qtest/pnv-xscom-test.c b/tests/qtest/pnv-xscom-test.c
index c8d40433620a..2c46d5cf6de3 100644
--- a/tests/qtest/pnv-xscom-test.c
+++ b/tests/qtest/pnv-xscom-test.c
@@ -8,7 +8,7 @@
  */
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 typedef enum PnvChipType {
     PNV_CHIP_POWER8E,     /* AKA Murano (default) */
diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c
index bdbb01d8e584..c2b0448e551d 100644
--- a/tests/qtest/prom-env-test.c
+++ b/tests/qtest/prom-env-test.c
@@ -20,7 +20,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
 #define MAGIC   0xcafec0de
diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
index 2358852d356f..c82c365c267d 100644
--- a/tests/qtest/pvpanic-pci-test.c
+++ b/tests/qtest/pvpanic-pci-test.c
@@ -12,7 +12,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "libqos/pci.h"
 #include "libqos/pci-pc.h"
diff --git a/tests/qtest/pvpanic-test.c b/tests/qtest/pvpanic-test.c
index 6dcad2db4984..bc7b7dfc39e2 100644
--- a/tests/qtest/pvpanic-test.c
+++ b/tests/qtest/pvpanic-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 
 static void test_panic_nopause(void)
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 3cb47d2c5496..52f0b5c67c03 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "boot-sector.h"
 #include "libqos/libqos-spapr.h"
 
diff --git a/tests/qtest/q35-test.c b/tests/qtest/q35-test.c
index b7cf1449906f..c922d81bc020 100644
--- a/tests/qtest/q35-test.c
+++ b/tests/qtest/q35-test.c
@@ -10,7 +10,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/pci.h"
 #include "libqos/pci-pc.h"
 #include "hw/pci-host/q35.h"
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea3fd2a..056b40e67f60 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-introspect.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index cd27fae3deb2..9a42480cef0a 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-control.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index 6b162e12b5aa..7b871b2a3107 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -12,7 +12,7 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qemu/cutils.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 static void test_properties(QTestState *qts, const char *path, bool recurse)
 {
diff --git a/tests/qtest/rtas-test.c b/tests/qtest/rtas-test.c
index 5f1194a6eb53..50df60e5b20e 100644
--- a/tests/qtest/rtas-test.c
+++ b/tests/qtest/rtas-test.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 #include "libqos/libqos-spapr.h"
 #include "libqos/rtas.h"
diff --git a/tests/qtest/sdhci-test.c b/tests/qtest/sdhci-test.c
index a110cfe3219c..6275e7626c21 100644
--- a/tests/qtest/sdhci-test.c
+++ b/tests/qtest/sdhci-test.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/registerfields.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/pci-pc.h"
 #include "hw/pci/pci.h"
diff --git a/tests/qtest/spapr-phb-test.c b/tests/qtest/spapr-phb-test.c
index ea8d59650721..093dc22f2f41 100644
--- a/tests/qtest/spapr-phb-test.c
+++ b/tests/qtest/spapr-phb-test.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index 47bc7ad3019d..254f7353701c 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/pci.h"
 #include "libqos/pci-pc.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mirror.c
index fdf66cebd62f..c8b0a92b53b7 100644
--- a/tests/qtest/test-filter-mirror.c
+++ b/tests/qtest/test-filter-mirror.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter-redirector.c
index 339d3c04cedc..24ca9280f814 100644
--- a/tests/qtest/test-filter-redirector.c
+++ b/tests/qtest/test-filter-redirector.c
@@ -51,7 +51,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index 413eb95d2a0c..f8b22abe4cac 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -15,7 +15,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 static int verbose;
 
diff --git a/tests/qtest/tpm-crb-swtpm-test.c b/tests/qtest/tpm-crb-swtpm-test.c
index 1d82a48c04be..55fdb5657d91 100644
--- a/tests/qtest/tpm-crb-swtpm-test.c
+++ b/tests/qtest/tpm-crb-swtpm-test.c
@@ -15,7 +15,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "tpm-tests.h"
 #include "hw/acpi/tpm.h"
diff --git a/tests/qtest/tpm-tis-device-swtpm-test.c b/tests/qtest/tpm-tis-device-swtpm-test.c
index f7126eff9e74..7b200351426a 100644
--- a/tests/qtest/tpm-tis-device-swtpm-test.c
+++ b/tests/qtest/tpm-tis-device-swtpm-test.c
@@ -16,7 +16,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "tpm-tests.h"
 #include "hw/acpi/tpm.h"
diff --git a/tests/qtest/tpm-tis-swtpm-test.c b/tests/qtest/tpm-tis-swtpm-test.c
index fa590e68f115..90131cb3c487 100644
--- a/tests/qtest/tpm-tis-swtpm-test.c
+++ b/tests/qtest/tpm-tis-swtpm-test.c
@@ -15,7 +15,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "tpm-tests.h"
 #include "hw/acpi/tpm.h"
diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index 3a40ff3f96c2..e0dc5da0af1e 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -15,7 +15,7 @@
 #include "qemu/osdep.h"
 
 #include "hw/acpi/tpm.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "tpm-util.h"
 #include "qapi/qmp/qdict.h"
 
diff --git a/tests/qtest/tulip-test.c b/tests/qtest/tulip-test.c
index da16cbfafcc2..2fb6c4d5a781 100644
--- a/tests/qtest/tulip-test.c
+++ b/tests/qtest/tulip-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 78811f1c9216..443ee56de966 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -8,7 +8,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "libqos/pci.h"
 #include "libqos/pci-pc.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/qtest/virtio-rng-test.c b/tests/qtest/virtio-rng-test.c
index e6b8cd8e0cfa..092ba130684d 100644
--- a/tests/qtest/virtio-rng-test.c
+++ b/tests/qtest/virtio-rng-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/virtio-rng.h"
diff --git a/tests/qtest/virtio-test.c b/tests/qtest/virtio-test.c
index 63134176303a..f7c6afdcf111 100644
--- a/tests/qtest/virtio-test.c
+++ b/tests/qtest/virtio-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
index 6781a514479b..efba76e7164e 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -14,7 +14,7 @@
 #include "hw/acpi/acpi-defs.h"
 #include "boot-sector.h"
 #include "acpi-utils.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 
 #define VGID_GUID "324e6eaf-d1d1-4bf6-bf41-b9bb6c91fb87"
diff --git a/tests/qtest/vmxnet3-test.c b/tests/qtest/vmxnet3-test.c
index 97c23fd3a8f6..a81025252c87 100644
--- a/tests/qtest/vmxnet3-test.c
+++ b/tests/qtest/vmxnet3-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/module.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
diff --git a/tests/qtest/wdt_ib700-test.c b/tests/qtest/wdt_ib700-test.c
index 6c36e43fb835..797288d939fa 100644
--- a/tests/qtest/wdt_ib700-test.c
+++ b/tests/qtest/wdt_ib700-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/timer.h"
 
diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
index 54de71a68643..89610fc499b6 100644
--- a/tests/qtest/xlnx-can-test.c
+++ b/tests/qtest/xlnx-can-test.c
@@ -25,7 +25,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
 /* Base address. */
 #define CAN0_BASE_ADDR          0xFF060000
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index e17a288034bc..d6df1ee92ea1 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -4,7 +4,7 @@
 #include <sys/socket.h>
 #include <sys/un.h>
 
-#include "../qtest/libqos/libqtest.h"
+#include "../qtest/libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 
diff --git a/scripts/oss-fuzz/output_reproducer.py b/scripts/oss-fuzz/output_reproducer.py
index 3608b0600e00..e8ef76b34138 100755
--- a/scripts/oss-fuzz/output_reproducer.py
+++ b/scripts/oss-fuzz/output_reproducer.py
@@ -36,7 +36,7 @@ def c_header(owner):
 
 #include "qemu/osdep.h"
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 
     """.format(date=date.today().year, owner=owner)
 
-- 
2.36.0.44.g0f828332d5ac


