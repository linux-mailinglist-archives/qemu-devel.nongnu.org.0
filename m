Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226CF332540
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:17:25 +0100 (CET)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbIg-0002GQ-7T
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoc-0000VM-70; Tue, 09 Mar 2021 06:46:22 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoZ-0000aH-9C; Tue, 09 Mar 2021 06:46:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 36B92261C;
 Tue,  9 Mar 2021 06:45:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lcFhqdQmFIMeo
 c4OeqdEW6d+jb8xy7ztJHSf3HbE1Jg=; b=ioa2a6VFIRB3iu3ij/OLKNHL9HIT9
 gA+q+UWWeLVPpu1tYzVIhG4XOjCq54ntp6aCx38U+64Ev5R0v91jhVSN8NLQoJ9A
 x6qi8pdSzs8UkX+JxTNSNjTIWsltK75gmCKiO71JKgoa6LmssdCcewT0Ne0v+KNj
 qaoR6cw3Bin6TUE7ThnCzBhNW3aJwYqFvn1VVnjDO6cMQSIvLh4MFxgbkPKj0Buj
 w2GcaKxpTRER4kfbIjwAOoJbxxn0HbHHYTEEv83jAanz+w0SOD2eEQz+mnEekVvV
 kPJJ94w/KV1a8K7zZXk42QcKiepz3EwvTuxTpfxtuSGFT6Q5yUg0PeJow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lcFhqdQmFIMeoc4OeqdEW6d+jb8xy7ztJHSf3HbE1Jg=; b=U9tzOLas
 4xXtsCaLT2gGJ9pDPkOUHByZiFs8pzVEFrLGwwdEmubcYt3NQQqqKnaxtb48l88D
 SrdHWFJpIRaI5dhB3CStY65guPfieHivhcGlnzH8gH24hqQoq4624EvWOxHuYcgL
 EN/kP7OPRYY8PqwvLpfdpMfcsSmVGBWfwQqo+M3toXJuEWjZ+tkJ9eJIhu6ZH0ef
 QEKwOMqx50ANbzYeGtxh3+QD/M/ADDqY/PkLJyjgVdbBpW9ZDUKskE/YgWg4d4U1
 doFcRS0Ay7k83aKe3NTiROvQ/W+YUkfFpfutpNNNGHLdFxOG8s1lLIYIt72nSlr0
 2hz1Ew+S4IAFtQ==
X-ME-Sender: <xms:7l9HYCTkQVuJfB4ELAtk2Pc9iSDkrw1ds7g1HHbOptPnD7PH8gaVqA>
 <xme:7l9HYNCENaadLJVjjd1pag90GnraEozA3lKKWI4tsB-9rXu596wE2YyFCBN5uyBNl
 puPslv2hky6TTcBuhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedufe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7l9HYBgMcIIdx-iqnTaT7Bp5kPKPzxNq3CMgeqFy4oO9CqAXFGY3bA>
 <xmx:7l9HYGOs-17Fv2zqGwX9ipVTJLcovXolCN5d6-_np_QV6P2n-GYdww>
 <xmx:7l9HYC6hJ3vWZgt5vhpYnkQuG6QkoM-hrtyffJWvcc43P_65rYsR7Q>
 <xmx:7l9HYIliYUdsa5ayTdfGyysJX7I9Zhp0wF8_IY0ppSSH0Swp8vjazDCu8u4>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1AC1724005E;
 Tue,  9 Mar 2021 06:45:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 22/38] hw/block/nvme: fix potential compilation error
Date: Tue,  9 Mar 2021 12:44:56 +0100
Message-Id: <20210309114512.536489-23-its@irrelevant.dk>
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
index f5538fd00f49..de3d0ca51bb4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1246,8 +1246,6 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 {
-    uint16_t status;
-
     switch (nvme_get_zone_state(zone)) {
     case NVME_ZONE_STATE_EMPTY:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
@@ -1255,16 +1253,14 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
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


