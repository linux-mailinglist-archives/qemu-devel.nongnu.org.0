Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8E69AB07
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzWs-0005DU-EK; Fri, 17 Feb 2023 07:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWp-0005BU-Dw; Fri, 17 Feb 2023 07:07:51 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWn-0003Pv-S0; Fri, 17 Feb 2023 07:07:51 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2028F5C0129;
 Fri, 17 Feb 2023 07:07:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 17 Feb 2023 07:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676635669; x=1676722069; bh=yN
 qkIi9DTxLm3SgOgUDJlmyKa+80oFSROj6j8Gdhsfo=; b=NL5hE+cP6j0ka1K4cd
 sr3iKY7YTEyBOD+V/NLYbaTTI4JR0y/Mb4weRm9YpHeQGs0w70u3ctlaJp5mlfl0
 qPBrdZi3OgwuGFezupdD/A1DVKZy+cOGnnyn+5/R0P0TvuE9/8TQxPTOm2cH5tgx
 8VZkVLErHWhl/TqznQfVQeefAL5sZCG6SSWIFKfyLCIrkxjz1Xn6mwAEayOyJvsL
 5aqLTOKWYF+HWEUXZhoni3TbkvMrPczrAXvxfVvhu1KcjBRH+ZIRM7Y53nvC4ajx
 pKb++pZblk+SH7oFCEJMd23zSlHmsABvbfaN73r4O75pIZuLrcUmP9F7yXORzqMS
 +/qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676635669; x=1676722069; bh=yNqkIi9DTxLm3
 SgOgUDJlmyKa+80oFSROj6j8Gdhsfo=; b=iA2G2mqJFExJ9Fd1gPW78Zc+MTQug
 TReKcGwKG7VHFNo5umXixID92cqZLpEdMiHYTJ9dt5DBKZ9ZzLb8r0Nkul/PJLfU
 bkg8cN4m1zOYQzIKOgN5xh8Ux10GbyqEZELlHXBb8x5zRlyy10rCpJk9QjE2ZDMw
 Mjx2aFAJ94p5/16liEYtUgBP9C+HTDNmTOanA8l3aODtGROk1/Ox2wh98enijXnK
 agpbuEJpsD62+sYorHvf3Giqw/wRJXfMfYFamQJ8Liv1h7tcaZFVzmQSIREKQdWr
 5MFk3YtKIL1/9FhSMhENXrye+LrkeK518dXKhX1A+mPFRf5BE+oyDVEYw==
X-ME-Sender: <xms:FG7vYzCS8goZ01143xikil5Q-FK1HlXQSytkMKa7SuYxeTY032y0SQ>
 <xme:FG7vY5h61UQUVpIC6rgPNcjVzcgAMgEathSJdrC78Nw8FJzHDH736NVUBU7qt9TPb
 8QBVTpMNfZGC3gaKY0>
X-ME-Received: <xmr:FG7vY-kaiuYyKgjfGyHeAxn9Eag01cv0gJDCzlNUnT--sbXJZj8slmhSEt_-H13fDLpu69H5mV4jbjvu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:FG7vY1w3ql51U8SJcvf5QtwFRj_CIGvAQOzrvFZjqDkk2_ZvIBvfuw>
 <xmx:FG7vY4T-SUlgXd8PXQxrIRdR9hvdq99-iLanBgwGL1hk2G2sqtrRnQ>
 <xmx:FG7vY4aSwklA_ghY06qgQwOBie7tm6OXS2d-zGYbxhLXqtmCUcZVzw>
 <xmx:FW7vY9I5_ZPni5SZi_HdhbW1xylkD2sp_QRY-ouU2zhigiE9tiGXkw>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 07:07:46 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: qemu-devel@nongnu.org,
	jwd@defmacro.it
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 Joel Granados <j.granados@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 1/5] hw/nvme: move adjustment of data_units{read,written}
Date: Fri, 17 Feb 2023 13:07:39 +0100
Message-Id: <20230217120743.308632-2-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217120743.308632-1-jwd@defmacro.it>
References: <20230217120743.308632-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jwd@defmacro.it;
 helo=out5-smtp.messagingengine.com
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
2.39.1


