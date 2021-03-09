Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECC833255F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:22:37 +0100 (CET)
Received: from localhost ([::1]:50196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbNk-000607-45
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao6-00006z-63; Tue, 09 Mar 2021 06:45:46 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao3-0000Rx-Ja; Tue, 09 Mar 2021 06:45:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5F6EA2777;
 Tue,  9 Mar 2021 06:45:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=6tUgHYgUp2ybC
 6UX/X0aIvrDkDk1L72fYFBNNAan4Kc=; b=Te9Pv2W3Zfn8zJFlPpxWIzZ2t3zfM
 EZurQUoYse0cGhctP8fPD1eTyTFxx1fHfY4wftpkAFOKK7JKPKldERYXiRNvAnsV
 p4ejeTwNqAIZvttrG2jmQYcEaDEH/+8suI+lEhU0pmOiN3GNa5x7WdLAPo2JcoKu
 fCWaPN3B0s+o7sgHoHwP2UJ8/RveKuxCUHGW+aq0SxGfXlxnE+Utn+kcs5e4+xb/
 dejuKfSkWzdQAJ+pTXwjQTZEpdjnyNKEYeRQBCfrUV7ZoVY53JNZ6N8ZH0MsPd6f
 JnUD3CPtI9sOHSPH5n9iKYQtwu/1hJrGEXAUHpigxrrxCjD7Xr0WYh4wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6tUgHYgUp2ybC6UX/X0aIvrDkDk1L72fYFBNNAan4Kc=; b=Ox33hHoJ
 /nW9b7PqZ2bu45wT5S6fCmEDchTiJ2/0mFEpMK94HfkBB0GLsY1v3kjWmmkll9JZ
 /A78BDVTSTBsHUlTWn+mDMk1X2acZ1yfNZhGRCzWBKqha2ca0yWFE5NiPgL495aA
 GH2xJWckClrxpW8+WXQv6EXt4GUV6gI4ieM2BIzpa4LGaltk9j55Efz3C0RcDzEu
 izGoEVt+WVGaGxl13EoIrDg0flX2Oo0lI0C6dH2t/rg7PltIYavb2IEw2+VHShLp
 kYRKY45mwpkFwU3uuDvokjipHHkSkD8smym5DiF2DbZnrClphYAAsZwKDlOuIu/F
 letimaXKWTNi7A==
X-ME-Sender: <xms:4l9HYN7I4lSQSbkij3kwP1ZMpk7VblsMOWAPCNC63FUVa1tW4tCB9Q>
 <xme:4l9HYK4Wpd2UmhjRYu8ztxhN_nxIdEMwu7NZ466VzZX8C9z5U1uhVexDloEtjDKD5
 JPjPLsGAKCwEcvCPLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4l9HYEdUc3VAbLgvhiz3_SROm8roTyduncApCoPO_nCx1tXVMX0uPA>
 <xmx:4l9HYGIYKii687p-Rh1EjNxhJf6GU4ldWMBMNM6QqH4sqEWdsMNAvA>
 <xmx:4l9HYBIycJ7WzKxA1gPBBCztPXBAHLY9-drxv5mktawTmD5PrawxMA>
 <xmx:5V9HYKUVXnBGMST9GB3ovgqp_8HH4BA-aquoVo8AncxllEXt6nPu18m3phE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71DEA240054;
 Tue,  9 Mar 2021 06:45:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 14/38] hw/block/nvme: improve invalid zasl value reporting
Date: Tue,  9 Mar 2021 12:44:48 +0100
Message-Id: <20210309114512.536489-15-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Corne <info@dantalion.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
improve the user experience by adding an early parameter check in
nvme_check_constraints.

When ZASL is still too small due to the host configuring the device for
an even larger page size, convert the trace point in nvme_start_ctrl to
an NVME_GUEST_ERR such that this is logged by QEMU instead of only
traced.

Reported-by: Corne <info@dantalion.nl>
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 56ef07b74d27..2addaf7c4f70 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3997,8 +3997,10 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         n->zasl = n->params.mdts;
     } else {
         if (n->params.zasl_bs < n->page_size) {
-            trace_pci_nvme_err_startfail_zasl_too_small(n->params.zasl_bs,
-                                                        n->page_size);
+            NVME_GUEST_ERR(pci_nvme_err_startfail_zasl_too_small,
+                           "Zone Append Size Limit (ZASL) of %d bytes is too "
+                           "small; must be at least %d bytes",
+                           n->params.zasl_bs, n->page_size);
             return -1;
         }
         n->zasl = 31 - clz32(n->params.zasl_bs / n->page_size);
@@ -4517,6 +4519,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "zone append size limit has to be a power of 2");
             return;
         }
+
+        if (n->params.zasl_bs < 4096) {
+            error_setg(errp, "zone append size limit must be at least "
+                       "4096 bytes");
+            return;
+        }
     }
 }
 
-- 
2.30.1


