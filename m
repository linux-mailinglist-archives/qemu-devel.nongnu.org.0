Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934C333993
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:10:55 +0100 (CET)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvnp-0006GI-Tu
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXk-0007gv-FN; Wed, 10 Mar 2021 04:54:18 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXb-0005Bu-0H; Wed, 10 Mar 2021 04:54:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B64B5C009C;
 Wed, 10 Mar 2021 04:54:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Wr8FMSuzAInyU
 L9nTeQ8MgcMnz0QdgEpTUBW1cUQAGI=; b=JTIQJe1wzx1AMAaTHCUdCBNkHiO5P
 e5bwrRhbR6BkXHF69qLSswq6vKRD8ie4x1lkGk6N5KGQKsOFPhGEtJ/djxo4JjzS
 ce2gd1yXgJiuvdcGFVB+HI17RhDY6nom1HgteAEBxZ8eXmfMiUax+L2nt1h6kI/Y
 yQeZlBcQTnn/7DJ72rkUMO3ek0eZXOG4k6kVLyhCNpB8jQCDY903mdKA7xj3A7k3
 C3GuvCQpmscAxwlFiNzOst+ynnPbTG6RoztCRJ3W6T5TbPK+QjkypiSHYuGUl9Rw
 GupL7fFXJTGb1KZHfrtn1Evo4oUmj/NdqS7MfC9O1/o3Mq73/hRInSsuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Wr8FMSuzAInyUL9nTeQ8MgcMnz0QdgEpTUBW1cUQAGI=; b=hBhHoTcF
 ofEsAAqG++4pdeM/Py86Q5kk4KsfWa8+t2XYNyiQy1SmHhSTNW86x/7okxEKkEp1
 U8kBUM/jTges8xJePxIBd13LMklGC0q8nu51SsTB+MhkkKLLsmnfTmMZkNNGbYz5
 Su95uGhQbPkkhEKGD5uMOwuHRW9g4Up9KpW/JWHgG2zuWEzb1CR06sR2Q6cD8INB
 xlwtyRlrTAz2OPNkPwyk2GL5Zgw3rlogjYr71Iv1bMICKKah8a2JJIudxpsrw7Yg
 un5Rdf1wpcR3tEynfR159xoqr0sz9kloWRRh2Theu3Jq6DiM+GAdYDukCTA4XS+S
 MrXVHqJasEFQzw==
X-ME-Sender: <xms:PZdIYOk7J1JeaDtKYYJNyIStZuDBu1gCNoWAIa8Z4P9wJugNU_YYHg>
 <xme:PZdIYF30SctXBslwP3UHg7sN9q6_HNYt7NCf8sZhAs0JK5AsLES9EXdyQRhfqUypt
 Qrag4HxCdILZQoh1JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PpdIYMrxJOO1GJQpUasQjXQrCF81JqBSsv3pj04FoBXb9mh4mQCotQ>
 <xmx:PpdIYCnbET8DQkbdVXsHtTQrOZUKJNJydPM8_BEPO_V6TI7aw-zqHA>
 <xmx:PpdIYM3qkLngnFhv7zVR_YwJMEBwT29DG1U2bzWPiaodCn0bGg4MgQ>
 <xmx:PpdIYNlPPb5IwpuD8Y603Vcc-AUOqUgCmicXOxCzIlBJrNRFs2eefw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B31D3240057;
 Wed, 10 Mar 2021 04:54:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/13] hw/block/nvme: remove invalid zone resource checks
Date: Wed, 10 Mar 2021 10:53:44 +0100
Message-Id: <20210310095347.682395-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

It is not an error to report more active/open zones supported than the
number of zones in the namespace.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 1e8ef36ba5ae..5995d475ecdd 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -214,19 +214,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
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
2.30.1


