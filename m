Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CC55B969
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 13:53:22 +0200 (CEST)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nIv-0000qC-VJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 07:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDn-0002gG-N6; Mon, 27 Jun 2022 07:48:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDj-0004bj-6W; Mon, 27 Jun 2022 07:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656330479; x=1687866479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=memW7vf5XKTuLc7peMmqrSMGjc7jo87NUmcXCBFzHIw=;
 b=kr8VhTTZf2WS07byEHb06HLQJAD0zJ7LKPMuZ0Q4qRA5Vm9nmFWh/DGf
 dTQAQ4G6eYYpY6vwNFMTJj7MNfO28tUbMdVv3c5MUH19XsN1NwuOnW9tB
 d33kNaUlapJJaJKjE0kdXInvqG+yOUEG+8v5BVSKipFkmcnVW5zS6Rf6t
 o+9lTcbvxFan2cVlLAXYt0HFdHjDqID5WRaJjqzQvTnENxUo7kLwShWQ2
 yKWV8bJzYPagY0fx3zqYa8Ft7J/KiG6ZkhHIpQLBiBi+5c1uqRzXXLnDv
 +aavZ6yDJhc4gevLmztp8/KEuSzb15XFdA06S9JIHn0YMpaqQesxO8hAl Q==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650902400"; d="scan'208";a="316298969"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2022 19:47:56 +0800
IronPort-SDR: Mv7PXVkRTZGz12mwVUrbkK/WR2gpMdIemsLkP93wUgXHJ5h50q3bAmGBGtKBrZ+uBqkaqMKBGH
 EblqOwCJlR1qLkFThOglrhHdqrTh6GnXgfMfhnAv/V2sXbV/UPoj65rE43A0bzQ8GADPOkLpL2
 64pW8wXG///SPBjGFGE747N8gJ9m0WPdVG2S5bC3F0sO1mOJCL1S4Ob3A9fIsPu9n1+L2q9e7n
 WjBKty/od9Dp+ywhwikpTx9bJ1HrxCsYywH39skmOxeMDGV4rWQgl7c+XZdS2hrHtQ1jntlsph
 7JfhF84L8grKHbL25g66CXws
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 04:10:19 -0700
IronPort-SDR: bcANuk71GS+kiWeYRA2s2J2O0BqxflvAShH1bd/qfS3p+7Y5EWBiEK3Fm3DXl2HBTAPMIE4id3
 npg80e1lJ4PNi39xXRdh8RWZDl0Qaq+XYNMlS1eCYT8HQVmnS+yQFsbsVPccCMB5c9ubbOT3v+
 F+cVa/gzk0Rly675Gb4WDxDh9m1rvu6BJ8/bjdmpgHJRt+vRAxHx3/dI+ZpZcwbH1BCVNU8BSW
 evpCp505+cj/LzrA4gEBEctXIMZ9I6igWP2zGfWaPNOkWvdgCKdo17pJ6vc2yCc+90unOli+ba
 rUw=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.108])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Jun 2022 04:47:55 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: damien.lemoal@wdc.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v2 3/4] hw/nvme: add support for ratified TP4084
Date: Mon, 27 Jun 2022 13:47:30 +0200
Message-Id: <20220627114731.356462-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627114731.356462-1-niklas.cassel@wdc.com>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=170689b83=niklas.cassel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

TP4084 adds a new mode, CC.CRIME, that can be used to mark a namespace
as ready independently from the controller.

When CC.CRIME is 0 (default), things behave as before, all namespaces
are ready when CSTS.RDY gets set to 1.

When CC.CRIME is 1, the controller will become ready when CSTS.RDY gets
set to 1, but commands accessing a namespace are allowed to return
"Namespace Not Ready" or "Admin Command Media Not Ready".
After CRTO.CRWMT amount of time, if the namespace has not yet been
marked ready, the status codes also need to have the DNR bit set.

Add a new "ready_delay" namespace device parameter, in order to emulate
different ready latencies for namespaces.

Once a namespace is ready, it will set the NRDY bit in the I/O Command
Set Independent Identify Namespace Data Structure, and then send out a
Namespace Attribute Changed event.

This new "ready_delay" is supported on controllers not part of a NVMe
subsystem. The reasons are many. One problem is that multiple controllers
can have different CC.CRIME modes running. Another problem is the extra
locking needed. The third problem is when to actually clear NRDY. If we
assume that a namespace clears NRDY when it no longer has any controller
online for that namespace. The problem then is that Linux will reset the
controllers one by one during probe time. The reset goes so fast so that
there is no time when all controllers are in reset at the same time, so
NRDY will never get cleared. (The controllers are enabled by SeaBIOS by
default.) We could introduce a reset_time param, but this would only
increase the chances that all controllers are in reset at the same time.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ctrl.c       | 123 +++++++++++++++++++++++++++++++++++++++++--
 hw/nvme/ns.c         |  18 +++++++
 hw/nvme/nvme.h       |   6 +++
 hw/nvme/trace-events |   1 +
 include/block/nvme.h |  60 ++++++++++++++++++++-
 5 files changed, 204 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8ca824ea14..5404f67480 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -88,6 +88,12 @@
  *   completion when there are no outstanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * - `crwmt`
+ *   This is the Controller Ready With Media Timeout (CRWMT) field that is
+ *   defined in the CRTO register. This specifies the worst-case time that host
+ *   software should wait for the controller and all attached namespaces to
+ *   become ready. The value is in units of 500 milliseconds.
+ *
  * - `mdts`
  *   Indicates the maximum data transfer size for a command that transfers data
  *   between host-accessible memory and the controller. The value is specified
@@ -157,6 +163,11 @@
  *   namespace will be available in the subsystem but not attached to any
  *   controllers.
  *
+ * - `ready_delay`
+ *   This parameter specifies the amount of time that the namespace should wait
+ *   before being marked ready. Only applicable if CC.CRIME is set by the user.
+ *   The value is in units of 500 milliseconds (to be consistent with `crwmt`).
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
@@ -216,6 +227,8 @@
 #define NVME_VF_RES_GRANULARITY 1
 #define NVME_VF_OFFSET 0x1
 #define NVME_VF_STRIDE 1
+#define NVME_DEFAULT_CRIMT 0xa
+#define NVME_DEFAULT_CRWMT 0xf
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -4188,6 +4201,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
+    if (!(ns->id_indep_ns.nstat & NVME_NSTAT_NRDY)) {
+        return NVME_NS_NOT_READY;
+    }
+
     if (ns->status) {
         return ns->status;
     }
@@ -4791,6 +4808,27 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
+static uint16_t nvme_identify_cs_indep_ns(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint32_t nsid = le32_to_cpu(c->nsid);
+
+    trace_pci_nvme_identify_cs_indep_ns(nsid);
+
+    if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
+            return nvme_rpt_empty_id_struct(n, req);
+    }
+
+    return nvme_c2h(n, (uint8_t *)&ns->id_indep_ns, sizeof(NvmeIdNsCsIndep),
+                    req);
+}
+
 static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
                                         bool attached)
 {
@@ -5081,6 +5119,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ns(n, req, true);
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
+    case NVME_ID_CNS_CS_INDEPENDENT_NS:
+        return nvme_identify_cs_indep_ns(n, req);
     case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
         return nvme_identify_ctrl_list(n, req, true);
     case NVME_ID_CNS_CTRL_LIST:
@@ -5556,6 +5596,44 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
     }
 }
 
+void nvme_ns_ready_cb(void *opaque)
+{
+    NvmeNamespace *ns = opaque;
+    DeviceState *dev = &ns->parent_obj;
+    BusState *s = qdev_get_parent_bus(dev);
+    NvmeCtrl *n = NVME(s->parent);
+
+    ns->id_indep_ns.nstat |= NVME_NSTAT_NRDY;
+
+    if (!test_and_set_bit(ns->params.nsid, n->changed_nsids)) {
+        nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                           NVME_LOG_CHANGED_NSLIST);
+    }
+}
+
+static void nvme_set_ready_or_start_timer(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    int64_t expire_time;
+
+    if (!NVME_CC_CRIME(ldl_le_p(&n->bar.cc)) || ns->params.ready_delay == 0) {
+        ns->id_indep_ns.nstat |= NVME_NSTAT_NRDY;
+        return;
+    }
+
+    expire_time = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    expire_time += ns->params.ready_delay * 500;
+    timer_mod(ns->ready_delay_timer, expire_time);
+}
+
+static inline void nvme_ns_clear_ready_and_stop_timer(NvmeNamespace *ns)
+{
+    if (!ns->subsys) {
+        timer_del(ns->ready_delay_timer);
+        ns->id_indep_ns.nstat &= ~NVME_NSTAT_NRDY;
+    }
+}
+
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
@@ -5607,6 +5685,12 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_attach_ns(ctrl, ns);
+
+            /*
+             * The ready_delay param only delays a ns when enabling the
+             * controller. No delay is added when attaching a detached ns.
+             */
+            ns->id_indep_ns.nstat |= NVME_NSTAT_NRDY;
             nvme_select_iocs_ns(ctrl, ns);
 
             break;
@@ -5619,6 +5703,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             ctrl->namespaces[nsid] = NULL;
             ns->attached--;
 
+            nvme_ns_clear_ready_and_stop_timer(ns);
+
             nvme_update_dmrsl(ctrl);
 
             break;
@@ -6222,6 +6308,8 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
         }
 
         nvme_ns_drain(ns);
+
+        nvme_ns_clear_ready_and_stop_timer(ns);
     }
 
     for (i = 0; i < n->params.max_ioqpairs + 1; i++) {
@@ -6297,11 +6385,13 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
             continue;
         }
 
+        nvme_ns_clear_ready_and_stop_timer(ns);
+
         nvme_ns_shutdown(ns);
     }
 }
 
-static void nvme_select_iocs(NvmeCtrl *n)
+static void nvme_ctrl_per_ns_action_on_start(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -6313,6 +6403,7 @@ static void nvme_select_iocs(NvmeCtrl *n)
         }
 
         nvme_select_iocs_ns(n, ns);
+        nvme_set_ready_or_start_timer(n, ns);
     }
 }
 
@@ -6323,9 +6414,11 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     uint32_t aqa = ldl_le_p(&n->bar.aqa);
     uint64_t asq = ldq_le_p(&n->bar.asq);
     uint64_t acq = ldq_le_p(&n->bar.acq);
+    uint32_t crto = ldl_le_p(&n->bar.crto);
     uint32_t page_bits = NVME_CC_MPS(cc) + 12;
     uint32_t page_size = 1 << page_bits;
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
+    uint16_t new_cap_timeout;
 
     if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
         trace_pci_nvme_err_startfail_virt_state(le16_to_cpu(sctrl->nvi),
@@ -6404,6 +6497,15 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         return -1;
     }
 
+    if (!n->subsys && NVME_CC_CRIME(cc)) {
+        new_cap_timeout = NVME_CRTO_CRIMT(crto);
+    } else {
+        new_cap_timeout = NVME_CRTO_CRWMT(crto);
+    }
+    new_cap_timeout = MIN(0xff, new_cap_timeout);
+    NVME_CAP_SET_TO(cap, new_cap_timeout);
+    stq_le_p(&n->bar.cap, cap);
+
     n->page_bits = page_bits;
     n->page_size = page_size;
     n->max_prp_ents = n->page_size / sizeof(uint64_t);
@@ -6414,7 +6516,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_set_timestamp(n, 0ULL);
 
-    nvme_select_iocs(n);
+    nvme_ctrl_per_ns_action_on_start(n);
 
     return 0;
 }
@@ -6982,6 +7084,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
+    if (n->params.crwmt < NVME_DEFAULT_CRIMT) {
+        error_setg(errp, "crwmt must be greater than or equal to %d",
+                   NVME_DEFAULT_CRIMT);
+        return;
+    }
+
     if (!n->params.vsl) {
         error_setg(errp, "vsl must be non-zero");
         return;
@@ -7321,6 +7429,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    uint32_t crto = ldl_le_p(&n->bar.crto);
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
@@ -7402,18 +7511,25 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     NVME_CAP_SET_MQES(cap, 0x7ff);
     NVME_CAP_SET_CQR(cap, 1);
-    NVME_CAP_SET_TO(cap, 0xf);
+    /* NOTE: nvme_start_ctrl() may change CAP.TO if CC.CRIME is enabled. */
+    NVME_CAP_SET_TO(cap, n->params.crwmt > 0xff ? 0xff : n->params.crwmt);
     NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_NVM);
     NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_CSI_SUPP);
     NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(cap, 4);
     NVME_CAP_SET_CMBS(cap, n->params.cmb_size_mb ? 1 : 0);
     NVME_CAP_SET_PMRS(cap, n->pmr.dev ? 1 : 0);
+    /* We only support CRIMS if we do not have a subsys */
+    NVME_CAP_SET_CRMS(cap, n->subsys ? 0x1 : 0x3);
     stq_le_p(&n->bar.cap, cap);
 
     stl_le_p(&n->bar.vs, NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
 
+    NVME_CRTO_SET_CRIMT(crto, n->subsys ? 0 : NVME_DEFAULT_CRIMT);
+    NVME_CRTO_SET_CRWMT(crto, n->params.crwmt);
+    stl_le_p(&n->bar.crto, crto);
+
     if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
         stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
     }
@@ -7547,6 +7663,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
     DEFINE_PROP_UINT32("max_ioqpairs", NvmeCtrl, params.max_ioqpairs, 64),
     DEFINE_PROP_UINT16("msix_qsize", NvmeCtrl, params.msix_qsize, 65),
+    DEFINE_PROP_UINT16("crwmt", NvmeCtrl, params.crwmt, NVME_DEFAULT_CRWMT),
     DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8bee3e8b3b..c1d70183c4 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -60,6 +60,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     static uint64_t ns_count;
     NvmeIdNs *id_ns = &ns->id_ns;
     NvmeIdNsNvm *id_ns_nvm = &ns->id_ns_nvm;
+    NvmeIdNsCsIndep *id_indep_ns = &ns->id_indep_ns;
     uint8_t ds;
     uint16_t ms;
     int i;
@@ -73,6 +74,8 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->nsfeat |= (0x4 | 0x10);
 
     if (ns->params.shared) {
+        id_indep_ns->nmic |= NVME_NMIC_NS_SHARED;
+        /* This field is a mirror of id_indep_ns->nmic */
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
 
@@ -502,6 +505,9 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         nvme_ns_init_zoned(ns);
     }
 
+    ns->ready_delay_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                         nvme_ns_ready_cb, ns);
+
     return 0;
 }
 
@@ -525,6 +531,7 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
         g_free(ns->zone_array);
         g_free(ns->zd_extensions);
     }
+    timer_free(ns->ready_delay_timer);
 }
 
 static void nvme_ns_unrealize(DeviceState *dev)
@@ -559,6 +566,11 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
             return;
         }
+        if (ns->params.ready_delay) {
+            error_setg(errp, "ready-delay requires that the nvme device is not "
+                       "linked to an nvme-subsys device");
+            return;
+        }
         ns->subsys = subsys;
     }
 
@@ -607,6 +619,11 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (ns->params.ready_delay >= n->params.crwmt) {
+        error_setg(errp, "ready_delay on namespace id '%d' has to be smaller "
+                   "than crwmt", nsid);
+        return;
+    }
     nvme_attach_ns(n, ns);
 }
 
@@ -643,6 +660,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zoned.zrwafg", NvmeNamespace, params.zrwafg, -1),
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
                      false),
+    DEFINE_PROP_UINT16("ready_delay", NvmeNamespace, params.ready_delay, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 5487e2db40..9d2f13dfdb 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -125,6 +125,8 @@ typedef struct NvmeNamespaceParams {
     uint32_t numzrwa;
     uint64_t zrwas;
     uint64_t zrwafg;
+
+    uint16_t ready_delay;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -134,6 +136,7 @@ typedef struct NvmeNamespace {
     int64_t      size;
     int64_t      moff;
     NvmeIdNs     id_ns;
+    NvmeIdNsCsIndep id_indep_ns;
     NvmeIdNsNvm  id_ns_nvm;
     NvmeLBAF     lbaf;
     unsigned int nlbaf;
@@ -143,6 +146,7 @@ typedef struct NvmeNamespace {
     uint16_t     status;
     int          attached;
     uint8_t      pif;
+    QEMUTimer    *ready_delay_timer;
 
     struct {
         uint16_t zrwas;
@@ -409,6 +413,7 @@ typedef struct NvmeParams {
     uint32_t num_queues; /* deprecated since 5.1 */
     uint32_t max_ioqpairs;
     uint16_t msix_qsize;
+    uint16_t crwmt;
     uint32_t cmb_size_mb;
     uint8_t  aerl;
     uint32_t aer_max_queued;
@@ -571,6 +576,7 @@ static inline NvmeSecCtrlEntry *nvme_sctrl_for_cntlid(NvmeCtrl *n,
     return NULL;
 }
 
+void nvme_ns_ready_cb(void *opaque);
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f489..321eda46cd 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -56,6 +56,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_cs_indep_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
 pci_nvme_identify_pri_ctrl_cap(uint16_t cntlid) "identify primary controller capabilities cntlid=%"PRIu16""
 pci_nvme_identify_sec_ctrl_list(uint16_t cntlid, uint8_t numcntl) "identify secondary controller list cntlid=%"PRIu16" numcntl=%"PRIu8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 351fd44ca8..a66edd402d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -20,7 +20,11 @@ typedef struct QEMU_PACKED NvmeBar {
     uint64_t    bpmbl;
     uint64_t    cmbmsc;
     uint32_t    cmbsts;
-    uint8_t     rsvd92[3492];
+    uint32_t    cmbebs;
+    uint32_t    cmbswtp;
+    uint32_t    nssd;
+    uint32_t    crto;
+    uint8_t     rsvd108[3476];
     uint32_t    pmrcap;
     uint32_t    pmrctl;
     uint32_t    pmrsts;
@@ -49,6 +53,10 @@ enum NvmeBarRegs {
     NVME_REG_BPMBL   = offsetof(NvmeBar, bpmbl),
     NVME_REG_CMBMSC  = offsetof(NvmeBar, cmbmsc),
     NVME_REG_CMBSTS  = offsetof(NvmeBar, cmbsts),
+    NVME_REG_CMBEBS  = offsetof(NvmeBar, cmbebs),
+    NVME_REG_CMBSWTP = offsetof(NvmeBar, cmbswtp),
+    NVME_REG_NSSD    = offsetof(NvmeBar, nssd),
+    NVME_REG_CRTO    = offsetof(NvmeBar, crto),
     NVME_REG_PMRCAP  = offsetof(NvmeBar, pmrcap),
     NVME_REG_PMRCTL  = offsetof(NvmeBar, pmrctl),
     NVME_REG_PMRSTS  = offsetof(NvmeBar, pmrsts),
@@ -70,6 +78,7 @@ enum NvmeCapShift {
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMRS_SHIFT     = 56,
     CAP_CMBS_SHIFT     = 57,
+    CAP_CRMS_SHIFT     = 59,
 };
 
 enum NvmeCapMask {
@@ -84,6 +93,7 @@ enum NvmeCapMask {
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMRS_MASK      = 0x1,
     CAP_CMBS_MASK      = 0x1,
+    CAP_CRMS_MASK      = 0x3,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -97,6 +107,7 @@ enum NvmeCapMask {
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
 #define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
 #define NVME_CAP_CMBS(cap)  (((cap) >> CAP_CMBS_SHIFT)   & CAP_CMBS_MASK)
+#define NVME_CAP_CRMS(cap)  (((cap) >> CAP_CRMS_SHIFT)   & CAP_CRMS_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
@@ -120,6 +131,8 @@ enum NvmeCapMask {
                                                            << CAP_PMRS_SHIFT)
 #define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMBS_MASK)  \
                                                            << CAP_CMBS_SHIFT)
+#define NVME_CAP_SET_CRMS(cap, val)   (cap |= (uint64_t)(val & CAP_CRMS_MASK)  \
+                                                           << CAP_CRMS_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
@@ -135,6 +148,7 @@ enum NvmeCcShift {
     CC_SHN_SHIFT    = 14,
     CC_IOSQES_SHIFT = 16,
     CC_IOCQES_SHIFT = 20,
+    CC_CRIME_SHIFT  = 24,
 };
 
 enum NvmeCcMask {
@@ -145,6 +159,7 @@ enum NvmeCcMask {
     CC_SHN_MASK     = 0x3,
     CC_IOSQES_MASK  = 0xf,
     CC_IOCQES_MASK  = 0xf,
+    CC_CRIME_MASK   = 0x1,
 };
 
 #define NVME_CC_EN(cc)     ((cc >> CC_EN_SHIFT)     & CC_EN_MASK)
@@ -154,6 +169,7 @@ enum NvmeCcMask {
 #define NVME_CC_SHN(cc)    ((cc >> CC_SHN_SHIFT)    & CC_SHN_MASK)
 #define NVME_CC_IOSQES(cc) ((cc >> CC_IOSQES_SHIFT) & CC_IOSQES_MASK)
 #define NVME_CC_IOCQES(cc) ((cc >> CC_IOCQES_SHIFT) & CC_IOCQES_MASK)
+#define NVME_CC_CRIME(cc)  ((cc >> CC_CRIME_SHIFT)  & CC_CRIME_MASK)
 
 enum NvmeCcCss {
     NVME_CC_CSS_NVM        = 0x0,
@@ -175,6 +191,8 @@ enum NvmeCcCss {
     (cc |= (uint32_t)((val) & CC_IOSQES_MASK) << CC_IOSQES_SHIFT)
 #define NVME_SET_CC_IOCQES(cc, val) \
     (cc |= (uint32_t)((val) & CC_IOCQES_MASK) << CC_IOCQES_SHIFT)
+#define NVME_SET_CC_CRIME(cc, val) \
+    (cc |= (uint32_t)((val) & CC_CRIME_MASK) << CC_CRIME_SHIFT)
 
 enum NvmeCstsShift {
     CSTS_RDY_SHIFT      = 0,
@@ -362,6 +380,26 @@ enum NvmeCmbstsMask {
 #define NVME_CMBSTS_SET_CBAI(cmbsts, val)  \
     (cmbsts |= (uint64_t)(val & CMBSTS_CBAI_MASK) << CMBSTS_CBAI_SHIFT)
 
+enum NvmeCrtoShift {
+    CRTO_CRWMT_SHIFT = 0,
+    CRTO_CRIMT_SHIFT = 16,
+};
+
+enum NvmeCrtoMask {
+    CRTO_CRWMT_MASK  = 0xffff,
+    CRTO_CRIMT_MASK  = 0xffff,
+};
+
+#define NVME_CRTO_CRWMT(crto)    \
+    ((crto >> CRTO_CRWMT_SHIFT)   & CRTO_CRWMT_MASK)
+#define NVME_CRTO_CRIMT(crto)    \
+    ((crto >> CRTO_CRIMT_SHIFT)   & CRTO_CRIMT_MASK)
+
+#define NVME_CRTO_SET_CRWMT(crto, val)   \
+    (crto |= (uint32_t)(val & CRTO_CRWMT_MASK) << CRTO_CRWMT_SHIFT)
+#define NVME_CRTO_SET_CRIMT(crto, val)   \
+    (crto |= (uint32_t)(val & CRTO_CRIMT_MASK) << CRTO_CRIMT_SHIFT)
+
 enum NvmePmrcapShift {
     PMRCAP_RDS_SHIFT      = 3,
     PMRCAP_WDS_SHIFT      = 4,
@@ -1035,6 +1073,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_CS_NS                 = 0x05,
     NVME_ID_CNS_CS_CTRL               = 0x06,
     NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
+    NVME_ID_CNS_CS_INDEPENDENT_NS     = 0x08,
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
@@ -1345,6 +1384,24 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint8_t     vs[3712];
 } NvmeIdNs;
 
+enum NvmeIdNsCsIndepNstat {
+    NVME_NSTAT_NRDY             = 1 << 0,
+};
+
+typedef struct QEMU_PACKED NvmeIdNsCsIndep {
+    uint8_t     nsfeat;
+    uint8_t     nmic;
+    uint8_t     rescap;
+    uint8_t     fpi;
+    uint32_t    anagrpid;
+    uint8_t     nsattr;
+    uint8_t     rsvd9;
+    uint16_t    nvmsetid;
+    uint16_t    endgid;
+    uint8_t     nstat;
+    uint8_t     rsvd15[4081];
+} NvmeIdNsCsIndep;
+
 #define NVME_ID_NS_NVM_ELBAF_PIF(elbaf) (((elbaf) >> 7) & 0x3)
 
 typedef struct QEMU_PACKED NvmeIdNsNvm {
@@ -1646,6 +1703,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsCsIndep) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
-- 
2.36.1


