Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3D33252D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:16:33 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbHs-0001u8-23
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao1-0008SX-WF; Tue, 09 Mar 2021 06:45:42 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:56397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao0-0000OO-4g; Tue, 09 Mar 2021 06:45:41 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id D4E762705;
 Tue,  9 Mar 2021 06:45:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 09 Mar 2021 06:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=UrKdYwGrVaGOu
 lNLHfnJ/mvHVJitFlGANq1iGrvBrjE=; b=OF5l4nh3Sw5Hw5JL5VP1bV61KMfrl
 fMVkCpyB9Vecsjk8tbocVkEjubnP+a8PriqLzHDO2VNdA/XnfvRrJS9MIfMBeog7
 9NpJe9r1ZWF3PEPY9kmZp105wvT5g6U5P40B9c5nQTig//ij1fFKjAy6dV1aPWWS
 jF1YHRnA23T2fRH1IViw6BYe737X6gyj4v2FKBmTglJw2wttjdvOI/JNbNlDEdPg
 kYjLPTdMV6WcvSnasd7MbrwFLsRz2pXimOBLKnX2VkActvQmSn0LBn6k79khfllS
 h2A5h+b8zP6ZqoiD9YJ9oPrEmzYGOG2Nn0qeYM18hxK8XZ62hEieqGczQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UrKdYwGrVaGOulNLHfnJ/mvHVJitFlGANq1iGrvBrjE=; b=c5alaxzo
 iczre2y+vxpZZZULezogkJpg8LWvRSy+w+PuEYDKu1UyB4qLg1vh/si44aNrYHdq
 sHmaN851ilsrxCBe1wv8MwociwrOk54R8t4X8N4JBYamlrUE9sq2lp+IKb32gthI
 1uTJESReqDJgowye9uaGstwsjTgDGmWHerNjH5is43Z1p2SeE19KsDWcX000zn6U
 g2XYW3GrHYE7KZOGkTG83nu+8VtgkXJhvuT/UNe2B+iMfSl0+oSplFaG74qeW7is
 UI0tfdzU11fwIQiusehlVnbUgGBLoQQhOFnSru9AdmTbGjPaBEdd+iUj0KNr9W1X
 ucCDXgnGuNxK9Q==
X-ME-Sender: <xms:4F9HYFzlMqOiL26Rmpge44JCXYZmRZkn7_0wppThO7bOwY3ki3kNkw>
 <xme:4F9HYHS7rutRz3x7wBEhYgXQXd9SoJfU57jds6P8ZS3m9v1ARgIcD1KPSWOdLusN-
 dK1L2q-NqNbuVLE9_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4F9HYIuJNSXpRI9xGY9iCei5zOxOXsiNFkB4K9cWQDQnDBDrqH4rbg>
 <xmx:4F9HYJtnp-jW8iF1R4xRJkXEPnmL7SfslHG8gyyauqk2SyM6rZB7zQ>
 <xmx:4F9HYOxL6yQcsezxG7tNigJ2lI1nzxXCVAHrlCwCAJQE-YCRMGkmXA>
 <xmx:4V9HYEqpt0X6vOK-Ah9a48X5amBNva0027DQI6kybsd_68qjWMfjBFgml1Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C69AF24005A;
 Tue,  9 Mar 2021 06:45:34 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 13/38] hw/block/nvme: add missing mor/mar constraint checks
Date: Tue,  9 Mar 2021 12:44:47 +0100
Message-Id: <20210309114512.536489-14-its@irrelevant.dk>
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


