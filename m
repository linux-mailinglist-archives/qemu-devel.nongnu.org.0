Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AE69CA68
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4pX-0001Mp-Rc; Mon, 20 Feb 2023 06:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pV-0001Lw-Ko; Mon, 20 Feb 2023 06:59:37 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pS-0006cT-KW; Mon, 20 Feb 2023 06:59:37 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4BA1C3200D61;
 Mon, 20 Feb 2023 06:59:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Feb 2023 06:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676894371; x=1676980771; bh=SX
 eeXDmtf04NMlUBVAXnx44vy9Z2TqQXa7RL1/obXn4=; b=g92Ubp615tuXrEPAIk
 nMBMR8JzanQ7gV07/1cuo3oppNt43IH7/JDxaB5UDynSPP+S8lwL63xUbrVs9z2P
 57Ggiiwr9fDGq3sNzG1xC/NJjo4naoWbyrNPcW4rgaD/9VdMihd+q8RMVCxzcZJj
 a3mqNS9Hmu1i0WPKHGPs+S8jmrPQC6pS67s8IRp8fXkUN/WMjD6/37iADPdNrljh
 OJGvmbbf1/gzNpGqDcDT7SUrWftG1kmVxn/y4LoHEUP+bahnnGIcgLtQc7b3nOpm
 eIsqPbr+UmmwtuyJf62J6fpbPjTARTwbk8PxfAyYbfHP65IiAXrTQ2bRWBQpZYiB
 RGAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676894371; x=1676980771; bh=SXeeXDmtf04NM
 lUBVAXnx44vy9Z2TqQXa7RL1/obXn4=; b=nBLxNbT4HqZQHFgPinGirvlBzOKVj
 7sl/WvyjXqjVj+MzTpwTf4OXVjMGRM+QytAyvT5vh/cPfCLr3HEptpWhwnN0BDRx
 kKejrtEm2XBWcymzAj5zBODJqosSHIkDxAmLPdbu9tWRqIEcxJcaXNoe7ScwHBYa
 zv+1QXoPgvPloFooztXn55r1hLN6NCbtApPob7fzN65+dV60RgJR5evHVjJf+Vda
 hZybBwVoYhz9olsPN/0VdXRG1z3Mweax0c8CAkpGrR92S37pVEpbvfKEt8X4kGO8
 yDy1hDlz5Rr6yM+2ipoFpjkkwmWn2vOR8NZtDuHebUvtEbzBtar0QZ4Ig==
X-ME-Sender: <xms:o2DzYxoRSNshfuh7u2soQJlSTRPYctkaUgo2ld_2Cuf2o3TOJr93Hw>
 <xme:o2DzYzrA-rT3-d-HYMKw5u2jGKZ6qKXD3KLIy_U_KEonkLyB09NYzDvViuZjA2lq0
 jspdj0bS7db4mkayA8>
X-ME-Received: <xmr:o2DzY-NMUNAOemjRzmvnyGVwe0DLqiC5uDb-COSE28qQ3O0cECpZslui2IYZ0gMz49kEpf6QdtSkDHs7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:o2DzY84abNcFVJW0A08pWi8RpvdTNPg61o1tMCy5jOgxduXnnUwvEg>
 <xmx:o2DzYw5CSG-5clHgTTKXMt2fXsdoLB56sIa1SH1BgOXOQsGKRrqDQQ>
 <xmx:o2DzY0hQ69YIrSRvtPwPtSssOGCDzT3sP8_HdAynPrvEi0swibGCuQ>
 <xmx:o2DzY9xzm5BRVvCTdXhIrZPiQWt0OtcKeuEMUnJcJ5IgNYe8QrOxfA>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 06:59:29 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Joel Granados <j.granados@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 1/5] hw/nvme: move adjustment of data_units{read,written}
Date: Mon, 20 Feb 2023 12:59:22 +0100
Message-Id: <20230220115926.54623-2-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220115926.54623-1-jwd@defmacro.it>
References: <20230220115926.54623-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=jwd@defmacro.it;
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

From: Joel Granados <j.granados@samsung.com>

In order to return the units_{read/written} required by the SMART log we
need to shift the number of bytes value by BDRV_SECTORS_BITS and multiply
by 1000. This is a prep patch that moves this adjustment to where the SMART
log is calculated in order to use the stats struct for calculating OCP
extended smart log values.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Joel Granados <j.granados@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f25cc2c235..99b92ff20b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4386,8 +4386,8 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
 {
     BlockAcctStats *s = blk_get_stats(ns->blkconf.blk);
 
-    stats->units_read += s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
-    stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
+    stats->units_read += s->nr_bytes[BLOCK_ACCT_READ];
+    stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE];
     stats->read_commands += s->nr_ops[BLOCK_ACCT_READ];
     stats->write_commands += s->nr_ops[BLOCK_ACCT_WRITE];
 }
@@ -4401,6 +4401,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     uint32_t trans_len;
     NvmeNamespace *ns;
     time_t current_ms;
+    uint64_t u_read, u_written;
 
     if (off >= sizeof(smart)) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -4427,10 +4428,11 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     trans_len = MIN(sizeof(smart) - off, buf_len);
     smart.critical_warning = n->smart_critical_warning;
 
-    smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
-                                                        1000));
-    smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
-                                                           1000));
+    u_read = DIV_ROUND_UP(stats.units_read >> BDRV_SECTOR_BITS, 1000);
+    u_written = DIV_ROUND_UP(stats.units_written >> BDRV_SECTOR_BITS, 1000);
+
+    smart.data_units_read[0] = cpu_to_le64(u_read);
+    smart.data_units_written[0] = cpu_to_le64(u_written);
     smart.host_read_commands[0] = cpu_to_le64(stats.read_commands);
     smart.host_write_commands[0] = cpu_to_le64(stats.write_commands);
 
-- 
2.39.2


