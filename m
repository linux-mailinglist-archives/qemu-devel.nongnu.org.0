Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086C330EB0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:52:15 +0100 (CET)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFMq-0001cA-9V
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvE-0003AA-M0; Mon, 08 Mar 2021 07:23:40 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvD-0006yO-49; Mon, 08 Mar 2021 07:23:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DB38436C8;
 Mon,  8 Mar 2021 07:23:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=UrKdYwGrVaGOu
 lNLHfnJ/mvHVJitFlGANq1iGrvBrjE=; b=vB2vDgpxcWIsBBbREH7MRaQoQS6BJ
 A1SYc+ry4azd75Pux8iCOqhR+FVW/rbaNL8ti35syQLOlYE0Q5xv+HmeFYnUYtDR
 Ls6xFc9fXkjCMYcrj7PbATYGFNEnJweB8mxqNniLclpuRm/RMiwwFCXyd6d3QuRC
 GvrlyQpWVQPl8dk7xaezozjKFM6mEjgbWa27170HUVf2CH1usTs6KvQCRju8donP
 juXkrCaSVQyR5rr5S9AiOZq2d3QAqKPB8tluTnZ11WZwT+6o/Mt1G4wjz6a2wlx5
 oAqXmuPfyyfLm2qpY4FHnwlsbhJ+iYBzceMOCeCRTipR6iIvTsW/HPMig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UrKdYwGrVaGOulNLHfnJ/mvHVJitFlGANq1iGrvBrjE=; b=geTGsk3O
 +Vtc9ek/SI92rbEz+tJ5egP8gBgrKRjqVmoV35sJXlfHrRBgpUMEdre/DWF+1wLh
 qCIr/HammyXfxXvDzdrmjiUZOsSvMm3xnc250j8aM+bXWtecMNDZdnqL6Ycd/eIT
 O/rE6Q+bw+5qQsL2JZ/7I25aXtRwzAp/3AAGx9iJfv+Z7e7sd/m93Fi+vU5dvyt0
 XpanCxu3ptIdZL2GjMOa/uJOgUAwFKcAjxmdb1KH2M3Tm3qzn+dYO1nFH3nI73vN
 RI3kMpoQ9+nC3b/GYhtkG86mv3XJBGXOkuMcnPyK8ElAq248nixlFHfSqdwl/lFX
 vHrDPtxx71jdkQ==
X-ME-Sender: <xms:SBdGYAf73rsT5cnN7yS4WP4MZZxXgu3MLEKAMjzrTzX8efW4dHZFRA>
 <xme:SBdGYCNI4xdYCjoUsRssiRxDmXj-147sU6j3WJWXvqfxk5DMp39f0hsoArXyo4qNy
 26lxxQbEJlJkBZW9js>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SBdGYBiBOTDoZmFP-0kj17ERVxZYRHwqdWTA0PPl721xgMkShI4Rtg>
 <xmx:SBdGYF_zekkFYtl_Dn1tUS2mxBYt_Ggw-FOSGePupTTABuB5o5sG2A>
 <xmx:SBdGYMu92LkCG39m0NF-qt8PUf9Zo9K8LGOl1W-SirkKi1jBKh1p_Q>
 <xmx:SBdGYOKpP6I83jBs_8-hwGENton87uj3WWiFPdu5hI-rJKCF6qDk6cFQGnQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E35091080063;
 Mon,  8 Mar 2021 07:23:34 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/38] hw/block/nvme: add missing mor/mar constraint checks
Date: Mon,  8 Mar 2021 13:22:48 +0100
Message-Id: <20210308122313.286938-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Firstly, if zoned.max_active is non-zero, zoned.max_open must be less
than or equal to zoned.max_active.

Secondly, if only zones.max_active is set, we have to explicitly set
zones.max_open or we end up with an invalid MAR/MOR configuration. This
is an artifact of the parameters not being zeroes-based like in the
spec.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reported-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme-ns.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index fd73d0321109..0e8760020483 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -163,6 +163,18 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.max_active_zones) {
+        if (ns->params.max_open_zones > ns->params.max_active_zones) {
+            error_setg(errp, "max_open_zones (%u) exceeds max_active_zones (%u)",
+                       ns->params.max_open_zones, ns->params.max_active_zones);
+            return -1;
+        }
+
+        if (!ns->params.max_open_zones) {
+            ns->params.max_open_zones = ns->params.max_active_zones;
+        }
+    }
+
     if (ns->params.zd_extension_size) {
         if (ns->params.zd_extension_size & 0x3f) {
             error_setg(errp,
-- 
2.30.1


