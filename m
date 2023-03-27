Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE66CAB94
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:10:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqMD-0004Vm-Aj; Mon, 27 Mar 2023 13:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pgqM8-0004HO-Oo; Mon, 27 Mar 2023 13:10:04 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pgqM6-0006AD-2h; Mon, 27 Mar 2023 13:10:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D288F3200962;
 Mon, 27 Mar 2023 13:09:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 27 Mar 2023 13:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679936992; x=
 1680023392; bh=n9EMuCZUvddA5ijQhLo6fWaML1e5fxQxsMeb/Uz/2a0=; b=D
 pJwDnunpgIYIutiw+jCElbI6XrLJlukdbuFJ+HbwLjvSChBsEOQAnzyAcrRicSpS
 aqANOkT5fbTrWAaZis/HT/A+efEH87VA1Ovh+zDHSk1wocHDoctAWEffi0YwPyi9
 syvmrhqvThWS1ZYQZVjU/3jMTr2sc52I1XF3tvAnIyb91LIL3elIpak1ffojgb+n
 PVeY12pPFDSSZ/kR/yMzJpoKyYaLVqe1B4ShevKj9aw5bOgAU0WjyMMkavzwzNQj
 04MYrtPKJhqAJEe0EANg+i+HnPSYdr38AqWTrCR93mCJtSv+gLYClc6nVFaEP85o
 kVwefz3Y9V/9wWJlPm3TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679936992; x=
 1680023392; bh=n9EMuCZUvddA5ijQhLo6fWaML1e5fxQxsMeb/Uz/2a0=; b=K
 Vj+0w+y4RMzC+a/m6m2FQHOJGXTIIYeFex4fxlemgx/rc9W9Jk/DtGHW21DRmE6L
 ub0Mg5lqtzIJ/q1KfPABSoqcbJeSVsclP70bAZAXkMwRaymKTvqGp2XtAdhelwGr
 ZCNuNoXPOLD8Doaw/EMf0zVkKbT+SkVS3se5/PF8hRDFajGU3163H/nVDJL+/0sg
 U2+nOcRrhIW94EJzbHHqVzo/vbOtVZfuucB89HbrqBA+NqZve4sPdoPkJBpk4dFb
 3FMGGR46WQU8UE4mA8gmbL0u7Q6IZkQqpOgVS72itV0tFz1nkNOu+SpqA2hHqldx
 vI1fuJkLhzg8tOp9bL8Ng==
X-ME-Sender: <xms:4M0hZJn-7zMJnlPJnT5YyPIhIG9usmSZPafdLWydL5UyIUSHsJZ3Pg>
 <xme:4M0hZE357maP7PVYghRikIhGtnzl5Gx5HAWOVeX0kFfBHLu-Pat-r8PLIOJ4DZAnq
 kXSrhpEbGIS131BW4M>
X-ME-Received: <xmr:4M0hZPqrFxhlehHyKFtmLT7Ci1FMId14QbhcyHbSOMa3i_CuVZd_7OrshpXE9pPKYIyopGg0xTfTiCaxvLRTOCyUz3IGZ2cH-WNF0Y8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4M0hZJlB8iFeo8t8ZyW4XxXBznLZ1jgMdgb_PAYCfJsoOcU0aj1ORA>
 <xmx:4M0hZH0oZX56auyKd4FXsG9yFvl0HmxXsG2d4HoMIWHoTkqp27wVlg>
 <xmx:4M0hZIsnle0wgcqGPnJv2kmr97Kk3iyrBq88H3MlM5u1Cg3lY4-8Ng>
 <xmx:4M0hZAvUCqvtLCEQ1bRJTyf_P0MNpyj4gL696qaGMCu8k_324-O0iw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 13:09:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 1/2] hw/nvme: Change alignment in dma functions for nvme_blk_*
Date: Mon, 27 Mar 2023 19:09:43 +0200
Message-Id: <20230327170944.57033-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327170944.57033-1-its@irrelevant.dk>
References: <20230327170944.57033-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565; i=k.jensen@samsung.com;
 h=from:subject; bh=FNHm5ygTWl7roULyfesngA85WKNqKJYJ9K/4SqgqgLg=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQhzdcDsRDwrNCIOJaw40ylHUnl7CzBzGA32
 xdBrkncO0eYkokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkIc3XAAoJEE3hrzFt
 Tw3pLnIH/iyPZhQ+jnAeUDIfrEaGOlICnUJQmVSQJr+rdxoolTAu9a8GT9B8hHCX+YLG29XVqwy
 Sy5ZYZfc63UujGPdAsyM44MQNyaWX3fAHdlrljRtg7hNcKZ3EO8oaNrM4DMpcPpIDBd8uoKe5gR
 lbhiBFUTzNgIRzgQFby1YSQnFTCMaeXYF3NbijV+yzw8u2TvyvOG5sS+f5ez+NbMqEcm2IPQ30K
 GEPNLTdCgOA7o9QamUrCzN5j9PtgX5YGFvaKUBratmjHQSBcW8rOHXNFD1r6Io1PBwLweBvmJeg
 ERuwoKzmEwqiv4j9N7MCvIOSQv6oaxNkriZpFYEVYpEQxrHu8PH3t6EY
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>

Since the nvme_blk_read/write are used by both the data and metadata
portions of the IO, it can't have the 512B alignment requirement.
Without this change any metadata transfer, which length isn't a multiple
of 512B and which is bigger than 512B, will result in only a partial
transfer.

Signed-off-by: Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 49c1210fce2b..291009545f03 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1434,26 +1434,26 @@ uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
 }
 
 static inline void nvme_blk_read(BlockBackend *blk, int64_t offset,
-                                 BlockCompletionFunc *cb, NvmeRequest *req)
+                                 uint32_t align, BlockCompletionFunc *cb,
+                                 NvmeRequest *req)
 {
     assert(req->sg.flags & NVME_SG_ALLOC);
 
     if (req->sg.flags & NVME_SG_DMA) {
-        req->aiocb = dma_blk_read(blk, &req->sg.qsg, offset, BDRV_SECTOR_SIZE,
-                                  cb, req);
+        req->aiocb = dma_blk_read(blk, &req->sg.qsg, offset, align, cb, req);
     } else {
         req->aiocb = blk_aio_preadv(blk, offset, &req->sg.iov, 0, cb, req);
     }
 }
 
 static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
-                                  BlockCompletionFunc *cb, NvmeRequest *req)
+                                  uint32_t align, BlockCompletionFunc *cb,
+                                  NvmeRequest *req)
 {
     assert(req->sg.flags & NVME_SG_ALLOC);
 
     if (req->sg.flags & NVME_SG_DMA) {
-        req->aiocb = dma_blk_write(blk, &req->sg.qsg, offset, BDRV_SECTOR_SIZE,
-                                   cb, req);
+        req->aiocb = dma_blk_write(blk, &req->sg.qsg, offset, align, cb, req);
     } else {
         req->aiocb = blk_aio_pwritev(blk, offset, &req->sg.iov, 0, cb, req);
     }
@@ -2207,10 +2207,10 @@ static void nvme_rw_cb(void *opaque, int ret)
             }
 
             if (req->cmd.opcode == NVME_CMD_READ) {
-                return nvme_blk_read(blk, offset, nvme_rw_complete_cb, req);
+                return nvme_blk_read(blk, offset, 1, nvme_rw_complete_cb, req);
             }
 
-            return nvme_blk_write(blk, offset, nvme_rw_complete_cb, req);
+            return nvme_blk_write(blk, offset, 1, nvme_rw_complete_cb, req);
         }
     }
 
@@ -3437,7 +3437,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                      BLOCK_ACCT_READ);
-    nvme_blk_read(blk, data_offset, nvme_rw_cb, req);
+    nvme_blk_read(blk, data_offset, BDRV_SECTOR_SIZE, nvme_rw_cb, req);
     return NVME_NO_COMPLETE;
 
 invalid:
@@ -3607,7 +3607,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
         block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                          BLOCK_ACCT_WRITE);
-        nvme_blk_write(blk, data_offset, nvme_rw_cb, req);
+        nvme_blk_write(blk, data_offset, BDRV_SECTOR_SIZE, nvme_rw_cb, req);
     } else {
         req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
-- 
2.39.2


