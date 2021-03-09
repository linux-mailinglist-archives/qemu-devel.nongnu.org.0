Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC43325D6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:53:04 +0100 (CET)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbrC-0001oo-Ts
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap8-0000mF-7i; Tue, 09 Mar 2021 06:46:50 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap4-0000r0-Qh; Tue, 09 Mar 2021 06:46:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 82901F7B;
 Tue,  9 Mar 2021 06:46:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=IQBwW3W5s2ahL
 1ydUgE8szTO73LmasHTgBmZ2lmD9so=; b=e5L0zR+qKCqq/SqRpaMg+b/eOSBGD
 51gUpcyzshIhGKlKmqjNWskci9Aj98oYwb78Annyb9fUJ/JMnFGadqy953aYeTp9
 BEjVTQ3THAa5dSuaPsaFAEU/8RVxoObRFilu/8MC4x/6zg0etBu3ABcBcNfvZITj
 GQ3PQhutGI1N6c01kuK4oWaQl8B6dl4QgTKIE3fDiQcs3U4ZlPuWbnzcFFD36p4x
 SYOFPCPOWCnxn/pWZ6/NJd0CiK1m9lUxK94Wpv2YLsXVRbwTB1V4gFsZU7Nm0geO
 5Wt8QT5hBXGRrslfuoAosk5IWv7pEVaht7RZxsnx7r96X2X+JG92MhjtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=IQBwW3W5s2ahL1ydUgE8szTO73LmasHTgBmZ2lmD9so=; b=DNHSQPru
 nO2aEr06XBMkWIh3xzX76eIkA7XqHWObmiS9Va39/rIxDXI/miyNSuzk1Af5Xhe2
 4kORCAmIpLijUwXkFRcuzRujsc8/eKk6DfDXd9T/iCd3oO7lnQGVwzYHhYVzIe60
 1684jcuvkvO5V9UqcuSmHtFLT3Ak5NzklAjuHdY5QuQ4bKcUA1iphCwduJB8pzNa
 Cu1pMInzhiXtII4PVaJErt9dHD2u9cnDIg0TuLChzHYIQav6Jp07yBaRfycpNzcJ
 6jOE7NLoi+OCYA+FvBtwET7MyQRjIKO55e1Xy81cuQi+hvnlBfqLi+n1Cf6RyKMl
 wMTv8I5+ptRyNw==
X-ME-Sender: <xms:BmBHYFWaXmK0r8FUIjYMGZAsXof52wxRPcgWmUxW6xhpytwl5C3FYA>
 <xme:BmBHYFkwQiXxpZhG-63L9-LfsgOm3hMjCoVNndh0lzWY0FNkqVpIuKNPzQc_w7ogf
 wV36OTv4X2q3f5MTsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BmBHYBbkCgwmBnJzjV0HgDyDohb6L00JU7UD9sVdgkFLkQ9y8w7xUg>
 <xmx:BmBHYIVNuoYhQDzGFxM8qQTYAOgRhq1JVKXyT_PpVCFNbWpp_YrxDw>
 <xmx:BmBHYPlD2McLDFou4J5Nrcp3sWkG9MuG9ruUuo8PiBDav5D6BbXE8Q>
 <xmx:BmBHYB7-MvYEEM20MSFUWtFYN5ofoCMTSf7JRYAIf4jSF56Dl9Z_KDt2Lvw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA4E124005A;
 Tue,  9 Mar 2021 06:46:12 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 37/38] hw/block/nvme: support changed namespace asynchronous
 event
Date: Tue,  9 Mar 2021 12:45:11 +0100
Message-Id: <20210309114512.536489-38-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

If namespace inventory is changed due to some reasons (e.g., namespace
attachment/detachment), controller can send out event notifier to the
host to manage namespaces.

This patch sends out the AEN to the host after either attach or detach
namespaces from controllers.  To support clear of the event from the
controller, this patch also implemented Get Log Page command for Changed
Namespace List log type.  To return namespace id list through the
command, when namespace inventory is updated, id is added to the
per-controller list (changed_ns_list).

To indicate the support of this async event, this patch set
OAES(Optional Asynchronous Events Supported) in Identify Controller data
structure.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h   |  1 +
 hw/block/nvme.h      |  4 ++++
 include/block/nvme.h |  7 ++++++
 hw/block/nvme.c      | 56 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index b0c00e115d81..318d3aebe1a8 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -53,6 +53,7 @@ typedef struct NvmeNamespace {
     uint8_t      csi;
 
     NvmeSubsystem   *subsys;
+    QTAILQ_ENTRY(NvmeNamespace) entry;
 
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 1287bc2cd17a..4955d649c7d4 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -192,6 +192,10 @@ typedef struct NvmeCtrl {
 
     uint32_t    dmrsl;
 
+    /* Namespace ID is started with 1 so bitmap should be 1-based */
+#define NVME_CHANGED_NSID_SIZE  (NVME_MAX_NAMESPACES + 1)
+    DECLARE_BITMAP(changed_nsids, NVME_CHANGED_NSID_SIZE);
+
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 03471a4d5abd..7ee887022aef 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -760,6 +760,7 @@ typedef struct QEMU_PACKED NvmeCopySourceRange {
 enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_ERROR                     = 0,
     NVME_AER_TYPE_SMART                     = 1,
+    NVME_AER_TYPE_NOTICE                    = 2,
     NVME_AER_TYPE_IO_SPECIFIC               = 6,
     NVME_AER_TYPE_VENDOR_SPECIFIC           = 7,
     NVME_AER_INFO_ERR_INVALID_DB_REGISTER   = 0,
@@ -771,6 +772,7 @@ enum NvmeAsyncEventRequest {
     NVME_AER_INFO_SMART_RELIABILITY         = 0,
     NVME_AER_INFO_SMART_TEMP_THRESH         = 1,
     NVME_AER_INFO_SMART_SPARE_THRESH        = 2,
+    NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED    = 0,
 };
 
 typedef struct QEMU_PACKED NvmeAerResult {
@@ -940,6 +942,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_ERROR_INFO     = 0x01,
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
+    NVME_LOG_CHANGED_NSLIST = 0x04,
     NVME_LOG_CMD_EFFECTS    = 0x05,
 };
 
@@ -1056,6 +1059,10 @@ typedef struct NvmeIdCtrlNvm {
     uint8_t     rsvd16[4080];
 } NvmeIdCtrlNvm;
 
+enum NvmeIdCtrlOaes {
+    NVME_OAES_NS_ATTR   = 1 << 8,
+};
+
 enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 86fbab1fc43c..cf0bb508aa80 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3015,6 +3015,48 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
 
+static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+                                    uint64_t off, NvmeRequest *req)
+{
+    uint32_t nslist[1024];
+    uint32_t trans_len;
+    int i = 0;
+    uint32_t nsid;
+
+    memset(nslist, 0x0, sizeof(nslist));
+    trans_len = MIN(sizeof(nslist) - off, buf_len);
+
+    while ((nsid = find_first_bit(n->changed_nsids, NVME_CHANGED_NSID_SIZE)) !=
+            NVME_CHANGED_NSID_SIZE) {
+        /*
+         * If more than 1024 namespaces, the first entry in the log page should
+         * be set to 0xffffffff and the others to 0 as spec.
+         */
+        if (i == ARRAY_SIZE(nslist)) {
+            memset(nslist, 0x0, sizeof(nslist));
+            nslist[0] = 0xffffffff;
+            break;
+        }
+
+        nslist[i++] = nsid;
+        clear_bit(nsid, n->changed_nsids);
+    }
+
+    /*
+     * Remove all the remaining list entries in case returns directly due to
+     * more than 1024 namespaces.
+     */
+    if (nslist[0] == 0xffffffff) {
+        bitmap_zero(n->changed_nsids, NVME_CHANGED_NSID_SIZE);
+    }
+
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
+    }
+
+    return nvme_c2h(n, ((uint8_t *)nslist) + off, trans_len, req);
+}
+
 static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
                                  uint64_t off, NvmeRequest *req)
 {
@@ -3098,6 +3140,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
+    case NVME_LOG_CHANGED_NSLIST:
+        return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
     default:
@@ -3956,6 +4000,16 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 
             nvme_ns_detach(ctrl, ns);
         }
+
+        /*
+         * Add namespace id to the changed namespace id list for event clearing
+         * via Get Log Page command.
+         */
+        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
+            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                               NVME_LOG_CHANGED_NSLIST);
+        }
     }
 
     return NVME_SUCCESS;
@@ -4954,6 +5008,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->cntlid = cpu_to_le16(n->cntlid);
 
+    id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
+
     id->rab = 6;
 
     if (n->params.use_intel_id) {
-- 
2.30.1


