Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E863482B5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:16:39 +0100 (CET)
Received: from localhost ([::1]:52268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9vc-0001sY-QS
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9of-0007qj-5V; Wed, 24 Mar 2021 16:09:21 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9oc-0008Kl-H9; Wed, 24 Mar 2021 16:09:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1C39013F4;
 Wed, 24 Mar 2021 16:09:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 24 Mar 2021 16:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XlsQzuRts1cnZ
 k6WID2ViUpLl9TVz61RaxQUDBr6iCs=; b=NrtJgsVd7PRjMxzZKEVIGikaNfND6
 EHkW/Dg1XkigRhGkx6ZjWNJ1DusybKOPm0eJkR/XfPNmPm5a9+ETSsC13reN376p
 PUPRfriVt7w/OT2m5KNL6/NIpR+UmnvvaO4I6ZypZygFU8U7eVcik6hEb+q5q3cB
 3M9SGS5imxknVn1NaabO6IHoSLFgJZcqAVE3vwZ/g2sRC0Az3LVw//wpeXIuxxSP
 2DCshJQiNpyIuzpHEanru5/fILUpIq79Yr68xDRAADYFW5wQxT+yIQC7hHBZO0ur
 4creBGQ85Mjld1701ye6F2XcrfuV496O8TtcbGF9j8Uuw/T9JAgbJr0oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XlsQzuRts1cnZk6WID2ViUpLl9TVz61RaxQUDBr6iCs=; b=TI3x1DTT
 tXVgqEbg1S98/u1c3y6MXoLW86s92nLXGzuvEg+24KF12Ph5Fp5yN7BJNglg1S/U
 olVtlSoDl5M0TwosvfTeiAuKqAT41b9ZNVtbS5gGvO314Q6FDLvU1+XRiOmk58WF
 aLF8+rqluy0VoMm9v0LHr8W07xm6UI+M9Ylf1dWZHad0dKp9J8apWIrh0qPP7AyY
 lhX+JYK+qfcmHSHCobkH7XYvz1pLf/FprnBPq0VVKBFRgbo3sbI3zlJaPQbAtpJU
 h3LSpZj5WxFXls+GuTYefyP6Y0e7GL4kiwsWgrxaQcz0QA2HAGTFX46MK8B5pRit
 ZsbFdL/bgSaDgg==
X-ME-Sender: <xms:aZxbYPkpJQUxrQIIX5CGv_r4JxW-Hg8OaX4UZtvNU349Dxq0APo80A>
 <xme:aZxbYC2xCnzPuqopvfzGLvTxOVjPqzojCwZQq4O0MKxEPcFp8IYmbFFTx2hpnMFr1
 FakCeix0FJLrWZOwAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aZxbYFo2mL67bnl-KEl0YgaJr69fs3yO6OlrhOfSAh4Jh6JJjFfNng>
 <xmx:aZxbYHlsf1PRPaym-GRNd4ClVpIVwdwuKp8V0JlrsIMHvoH6lIUiUA>
 <xmx:aZxbYN2phTIOFGCxO-mvnDaCyCrJMcjpZ9ajYIIVYTR7kvX8p4Cy1g>
 <xmx:aZxbYHr_BKlxZMxzuxwIjZdVQZw5MjBWYeiww1uuMZudzS-fHAHk4w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B18441080054;
 Wed, 24 Mar 2021 16:09:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/7] hw/block/nvme: fix pi constraint check
Date: Wed, 24 Mar 2021 21:09:01 +0100
Message-Id: <20210324200907.408996-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Protection Information can only be enabled if there is at least 8 bytes
of metadata.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7f8d139a8663..ca04ee1bacfb 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -394,7 +394,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.pi && !ns->params.ms) {
+    if (ns->params.pi && ns->params.ms < 8) {
         error_setg(errp, "at least 8 bytes of metadata required to enable "
                    "protection information");
         return -1;
-- 
2.31.0


