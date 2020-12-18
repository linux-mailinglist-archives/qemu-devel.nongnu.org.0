Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749042DE06A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:30:15 +0100 (CET)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqC5W-0007xf-4I
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqByz-0005Ux-CP; Fri, 18 Dec 2020 04:23:29 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqByw-0002aV-D4; Fri, 18 Dec 2020 04:23:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E5885C00D0;
 Fri, 18 Dec 2020 04:23:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 04:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=J0rSAQf7JoSJM
 5eGidEZCIpeA32MKYZZ27SHwZsIcN4=; b=MBMQT4IAeSWTRoeYTuGJ8gWmQEipe
 R5jLYiqZX6X8IAhIk84Fimp8jgWejEoUgz5czcq+LYsqFRfmNpdk+Rh5HvctHcW3
 9T1o3np5ulPJ88AuQ15A6xj+tctxdBSWanFH+2dRyxi8AE97av/fpyXxH1Y2wYm2
 5AabgoaN+JJRSGazI1RidvSciibZ15xWVofNU6OjZkNx+HzFzBbJyuj3B3nC+N0l
 qAGkGsgxMDLHm/UdoUhoywctbISAQLJyz4AUqHtSyO5sZegkkvaAkq1oQWNulO+T
 rx+C/dL7q/gjddwy80RwA7nbFpOTxnpgLo/LEnS9qcmuYG/QjMltK4SHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=J0rSAQf7JoSJM5eGidEZCIpeA32MKYZZ27SHwZsIcN4=; b=hMUcpf7C
 xeDN90tSaHEo+TT8O1QpuEZz06p8jnR/omAez5+gLqu5LdCEGh1FoVIAgvi/Si42
 yzoJzcRnwSkbAwvApU/L4Ry1FekmjNVLDJWVhVjqwy6JIkyw3yI+wt0+3IATLyVO
 Md1ZlJJC0ok1RyHeY9QO9bCOVBqCUzE7P6l+1at9eCpRUfs3rUZ3OHw0B9y740Y5
 vyphLMN7+nYwLpeeCiGjmYwcrRe3PiwhbNvtcuIjXFyi+qxr9356pmJ/WxYQMMCp
 OHKoZM7oKReTdu+Kd6o2UYSi3A9r6To/ePUoJ5S7E+1uXoVY5cOMFybZ5kNSr8sg
 oSrn1YhX0y6rlw==
X-ME-Sender: <xms:DXXcXwCQssr7_qfwf0Ii6Q6r08f58cKjhOqNjbQRRVoSq1uxB6MLNA>
 <xme:DXXcXyhsXcPpXaldMzAJBmjuBzTJ_-A0geKxQp6afVaGzMf2cELN_7oZSncUTkO-i
 aU8dGiPyFa0F4S_nww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DXXcXzlVM3rGBierqq00tknFki0WPRIhb5COGS26gIiJptCWqouL3w>
 <xmx:DXXcX2zr22k5NWgErLevuBMUS8hwpluj1H7FOxP5XO6EBLUmUw_gbQ>
 <xmx:DXXcX1QJ-pPqZnnbXgsH0jJkaMDzAPmCn1yzR9djaB7vwGqgfT2Pog>
 <xmx:DXXcX0H148fsLt8ttNII4dINbuBwnUo0MlEv2bmf5BntUw6elWcNfA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 48A52108005F;
 Fri, 18 Dec 2020 04:23:21 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: bump to v1.4
Date: Fri, 18 Dec 2020 10:23:06 +0100
Message-Id: <20201218092308.894367-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218092308.894367-1-its@irrelevant.dk>
References: <20201218092308.894367-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With the new CMB logic in place, bump the implemented specification
version to v1.4.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f3c111ee0a5c..16bf05638bf6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -74,7 +74,7 @@
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-#define NVME_SPEC_VER 0x00010300
+#define NVME_SPEC_VER 0x00010400
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 2
 #define NVME_TEMPERATURE 0x143
-- 
2.29.2


