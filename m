Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596541B1E4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 10:28:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ6Jz-00042s-HH
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 04:28:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Ad-0004ec-4t
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Ab-0007eC-Ar
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQ6Ab-0007d8-1d
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62E693084248
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09E971750E
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E873E113303E; Mon, 13 May 2019 10:18:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:18:44 +0200
Message-Id: <20190513081844.26699-10-armbru@redhat.com>
In-Reply-To: <20190513081844.26699-1-armbru@redhat.com>
References: <20190513081844.26699-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 13 May 2019 08:18:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 9/9] Clean up decorations and whitespace around
 header guards
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleaned up with scripts/clean-header-guards.pl.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190315145123.28030-9-armbru@redhat.com>
---
 hw/ide/ahci_internal.h              | 2 +-
 include/block/aio-wait.h            | 2 +-
 include/exec/translator.h           | 2 +-
 include/hw/arm/nrf51_soc.h          | 1 -
 include/hw/arm/smmu-common.h        | 2 +-
 include/hw/misc/imx2_wdt.h          | 2 +-
 include/hw/misc/nrf51_rng.h         | 3 ++-
 include/hw/pci-host/designware.h    | 2 +-
 include/hw/riscv/sifive_plic.h      | 1 -
 include/qemu/pmem.h                 | 2 +-
 target/xtensa/xtensa-isa-internal.h | 2 +-
 tests/acpi-utils.h                  | 2 +-
 tests/tpm-emu.h                     | 2 +-
 13 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 9b7fa8fc7d..95ecddcd3c 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -394,4 +394,4 @@ void ahci_reset(AHCIState *s);
 
 #define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj), TYPE_SYSBUS_AHCI)
 
-#endif /* HW_IDE_AHCI_H */
+#endif /* HW_IDE_AHCI_INTERNAL_H */
diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index afd0ff7eb8..afeeb18f95 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -124,4 +124,4 @@ void aio_wait_kick(void);
  */
 void aio_wait_bh_oneshot(AioContext *ctx, QEMUBHFunc *cb, void *opaque);
 
-#endif /* QEMU_AIO_WAIT */
+#endif /* QEMU_AIO_WAIT_H */
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 66dfe906c4..180c51d509 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -142,4 +142,4 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 
 void translator_loop_temp_check(DisasContextBase *db);
 
-#endif  /* EXEC__TRANSLATOR_H */
+#endif /* EXEC__TRANSLATOR_H */
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index fd7fcc71a5..0cb78aafea 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -53,4 +53,3 @@ typedef struct NRF51State {
 } NRF51State;
 
 #endif
-
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 2c7fbf4202..1f37844e5c 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -163,4 +163,4 @@ void smmu_inv_notifiers_all(SMMUState *s);
 /* Unmap the range of all the notifiers registered to @mr */
 void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
 
-#endif  /* HW_ARM_SMMU_COMMON */
+#endif /* HW_ARM_SMMU_COMMON_H */
diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/misc/imx2_wdt.h
index 8afc99a10e..b91b002528 100644
--- a/include/hw/misc/imx2_wdt.h
+++ b/include/hw/misc/imx2_wdt.h
@@ -30,4 +30,4 @@ typedef struct IMX2WdtState {
     MemoryRegion mmio;
 } IMX2WdtState;
 
-#endif /* IMX7_SNVS_H */
+#endif /* IMX2_WDT_H */
diff --git a/include/hw/misc/nrf51_rng.h b/include/hw/misc/nrf51_rng.h
index 3d6bf79997..b0133bf665 100644
--- a/include/hw/misc/nrf51_rng.h
+++ b/include/hw/misc/nrf51_rng.h
@@ -30,6 +30,7 @@
  * the COPYING file in the top-level directory.
  *
  */
+
 #ifndef NRF51_RNG_H
 #define NRF51_RNG_H
 
@@ -80,4 +81,4 @@ typedef struct {
 } NRF51RNGState;
 
 
-#endif /* NRF51_RNG_H_ */
+#endif /* NRF51_RNG_H */
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index a4f2c0695b..186bb36238 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -99,4 +99,4 @@ typedef struct DesignwarePCIEHost {
     MemoryRegion mmio;
 } DesignwarePCIEHost;
 
-#endif  /* DESIGNWARE_H */
+#endif /* DESIGNWARE_H */
diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
index 688cd97f82..ce8907f6aa 100644
--- a/include/hw/riscv/sifive_plic.h
+++ b/include/hw/riscv/sifive_plic.h
@@ -80,4 +80,3 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     uint32_t aperture_size);
 
 #endif
-
diff --git a/include/qemu/pmem.h b/include/qemu/pmem.h
index dfb6d0da62..d2d7ad085c 100644
--- a/include/qemu/pmem.h
+++ b/include/qemu/pmem.h
@@ -33,4 +33,4 @@ pmem_persist(const void *addr, size_t len)
 
 #endif /* CONFIG_LIBPMEM */
 
-#endif /* !QEMU_PMEM_H */
+#endif /* QEMU_PMEM_H */
diff --git a/target/xtensa/xtensa-isa-internal.h b/target/xtensa/xtensa-isa-internal.h
index c29295ff96..40dd8bac96 100644
--- a/target/xtensa/xtensa-isa-internal.h
+++ b/target/xtensa/xtensa-isa-internal.h
@@ -228,4 +228,4 @@ int xtensa_isa_name_compare(const void *, const void *);
 extern xtensa_isa_status xtisa_errno;
 extern char xtisa_error_msg[];
 
-#endif /* !XTENSA_ISA_INTERNAL_H */
+#endif /* XTENSA_ISA_INTERNAL_H */
diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
index ef388bbf12..73fe24f044 100644
--- a/tests/acpi-utils.h
+++ b/tests/acpi-utils.h
@@ -52,4 +52,4 @@ void acpi_fetch_table(QTestState *qts, uint8_t **aml, uint32_t *aml_len,
                       const uint8_t *addr_ptr, const char *sig,
                       bool verify_checksum);
 
-#endif  /* TEST_ACPI_UTILS_H */
+#endif /* TEST_ACPI_UTILS_H */
diff --git a/tests/tpm-emu.h b/tests/tpm-emu.h
index 8eb802a79e..a4f1d64226 100644
--- a/tests/tpm-emu.h
+++ b/tests/tpm-emu.h
@@ -36,4 +36,4 @@ typedef struct TestState {
 void tpm_emu_test_wait_cond(TestState *s);
 void *tpm_emu_ctrl_thread(void *data);
 
-#endif /* TEST_TPM_EMU_H */
+#endif /* TESTS_TPM_EMU_H */
-- 
2.17.2


