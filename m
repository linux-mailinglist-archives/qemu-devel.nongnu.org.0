Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BC382889
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:39:51 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZj4-0002zv-Mu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOf-0003vh-KW; Mon, 17 May 2021 05:18:45 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOa-00066a-UC; Mon, 17 May 2021 05:18:45 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BEA9569B;
 Mon, 17 May 2021 05:18:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 May 2021 05:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7OmYgoJTlIydJ
 GN2Pi3EGX9pMYR+k1maUIL5Jxiw1fc=; b=jpuwCCcvWDDzKs429J+80ezvmV35W
 QKaZob3y0ygw8uEV+LMtcHEsM6T/YF3e6bsNN6ayDLhWblyjqM5OvEttBg3IDz/T
 kyPoRvjGYivJEDoYXJRxhbMt6VMlXQZpDF7cHqLDl+d9MePrH43dXMx8d6DpIXfg
 MngFI5cU8AuKmQi5ls5fSzv2BUbcUTTMXGfrEctnZTnrxGSw2G0Sqohrqoz8+NTp
 NtdMTWJ5OD6C2yPFega4SAftlc5CTUW16TY8BcoHdWZLzhETaajkdWAYbJfGe+05
 SUCX7QHrQT0q1jhqXoAjoEIRv8jq1qe+NsPzUKsuO5UUtC6naH0Qv/2aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7OmYgoJTlIydJGN2Pi3EGX9pMYR+k1maUIL5Jxiw1fc=; b=QxPjayUe
 jat8TZJ9jM4eg0iVjgbu2VR1wFfUnvhBzGhOH8ryr/Elz+vJfbjaoXT/ytYujKCf
 7801VNwZv4NY/QSsHBrpYO3HjrLTaB2pRUHqQNpbPR2OADb6c9LOFxK4UY8M4gR7
 0YmLVxRTxog4QEYG9Zp7xP0+3wv3uXgIMBvqSzr0+ZnGxsMcjYeYxY/RJtYL4OrG
 tRULq8qdE+HKsHC0oVz2HKCO4VGvKBqNHIbwQP39fvRQERRzkPgeKu3UPpmcNKKB
 F+wO4yhVjC/0J+vdwy7twKjvQapS8IVDYZZaeq8iHdItQQslcJcscmSVtL3ybfia
 1JNRXq1w5fMZtA==
X-ME-Sender: <xms:7jSiYA43eo7YH-sxvopUjh3clfAUkRTceYuKGUjEWYLqItSHz0JzYw>
 <xme:7jSiYB4hXqTcMz1pnbA2ux89xIUFj0YEG1ObC_-9zMR7hhZXNjWgFNvujSgG2BKoJ
 Ly3eClCUre-mODEfEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7jSiYPdl3RCoxGCVqthted48q0lar7lXzbq0mkuhr70aL0HldiOLDw>
 <xmx:7jSiYFLAd45NUSUYkL_S3fe-TI-JZ4Q82TZfAlcNj5A-za2BWqN5aw>
 <xmx:7jSiYEJTouP-lQ0ii4so-Srl8GR7zUshfeOFDkBKxvb27eMUwv-CIw>
 <xmx:7jSiYNouKqzUzhF7pdFjyiojr7SqePOeiKUGh7lGh1AdlHJNG_ZksQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 18/20] hw/block/nvme: remove irrelevant zone resource checks
Date: Mon, 17 May 2021 11:17:35 +0200
Message-Id: <20210517091737.841787-19-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

It is not an error to report more active/open zones supported than the
number of zones in the namespace.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index b25838ac4fd4..008deb5e87d1 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -210,19 +210,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.max_open_zones > ns->num_zones) {
-        error_setg(errp,
-                   "max_open_zones value %u exceeds the number of zones %u",
-                   ns->params.max_open_zones, ns->num_zones);
-        return -1;
-    }
-    if (ns->params.max_active_zones > ns->num_zones) {
-        error_setg(errp,
-                   "max_active_zones value %u exceeds the number of zones %u",
-                   ns->params.max_active_zones, ns->num_zones);
-        return -1;
-    }
-
     if (ns->params.max_active_zones) {
         if (ns->params.max_open_zones > ns->params.max_active_zones) {
             error_setg(errp, "max_open_zones (%u) exceeds max_active_zones (%u)",
-- 
2.31.1


