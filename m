Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964E33B0B1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:10:57 +0100 (CET)
Received: from localhost ([::1]:49166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLl7g-0006IG-G1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLl19-0004ET-LI; Mon, 15 Mar 2021 07:04:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLl17-0006Sk-Gd; Mon, 15 Mar 2021 07:04:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7D1942364;
 Mon, 15 Mar 2021 07:04:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9bFIGAxC9x0K0
 ekqCHhtYXq2mJe+Ab86YxnH+er/auE=; b=3C5Q6z3H984CsuQYNG3kB2JadKOqJ
 WQC04NqiR9W8+BujNx0+/biVntk7Sy9RNapvHBBDfELJ/pW798KiAnQ/SoPcHF9X
 aBmhDcyk3RiPydPJ2XTprA0e5bhiFffwOrEllUbnoj1XQBDR7uCXj7BjmwfRE+p9
 ptGUN2+0+RUvExkFluMZU6YgJOH0hm4PuChEYSjtMALgYaMQI2WCty6+eg4Aojgj
 TJjIT/JDXPnpiSJKHO6yuln5Un+X3L4EfA50Jxb9EYUdM1+NUVjZbdcGkBpt39CG
 /HMyxl0X/6rqG4xePoFsb9AH88XnmX1n+wSwf9nrGktdpeYwudOX+vVng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9bFIGAxC9x0K0ekqCHhtYXq2mJe+Ab86YxnH+er/auE=; b=T8tlDmEB
 aglhZmWyLhGgQ3V/Qxw0hGapOdth4IekddtFih1kIdzYo6fBsC5u+OCKK4VvJmMY
 cOo0jIdAzxaINJwPpfcYluX84svheZ4obf1jvAuAwhvZKbR2ACHvq1niBCO62Dkr
 L8OESQR8OEmwOlZejO7sAeAVoeWW0aqDe5BfiPwon3T3IhViLlgTRT0mNlNBcoqP
 rPEJNVbqI7TxUBS1cGOWFo44bDto8lp5TYLEfGLKXvq5lN9xe+993g0lpmTPpmEg
 bmXelWamscxTXetNiZ8sezgLCoGFv2bRmRRqWUfcC1obwWg5U59TtoBrk2oCVqvi
 VoM2qL3L5m/mnA==
X-ME-Sender: <xms:JT9PYAIqPIjM86VDHaJklakHNCilrSJebTDRGTwNoYDlWJsD5b4wdA>
 <xme:JT9PYALLKc37BY8sLR1bbbCyKiYV-dPLI8_sP4yTtwRQxnfnovS2zp2evFvuy2wYM
 -SC67x6qjHnLLiKRbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JT9PYAuUZ8Cy_pUB-u7IfRV_BYfG5VKKc5ZJaP92bVnKZ4edfFYjXQ>
 <xmx:JT9PYNZWI0Srnzhpf0iQDj65__ErN8iMYFh6EeCnPwGLkttLPQoPCw>
 <xmx:JT9PYHYBnKAdJKtytfqW5TN1hwCwRiyeAtOSVZTLET7YeE8_tKfe5w>
 <xmx:JT9PYCzwuIltCb01_Nhh6KgMJI1K1t39YCZhrNeorljcvIQZ5paoCA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB182240068;
 Mon, 15 Mar 2021 07:04:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: assert namespaces array indices
Date: Mon, 15 Mar 2021 12:03:59 +0100
Message-Id: <20210315110359.51450-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315110359.51450-1-its@irrelevant.dk>
References: <20210315110359.51450-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Coverity complains about a possible memory corruption in the
nvme_ns_attach and _detach functions. While we should not (famous last
words) be able to reach this function without nsid having previously
been validated, this is still an open door for future misuse.

Make Coverity and maintainers happy by asserting that the index into the
array is valid. Also, while not detected by Coverity (yet), add an
assert in nvme_subsys_ns and nvme_subsys_register_ns as well since a
similar issue is exists there.

Fixes: 037953b5b299 ("hw/block/nvme: support namespace detach")
Fixes: CID 1450757
Fixes: CID 1450758
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h |  2 ++
 hw/block/nvme.h        | 10 ++++++++--
 hw/block/nvme-subsys.c |  7 +++++--
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index fb66ae752ad5..aafa04b84829 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -54,6 +54,8 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
         return NULL;
     }
 
+    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
+
     return subsys->namespaces[nsid];
 }
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 4955d649c7d4..45ba9dbc2131 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -236,12 +236,18 @@ static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
 
 static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
 {
-    n->namespaces[nvme_nsid(ns) - 1] = ns;
+    uint32_t nsid = ns->params.nsid;
+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
+
+    n->namespaces[nsid - 1] = ns;
 }
 
 static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
 {
-    n->namespaces[nvme_nsid(ns) - 1] = NULL;
+    uint32_t nsid = ns->params.nsid;
+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
+
+    n->namespaces[nsid - 1] = NULL;
 }
 
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index af4804a819ee..2f6d3b47bacf 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -47,15 +47,18 @@ int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
 {
     NvmeSubsystem *subsys = ns->subsys;
     NvmeCtrl *n;
+    uint32_t nsid = ns->params.nsid;
     int i;
 
-    if (subsys->namespaces[nvme_nsid(ns)]) {
+    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
+
+    if (subsys->namespaces[nsid]) {
         error_setg(errp, "namespace %d already registerd to subsy %s",
                    nvme_nsid(ns), subsys->parent_obj.id);
         return -1;
     }
 
-    subsys->namespaces[nvme_nsid(ns)] = ns;
+    subsys->namespaces[nsid] = ns;
 
     for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
         n = subsys->ctrls[i];
-- 
2.30.1


