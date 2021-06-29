Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2F3B7881
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:21:16 +0200 (CEST)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJIJ-0002Qj-Ad
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIno-0002M7-IE; Tue, 29 Jun 2021 14:49:44 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:48361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInf-0005nk-TZ; Tue, 29 Jun 2021 14:49:44 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9C7CE2B00ACD;
 Tue, 29 Jun 2021 14:49:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 14:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=hs3hDVr9lfAnV
 6rqehujyh+1HUgoWloBLWzkDXyXH28=; b=UEGfEhKY7ZKXYL8ZI09vqGHfd3d1B
 xTU4w95+5WEwc2le7z7iI/dXor5gO3s1OmW/wm19owdFMiP5J2xtatVdA+/louY9
 ASXBfdeL2NUWD7HaALQ8NVBBjAWDdq9LLyAJ208ZOFG0ZKW/9j32TxKOz2cjX/fH
 Y9/BL3G7tjVqYX3DbwdQYqTTB+emLc+dTxzRlTGExO7oZJZif4hAyONK8O5fEV0i
 d6zDFT5u03y9IvgAsgVwKSmitenMwKFfLEdX/1apSIZklyp9g1d8Li02jJd+kLnP
 Yrj4ukbmOJZxMwNX95jg8SrQXk9eebsdWFo/mX6zw4l5EEBhrw+HW3oWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=hs3hDVr9lfAnV6rqehujyh+1HUgoWloBLWzkDXyXH28=; b=utcqLSnC
 B7Q+kzgZj8C9EvatxbegHDlQtQ2Ezi24e8RbS6eQlHl4+DG0MyeHJrc5hujqE/PK
 ifb6EMKq9I7dzw1CQhxJJyVhnxH9zTxlxz5ojsm4gjGpZdaB5T4iOjTszZ+5W+ue
 oRHaalgnq853MMMozcd8WST9be2/aA7LFS31eA9mIL9PO3294aoEldKGvf17fxfb
 FtlxXSg+qtNFeIrCJgOsI2FubkRfMoTTU9Vf+w9+sQm/SD0XjdlFwas+rQRuBEDK
 cPrGqCQvyU74p8loRf9UMMU0ABAb3Reo9/CD7q5h5YsF0qJbADcBZDop2cIRrG8Y
 AEVDeEY9PPigCw==
X-ME-Sender: <xms:HmvbYDTYjRIqxsmlB6nifLwDJScJk4iG7Y3Gfev95fZMnUC58hVyvQ>
 <xme:HmvbYEziiQZ7sbqkGeLpAz461sDd-TgpDF8qUfErmMLhqYdAmTPugLpkN2S4PFl-B
 IC8NP5ZaaZNEL_ofa8>
X-ME-Received: <xmr:HmvbYI36dSdkVSgX4nxTk1L04UipefhJjY3RD6JLoKA7y74SolDlv0E869g5j_1MfUG7KzShygeCxnGj-Y3TgfCsjs2NCxZ4EfolBmpVRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehkeeiudejffffffegheekhfejhfehveehtdeuiefgleekheegfefggedtffet
 tdenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HmvbYDDINVH7X58qaFlxDjpEUqKUMsu24jSDkNmAKe3XCloE83wx4A>
 <xmx:HmvbYMggRU47VAOd8kDIthbsRBB9FuXJeC82eN-6PWGzmDSrdrdODw>
 <xmx:HmvbYHpBKZh7GSrdS5RmlCNiQNU6n5fX6LoCsKpq7AGDg5My_VbXsQ>
 <xmx:HmvbYLqm2p4u1aNc87wsfPvYJagA4ycIUIFLFT-6rmXtmms2trr08HGUP0o>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:49:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 21/23] hw/nvme: fix missing check for PMR capability
Date: Tue, 29 Jun 2021 20:47:41 +0200
Message-Id: <20210629184743.230173-22-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Qiang Liu reported that an access on an unknown address is triggered in
memory_region_set_enabled because a check on CAP.PMRS is missing for the
PMRCTL register write when no PMR is configured.

Cc: qemu-stable@nongnu.org
Fixes: 75c3c9de961d ("hw/block/nvme: disable PMR at boot up")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/362
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dd2b4fa127cc..5c6c7d3455c3 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5860,6 +5860,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                        "invalid write to PMRCAP register, ignored");
         return;
     case 0xe04: /* PMRCTL */
+        if (!NVME_CAP_PMRS(n->bar.cap)) {
+            return;
+        }
+
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
-- 
2.32.0


