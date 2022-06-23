Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48519558AF1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:50:26 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UiW-0007nu-U7
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUL-00054R-2I; Thu, 23 Jun 2022 17:35:45 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUI-0006hB-3i; Thu, 23 Jun 2022 17:35:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3CE8C3200980;
 Thu, 23 Jun 2022 17:35:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020138; x=
 1656106538; bh=dFOpANDDNYBPxrDO7dEroeNRMyqlauLrX98CaBQGQiQ=; b=Q
 E5Dy+RhWlh4Oc5rz+4LMT8TtBN0crE1OGjrQcBrK359FYj+rvnmLMZshvOLW+zAq
 loF2E0aQ36K49zDcXDNPSts66vghnjlnr7pWndfb999dlfYb/zeS0hZKyYqHkwuZ
 mb7h5A6MmlT2d1Q4E5FSD3940QtLx0mD4nEymPScr80dBck3md9hYkjJJ/JusxEh
 Kyr7a0IJHjB92c3TkZxikXlBHw9YUUXNM1q3AeRbkJP8lLvS7w1/We/E6cmKcuDS
 CHVQje6CCoA5DdkSZW04JtT7lA6vfO9HBr72+Ckt0Ln0tKBskqGV7/qb691vRG46
 u5EFRnJUlu3f/eNo1bK0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656020138; x=
 1656106538; bh=dFOpANDDNYBPxrDO7dEroeNRMyqlauLrX98CaBQGQiQ=; b=s
 8LSfPEK2NV4rT0oEWv/v887n0rAKYNJm3j9xOvHRfbBHD2eu+tojU+bQT8GuGd+c
 KvI38TIpnY6rrZ4zIEFUKoY7b2pcLhyZwJLeuvaQdZzqbAYOoMLTXDqc/F7+5I28
 sGil3t2gWPGE6Woe6CaTE6G35gJ7mIRU7ONhGjql7QuLMCJBlTQZDm9hJITJ/LXy
 Sm3S1oSdPbPXdv6mdfognbS/Sy73f6B3GLdaxffH7m/hS9iPODqVbKV6X9gxMyOf
 eK8c6H1rW6efxUZ8w4IbxbRhXptSFW9WYXX9XBezFlD1ruOAhjeipU9PRcMgRI7H
 Ly2ltKvKFKnArnKCykAGA==
X-ME-Sender: <xms:qty0Yr8GlvsegL_hsyHBti_mN_9IVP8rSwVaPzLg2UUOcMcGc-UtXg>
 <xme:qty0YnuV-goLrsdFErcFKo8ZAZlm-h6wSFMX72rlvUwwJY2W7LV5Laq3O5_Fa8rAR
 uarwEUno693xFGXR84>
X-ME-Received: <xmr:qty0YpB_wj2zLD8iwq25iJxZCCqyvQwNO6O2Kw8JfUN1LjbGr7W96qkQSZ-fji8DCW_BYMlVA0fRfrJtruN->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeigecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhl
 rghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrf
 grthhtvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffet
 jeeihfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:qty0YnccD8gkGzW0t4UBQbtOZhzicApudM1SW7EMGAyHnXc69tvHhA>
 <xmx:qty0YgPN-W30FERkEPkaa3eGFRM7HrY7o50XARJIZdefq8u9JHzi5w>
 <xmx:qty0YpmYN1stXyx0irD8fQUJpgrMO4-AqZgOol2NaKB817_z_nGn_A>
 <xmx:qty0Ynn5IvO-QMRskwKx_T1yPgU0G81EOxqA6Or78DlhExYXUjZ-Og>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 11/15] hw/nvme: Update the initalization place for the AER queue
Date: Thu, 23 Jun 2022 23:34:38 +0200
Message-Id: <20220623213442.67789-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

This patch updates the initialization place for the AER queue, so it’s
initialized once, at controller initialization, and not every time
controller is enabled.

While the original version works for a non-SR-IOV device, as it’s hard
to interact with the controller if it’s not enabled, the multiple
reinitialization is not necessarily correct.

With the SR/IOV feature enabled a segfault can happen: a VF can have its
controller disabled, while a namespace can still be attached to the
controller through the parent PF. An event generated in such case ends
up on an uninitialized queue.

While it’s an interesting question whether a VF should support AER in
the first place, I don’t think it must be answered today.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 20f1a7399592..658584d417fe 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6328,8 +6328,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_set_timestamp(n, 0ULL);
 
-    QTAILQ_INIT(&n->aer_queue);
-
     nvme_select_iocs(n);
 
     return 0;
@@ -6989,6 +6987,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+    QTAILQ_INIT(&n->aer_queue);
 
     list->numcntl = cpu_to_le16(max_vfs);
     for (i = 0; i < max_vfs; i++) {
-- 
2.36.1


