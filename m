Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56063149C2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:53:07 +0100 (CET)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Npa-0007PO-Jv
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUs-000538-MW; Tue, 09 Feb 2021 02:31:42 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUq-0005aC-QJ; Tue, 09 Feb 2021 02:31:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5ECA34A4;
 Tue,  9 Feb 2021 02:31:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3kdZKIEpIPK5s
 EscVXRmBytUnp76OqmdJpxleXWZVpk=; b=qlbNaT5z3PDhzBK8THw0rEzpo3lOK
 9nlxkBg6lnWrAKdMN2bv+FNHyquH3cEY6R6mXoD81U4Nc2nm8yBumLtU2wXQ7COK
 W3FzBkf3diF1/323GhhjgH2vFF7+eN5IOucfuggkyoUnZP87gfKe6s8Q+KS4YNbf
 FMGUt5Juv4LYaBREiAb2jL3LdpZjkCcVlvgntVfdGlca12BG2xKZ8LDIhc0v5C9t
 tGj4UPYGBgWMwNBTgNVTqhPaB2w18r6QzI+jAMXbcvE0wt5AzMYryr131h0b+SkI
 JftzPUHDaMzPG/+RV4DYcAv5pQvzIu624UD2Y87zXK50JoD7wa3gjQvPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3kdZKIEpIPK5sEscVXRmBytUnp76OqmdJpxleXWZVpk=; b=IjjPF9lK
 mQndv5X4GppyNkCj+4Mz0OV71rDn8oh9v1GRFelrZApK61ybH+9llPsVtEiJV2wQ
 ArhXpQBF3EsWH/qTc+YHsauP4/LJuaqz4ydy+Hih64zN9VGcpRuYwNup2udtoPaL
 2nbF6dp0f5qlMMJ15SaAYDo1tJm/2VOWmBP+5JkcJlZCw/q9XW9JvPovkrEAwmeD
 7NmRg6aCi+b8HB/OFgpMVAwRcOJhzTDc/irr91Sg1RRaWUdPrJw9FEQksNXuKxX4
 KHyHeI5kxIc1RF7NamApFxSjhtrss+ZuzoW7EK0Z5McEf/sN7ti4a70ZFiUaMEHS
 R8Lpa/HWSTuhDw==
X-ME-Sender: <xms:WToiYLyNzYYJ4-P19FjxsGDJ-DueKD9gS287wGUtampnoGRHj0DlUQ>
 <xme:WToiYDRdIgxO91xU4M5jDuf0lWSkCBhqvIkfhiMmfK9EESztTeuCcOnYiwf6apxNS
 xFEUQqCJjBDjpbWrPk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WToiYFW_rgUFRv6vJkMI3geZmgec1OvZUij_9HkpjUGYgaAeTpKW9g>
 <xmx:WToiYFhBjcjjZ-P0QFmunGMqOvwgzEY2FwHGf-f47te1IyUTgjjC_g>
 <xmx:WToiYNCmPRZQkFQb79ycpGRBOeJtdFwIkb5_MEIhbdQMZ4iWBW8ukA>
 <xmx:WjoiYBtoVb-Fg1yED6NMgHbCj8xtwwwMCHgVndB7NTr-OkOTbPWQm7yBHWA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6EA18108005C;
 Tue,  9 Feb 2021 02:31:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/56] hw/block/nvme: Combine nvme_write_zeroes() and
 nvme_write()
Date: Tue,  9 Feb 2021 08:30:16 +0100
Message-Id: <20210209073101.548811-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Move write processing to nvme_do_write() that now handles both WRITE
and WRITE ZEROES. Both nvme_write() and nvme_write_zeroes() become
inline helper functions.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 78 ++++++++++++++++++++-----------------------
 hw/block/trace-events |  1 -
 2 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 905fd1ba93f5..4d1ca8c466c5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1231,32 +1231,7 @@ invalid:
     return status | NVME_DNR;
 }
 
-static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
-{
-    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    NvmeNamespace *ns = req->ns;
-    uint64_t slba = le64_to_cpu(rw->slba);
-    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
-    uint64_t offset = nvme_l2b(ns, slba);
-    uint32_t count = nvme_l2b(ns, nlb);
-    uint16_t status;
-
-    trace_pci_nvme_write_zeroes(nvme_cid(req), nvme_nsid(ns), slba, nlb);
-
-    status = nvme_check_bounds(ns, slba, nlb);
-    if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
-        return status;
-    }
-
-    block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
-                     BLOCK_ACCT_WRITE);
-    req->aiocb = blk_aio_pwrite_zeroes(req->ns->blkconf.blk, offset, count,
-                                       BDRV_REQ_MAY_UNMAP, nvme_rw_cb, req);
-    return NVME_NO_COMPLETE;
-}
-
-static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool wrz)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -1270,10 +1245,12 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
                          nvme_nsid(ns), nlb, data_size, slba);
 
-    status = nvme_check_mdts(n, data_size);
-    if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
-        goto invalid;
+    if (!wrz) {
+        status = nvme_check_mdts(n, data_size);
+        if (status) {
+            trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
+            goto invalid;
+        }
     }
 
     status = nvme_check_bounds(ns, slba, nlb);
@@ -1282,21 +1259,28 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    status = nvme_map_dptr(n, data_size, req);
-    if (status) {
-        goto invalid;
-    }
-
     data_offset = nvme_l2b(ns, slba);
 
-    block_acct_start(blk_get_stats(blk), &req->acct, data_size,
-                     BLOCK_ACCT_WRITE);
-    if (req->qsg.sg) {
-        req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
-                                   BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+    if (!wrz) {
+        status = nvme_map_dptr(n, data_size, req);
+        if (status) {
+            goto invalid;
+        }
+
+        block_acct_start(blk_get_stats(blk), &req->acct, data_size,
+                         BLOCK_ACCT_WRITE);
+        if (req->qsg.sg) {
+            req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
+                                       BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+        } else {
+            req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
+                                         nvme_rw_cb, req);
+        }
     } else {
-        req->aiocb = blk_aio_pwritev(blk, data_offset, &req->iov, 0,
-                                     nvme_rw_cb, req);
+        block_acct_start(blk_get_stats(blk), &req->acct, 0, BLOCK_ACCT_WRITE);
+        req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
+                                           BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
+                                           req);
     }
     return NVME_NO_COMPLETE;
 
@@ -1305,6 +1289,16 @@ invalid:
     return status | NVME_DNR;
 }
 
+static inline uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
+{
+    return nvme_do_write(n, req, false);
+}
+
+static inline uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
+{
+    return nvme_do_write(n, req, true);
+}
+
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index ec1b43220eff..60262b03c901 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -43,7 +43,6 @@ pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opna
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
-- 
2.30.0


