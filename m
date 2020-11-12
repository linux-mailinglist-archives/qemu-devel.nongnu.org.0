Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16A2B0ED7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:11:04 +0100 (CET)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdIvs-0007Dq-TT
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl9-0003EL-7M; Thu, 12 Nov 2020 14:59:55 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl6-00078K-0B; Thu, 12 Nov 2020 14:59:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B5A25C017E;
 Thu, 12 Nov 2020 14:59:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QJu9EZgITufLl
 IAGc3RPGhI8adKjYXythScJdM//N6U=; b=HDNCeo2c+ZEqs3D9vwJVo5dpgn/TB
 sUGlPS+TJqx6UX7UKax/4EskAfLCnNXIOEuFpmJnX2GWPLBnLyOGYdur+FGghJVe
 kvqONYFrecYOiLh/zY+lKvPX6fCFWuMpDrj4I+dddKOVgPtWSPafx2Kh+brWWjrS
 O7K1Xl37iXEusUYql7lYSatHPQ+JhKbsTBVHIpweHs0OsINO51qt/BVqlPfzx+Px
 QJ3SrwxFaq4Tevmt8xUpnWNpPlv5yp4VbDJzGJOdhm0V1PNiiKeWIxQf3HTK0rDK
 soM86N5x3SbsoCXdgTgGRKRo6C34DQW02GGBp2f8eKQPqdMV4geU3y9fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QJu9EZgITufLlIAGc3RPGhI8adKjYXythScJdM//N6U=; b=GPasLE+G
 de+VjkLMytzu64ed6TYABkvQT1MxPI3FWw+tjVuGFy9TJv8VEWwcTNKYAfVEODEB
 fZoPwzE4R97/Tcc6asJetqgEWCBduSf2nQclSG6mX5AjMBu5dDA+DcQ6bHJ8Yfky
 lLEwztxErTbBhxuhcEiNHFHXRDLPwS3kRlZbGdKb3y2+wegcoKK7PlQ2B66UcmBg
 TVe9/QjbZtkaDcUg3j+OJoGlWns6WzvGq6ipMly0WZN9hsuxfZkbx3U5lT6kkjAB
 zw0pfSucwFQHULDjAIjhYPaHOnIdLfpbON89k3WrCuBl6UsbDn8C3LmecGjPVY9B
 +BD6rDHp7qhEqw==
X-ME-Sender: <xms:NZStX-3O1xDksaHFU6OBzFk-AYJCZoa7zWCZCq0F9huraWLw5YfFDQ>
 <xme:NZStXxElPqBF5oSHMbICnjxB5i5-rJvdCUCMWPzIztq90rAsYjFX_30b8AWQfPMYs
 yz244AKxphvu5S9DYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NZStX25mz_APvuezdvQeYAyJ1q76TJ5gHhNJ-EQ06PpXSrf1X5Opyw>
 <xmx:NZStX_3coPTO84OEHwm7640pzoon5QcsMZLJALh6Vr2VOTLfG8RX9A>
 <xmx:NZStXxEqiQrB8Av1vY5HD5LqDuNY87x_elhGFAAeNNP90UVpF7gEUg>
 <xmx:NpStX6NNRy9G8N34ueerrX4yf5Nnux2bWtppVehe-WVuXU2o1ZQcRA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA25330689E3;
 Thu, 12 Nov 2020 14:59:48 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/5] hw/block/nvme: pull aio error handling
Date: Thu, 12 Nov 2020 20:59:42 +0100
Message-Id: <20201112195945.819915-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112195945.819915-1-its@irrelevant.dk>
References: <20201112195945.819915-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
index 51f35e8cf18b..a96a996ddc0d 100644
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
2.29.2


