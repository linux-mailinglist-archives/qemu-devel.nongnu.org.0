Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D5314992
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:38:02 +0100 (CET)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Naz-0007Sl-DG
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUf-0004o1-UR; Tue, 09 Feb 2021 02:31:29 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUc-0005RS-ND; Tue, 09 Feb 2021 02:31:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 829EAAF3;
 Tue,  9 Feb 2021 02:31:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=q6Py2zIPiYf3L
 nGGnIkgfb4PY6EEtZny6jZYYq4PzX8=; b=AO2MCyC9qKeijHaKqe2HSR571cURz
 jo/fcp3owbnEbdhUY32w74+0G9UjEFO3xHM6NSCs4/xQn2+k0eAJsjbRfxHxXCM+
 R42WmSmjZFbYSLZu5rRiX7p7+86y3xKzEOPL9wP2Btk0po3dN3tVsb2a7fJ+MhNm
 OaW2Y7a8Jd77EKu/Ak+8Idf3ReYpGV6gFlFJR+Xm3Dgnif8YhP1wjSmsFKXZKnfK
 v52Y3VPfkGAgJ56919s8ZriXOqvkWlZ+i6XKQyWpgQfoflnfsROb4o4PVEUQLY0+
 mnsWUP5fwdHiwteIXy4mioUwfIor9M7Eln/zoSBF/LXM5SJ+/wAMh5K2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=q6Py2zIPiYf3LnGGnIkgfb4PY6EEtZny6jZYYq4PzX8=; b=tpl6Au5L
 S3/B3Boihm4mu3Y48+mvWstU+xZrRaOErpny17+shoyVf58sls9QRPKVITlgRAq1
 SK1SMNixdP/6ir1R9Qy7iqc1AKQdTjmLG295jXyKRwjzYJYZOhR5EadaqcW3IuqE
 fn/HdXQmAuTxgM+4oSZZBAh4gcCFIP+qCtAYNMQJIAhqydNfwkLkjdvYXmFhFG63
 EbaqMPk+INawuUuMTFuhb69k6M7n3Cecp9J0QRyDJEIXcW6ZGW4IKoLPKesp1O0o
 YAl0XW9kT747FwWI3IXPIaXJseDNK6AM/nVpONxomJyTAhGxwnHS+x/89UMCa7Nr
 LRPR2kvcjvXXFw==
X-ME-Sender: <xms:SzoiYC7cnWkPC5MhBK_8VcyqPzkMgjnZPRMO4Pjd6strqlxR0HXG-w>
 <xme:SzoiYL4vZvJ_X5gzjmRk6pW57gTzlq1jdMAo_XoLqNwSNVWnYfiuVCqF6esbqUE5f
 pE6nXUcMMblNyy1hE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SzoiYBdg78JY2fK__XpU-nkV_ivX_jaNsWvA6rcdz2JitEr7U3CE7Q>
 <xmx:SzoiYPL_V9ye-V9fDhV70qnBHOhjO_5Vhw4AsiDvZcW1l46mrnRTUQ>
 <xmx:SzoiYGIqx-xyuK4HjWWDRAGkGuPNEY-Cm6TdVhGAADKRV8WB342DUg>
 <xmx:SzoiYHol0yykTp2CjivmACTLgc0GnKZTkJdHbc8KqDUkybckSbkS0g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A525108005C;
 Tue,  9 Feb 2021 02:31:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/56] hw/block/nvme: pull aio error handling
Date: Tue,  9 Feb 2021 08:30:07 +0100
Message-Id: <20210209073101.548811-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a new function, nvme_aio_err, to handle errors resulting from AIOs
and use this from the callbacks.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 61 +++++++++++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b0816d19eff4..a245ff8ceb2c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -878,6 +878,41 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
+static void nvme_aio_err(NvmeRequest *req, int ret)
+{
+    uint16_t status = NVME_SUCCESS;
+    Error *local_err = NULL;
+
+    switch (req->cmd.opcode) {
+    case NVME_CMD_READ:
+        status = NVME_UNRECOVERED_READ;
+        break;
+    case NVME_CMD_FLUSH:
+    case NVME_CMD_WRITE:
+    case NVME_CMD_WRITE_ZEROES:
+        status = NVME_WRITE_FAULT;
+        break;
+    default:
+        status = NVME_INTERNAL_DEV_ERROR;
+        break;
+    }
+
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+
+    error_setg_errno(&local_err, -ret, "aio failed");
+    error_report_err(local_err);
+
+    /*
+     * Set the command status code to the first encountered error but allow a
+     * subsequent Internal Device Error to trump it.
+     */
+    if (req->status && status != NVME_INTERNAL_DEV_ERROR) {
+        return;
+    }
+
+    req->status = status;
+}
+
 static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -887,37 +922,13 @@ static void nvme_rw_cb(void *opaque, int ret)
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
 
-    Error *local_err = NULL;
-
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
     if (!ret) {
         block_acct_done(stats, acct);
     } else {
-        uint16_t status;
-
         block_acct_failed(stats, acct);
-
-        switch (req->cmd.opcode) {
-        case NVME_CMD_READ:
-            status = NVME_UNRECOVERED_READ;
-            break;
-        case NVME_CMD_FLUSH:
-        case NVME_CMD_WRITE:
-        case NVME_CMD_WRITE_ZEROES:
-            status = NVME_WRITE_FAULT;
-            break;
-        default:
-            status = NVME_INTERNAL_DEV_ERROR;
-            break;
-        }
-
-        trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
-
-        error_setg_errno(&local_err, -ret, "aio failed");
-        error_report_err(local_err);
-
-        req->status = status;
+        nvme_aio_err(req, ret);
     }
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
-- 
2.30.0


