Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1A3149A4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:45:27 +0100 (CET)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ni9-0003MW-Nu
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUg-0004oc-UC; Tue, 09 Feb 2021 02:31:30 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUf-0005Si-AW; Tue, 09 Feb 2021 02:31:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 31CDCBA1;
 Tue,  9 Feb 2021 02:31:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GV6brwDn/G/R2
 gqLKsrMr2zPeh9LMmKWPCMsZKlIWxQ=; b=t2BLH3nYSsfqpwShVUTpYpu8I6Qox
 gpLa3dgrnJR4+q1Be4XicX3mAhWzwOk4L1WP7ovlYNYEN+HAJ1ArodM8zcbz4jjE
 gnh2zw0ah1TR7En4wcKhoJPEznxRUJHT89vw6IdClB4JIMAsoCG9DFOYa1zJFfsA
 pnuJEeKcvgIgRAX6kKlLpnTbfCX6KYKZAK8xUZqRExU1GnsJgLDM+Ci9jgbop2V8
 BAm2cBfVrSqiU37VltqpwkOWoR3zQEX7ybKUvJmEZ1h2ri8jdJeyWb6dGiloLEA3
 Xa7lkEBz6FtXEUsRphRmCHDX7khx6nGKLkqD6wK3fNFEdx0kJazGOygZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GV6brwDn/G/R2gqLKsrMr2zPeh9LMmKWPCMsZKlIWxQ=; b=ogeTfs7u
 nPvu90PSCg7ro/lrqe2M7p72sCEKjpsGw8EL9C5XZdrbEvzPXShSTp+5ZiJYHlwz
 gmUc7nnXWqb3+tY75I3+rsQO+DHKk5Z9eo8W/HymfZOkjRl/cHRYJsyqYrKGVmUW
 m294Yw+1H6LgcP2sWokesE0Oi5izSvYFN+uNb/gqUG9av7DiIppdk+Qmsy0Ln81k
 kMNosicLjhY1lokPqPcrPbsFI5+fOpTqjRPvUpn9SJU/2hAE12D48K43BuZJGYfF
 2DCvRqVZBpVsvAfdrJpZoAOvNL1n1b0EhXuTG7r9LBh2jEA4G10NWBAeDjK2PbCH
 HicbVwToUnvXSA==
X-ME-Sender: <xms:TjoiYE15taS-lbASZOrc0hAMC3SkgCBcci3kCYlB1nO4qS8NC_g7fA>
 <xme:TjoiYPHvMQ1swJYNB2WwrwVszYMUw8M5TT2nCmZirA5vfJeSk6T8W6YKS9bdUGOM6
 fDUwNd-dzuUg_5_Z3E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:TjoiYM4HYqOnCsHRhmP9vzyCVHKkRwbC0mBuzcZ636CMnX1uD27TQw>
 <xmx:TjoiYN3Si77_LX23VnxCi3-iRbgyThLEuRFygyvrn5C86uTKg5OFJA>
 <xmx:TjoiYHEa-waW8gMdfjX_Ha7dZFZv7oTIIesxOzUNrPP7bmRjToXg4g>
 <xmx:TjoiYNZ_-kB9b71-qGo_ynZNOqbPiJa1Sk9rOJo4gnRedjUG3p7U_AepxLk>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6252B108005B;
 Tue,  9 Feb 2021 02:31:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/56] nvme: add namespace I/O optimization fields to shared
 header
Date: Tue,  9 Feb 2021 08:30:09 +0100
Message-Id: <20210209073101.548811-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This adds the NPWG, NPWA, NPDG, NPDA and NOWS family of fields to the
shared nvme.h header for use by later patches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index b663d11e60c1..11ac1c2b7dfb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -996,7 +996,12 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    nabspf;
     uint16_t    noiob;
     uint8_t     nvmcap[16];
-    uint8_t     rsvd64[40];
+    uint16_t    npwg;
+    uint16_t    npwa;
+    uint16_t    npdg;
+    uint16_t    npda;
+    uint16_t    nows;
+    uint8_t     rsvd74[30];
     uint8_t     nguid[16];
     uint64_t    eui64;
     NvmeLBAF    lbaf[16];
-- 
2.30.0


