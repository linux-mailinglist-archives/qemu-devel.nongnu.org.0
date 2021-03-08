Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951C330F00
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:18:24 +0100 (CET)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFmB-0002Ir-Hs
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvr-0003lq-EJ; Mon, 08 Mar 2021 07:24:19 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:50927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvm-00072a-42; Mon, 08 Mar 2021 07:24:19 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 464B236DB;
 Mon,  8 Mar 2021 07:23:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=01FcnzN69YYvh
 /41PQMl+voL5YDhDYSrb+1kaoODpfg=; b=qM2T5+tVEpQa5BU2YPL56+J4QfvRy
 a3rmSyHh+qDWvanaWs4KoDoitDwhuB1kyMLTAV++X8HNENTZwxihaNLZhw3Un9xR
 rQjsH3HqzKSC4PYLXEhOcbLeREGNjTanOZNLBmYAv9Aw8r3aGUt3t5hLk4+g/Ezf
 YYs8C/bXevEAJhbzIleAAM4TUsC1g/KGMQa5MZDUyy9zOyAOjah5sxYXRO41TfXD
 tPQhbqdJ33m75az/ACPLG7O5WqtVGLIgN04qA1sVekIh9japbhUQ7sQuDfbCgMFW
 wx8fHVY2lIk+4OVi8QH6ZmaxApePHop6BePztog2a14zNtk6Q7ZYbNarQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=01FcnzN69YYvh/41PQMl+voL5YDhDYSrb+1kaoODpfg=; b=wYjWxT4D
 RpayjNq4PWKwAh9dE8rLA/Nm5OxSzJqHVKGBtI9wphcIRKr/9mqghLlql+9bzIKh
 4lKM1FXs/yYufSagpWQiSdlsqKIDFvVSoE4xz9s970lfcY2mTsXpjFSKd/3yJDl+
 cgVNCBDoGN9b2MF/9KcH9NmIzHYo6FZwqnbJuA3IepbUp0B6AgLUI69E0nsOkR5W
 s7NbRuae2VB7V35OLKvA7tSBLPILjWN8u3mXYhfCxNUEYTHy5CaKmzgq+XUYn2ou
 7FSZ7VIurGMNpnjGxLgzbqDem+TPo28+69k049KQK+hsGqG4+uIbVxRd0W73T2q/
 Rd8+uHprCTi9yQ==
X-ME-Sender: <xms:VhdGYA2CrTxPHgVnQclgq6Bg7T0ZXSRrNJSyTF0y8HG6RDP-lCQw2A>
 <xme:VhdGYLEpqipEQp_z6IOVrWJCYaUzCvYk6ypqa79-2HgU783Idp70xO1vn04IS7mrQ
 54kA339s9T0scNDYoY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VhdGYI4edfDfVrQZXwTuri0uB3eLjPXkQKwv764N5tjcff0teTTwtQ>
 <xmx:VhdGYJ0CHS8boHD-LSAVhvvMtx11L-XpgeCOw-i6rzMa9FjlXfOl4g>
 <xmx:VhdGYDHvsuppGD0QdSd7i1MkmDt85nOnBcvKevCYw2-FHGUWtQnIzA>
 <xmx:VhdGYJbGAEjRV1lw8SAEmZPtUMHXYv6WiNTUK4-2p71ffciA0CjlmTrs0Rc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65C6A1080064;
 Mon,  8 Mar 2021 07:23:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 22/38] hw/block/nvme: fix potential compilation error
Date: Mon,  8 Mar 2021 13:22:57 +0100
Message-Id: <20210308122313.286938-23-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

assert may be compiled to a noop and we could end up returning an
uninitialized status.

Fix this by always returning Internal Device Error as a fallback.

Note that, as pointed out by Philippe, per commit 262a69f4282 ("osdep.h:
Prohibit disabling assert() in supported builds") this shouldn't be
possible. But clean it up so we don't worry about it again.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: split commit]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 478168de6eab..7b4adb906fb4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1237,8 +1237,6 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 {
-    uint16_t status;
-
     switch (nvme_get_zone_state(zone)) {
     case NVME_ZONE_STATE_EMPTY:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
@@ -1246,16 +1244,14 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_FULL:
     case NVME_ZONE_STATE_CLOSED:
     case NVME_ZONE_STATE_READ_ONLY:
-        status = NVME_SUCCESS;
-        break;
+        return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
-        status = NVME_ZONE_OFFLINE;
-        break;
+        return NVME_ZONE_OFFLINE;
     default:
         assert(false);
     }
 
-    return status;
+    return NVME_INTERNAL_DEV_ERROR;
 }
 
 static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
-- 
2.30.1


