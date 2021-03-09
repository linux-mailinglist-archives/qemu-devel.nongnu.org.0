Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2783325D5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:53:00 +0100 (CET)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbr9-0001mj-Ik
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap6-0000jy-UA; Tue, 09 Mar 2021 06:46:48 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:56585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap4-0000qq-NJ; Tue, 09 Mar 2021 06:46:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 699BB2733;
 Tue,  9 Mar 2021 06:46:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=k9S7Bk4wiORPf
 lGxOETDHajI+f0Nr+lpJMqWYCe4RMk=; b=uFZlY8rxL0eCQuH5neMyGGLGR0drf
 HnzC5wq2Qk47AVsFRDF/tFVuGgWvJdPEpbGQ+8rJy7bWecdPc+ntOkB4yPXDpeUr
 25W1dUCD12VgYT2lr+JXxO9nxP/NmXBS95Xu6fC7kUTLklyVt31QHQCJndqJ1TlC
 cUUG8MHwRNCWsYsFKQavm37dwnpB+ijUceZ4WKZdk2qstTJ9nvyKdAf/FqpCahzG
 56ZUFfUY6k8rF74Qk2IBC9fZRWMoffR8BpOfHXzaO0fSQejf59VBy406R30YDut6
 5KFz81DPL5xEmwka/BWpAqP62PpQRjUR7D0gGyNBiA0ytBA71vZjGil6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=k9S7Bk4wiORPflGxOETDHajI+f0Nr+lpJMqWYCe4RMk=; b=b/f0k8Zt
 xzJjxfoHMiWbajeF30eP31OeUKvNuTZkXJsFVn+iegC9/w1DrqkiEE6Yzdo3yhUQ
 r+8j0NQixVvUppXeKKQ6VofUNNl6WKE5qfKu5lkCMTPzmG1673SRsn+4EVSzAcPK
 IIl+I1iG8Hv7JxBypGnok52OL8za2dr5wPco4FITCZIUU63EYEaQVDYrJx2Yna3P
 PncEnZAVV6+p7/vIXxuw1yD3zcsS/KFUCZOSoc1QSjs1Y66fL1PIYNkCx2pZlSKZ
 FM7ayRD61DldztJuKxVWDhKedtlI6CEGw668c6Mz2JXJDnj6ATE+c/TsRA/b06xk
 cAgAoJ0A2qvYGQ==
X-ME-Sender: <xms:AmBHYM1TR49kp_u9-VuglEEgtqbEbMlmCLPP4ezr-iIlqbKlUXWk-g>
 <xme:AmBHYHH4mmX3lxAVv6xSgXGa0MHG2U16o-ifrz2FzmfolLlAsalt7z0IJIlxRE84c
 lTKVHps2vvwRSrCorA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AmBHYE6mvXvtchlwlWNj3k2kIjSiSqcX0VXA7jeQ55nT1W08N723IQ>
 <xmx:AmBHYF1P9UsCnGQgAB2Q-jocAsQ2ZB_Ym1DvIerqhBT9J_C9pd3nVg>
 <xmx:AmBHYPEcwMipi8-QkrhMjBSSp5YNzN5jucd5XA3Slt15SAhFcIwSKA>
 <xmx:A2BHYFa-ermgYIq5c8zKaxs8Jxf8OYeur8HsVl3_85NxxgKPELTQHVPd5MY>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 926A124005A;
 Tue,  9 Mar 2021 06:46:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 35/38] hw/block/nvme: refactor nvme_select_ns_iocs
Date: Tue,  9 Mar 2021 12:45:09 +0100
Message-Id: <20210309114512.536489-36-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

This patch has no functional changes.  This patch just refactored
nvme_select_ns_iocs() to iterate the attached namespaces of the
controlller and make it invoke __nvme_select_ns_iocs().

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 414473c19c56..b4843d3bcf5e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4042,6 +4042,25 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     }
 }
 
+static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    ns->iocs = nvme_cse_iocs_none;
+    switch (ns->csi) {
+    case NVME_CSI_NVM:
+        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+        break;
+    case NVME_CSI_ZONED:
+        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
+            ns->iocs = nvme_cse_iocs_zoned;
+        } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+        break;
+    }
+}
+
 static void nvme_select_ns_iocs(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
@@ -4052,21 +4071,8 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
         if (!ns) {
             continue;
         }
-        ns->iocs = nvme_cse_iocs_none;
-        switch (ns->csi) {
-        case NVME_CSI_NVM:
-            if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
-                ns->iocs = nvme_cse_iocs_nvm;
-            }
-            break;
-        case NVME_CSI_ZONED:
-            if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
-                ns->iocs = nvme_cse_iocs_zoned;
-            } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
-                ns->iocs = nvme_cse_iocs_nvm;
-            }
-            break;
-        }
+
+        __nvme_select_ns_iocs(n, ns);
     }
 }
 
-- 
2.30.1


