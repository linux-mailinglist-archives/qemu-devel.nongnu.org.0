Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5130CEE7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:32:12 +0100 (CET)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74DT-00033o-D6
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1l74Bv-0002Et-SP
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:30:35 -0500
Received: from server.avery-design.com ([198.57.169.184]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1l74Bq-0007G1-Px
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:30:35 -0500
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:36978 helo=server4)
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <cbrowy@avery-design.com>)
 id 1l72Pq-0006hv-8t; Tue, 02 Feb 2021 20:36:50 +0000
Date: Tue, 2 Feb 2021 15:43:28 -0500 (EST)
From: Chris Browy <cbrowy@avery-design.com>
X-X-Sender: chris@server4
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [RFC PATCH v1 01/01] PCIe DOE for PCIe and CXL 2.0
In-Reply-To: <alpine.LRH.2.23.451.2102021236150.13496@server4>
Message-ID: <alpine.LRH.2.23.451.2102021543190.30097@server4>
References: <alpine.LRH.2.23.451.2102021236150.13496@server4>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463770623-1743276501-1612298610=:30097"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.avery-design.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - avery-design.com
X-Get-Message-Sender-Via: server.avery-design.com: authenticated_id:
 avery_cxl@avery-design.com
X-Authenticated-Sender: server.avery-design.com: avery_cxl@avery-design.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=198.57.169.184;
 envelope-from=cbrowy@avery-design.com; helo=server.avery-design.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, mst@redhat.com,
 Jonathan.Cameron@Huawei.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770623-1743276501-1612298610=:30097
Content-Type: text/plain; format=flowed; charset=UTF-8
Content-Transfer-Encoding: 8BIT

﻿diff --git a/MAINTAINERS b/MAINTAINERS
index 981dc92e25..4fb865e0b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1655,6 +1655,13 @@ F: docs/pci*
  F: docs/specs/*pci*
  F: default-configs/pci.mak

+PCIE DOE
+M: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
+M: Chris Browy <cbrowy@avery-design.com>
+S: Supported
+F: include/hw/pci/pcie_doe.h
+F: hw/pci/pcie_doe.c
+
  ACPI/SMBIOS
  M: Michael S. Tsirkin <mst@redhat.com>
  M: Igor Mammedov <imammedo@redhat.com>
diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index e1bcee5bdb..c49d2aa896 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -195,3 +195,154 @@ void cxl_component_create_dvsec(CXLComponentState *cxl, uint16_t length,
      range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
      cxl->dvsec_offset += length;
  }
+
+uint32_t cxl_doe_compliance_init(CXLComponentState *cxl_cstate)
+{
+    PCIDevice *pci_dev = cxl_cstate->pdev;
+    uint32_t req;
+    uint32_t byte_cnt = 0;
+
+    DOE_DBG(">> %s\n",  __func__);
+
+    req = ((struct cxl_compliance_mode_cap *)pcie_doe_get_req(pci_dev))
+        ->req_code;
+    switch (req) {
+    case CXL_COMP_MODE_CAP:
+        byte_cnt = sizeof(struct cxl_compliance_mode_cap_rsp);
+        cxl_cstate->doe_resp.cap_rsp.header.vendor_id = CXL_VENDOR_ID;
+        cxl_cstate->doe_resp.cap_rsp.header.doe_type = CXL_DOE_COMPLIANCE;
+        cxl_cstate->doe_resp.cap_rsp.header.reserved = 0x0;
+        cxl_cstate->doe_resp.cap_rsp.header.length =
+            dwsizeof(struct cxl_compliance_mode_cap_rsp);
+        cxl_cstate->doe_resp.cap_rsp.rsp_code = 0x0;
+        cxl_cstate->doe_resp.cap_rsp.version = 0x1;
+        cxl_cstate->doe_resp.cap_rsp.length = 0x1c;
+        cxl_cstate->doe_resp.cap_rsp.status = 0x0;
+        cxl_cstate->doe_resp.cap_rsp.available_cap_bitmask = 0x3;
+        cxl_cstate->doe_resp.cap_rsp.enabled_cap_bitmask = 0x3;
+        break;
+    case CXL_COMP_MODE_STATUS:
+        byte_cnt = sizeof(struct cxl_compliance_mode_status_rsp);
+        cxl_cstate->doe_resp.status_rsp.header.vendor_id = CXL_VENDOR_ID;
+        cxl_cstate->doe_resp.status_rsp.header.doe_type = CXL_DOE_COMPLIANCE;
+        cxl_cstate->doe_resp.status_rsp.header.reserved = 0x0;
+        cxl_cstate->doe_resp.status_rsp.header.length =
+            dwsizeof(struct cxl_compliance_mode_status_rsp);
+        cxl_cstate->doe_resp.status_rsp.rsp_code = 0x1;
+        cxl_cstate->doe_resp.status_rsp.version = 0x1;
+        cxl_cstate->doe_resp.status_rsp.length = 0x14;
+        cxl_cstate->doe_resp.status_rsp.cap_bitfield = 0x3;
+        cxl_cstate->doe_resp.status_rsp.cache_size = 0;
+        cxl_cstate->doe_resp.status_rsp.cache_size_units = 0;
+        break;
+    default:
+        break;
+    }
+
+    DOE_DBG("  REQ=%x, RSP BYTE_CNT=%d\n", req, byte_cnt);
+    DOE_DBG("<< %s\n",  __func__);
+    return byte_cnt;
+}
+
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate)
+{
+
+    DOE_DBG(">> %s\n",  __func__);
+
+    cxl_cstate->doe_resp.cdat_rsp.header.vendor_id = CXL_VENDOR_ID;
+    cxl_cstate->doe_resp.cdat_rsp.header.doe_type = CXL_DOE_TABLE_ACCESS;
+    cxl_cstate->doe_resp.cdat_rsp.header.reserved = 0x0;
+    cxl_cstate->doe_resp.cdat_rsp.header.length = 0;
+    cxl_cstate->doe_resp.cdat_rsp.rsp_code = 0x0;
+    cxl_cstate->doe_resp.cdat_rsp.table_type = 0x0;
+    cxl_cstate->doe_resp.cdat_rsp.next_entry_handle = 0xffff;
+
+    /* copy the DSMAS entry */
+    cxl_cstate->dsmas.type = CDAT_TYPE_DSMAS;
+    cxl_cstate->dsmas.reserved = 0x0;
+    cxl_cstate->dsmas.length = 0x0;
+    cxl_cstate->dsmas.DSMADhandle = 0x0;
+    cxl_cstate->dsmas.flags = 0x0;
+    cxl_cstate->dsmas.reserved2 = 0x0;
+    cxl_cstate->dsmas.DPA_base = 0x0;
+    cxl_cstate->dsmas.DPA_length = 0x40000;
+
+    /* copy the DSLBIS entry */
+    cxl_cstate->dslbis.type = CDAT_TYPE_DSLBIS;
+    cxl_cstate->dslbis.reserved = 0;
+    cxl_cstate->dslbis.length = 16;
+    cxl_cstate->dslbis.handle = 0;
+    cxl_cstate->dslbis.flags = 0;
+    cxl_cstate->dslbis.data_type = 0;
+    cxl_cstate->dslbis.reserved2 = 0;
+    cxl_cstate->dslbis.entry_base_unit = 0;
+    cxl_cstate->dslbis.entry[0] = 0;
+    cxl_cstate->dslbis.entry[1] = 0;
+    cxl_cstate->dslbis.entry[2] = 0;
+    cxl_cstate->dslbis.reserved3 = 0;
+
+    /* copy the DSMSCIS entry */
+    cxl_cstate->dsmscis.type = CDAT_TYPE_DSMSCIS;
+    cxl_cstate->dsmscis.reserved = 0;
+    cxl_cstate->dsmscis.length = 20;
+    cxl_cstate->dsmscis.DSMASH_handle = 0;
+    cxl_cstate->dsmscis.reserved2[0] = 0;
+    cxl_cstate->dsmscis.reserved2[1] = 0;
+    cxl_cstate->dsmscis.reserved2[2] = 0;
+    cxl_cstate->dsmscis.memory_side_cache_size = 0;
+    cxl_cstate->dsmscis.cache_attributes = 0;
+
+    /* copy the DSIS entry */
+    cxl_cstate->dsis.type = CDAT_TYPE_DSIS;
+    cxl_cstate->dsis.reserved = 0;
+    cxl_cstate->dsis.length = 8;
+    cxl_cstate->dsis.flags = 0;
+    cxl_cstate->dsis.handle = 0;
+    cxl_cstate->dsis.reserved2 = 0;
+    cxl_cstate->dsis.DPA_offset = 0;
+    cxl_cstate->dsis.DPA_length = 0;
+
+    /* copy the DSEMTS entry */
+    cxl_cstate->dsemts.type = CDAT_TYPE_DSEMTS;
+    cxl_cstate->dsemts.reserved = 0;
+    cxl_cstate->dsemts.length = 24;
+    cxl_cstate->dsemts.DSMAS_handle = 0;
+    cxl_cstate->dsemts.EFI_memory_type_attr = 0;
+    cxl_cstate->dsemts.reserved2 = 0;
+
+    /* copy the SSLBE entry */
+    cxl_cstate->sslbe.port_x_id = 0;
+    cxl_cstate->sslbe.port_y_id = 0;
+    cxl_cstate->sslbe.latency_bandwidth = 0;
+    cxl_cstate->sslbe.reserved = 0;
+
+    /* copy the SSLBIS entry */
+    cxl_cstate->sslbis.type = CDAT_TYPE_SSLBIS;
+    cxl_cstate->sslbis.reserved = 0;
+    cxl_cstate->sslbis.length = 0;
+    cxl_cstate->sslbis.data_type = 0;
+    cxl_cstate->sslbis.reserved2[0] = 0;
+    cxl_cstate->sslbis.reserved2[1] = 0;
+    cxl_cstate->sslbis.reserved2[2] = 0;
+    cxl_cstate->sslbis.cdat_sslbe_array[0] = cxl_cstate->sslbe;
+
+    DOE_DBG("<< %s\n",  __func__);
+}
+
+/*
+ * Helper to creates a DOE header for a CXL entity. The caller is responsible
+ * for tracking the valid offset.
+ *
+ * This function will build the DOE header on behalf of the caller and then
+ * copy in the remaining bits.
+ */
+void cxl_component_create_doe(CXLComponentState *cxl, uint16_t offset)
+{
+    PCIDevice *pdev = cxl->pdev;
+
+    pcie_cap_doe_init(pdev, offset);
+    pcie_doe_register_protocol(pdev, CXL_VENDOR_ID, CXL_DOE_COMPLIANCE,
+                               cxl_doe_compliance_rsp);
+    pcie_doe_register_protocol(pdev, CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS,
+                               cxl_doe_cdat_rsp);
+}
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index d091e645aa..2875536826 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -14,6 +14,123 @@
  #include "sysemu/hostmem.h"
  #include "hw/cxl/cxl.h"

+bool cxl_doe_compliance_rsp(PCIDevice *pci_dev)
+{
+    CXLComponentState *cxl_cstate = &CT3(pci_dev)->cxl_cstate;
+    uint32_t byte_cnt;
+    uint32_t dw_cnt;
+
+    DOE_DBG(">> %s\n",  __func__);
+
+    byte_cnt = cxl_doe_compliance_init(cxl_cstate);
+    dw_cnt = byte_cnt / 4;
+    memcpy(pci_dev->exp.doe_state.read_mbox,
+           cxl_cstate->doe_resp.data_byte, byte_cnt);
+
+    pci_dev->exp.doe_state.read_mbox_len += dw_cnt;
+    DOE_DBG("  read_mbox_len=%x\n",
+            pci_dev->exp.doe_state.read_mbox_len);
+
+    DOE_DBG("  RD MBOX[%d]=%x\n", dw_cnt - 1,
+            *(pci_dev->exp.doe_state.read_mbox + dw_cnt - 1));
+
+    DOE_DBG("<< %s\n",  __func__);
+
+    return DOE_SUCCESS;
+}
+
+bool cxl_doe_cdat_rsp(PCIDevice *pci_dev)
+{
+    CXLComponentState *cxl_cstate = &CT3(pci_dev)->cxl_cstate;
+    uint32_t cnt;
+    uint32_t dw_cnt;
+
+    DOE_DBG(">> %s\n",  __func__);
+
+    cnt = sizeof(struct cxl_cdat_rsp);
+    cxl_doe_cdat_init(cxl_cstate);
+    memcpy(pci_dev->exp.doe_state.read_mbox,
+           cxl_cstate->doe_resp.data_byte, cnt);
+
+    /* copy the DSMAS entry */
+    memcpy(pci_dev->exp.doe_state.read_mbox + cnt / 4,
+           &cxl_cstate->dsmas, sizeof(struct cdat_dsmas));
+    cnt += sizeof(struct cdat_dsmas);
+
+    /* copy the DSLBIS entry */
+    memcpy(pci_dev->exp.doe_state.read_mbox + cnt / 4,
+           &cxl_cstate->dslbis, sizeof(struct cdat_dslbis));
+    cnt += sizeof(struct cdat_dslbis);
+
+    /* copy the DSMSCIS entry */
+    memcpy(pci_dev->exp.doe_state.read_mbox + cnt / 4,
+           &cxl_cstate->dsmscis, sizeof(struct cdat_dsmscis));
+    cnt += sizeof(struct cdat_dsmscis);
+
+    /* copy the DSIS entry */
+    memcpy(pci_dev->exp.doe_state.read_mbox + cnt / 4,
+           &cxl_cstate->dsis, sizeof(struct cdat_dsis));
+    cnt += sizeof(struct cdat_dsis);
+
+    /* copy the DSEMTS entry */
+    memcpy(pci_dev->exp.doe_state.read_mbox + cnt / 4,
+           &cxl_cstate->dsemts, sizeof(struct cdat_dsemts));
+    cnt += sizeof(struct cdat_dsemts);
+
+    /* copy the SSLBE entry */
+
+    /* copy the SSLBIS entry */
+
+    memcpy(pci_dev->exp.doe_state.read_mbox + cnt / 4,
+           &cxl_cstate->sslbis, 4);
+    cnt += 4;
+    dw_cnt = cnt / 4;
+    pci_dev->exp.doe_state.read_mbox_len += dw_cnt;
+    DOE_DBG("  read_mbox_len=%x\n",
+            pci_dev->exp.doe_state.read_mbox_len);
+    memcpy(pci_dev->exp.doe_state.read_mbox + 1, &dw_cnt, 4);
+    DOE_DBG("  RD MBOX[0]=%x", *(pci_dev->exp.doe_state.read_mbox));
+    DOE_DBG("  RD MBOX[%d]=%x\n",
+            dw_cnt - 1, *(pci_dev->exp.doe_state.read_mbox + dw_cnt - 1));
+    for (int i = 0; i < dw_cnt; i++)
+        DOE_DBG("\033[31m  RD MBOX[%d]=%x\033[m\n", i,
+                pci_dev->exp.doe_state.read_mbox[i]);
+
+    DOE_DBG("<< %s\n",  __func__);
+
+    return DOE_SUCCESS;
+}
+
+static uint32_t ct3d_config_read(PCIDevice *pci_dev,
+                            uint32_t addr, int size)
+{
+    DOE_DBG(">> %s addr: %"PRIx32" size: %x\n",  __func__, addr, size);
+
+    DOE_DBG("<< %s\n",  __func__);
+    return pcie_doe_read_config(pci_dev, addr, size); ;
+}
+
+static void ct3d_config_write(PCIDevice *pci_dev,
+                            uint32_t addr, uint32_t val, int size)
+{
+    DOE_DBG(">> %s\n",  __func__);
+    DOE_DBG("  addr=%x, val=%x, size=%x\n", addr, val, size);
+
+    pcie_doe_write_config(pci_dev, addr, val, size);
+
+    DOE_DBG("<< %s\n",  __func__);
+}
+
+static void build_doe(CXLType3Dev *ct3d)
+{
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+
+    DOE_DBG(">> %s\n",  __func__);
+    cxl_component_create_doe(cxl_cstate, 0x160);
+
+    DOE_DBG("<< %s\n",  __func__);
+}
+
  static void build_dvsecs(CXLType3Dev *ct3d)
  {
      CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
@@ -239,6 +356,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                       PCI_BASE_ADDRESS_SPACE_MEMORY |
                           PCI_BASE_ADDRESS_MEM_TYPE_64,
                       &ct3d->cxl_dstate.device_registers);
+    build_doe(ct3d);
  }

  static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
@@ -357,6 +475,9 @@ static void ct3_class_init(ObjectClass *oc, void *data)
      DeviceClass *dc = DEVICE_CLASS(oc);
      PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
      MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+
+    pc->config_write = ct3d_config_write;
+    pc->config_read = ct3d_config_read;
      CXLType3Class *cvc = CXL_TYPE3_DEV_CLASS(oc);

      pc->realize = ct3_realize;
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 5c4bbac817..aa4783d978 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -12,6 +12,7 @@ pci_ss.add(files(
  # allow plugging PCIe devices into PCI buses, include them even if
  # CONFIG_PCI_EXPRESS=n.
  pci_ss.add(files('pcie.c', 'pcie_aer.c'))
+pci_ss.add(files('pcie.c', 'pcie_doe.c'))
  softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
  softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 1ecf6f6a55..532219ae17 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -19,6 +19,8 @@
   */

  #include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
  #include "qapi/error.h"
  #include "hw/mem/memory-device.h"
  #include "hw/pci/pci_bridge.h"
@@ -735,7 +737,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,

      hotplug_event_notify(dev);

-    /* 
+    /*
       * 6.7.3.2 Command Completed Events
       *
       * Software issues a command to a hot-plug capable Downstream Port by
diff --git a/hw/pci/pcie_doe.c b/hw/pci/pcie_doe.c
new file mode 100644
index 0000000000..92e16f328c
--- /dev/null
+++ b/hw/pci/pcie_doe.c
@@ -0,0 +1,360 @@
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qemu/range.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/pcie_doe.h"
+
+/*
+ * DOE Default Protocols (Discovery, CMA)
+ */
+/* Discovery Request Object */
+struct doe_discovery {
+    DOEHeader header;
+    uint8_t index;
+    uint8_t reserved[3];
+} __attribute__((__packed__));
+
+/* Discovery Response Object */
+struct doe_discovery_rsp {
+    DOEHeader header;
+    uint16_t vendor_id;
+    uint8_t doe_type;
+    uint8_t next_index;
+} __attribute__((__packed__));
+
+/* Callback for Discovery */
+static bool pcie_doe_discovery_rsp(PCIDevice *dev)
+{
+    struct doe_discovery *req = pcie_doe_get_req(dev);
+    uint8_t index = req->index;
+    DOEProtocol *prot = NULL;
+
+    /* Length mismatch, discard */
+    if (req->header.length < dwsizeof(struct doe_discovery)) {
+        return DOE_DISCARD;
+    }
+
+    if (index < dev->exp.doe_state.protocol_num) {
+        prot = &dev->exp.doe_state.protocols[index];
+    }
+
+    struct doe_discovery_rsp response = {
+        .header = {
+            .vendor_id = PCI_DOE_PCI_SIG_VID,
+            .doe_type = PCI_SIG_DOE_DISCOVERY,
+            .reserved = 0x0,
+            .length = dwsizeof(struct doe_discovery_rsp),
+        },
+        .vendor_id = (prot) ? prot->vendor_id : 0xFFFF,
+        .doe_type = (prot) ? prot->doe_type : 0xFF,
+        .next_index = (index + 1) < dev->exp.doe_state.protocol_num ?
+                      (index + 1) : 0,
+    };
+
+    pcie_doe_set_rsp(dev, &response);
+
+    return DOE_SUCCESS;
+}
+
+/* Callback for CMA */
+static bool pcie_doe_cma_rsp(PCIDevice *dev)
+{
+    uint32_t local_val;
+
+    local_val =
+        pci_get_long(dev->config + dev->exp.doe_cap + PCI_EXP_DOE_STATUS);
+    local_val = FIELD_DP32(local_val, PCI_DOE_CAP_STATUS, DOE_ERROR, 0x1);
+    pci_set_long(dev->config + dev->exp.doe_cap + PCI_EXP_DOE_STATUS,
+                 local_val);
+    memset(dev->exp.doe_state.read_mbox, 0,
+           PCI_DOE_MAX_DW_SIZE * sizeof(uint32_t));
+
+    dev->exp.doe_state.write_mbox_len = 0;
+
+    return DOE_DISCARD;
+}
+
+/*
+ * DOE Utilities
+ */
+static void pcie_doe_reset_mbox(PCIDevice *dev)
+{
+    DOEState *st = &dev->exp.doe_state;
+    uint16_t offset = dev->exp.doe_cap;
+
+    st->read_mbox_idx = 0;
+
+    st->read_mbox_len = 0;
+    st->write_mbox_len = 0;
+
+    memset(st->read_mbox, 0, PCI_DOE_MAX_DW_SIZE * sizeof(uint32_t));
+    memset(st->write_mbox, 0, PCI_DOE_MAX_DW_SIZE * sizeof(uint32_t));
+
+    pci_set_word(dev->config + offset + PCI_EXP_DOE_WR_DATA_MBOX, 0);
+    pci_set_word(dev->config + offset + PCI_EXP_DOE_RD_DATA_MBOX, 0);
+}
+
+void pcie_cap_doe_init(PCIDevice *dev, uint16_t offset)
+{
+    pcie_add_capability(dev, PCI_EXT_CAP_ID_DOE, PCI_DOE_VER, offset,
+                        PCI_DOE_SIZEOF);
+    dev->exp.doe_cap = offset;
+
+    /* Set wmask on all registers */
+    pci_set_long(dev->wmask + offset + PCI_EXP_DOE_CTRL, 0xffffffff);
+    pci_set_long(dev->wmask + offset + PCI_EXP_DOE_WR_DATA_MBOX, 0xffffffff);
+    pci_set_long(dev->wmask + offset + PCI_EXP_DOE_RD_DATA_MBOX, 0xffffffff);
+
+    dev->exp.doe_state.write_mbox =
+        calloc(PCI_DOE_MAX_DW_SIZE, sizeof(uint32_t));
+    if (dev->exp.doe_state.write_mbox == NULL) {
+        DOE_DBG("%s could not allocate DOE write mbox memory\n", __func__);
+    }
+
+    dev->exp.doe_state.read_mbox =
+        calloc(PCI_DOE_MAX_DW_SIZE, sizeof(uint32_t));
+    if (dev->exp.doe_state.read_mbox == NULL) {
+        DOE_DBG("%s could not allocate DOE read mbox memory\n", __func__);
+    }
+
+    dev->exp.doe_state.protocol_num = 0;
+    pcie_doe_register_protocol(dev, PCI_DOE_PCI_SIG_VID,
+            PCI_SIG_DOE_DISCOVERY, pcie_doe_discovery_rsp);
+    pcie_doe_register_protocol(dev, PCI_DOE_PCI_SIG_VID,
+            PCI_SIG_DOE_CMA, pcie_doe_cma_rsp);
+
+    pcie_doe_reset_mbox(dev);
+}
+
+void pcie_doe_register_protocol(PCIDevice *dev, uint16_t vendor_id,
+        uint8_t doe_type, bool (*set_rsp)(PCIDevice *))
+{
+    DOEState *st;
+
+    st = &dev->exp.doe_state;
+
+    /* Protocol num should not exceed 256 */
+    assert(st->protocol_num < PCI_DOE_PROTOCOL_MAX);
+
+    st->protocols[st->protocol_num].vendor_id = vendor_id;
+    st->protocols[st->protocol_num].doe_type = doe_type;
+    st->protocols[st->protocol_num].set_rsp = set_rsp;
+
+    st->protocol_num++;
+}
+
+void pcie_cap_doe_reset(PCIDevice *dev)
+{
+    uint16_t offset;
+
+    offset = dev->exp.doe_cap;
+    if (offset) {
+        pci_set_word(dev->config + offset + PCI_EXP_DOE_CTRL, 0);
+        pcie_doe_reset_mbox(dev);
+    }
+}
+
+uint32_t pcie_doe_build_protocol(DOEProtocol *p)
+{
+    return DATA_OBJ_BUILD_HEADER1(p->vendor_id, p->doe_type);
+}
+
+/* Return the pointer of DOE request in write mailbox buffer */
+void *pcie_doe_get_req(PCIDevice *dev)
+{
+    return dev->exp.doe_state.write_mbox;
+}
+
+/* Copy the response to read mailbox buffer */
+void pcie_doe_set_rsp(PCIDevice *dev, void *rsp)
+{
+    DOEState *st = &dev->exp.doe_state;
+    uint32_t len = ((DOEHeader *)rsp)->length;
+
+    memcpy(st->read_mbox + st->read_mbox_len, rsp, len * sizeof(uint32_t));
+    st->read_mbox_len += len;
+}
+
+static void pcie_doe_write_mbox(DOEState *st, uint32_t val)
+{
+    memcpy(st->write_mbox + st->write_mbox_len, &val, sizeof(uint32_t));
+
+    if (st->write_mbox_len == 1) {
+        DOE_DBG("  Capture DOE request DO length = %d\n", val & 0x0003ffff);
+    }
+
+    st->write_mbox_len += 1;
+}
+
+static bool pcie_doe_check_ready(PCIDevice *p)
+{
+    uint32_t val;
+
+    val = pci_get_long(p->config + p->exp.doe_cap + PCI_EXP_DOE_STATUS);
+    DOE_DBG("  STATUS_REG=%x\n", val);
+
+    val = FIELD_EX32(val, PCI_DOE_CAP_STATUS, DATA_OBJ_RDY);
+    DOE_DBG("  DATA OBJECT READY=%x\n", val);
+
+    return val;
+}
+
+static void pcie_doe_set_ready(PCIDevice *p, bool rdy)
+{
+    uint32_t val;
+
+    val = pci_get_long(p->config + p->exp.doe_cap + PCI_EXP_DOE_STATUS);
+    val = FIELD_DP32(val, PCI_DOE_CAP_STATUS, DATA_OBJ_RDY, rdy);
+    pci_set_long(p->config + p->exp.doe_cap + PCI_EXP_DOE_STATUS, val);
+}
+
+static void pcie_doe_set_error(PCIDevice *p, bool err)
+{
+    uint32_t val;
+
+    val = pci_get_long(p->config + p->exp.doe_cap + PCI_EXP_DOE_STATUS);
+    val = FIELD_DP32(val, PCI_DOE_CAP_STATUS, DOE_ERROR, err);
+    pci_set_long(p->config + p->exp.doe_cap + PCI_EXP_DOE_STATUS, val);
+}
+
+uint32_t pcie_doe_read_config(PCIDevice *pci_dev,
+                            uint32_t addr, int size)
+{
+    uint32_t ret_val;
+    uint16_t doe_offset = pci_dev->exp.doe_cap;
+    uint32_t doe_reg = addr - doe_offset;
+    DOEState *st = &pci_dev->exp.doe_state;
+
+    /* Decode address and process DOE protocol if overlaps DOE cap range */
+    if (!range_covers_byte(doe_offset, PCI_DOE_SIZEOF, addr))
+        ret_val = pci_default_read_config(pci_dev, addr, size);
+    else {
+        switch (doe_reg) {
+        case PCI_EXP_DOE_CTRL:
+            /* must return ABORT=0 and GO=0 */
+            ret_val = pci_get_long(pci_dev->config + addr);
+            ret_val &= PCI_EXP_DOE_CTRL_RMASK;
+            DOE_DBG("  CONTROL REG=%x\n", ret_val);
+            break;
+        case PCI_EXP_DOE_RD_DATA_MBOX:
+            /* check that DOE_READY is set */
+            if (!pcie_doe_check_ready(pci_dev)) {
+                /* return 0 if not ready */
+                ret_val = 0;
+                DOE_DBG("  RD MBOX RETURN=%x\n", ret_val);
+            } else {
+                /* deposit next DO DW into read mbox */
+                DOE_DBG("  RD MBOX, DATA OBJECT READY,"
+                        " CURRENT DO DW OFFSET=%x\n",
+                        st->read_mbox_idx);
+
+                ret_val = st->read_mbox[st->read_mbox_idx];
+                pci_set_long(pci_dev->config + addr, ret_val);
+
+                DOE_DBG("  RD MBOX DW=%x\n", ret_val);
+                DOE_DBG("  RD MBOX DW OFFSET=%d, RD MBOX LENGTH=%d\n",
+                        st->read_mbox_idx, st->read_mbox_len);
+            }
+            break;
+        case PCI_EXP_DOE_WR_DATA_MBOX:
+            ret_val = 0;
+            DOE_DBG("  WR MBOX, local_val =%x\n", ret_val);
+            break;
+        default:
+            ret_val = pci_default_read_config(pci_dev, addr, size);
+            DOE_DBG("  ADDR=%x, VAL =%x\n", addr, ret_val);
+            break;
+        }
+        DOE_DBG("  RETURN=%x\n", ret_val);
+    }
+
+    return ret_val;
+}
+
+void pcie_doe_write_config(PCIDevice *pci_dev,
+                            uint32_t addr, uint32_t val, int size)
+{
+    uint16_t doe_offset = pci_dev->exp.doe_cap;
+    uint32_t doe_reg = addr - doe_offset;
+    DOEState *st = &pci_dev->exp.doe_state;
+    int p;
+    bool discard;
+
+    DOE_DBG("  addr=%x, val=%x, size=%x\n", addr, val, size);
+
+    /* if accessing DOE cap read or write mailbox */
+    if (!range_covers_byte(doe_offset, PCI_DOE_SIZEOF, addr))
+        pci_default_write_config(pci_dev, addr, val, size);
+    else {
+        switch (doe_reg) {
+        case PCI_EXP_DOE_CTRL:
+            DOE_DBG("  CONTROL=%x\n", val);
+            /* control reg */
+            if (FIELD_EX32(val, PCI_DOE_CAP_CONTROL, DOE_ABORT)) {
+                /* If ABORT, clear status reg DOE Error and DOE Ready */
+                DOE_DBG("  Setting ABORT\n");
+                pcie_doe_set_ready(pci_dev, 0);
+                pcie_doe_set_error(pci_dev, 0);
+                pcie_doe_reset_mbox(pci_dev);
+            } else if (FIELD_EX32(val, PCI_DOE_CAP_CONTROL, DOE_GO)) {
+                DOE_DBG("  CONTROL GO=%x\n", val);
+                /*
+                 * Check protocol the incoming request in write_mbox and
+                 * memcpy the corresponding response to read_mbox.
+                 *
+                 * "discard" should be set up if the response callback
+                 * function could not deal with request (e.g. length
+                 * mismatch) or the protocol of request was not found.
+                 */
+                p = 0;
+                discard = DOE_DISCARD;
+                while (p < st->protocol_num) {
+                    if (st->write_mbox[0] ==
+                        pcie_doe_build_protocol(&st->protocols[p])) {
+                        /* Found */
+                        DOE_DBG("  DOE PROTOCOL=%x\n", st->write_mbox[0]);
+                        /*
+                         * Spec:
+                         * If the number of DW transferred does not match the
+                         * indicated Length for a data object, then the
+                         * data object must be silently discarded.
+                         */
+                        if (st->write_mbox_len ==
+                            ((DOEHeader *)pcie_doe_get_req(pci_dev))->length)
+                            discard = st->protocols[p].set_rsp(pci_dev);
+                        break;
+                    }
+                    p++;
+                }
+
+                /* set DOE Ready */
+                if (!discard) {
+                    pcie_doe_set_ready(pci_dev, 1);
+                } else {
+                    pcie_doe_reset_mbox(pci_dev);
+                }
+            }
+            break;
+        case PCI_EXP_DOE_RD_DATA_MBOX:
+            /* read mbox */
+            DOE_DBG("  INCR RD MBOX DO DW OFFSET=%d\n", st->read_mbox_idx);
+            st->read_mbox_idx += 1;
+            /* Last DW */
+            if (st->read_mbox_idx >= st->read_mbox_len) {
+                pcie_doe_reset_mbox(pci_dev);
+                pcie_doe_set_ready(pci_dev, 0);
+            }
+            break;
+        case PCI_EXP_DOE_WR_DATA_MBOX:
+            /* write mbox */
+            DOE_DBG("  WR MBOX=%x, DW OFFSET = %d\n", val, st->write_mbox_len);
+            pcie_doe_write_mbox(st, val);
+            break;
+        default:
+            break;
+        }
+    }
+}
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 762feb54da..4078b99c49 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -132,6 +132,23 @@ HDM_DECODER_INIT(0);
  _Static_assert((CXL_SNOOP_REGISTERS_OFFSET + CXL_SNOOP_REGISTERS_SIZE) < 0x1000,
                 "No space for registers");

+/* 14.16.4 - Compliance Mode */
+#define CXL_COMP_MODE_CAP               0x0
+#define CXL_COMP_MODE_STATUS            0x1
+#define CXL_COMP_MODE_HALT              0x2
+#define CXL_COMP_MODE_MULT_WR_STREAM    0x3
+#define CXL_COMP_MODE_PRO_CON           0x4
+#define CXL_COMP_MODE_BOGUS             0x5
+#define CXL_COMP_MODE_INJ_POISON        0x6
+#define CXL_COMP_MODE_INJ_CRC           0x7
+#define CXL_COMP_MODE_INJ_FC            0x8
+#define CXL_COMP_MODE_TOGGLE_CACHE      0x9
+#define CXL_COMP_MODE_INJ_MAC           0xa
+#define CXL_COMP_MODE_INS_UNEXP_MAC     0xb
+#define CXL_COMP_MODE_INJ_VIRAL         0xc
+#define CXL_COMP_MODE_INJ_ALMP          0xd
+#define CXL_COMP_MODE_IGN_ALMP          0xe
+
  typedef struct component_registers {
      /*
       * Main memory region to be registered with QEMU core.
@@ -173,6 +190,103 @@ typedef struct cxl_component {
              struct PCIDevice *pdev;
          };
      };
+
+    /*
+     * SW write write mailbox and GO on last DW
+     * device sets READY of offset DW in DO types to copy
+     * to read mailbox register on subsequent cfg_read
+     * of read mailbox register and then on cfg_write to
+     * denote success read increments offset to next DW
+     */
+    struct cdat_table_header cdat_header;
+
+    union doe_request_u {
+        /* Compliance DOE Data Objects Type=0*/
+        struct cxl_compliance_mode_cap
+            mode_cap;
+        struct cxl_compliance_mode_status
+            mode_status;
+        struct cxl_compliance_mode_halt
+            mode_halt;
+        struct cxl_compliance_mode_multiple_write_streaming
+            multiple_write_streaming;
+        struct cxl_compliance_mode_producer_consumer
+            producer_consumer;
+        struct cxl_compliance_mode_inject_bogus_writes
+            inject_bogus_writes;
+        struct cxl_compliance_mode_inject_poison
+            inject_poison;
+        struct cxl_compliance_mode_inject_crc
+            inject_crc;
+        struct cxl_compliance_mode_inject_flow_control
+            inject_flow_control;
+        struct cxl_compliance_mode_toggle_cache_flush
+            toggle_cache_flush;
+        struct cxl_compliance_mode_inject_mac_delay
+            inject_mac_delay;
+        struct cxl_compliance_mode_insert_unexp_mac
+            insert_unexp_mac;
+        struct cxl_compliance_mode_inject_viral
+            inject_viral;
+        struct cxl_compliance_mode_inject_almp
+            inject_almp;
+        struct cxl_compliance_mode_ignore_almp
+            ignore_almp;
+        struct cxl_compliance_mode_ignore_bit_error
+            ignore_bit_error;
+        /* CDAT DOE Data Objects Type=2*/
+        struct cxl_cdat cdat;
+        char data_byte[128];
+    } doe_request;
+
+    union doe_resp_u {
+        /* Compliance DOE Data Objects Type=0*/
+        struct cxl_compliance_mode_cap_rsp
+            cap_rsp;
+        struct cxl_compliance_mode_status_rsp
+            status_rsp;
+        struct cxl_compliance_mode_halt_rsp
+            halt_rsp;
+        struct cxl_compliance_mode_multiple_write_streaming_rsp
+            multiple_write_streaming_rsp;
+        struct cxl_compliance_mode_producer_consumer_rsp
+            producer_consumer_rsp;
+        struct cxl_compliance_mode_inject_bogus_writes_rsp
+            inject_bogus_writes_rsp;
+        struct cxl_compliance_mode_inject_poison_rsp
+            inject_poison_rsp;
+        struct cxl_compliance_mode_inject_crc_rsp
+            inject_crc_rsp;
+        struct cxl_compliance_mode_inject_flow_control_rsp
+            inject_flow_control_rsp;
+        struct cxl_compliance_mode_toggle_cache_flush_rsp
+            toggle_cache_flush_rsp;
+        struct cxl_compliance_mode_inject_mac_delay_rsp
+            inject_mac_delay_rsp;
+        struct cxl_compliance_mode_insert_unexp_mac_rsp
+            insert_unexp_mac_rsp;
+        struct cxl_compliance_mode_inject_viral
+            inject_viral_rsp;
+        struct cxl_compliance_mode_inject_almp_rsp
+            inject_almp_rsp;
+        struct cxl_compliance_mode_ignore_almp_rsp
+            ignore_almp_rsp;
+        struct cxl_compliance_mode_ignore_bit_error_rsp
+            ignore_bit_error_rsp;
+        /* CDAT DOE Data Objects Type=2*/
+        struct cxl_cdat_rsp cdat_rsp;
+        char data_byte[520 * 4];
+        uint32_t data_dword[520];
+    } doe_resp;
+
+    /* Table entry types */
+    struct cdat_dsmas dsmas;
+    struct cdat_dslbis dslbis;
+    struct cdat_dsmscis dsmscis;
+    struct cdat_dsis dsis;
+    struct cdat_dsemts dsemts;
+    struct cdat_sslbe sslbe;
+    struct cdat_sslbis sslbis;
  } CXLComponentState;

  void cxl_component_register_block_init(Object *obj,
@@ -184,4 +298,10 @@ void cxl_component_register_init_common(uint32_t *reg_state,
  void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
                                  uint16_t type, uint8_t rev, uint8_t *body);

+void cxl_component_create_doe(CXLComponentState *cxl_cstate, uint16_t offset);
+
+uint32_t cxl_doe_compliance_init(CXLComponentState *cxl_cstate);
+bool cxl_doe_compliance_rsp(PCIDevice *pci_dev);
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate);
+bool cxl_doe_cdat_rsp(PCIDevice *pci_dev);
  #endif
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 9ec28c9feb..c7300af8f8 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -34,6 +34,15 @@
  #define REG_LOC_DVSEC_LENGTH 0x24
  #define REG_LOC_DVSEC_REVID  0

+enum {
+    CXL_DOE_COMPLIANCE             = 0,
+    CXL_DOE_TABLE_ACCESS           = 2,
+    CXL_DOE_MAX_TYPE
+};
+
+#define CXL_DOE_PROTOCOL_COMPLIANCE ((CXL_DOE_COMPLIANCE << 16) | CXL_VENDOR_ID)
+#define CXL_DOE_PROTOCOL_CDAT     ((CXL_DOE_TABLE_ACCESS << 16) | CXL_VENDOR_ID)
+
  enum {
      PCIE_CXL_DEVICE_DVSEC      = 0,
      NON_CXL_FUNCTION_MAP_DVSEC = 2,
@@ -54,6 +63,425 @@ struct dvsec_header {
  _Static_assert(sizeof(struct dvsec_header) == 10,
                 "dvsec header size incorrect");

+/* CXL 2.0 - 8.1.11 */
+/*
+ * CDAT - Coherence Device Attributes Table
+ *        Version 1
+ */
+
+/*
+ * CXL 2.0 devices may implement certain DOE Cap
+ */
+
+/*
+ * DOE CDAT Table Protocol
+ */
+
+/* Data object header */
+struct cdat_table_header {
+    uint32_t length;    /* Length of table in bytes, including this header */
+    uint8_t revision;   /* ACPI Specification minor version number */
+    uint8_t checksum;   /* To make sum of entire table == 0 */
+    char reserved[6];
+    char sequence[4];   /* ASCII table signature */
+} __attribute__((__packed__));
+
+/* Values for subtable type in CDAT structures */
+
+enum cdat_type {
+    CDAT_TYPE_DSMAS = 0,
+    CDAT_TYPE_DSLBIS = 1,
+    CDAT_TYPE_DSMSCIS = 2,
+    CDAT_TYPE_DSIS = 3,
+    CDAT_TYPE_DSEMTS = 4,
+    CDAT_TYPE_SSLBIS = 5
+};
+
+/*
+ * CDAT Structure Subtables
+ */
+
+struct cxl_cdat {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t table_type;
+    uint16_t entry_handle;
+} __attribute__((__packed__));
+
+struct cxl_cdat_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t table_type;
+    uint16_t next_entry_handle;
+    uint32_t *entry; /* CDAT Table Entry content */
+} __attribute__((__packed__));
+
+struct cdat_dsmas {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+    uint8_t DSMADhandle;
+    uint8_t flags;
+    uint16_t reserved2;
+    uint64_t DPA_base;
+    uint64_t DPA_length;
+} __attribute__((__packed__));
+
+struct cdat_dslbis {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+    uint8_t handle;
+    uint8_t flags;
+    uint8_t data_type;
+    uint8_t reserved2;
+    uint64_t entry_base_unit;
+    uint16_t entry[3];
+    uint16_t reserved3;
+} __attribute__((__packed__));
+
+struct cdat_dsmscis {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+    uint8_t DSMASH_handle;
+    char reserved2[3];
+    uint64_t memory_side_cache_size;
+    uint32_t cache_attributes;
+} __attribute__((__packed__));
+
+struct cdat_dsis {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+    uint8_t flags;
+    uint8_t handle;
+    uint16_t reserved2;
+    uint64_t DPA_offset;
+    uint64_t DPA_length;
+} __attribute__((__packed__));
+
+struct cdat_dsemts {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+    uint8_t DSMAS_handle;
+    uint8_t EFI_memory_type_attr;
+    uint16_t reserved2;
+} __attribute__((__packed__));
+
+struct cdat_sslbe {
+    uint16_t port_x_id;
+    uint16_t port_y_id;
+    uint16_t latency_bandwidth;
+    uint16_t reserved;
+} __attribute__((__packed__));
+
+struct cdat_sslbis {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+    uint8_t data_type;
+    char reserved2[3];
+    struct cdat_sslbe cdat_sslbe_array[256];
+} __attribute__((__packed__));
+
+/*
+ * DOE Compliance Mode Protocol
+ *        Version 1
+ */
+
+/*
+ * CXL 2.0 devices may implement certain DOE Cap
+ */
+
+struct cxl_compliance_mode_cap {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_cap_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+    uint64_t available_cap_bitmask;
+    uint64_t enabled_cap_bitmask;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_status {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_status_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint32_t cap_bitfield;
+    uint16_t cache_size;
+    uint8_t cache_size_units;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_halt {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_halt_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_multiple_write_streaming {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t protocol;
+    uint8_t virtual_addr;
+    uint8_t self_checking;
+    uint8_t verify_read_semantics;
+    uint8_t num_inc;
+    uint8_t num_sets;
+    uint8_t num_loops;
+    uint8_t reserved2;
+    uint64_t start_addr;
+    uint64_t write_addr;
+    uint64_t writeback_addr;
+    uint64_t byte_mask;
+    uint32_t addr_incr;
+    uint32_t set_offset;
+    uint32_t pattern_p;
+    uint32_t inc_pattern_b;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_multiple_write_streaming_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_producer_consumer {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t protocol;
+    uint8_t num_inc;
+    uint8_t num_sets;
+    uint8_t num_loops;
+    uint8_t write_semantics;
+    char reserved2[3];
+    uint64_t start_addr;
+    uint64_t byte_mask;
+    uint32_t addr_incr;
+    uint32_t set_offset;
+    uint32_t pattern;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_producer_consumer_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_bogus_writes {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t count;
+    uint8_t reserved2;
+    uint32_t pattern;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_bogus_writes_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_poison {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t protocol;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_poison_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_crc {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t num_bits_flip;
+    uint8_t num_flits_inj;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_crc_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_flow_control {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t inj_flow_control;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_flow_control_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_toggle_cache_flush {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t inj_flow_control;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_toggle_cache_flush_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_mac_delay {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t enable;
+    uint8_t mode;
+    uint8_t delay;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_mac_delay_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_insert_unexp_mac {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t opcode;
+    uint8_t mode;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_insert_unexp_mac_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_viral {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t protocol;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_viral_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+    uint8_t status;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_almp {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t opcode;
+    char reserved2[3];
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_inject_almp_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t reserved[6];
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_ignore_almp {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_ignore_almp_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t reserved[6];
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_ignore_bit_error {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+    uint8_t opcode;
+} __attribute__((__packed__));
+
+struct cxl_compliance_mode_ignore_bit_error_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t reserved[6];
+} __attribute__((__packed__));
+
  /*
   * CXL 2.0 devices must implement certain DVSEC IDs, and can [optionally]
   * implement others.
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 14c58ebdb6..6d199f3093 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -25,6 +25,7 @@
  #include "hw/pci/pcie_regs.h"
  #include "hw/pci/pcie_aer.h"
  #include "hw/hotplug.h"
+#include "hw/pci/pcie_doe.h"

  typedef enum {
      /* for attention and power indicator */
@@ -81,6 +82,10 @@ struct PCIExpressDevice {

      /* ACS */
      uint16_t acs_cap;
+
+    /* DOE */
+    uint16_t doe_cap;
+    DOEState doe_state;
  };

  #define COMPAT_PROP_PCP "power_controller_present"
diff --git a/include/hw/pci/pcie_doe.h b/include/hw/pci/pcie_doe.h
new file mode 100644
index 0000000000..4eef0acea9
--- /dev/null
+++ b/include/hw/pci/pcie_doe.h
@@ -0,0 +1,130 @@
+#ifndef PCIE_DOE_H
+#define PCIE_DOE_H
+
+#include "qemu/range.h"
+#include "qemu/typedefs.h"
+#include "hw/register.h"
+
+/* PCI DOE register defines 7.9.xx */
+/* DOE Capabilities Register */
+#define PCI_EXP_DOE_CAP             0x04
+#define  PCI_EXP_DOE_CAP_INTR_SUPP  0x00000001
+#define  PCI_EXP_DOE_CAP_INTR(x)    ((x) >> 11)
+REG32(PCI_DOE_CAP_REG, 0)
+    FIELD(PCI_DOE_CAP_REG, INTR_SUPP, 0, 1)
+    FIELD(PCI_DOE_CAP_REG, DOE_INTR_MSG_NUM, 1, 11)
+/* DOE Control Register  */
+#define PCI_EXP_DOE_CTRL            0x08
+#define  PCI_EXP_DOE_CTRL_ABORT     0x00000001
+#define  PCI_EXP_DOE_CTRL_INTR_EN   0x00000002
+#define  PCI_EXP_DOE_CTRL_GO        0x80000000
+REG32(PCI_DOE_CAP_CONTROL, 0)
+    FIELD(PCI_DOE_CAP_CONTROL, DOE_ABORT, 0, 1)
+    FIELD(PCI_DOE_CAP_CONTROL, DOE_INTR_EN, 1, 1)
+    FIELD(PCI_DOE_CAP_CONTROL, DOE_GO, 31, 1)
+#define  PCI_EXP_DOE_CTRL_RMASK     \
+        (~(PCI_EXP_DOE_CTRL_ABORT | PCI_EXP_DOE_CTRL_GO))
+/* DOE Status Register  */
+#define PCI_EXP_DOE_STATUS          0x0c
+#define  PCI_EXP_DOE_STATUS_BUSY    0x00000001
+#define  PCI_EXP_DOE_STATUS_INTR    0x00000002
+#define  PCI_EXP_DOE_STATUS_ERR     0x00000004
+#define  PCI_EXP_DOE_STATUS_DO_RDY  0x80000000
+REG32(PCI_DOE_CAP_STATUS, 0)
+    FIELD(PCI_DOE_CAP_STATUS, DOE_BUSY, 0, 1)
+    FIELD(PCI_DOE_CAP_STATUS, DOE_INTR_STATUS, 1, 1)
+    FIELD(PCI_DOE_CAP_STATUS, DOE_ERROR, 2, 1)
+    FIELD(PCI_DOE_CAP_STATUS, DATA_OBJ_RDY, 31, 1)
+/* DOE Write Data Mailbox Register  */
+#define PCI_EXP_DOE_WR_DATA_MBOX    0x10
+/* DOE Read Data Mailbox Register  */
+#define PCI_EXP_DOE_RD_DATA_MBOX    0x14
+
+/* Table 7-x2 */
+#define PCI_DOE_PCI_SIG_VID         0x0001
+#define  PCI_SIG_DOE_DISCOVERY      0x00
+#define  PCI_SIG_DOE_CMA            0x01
+
+#define DATA_OBJ_BUILD_HEADER1(v, p)  ((p << 16) | v)
+#define PCI_DOE_PROTOCOL_DISCOVERY  \
+        DATA_OBJ_BUILD_HEADER1(PCI_DOE_PCI_SIG_VID, PCI_SIG_DOE_DISCOVERY)
+#define PCI_DOE_PROTOCOL_CMA        \
+        DATA_OBJ_BUILD_HEADER1(PCI_DOE_PCI_SIG_VID, PCI_SIG_DOE_CMA)
+
+/* Table 7-x3 */
+#define DOE_DISCOVERY_IDX_MASK      0x000000ff
+
+/* Figure 6-x1 */
+#define DATA_OBJECT_HEADER1_OFFSET  0
+#define DATA_OBJECT_HEADER2_OFFSET  1
+#define DATA_OBJECT_CONTENT_OFFSET  2
+
+#define PCI_DOE_MAX_DW_SIZE (1 << 18)
+#define PCI_DOE_PROTOCOL_MAX 256
+
+#define DOE_SUCCESS 0
+#define DOE_DISCARD 1
+/*
+ * DOE Protocol - Data Object
+ */
+typedef struct DOEHeader DOEHeader;
+typedef struct DOEProtocol DOEProtocol;
+typedef struct DOEState DOEState;
+
+struct DOEHeader {
+    uint16_t vendor_id;
+    uint8_t doe_type;
+    uint8_t reserved;
+    struct {
+        uint32_t length:18;
+        uint32_t reserved2:14;
+    };
+} __attribute__((__packed__));
+
+/* Protocol infos and rsp function callback */
+struct DOEProtocol {
+    uint16_t vendor_id;
+    uint8_t doe_type;
+
+    bool (*set_rsp)(PCIDevice *);
+};
+
+struct DOEState {
+    /* Mailbox buffer for device */
+    uint32_t *write_mbox;
+    uint32_t *read_mbox;
+
+    /* Mailbox position indicator */
+    uint32_t read_mbox_idx;
+    uint32_t read_mbox_len;
+    uint32_t write_mbox_len;
+
+    /* Protocols and its callback response */
+    DOEProtocol protocols[PCI_DOE_PROTOCOL_MAX];
+    uint32_t protocol_num;
+};
+
+void pcie_cap_doe_init(PCIDevice *dev, uint16_t offset);
+void pcie_cap_doe_reset(PCIDevice *dev);
+uint32_t pcie_doe_build_protocol(DOEProtocol *p);
+uint32_t pcie_doe_read_config(PCIDevice *pci_dev, uint32_t addr, int size);
+void pcie_doe_write_config(PCIDevice *pci_dev, uint32_t addr,
+                           uint32_t val, int size);
+void pcie_doe_register_protocol(PCIDevice *dev, uint16_t vendor_id,
+                                uint8_t doe_type,
+                                bool (*set_rsp)(PCIDevice *));
+
+/* Utility functions for set_rsp in DOEProtocol */
+void *pcie_doe_get_req(PCIDevice *dev);
+void pcie_doe_set_rsp(PCIDevice *dev, void *rsp);
+
+#define DOE_DEBUG
+#ifdef DOE_DEBUG
+#define DOE_DBG(...) printf(__VA_ARGS__)
+#else
+#define DOE_DBG(...) {}
+#endif
+
+#define dwsizeof(s) ((sizeof(s) + 4 - 1) / 4)
+
+#endif /* PCIE_DOE_H */
diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 1db86b0ec4..963dc2e170 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -179,4 +179,8 @@ typedef enum PCIExpLinkWidth {
  #define PCI_ACS_VER                     0x1
  #define PCI_ACS_SIZEOF                  8

+/* DOE Capability Register Fields */
+#define PCI_DOE_VER                     0x1
+#define PCI_DOE_SIZEOF                  24
+
  #endif /* QEMU_PCIE_REGS_H */
diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index e709ae8235..4a7b7a426d 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -730,7 +730,8 @@
  #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
  #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
  #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
+#define PCI_EXT_CAP_ID_DOE      0x2E    /* Data Object Exchange */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE

  #define PCI_EXT_CAP_DSN_SIZEOF	12
  #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40

---1463770623-1743276501-1612298610=:30097--

