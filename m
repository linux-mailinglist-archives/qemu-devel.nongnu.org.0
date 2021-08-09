Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315053E4DA7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:10:36 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBbX-0000gg-82
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYp-0004uW-A1
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYl-00005m-Qz
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628539663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI+F4TP7sjBT09k3+coWLIX4KGGoZp2PQqSJ5FdHc6c=;
 b=byd52B4qxVQXYxeQSO0hFshLgUid52qWrI9XG96p6j2pVJYmfRATc1UKvLSro2H7/S53SS
 hw8MD7DQVCxmvwbIc4KOq3YqoHc7gxKb+IIKQPDLmoIp4rI1z05WqGMR9Me4cmKJQMirE0
 95CHl4RXeUoa/PLzfMP9B01NrCnab+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-6UhE1WG9OGyv29kRWYbecQ-1; Mon, 09 Aug 2021 16:07:41 -0400
X-MC-Unique: 6UhE1WG9OGyv29kRWYbecQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77C6107ACF5;
 Mon,  9 Aug 2021 20:07:40 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D7260C05;
 Mon,  9 Aug 2021 20:07:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v3 2/2] [autoamted] Use DECLARE_INTERFACE_CHECKER macro
Date: Mon,  9 Aug 2021 16:07:14 -0400
Message-Id: <20210809200714.887337-3-ehabkost@redhat.com>
In-Reply-To: <20210809200714.887337-1-ehabkost@redhat.com>
References: <20210809200714.887337-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace manual INTERFACE_CHECK macros with
DECLARE_INTERFACE_CHECKER, which is less error prone.

Generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=InterfaceCheckMacro $(g grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/acpi/acpi_dev_interface.h |  5 ++---
 include/hw/arm/linux-boot-if.h       |  4 ++--
 include/hw/fw-path-provider.h        |  4 ++--
 include/hw/hotplug.h                 |  4 ++--
 include/hw/intc/intc.h               |  5 ++---
 include/hw/ipmi/ipmi.h               |  4 ++--
 include/hw/isa/isa.h                 |  4 ++--
 include/hw/mem/memory-device.h       |  4 ++--
 include/hw/nmi.h                     |  4 ++--
 include/hw/ppc/pnv_xscom.h           |  4 ++--
 include/hw/ppc/spapr_irq.h           |  4 ++--
 include/hw/ppc/xics.h                |  4 ++--
 include/hw/ppc/xive.h                | 12 ++++++------
 include/hw/rdma/rdma.h               |  5 ++---
 include/hw/rtc/m48t59.h              |  4 ++--
 include/hw/stream.h                  |  4 ++--
 include/hw/vmstate-if.h              |  4 ++--
 include/qom/object_interfaces.h      |  5 ++---
 include/sysemu/tpm.h                 |  4 ++--
 target/arm/idau.h                    |  4 ++--
 tests/unit/check-qom-interface.c     |  4 ++--
 21 files changed, 46 insertions(+), 50 deletions(-)

diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index c9c7c17e043..f99b8b380eb 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -22,9 +22,8 @@ typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
 DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
                        TYPE_ACPI_DEVICE_IF)
 typedef struct AcpiDeviceIf AcpiDeviceIf;
-#define ACPI_DEVICE_IF(obj) \
-     INTERFACE_CHECK(AcpiDeviceIf, (obj), \
-                     TYPE_ACPI_DEVICE_IF)
+DECLARE_INTERFACE_CHECKER(AcpiDeviceIf, ACPI_DEVICE_IF,
+                          TYPE_ACPI_DEVICE_IF)
 
 
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-if.h
index 295e282c36e..17b8083f954 100644
--- a/include/hw/arm/linux-boot-if.h
+++ b/include/hw/arm/linux-boot-if.h
@@ -13,8 +13,8 @@ typedef struct ARMLinuxBootIfClass ARMLinuxBootIfClass;
 DECLARE_CLASS_CHECKERS(ARMLinuxBootIfClass, ARM_LINUX_BOOT_IF,
                        TYPE_ARM_LINUX_BOOT_IF)
 typedef struct ARMLinuxBootIf ARMLinuxBootIf;
-#define ARM_LINUX_BOOT_IF(obj) \
-    INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
+DECLARE_INTERFACE_CHECKER(ARMLinuxBootIf, ARM_LINUX_BOOT_IF,
+                          TYPE_ARM_LINUX_BOOT_IF)
 
 
 struct ARMLinuxBootIfClass {
diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.h
index 33d91daed52..639fe9d821a 100644
--- a/include/hw/fw-path-provider.h
+++ b/include/hw/fw-path-provider.h
@@ -26,8 +26,8 @@ typedef struct FWPathProviderClass FWPathProviderClass;
 DECLARE_CLASS_CHECKERS(FWPathProviderClass, FW_PATH_PROVIDER,
                        TYPE_FW_PATH_PROVIDER)
 typedef struct FWPathProvider FWPathProvider;
-#define FW_PATH_PROVIDER(obj) \
-     INTERFACE_CHECK(FWPathProvider, (obj), TYPE_FW_PATH_PROVIDER)
+DECLARE_INTERFACE_CHECKER(FWPathProvider, FW_PATH_PROVIDER,
+                          TYPE_FW_PATH_PROVIDER)
 
 
 struct FWPathProviderClass {
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index 75d32d69e2b..5dc7435a4c5 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -20,8 +20,8 @@ typedef struct HotplugHandlerClass HotplugHandlerClass;
 DECLARE_CLASS_CHECKERS(HotplugHandlerClass, HOTPLUG_HANDLER,
                        TYPE_HOTPLUG_HANDLER)
 typedef struct HotplugHandler HotplugHandler;
-#define HOTPLUG_HANDLER(obj) \
-     INTERFACE_CHECK(HotplugHandler, (obj), TYPE_HOTPLUG_HANDLER)
+DECLARE_INTERFACE_CHECKER(HotplugHandler, HOTPLUG_HANDLER,
+                          TYPE_HOTPLUG_HANDLER)
 
 
 /**
diff --git a/include/hw/intc/intc.h b/include/hw/intc/intc.h
index 7c57c3a0379..a31b5341acb 100644
--- a/include/hw/intc/intc.h
+++ b/include/hw/intc/intc.h
@@ -9,9 +9,8 @@ typedef struct InterruptStatsProviderClass InterruptStatsProviderClass;
 DECLARE_CLASS_CHECKERS(InterruptStatsProviderClass, INTERRUPT_STATS_PROVIDER,
                        TYPE_INTERRUPT_STATS_PROVIDER)
 typedef struct InterruptStatsProvider InterruptStatsProvider;
-#define INTERRUPT_STATS_PROVIDER(obj) \
-    INTERFACE_CHECK(InterruptStatsProvider, (obj), \
-                    TYPE_INTERRUPT_STATS_PROVIDER)
+DECLARE_INTERFACE_CHECKER(InterruptStatsProvider, INTERRUPT_STATS_PROVIDER,
+                          TYPE_INTERRUPT_STATS_PROVIDER)
 
 
 struct InterruptStatsProviderClass {
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index d655352fa95..983e7366e75 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -110,8 +110,8 @@ uint32_t ipmi_next_uuid(void);
  */
 #define TYPE_IPMI_INTERFACE "ipmi-interface"
 typedef struct IPMIInterface IPMIInterface;
-#define IPMI_INTERFACE(obj) \
-     INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
+DECLARE_INTERFACE_CHECKER(IPMIInterface, IPMI_INTERFACE,
+                          TYPE_IPMI_INTERFACE)
 typedef struct IPMIInterfaceClass IPMIInterfaceClass;
 DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
                        TYPE_IPMI_INTERFACE)
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d4417b34b63..a4a733a1836 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -35,8 +35,8 @@ static inline uint16_t applesmc_port(void)
 typedef struct IsaDmaClass IsaDmaClass;
 DECLARE_CLASS_CHECKERS(IsaDmaClass, ISADMA,
                        TYPE_ISADMA)
-#define ISADMA(obj) \
-    INTERFACE_CHECK(IsaDma, (obj), TYPE_ISADMA)
+DECLARE_INTERFACE_CHECKER(IsaDma, ISADMA,
+                          TYPE_ISADMA)
 
 typedef enum {
     ISADMA_TRANSFER_VERIFY,
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index a83428209b9..bfdc2fc1f56 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -23,8 +23,8 @@ typedef struct MemoryDeviceClass MemoryDeviceClass;
 DECLARE_CLASS_CHECKERS(MemoryDeviceClass, MEMORY_DEVICE,
                        TYPE_MEMORY_DEVICE)
 typedef struct MemoryDeviceState MemoryDeviceState;
-#define MEMORY_DEVICE(obj) \
-     INTERFACE_CHECK(MemoryDeviceState, (obj), TYPE_MEMORY_DEVICE)
+DECLARE_INTERFACE_CHECKER(MemoryDeviceState, MEMORY_DEVICE,
+                          TYPE_MEMORY_DEVICE)
 
 
 /**
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index 529ab736f8f..5e087308336 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -30,8 +30,8 @@ typedef struct NMIClass NMIClass;
 DECLARE_CLASS_CHECKERS(NMIClass, NMI,
                        TYPE_NMI)
 typedef struct NMIState NMIState;
-#define NMI(obj) \
-     INTERFACE_CHECK(NMIState, (obj), TYPE_NMI)
+DECLARE_INTERFACE_CHECKER(NMIState, NMI,
+                          TYPE_NMI)
 
 
 struct NMIClass {
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 2ff9f7a8d6f..360b723bb85 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -25,8 +25,8 @@
 typedef struct PnvXScomInterface PnvXScomInterface;
 
 #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
-#define PNV_XSCOM_INTERFACE(obj) \
-    INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
+DECLARE_INTERFACE_CHECKER(PnvXScomInterface, PNV_XSCOM_INTERFACE,
+                          TYPE_PNV_XSCOM_INTERFACE)
 typedef struct PnvXScomInterfaceClass PnvXScomInterfaceClass;
 DECLARE_CLASS_CHECKERS(PnvXScomInterfaceClass, PNV_XSCOM_INTERFACE,
                        TYPE_PNV_XSCOM_INTERFACE)
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index c22a72c9e27..105e1fb4e71 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -34,8 +34,8 @@ struct SpaprMachineState;
 typedef struct SpaprInterruptController SpaprInterruptController;
 
 #define TYPE_SPAPR_INTC "spapr-interrupt-controller"
-#define SPAPR_INTC(obj)                                     \
-    INTERFACE_CHECK(SpaprInterruptController, (obj), TYPE_SPAPR_INTC)
+DECLARE_INTERFACE_CHECKER(SpaprInterruptController, SPAPR_INTC,
+                          TYPE_SPAPR_INTC)
 typedef struct SpaprInterruptControllerClass SpaprInterruptControllerClass;
 DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass, SPAPR_INTC,
                        TYPE_SPAPR_INTC)
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 00b80b08c27..375e5ce7fb7 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -137,8 +137,8 @@ struct ICSIRQState {
 };
 
 #define TYPE_XICS_FABRIC "xics-fabric"
-#define XICS_FABRIC(obj)                                     \
-    INTERFACE_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
+DECLARE_INTERFACE_CHECKER(XICSFabric, XICS_FABRIC,
+                          TYPE_XICS_FABRIC)
 typedef struct XICSFabricClass XICSFabricClass;
 DECLARE_CLASS_CHECKERS(XICSFabricClass, XICS_FABRIC,
                        TYPE_XICS_FABRIC)
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 445eccfe6b7..7f25b853ae4 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -152,8 +152,8 @@
 typedef struct XiveNotifier XiveNotifier;
 
 #define TYPE_XIVE_NOTIFIER "xive-notifier"
-#define XIVE_NOTIFIER(obj)                                     \
-    INTERFACE_CHECK(XiveNotifier, (obj), TYPE_XIVE_NOTIFIER)
+DECLARE_INTERFACE_CHECKER(XiveNotifier, XIVE_NOTIFIER,
+                          TYPE_XIVE_NOTIFIER)
 typedef struct XiveNotifierClass XiveNotifierClass;
 DECLARE_CLASS_CHECKERS(XiveNotifierClass, XIVE_NOTIFIER,
                        TYPE_XIVE_NOTIFIER)
@@ -385,8 +385,8 @@ typedef struct XiveTCTXMatch {
 } XiveTCTXMatch;
 
 #define TYPE_XIVE_PRESENTER "xive-presenter"
-#define XIVE_PRESENTER(obj)                                     \
-    INTERFACE_CHECK(XivePresenter, (obj), TYPE_XIVE_PRESENTER)
+DECLARE_INTERFACE_CHECKER(XivePresenter, XIVE_PRESENTER,
+                          TYPE_XIVE_PRESENTER)
 typedef struct XivePresenterClass XivePresenterClass;
 DECLARE_CLASS_CHECKERS(XivePresenterClass, XIVE_PRESENTER,
                        TYPE_XIVE_PRESENTER)
@@ -410,8 +410,8 @@ int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
  */
 
 #define TYPE_XIVE_FABRIC "xive-fabric"
-#define XIVE_FABRIC(obj)                                     \
-    INTERFACE_CHECK(XiveFabric, (obj), TYPE_XIVE_FABRIC)
+DECLARE_INTERFACE_CHECKER(XiveFabric, XIVE_FABRIC,
+                          TYPE_XIVE_FABRIC)
 typedef struct XiveFabricClass XiveFabricClass;
 DECLARE_CLASS_CHECKERS(XiveFabricClass, XIVE_FABRIC,
                        TYPE_XIVE_FABRIC)
diff --git a/include/hw/rdma/rdma.h b/include/hw/rdma/rdma.h
index e64104d631e..b8ebe5767df 100644
--- a/include/hw/rdma/rdma.h
+++ b/include/hw/rdma/rdma.h
@@ -23,9 +23,8 @@ typedef struct RdmaProviderClass RdmaProviderClass;
 DECLARE_CLASS_CHECKERS(RdmaProviderClass, RDMA_PROVIDER,
                        INTERFACE_RDMA_PROVIDER)
 typedef struct RdmaProvider RdmaProvider;
-#define RDMA_PROVIDER(obj) \
-    INTERFACE_CHECK(RdmaProvider, (obj), \
-                    INTERFACE_RDMA_PROVIDER)
+DECLARE_INTERFACE_CHECKER(RdmaProvider, RDMA_PROVIDER,
+                          INTERFACE_RDMA_PROVIDER)
 
 
 struct RdmaProviderClass {
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index 0b5beb9e2d6..77aee0bc29d 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -35,8 +35,8 @@ typedef struct NvramClass NvramClass;
 DECLARE_CLASS_CHECKERS(NvramClass, NVRAM,
                        TYPE_NVRAM)
 typedef struct Nvram Nvram;
-#define NVRAM(obj) \
-    INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
+DECLARE_INTERFACE_CHECKER(Nvram, NVRAM,
+                          TYPE_NVRAM)
 
 
 struct NvramClass {
diff --git a/include/hw/stream.h b/include/hw/stream.h
index 3190cc0dc73..1c2ae5a99d0 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -9,8 +9,8 @@ typedef struct StreamSinkClass StreamSinkClass;
 DECLARE_CLASS_CHECKERS(StreamSinkClass, STREAM_SINK,
                        TYPE_STREAM_SINK)
 typedef struct StreamSink StreamSink;
-#define STREAM_SINK(obj) \
-     INTERFACE_CHECK(StreamSink, (obj), TYPE_STREAM_SINK)
+DECLARE_INTERFACE_CHECKER(StreamSink, STREAM_SINK,
+                          TYPE_STREAM_SINK)
 
 
 typedef void (*StreamCanPushNotifyFn)(void *opaque);
diff --git a/include/hw/vmstate-if.h b/include/hw/vmstate-if.h
index 0250956967c..a869e521341 100644
--- a/include/hw/vmstate-if.h
+++ b/include/hw/vmstate-if.h
@@ -17,8 +17,8 @@ typedef struct VMStateIfClass VMStateIfClass;
 DECLARE_CLASS_CHECKERS(VMStateIfClass, VMSTATE_IF,
                        TYPE_VMSTATE_IF)
 typedef struct VMStateIf VMStateIf;
-#define VMSTATE_IF(obj)                             \
-    INTERFACE_CHECK(VMStateIf, (obj), TYPE_VMSTATE_IF)
+DECLARE_INTERFACE_CHECKER(VMStateIf, VMSTATE_IF,
+                          TYPE_VMSTATE_IF)
 
 
 struct VMStateIfClass {
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 57d5f6c0532..253bf62eb36 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -11,9 +11,8 @@ typedef struct UserCreatableClass UserCreatableClass;
 DECLARE_CLASS_CHECKERS(UserCreatableClass, USER_CREATABLE,
                        TYPE_USER_CREATABLE)
 typedef struct UserCreatable UserCreatable;
-#define USER_CREATABLE(obj) \
-     INTERFACE_CHECK(UserCreatable, (obj), \
-                     TYPE_USER_CREATABLE)
+DECLARE_INTERFACE_CHECKER(UserCreatable, USER_CREATABLE,
+                          TYPE_USER_CREATABLE)
 
 
 /**
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 4a02a8e0266..7cca7a2960c 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -32,8 +32,8 @@ typedef struct TPMIfClass TPMIfClass;
 DECLARE_CLASS_CHECKERS(TPMIfClass, TPM_IF,
                        TYPE_TPM_IF)
 typedef struct TPMIf TPMIf;
-#define TPM_IF(obj)                             \
-    INTERFACE_CHECK(TPMIf, (obj), TYPE_TPM_IF)
+DECLARE_INTERFACE_CHECKER(TPMIf, TPM_IF,
+                          TYPE_TPM_IF)
 
 
 struct TPMIfClass {
diff --git a/target/arm/idau.h b/target/arm/idau.h
index 600ac9066cf..95a18934942 100644
--- a/target/arm/idau.h
+++ b/target/arm/idau.h
@@ -32,8 +32,8 @@
 
 #define TYPE_IDAU_INTERFACE "idau-interface"
 typedef struct IDAUInterface IDAUInterface;
-#define IDAU_INTERFACE(obj) \
-    INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
+DECLARE_INTERFACE_CHECKER(IDAUInterface, IDAU_INTERFACE,
+                          TYPE_IDAU_INTERFACE)
 typedef struct IDAUInterfaceClass IDAUInterfaceClass;
 DECLARE_CLASS_CHECKERS(IDAUInterfaceClass, IDAU_INTERFACE,
                        TYPE_IDAU_INTERFACE)
diff --git a/tests/unit/check-qom-interface.c b/tests/unit/check-qom-interface.c
index 4f534d09085..bacfd00b05c 100644
--- a/tests/unit/check-qom-interface.c
+++ b/tests/unit/check-qom-interface.c
@@ -20,8 +20,8 @@ typedef struct TestIfClass TestIfClass;
 DECLARE_CLASS_CHECKERS(TestIfClass, TEST_IF,
                        TYPE_TEST_IF)
 typedef struct TestIf TestIf;
-#define TEST_IF(obj) \
-     INTERFACE_CHECK(TestIf, (obj), TYPE_TEST_IF)
+DECLARE_INTERFACE_CHECKER(TestIf, TEST_IF,
+                          TYPE_TEST_IF)
 
 
 struct TestIfClass {
-- 
2.31.1


