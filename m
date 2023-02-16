Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A855F699B42
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:28:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi1x-0002fH-Io; Thu, 16 Feb 2023 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQi-0000RB-2H; Thu, 16 Feb 2023 11:48:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQf-0003tT-2X; Thu, 16 Feb 2023 11:48:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 39BEB5C023A;
 Thu, 16 Feb 2023 11:48:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Feb 2023 11:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676566094; x=1676652494; bh=yN
 qkIi9DTxLm3SgOgUDJlmyKa+80oFSROj6j8Gdhsfo=; b=AMr+m8cuHm5E08W+Lm
 CNbUYqal6X0J+VWK1E/4iBlQMKLSoCGs+tVE7dG5iBdzYI/HA1Q0vIsDimVpUgwS
 W7hguJLJeeghiQ3ss8Z8pSTJomDoZuBrBsd4+Ay/gi6N3r7ZJzegadU8b3m3kix/
 EfOLVcH71+X/xoO+9yD9r3JhneTzdUaPk9LdMnNfE4tI3ePvRiE+coj5tJW0AWE6
 s2pjZeAGwCmfajrhl+ngI/294Uw4Mn2TsibjSVh9qsurHxKhSDu7hNnAIal+KGCr
 pn8my0qAbpBOcCtFnucJi1k1aRihx5Lx4mbQSm3QEVHPV16xUE3uopXPEo7gA0pl
 pHgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676566094; x=1676652494; bh=yNqkIi9DTxLm3
 SgOgUDJlmyKa+80oFSROj6j8Gdhsfo=; b=UGd3YFN5O+5j/35djFO+et7F8Cn1K
 PXPHW8dlopePjdkWe4Wb2Qollxz/XTE1yKi1PxRdva7rQOtIdl/AY7dz7QP26Sw6
 hexj5IQDAhVslh3vlYS4JW2/iqDAvzwUFSAnI67R5Vl+4Ai2Njm5JDY8IbX4O5Tz
 zLgKxzNhwlRf92noUvX7GEbGXGAEzeA68Yaigmu4xSMYcRMZY1YiHEVMG4Z85tZT
 VeCsYje9l/C5DBIjK6fNKgbiLzqv59Xy87IuWUbSNrIeG4ygFsG4QcDrg06GinK7
 0VUCUV6/Un2z+n7h9CRYLz3/TPgjK16pa6vzno0pKjQtaLw99GTJxnV2Q==
X-ME-Sender: <xms:Tl7uY_XsC6jixRUbcQlETRjw8i9c2KnGfYw80FTEGSQEBCiTrA1SNQ>
 <xme:Tl7uY3keynNv0j0FTfmv69DvpDQYqs8fTPz5X4z7SBLfAByvfWqIkszZLCLbrZxQH
 t-q0cdovfceizOXLHY>
X-ME-Received: <xmr:Tl7uY7YHXOHvv_DvBTgX91rnSPN8cu4Q4C8vsZ_zgY_72ddt-sy8tdTccOMGP0L5Ib2LlT86G4G6s6XmRusmP2Yxd4LQzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:Tl7uY6U4yNeBbxOY9AH-eMG0tTE-Rd8XMzG08XRs9XBOmjTspLEURA>
 <xmx:Tl7uY5kghE0G-XuwhVE9YcKi8Mj99m_RZD2nCcuwgt_l4VKFZJ3B5A>
 <xmx:Tl7uY3fzffLdWEjP5H_PQK1mAAj_nCuZrsibkY94D0_lLujf7WFJdw>
 <xmx:Tl7uYycLiGypsgqG62hEMAtOWF0NRA0b0IL5Th9P6FoZwcgtD636FQ>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 11:48:12 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Granados <j.granados@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 1/5] hw/nvme: move adjustment of data_units{read,written}
Date: Thu, 16 Feb 2023 17:48:02 +0100
Message-Id: <20230216164806.233533-2-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216164806.233533-1-jwd@defmacro.it>
References: <20230216164806.233533-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jwd@defmacro.it;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 12:26:45 -0500
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


