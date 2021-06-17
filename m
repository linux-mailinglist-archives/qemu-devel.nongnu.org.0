Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3C3ABC90
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:20:46 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxZF-0004B3-2t
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM9-0002YK-Qw; Thu, 17 Jun 2021 15:07:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM8-000312-7l; Thu, 17 Jun 2021 15:07:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A5B55C016D;
 Thu, 17 Jun 2021 15:07:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 17 Jun 2021 15:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=X2URhhTEc9V3u
 IEpB3rSnGjo6T7Vo1A6SEUWGiaFDCA=; b=EX94f2tP/K9/2x2tmwuDphqmVEytP
 Zh6OYzigf96thhpCJWUWrtAO7cQikESIcs6WKoThDAxBXtwznE1ZcVioS3/5OxJA
 ZcNIFDsOP7XAgriP1amWQOefKfhmAT/1ukKKSsiilcLiNqwr9AT1Y2jLu3IOuIFV
 RExBVVh7d8HBxw2hv1gy8iXulM2uRBkozVzI94/Ik28WzfhyJbJXGrkAnz/2tuck
 pXZjwesNDiUeoYW35oV7Z9wvlEhOUZz5xa/OlAAOyg/buZV/ggqxbEDAGwpNW1Xr
 fW/qkJrp+HmeE/YTvNvqTYbcakojEDh9wwgPx3BW/xMZb7LI+Xb8h7NEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=X2URhhTEc9V3uIEpB3rSnGjo6T7Vo1A6SEUWGiaFDCA=; b=L7LVFklc
 +hKf5XrqFed134f0+2u42pHmpK/34R7t9R3Hrl+Vbns3pocveZTgz+Mh6TDlQZSh
 O9HC6wNmDhNLbiz/nIAv8d+FJMYVFlgNNpMza6RUGCaE14fAGJ61VHaTgbZMXf5B
 FXrWli5oehgR18LNyHYkBBQ9xrHE2u3IdI/JdvG5QnZY0GfWud2+ygt6wMwOzh+3
 J9Xqe/OeIlYnrkS6oqT+v58FkeJz/MWj0hdcuj3raejwczDw010E/11usMs0BBUn
 +1+WQRHLgzjtiRI9IzT/oJHqRBzlpE6bRH+RdfdUSKNoBBUEwo/FOKjUURuuMqSH
 0hrJ8bRWTk/+zQ==
X-ME-Sender: <xms:Xp3LYERYU82dOkkW1rTeBoMtZ-f0LQevYw0CW3ikPtqr89eRgD5QXA>
 <xme:Xp3LYBzJb-z4ogOa4Vyq276xCPo-Mw8HPb_-cItXYzIz0tJXg8qRh8eYKg8sPQps8
 IGWRqb1tS4pJAKuz4c>
X-ME-Received: <xmr:Xp3LYB0heL9h7pvfOf1ekaDrS7Y4e65WoymUBMTuYlMMmVV42dGjnmONjxhVGiYO7QDGlpHT_jj5eIVFO3Q-v7IjHALqgXhUz6wMjOa6kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Xp3LYICThWUKtyl9Pceu3sixkAnysmpaYSo1rGxNb-UWMa4YBMN9Lg>
 <xmx:Xp3LYNiRqHLqQtjBLTnz9cwlQLh6oVoJ5WrmA-NCW4_3X8YOv7t43w>
 <xmx:Xp3LYErF1IhroAKgXEHtG1KZxHUYKxDVsTjh7VHwbyXxbWYhN5z7yQ>
 <xmx:X53LYOWKlaY7G6q1b-9ICypK5e4WVNsDwZXlgAip1j3r6r9Qwn0q7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:07:09 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] hw/nvme: remove assert from nvme_get_zone_by_slba
Date: Thu, 17 Jun 2021 21:06:51 +0200
Message-Id: <20210617190657.110823-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make nvme_get_zone_by_slba() return NULL if the slba is out of range.
This allows the function to be used without guarding the call with a
call to nvme_check_bounds(), in preparation for the next patch.

Add asserts after calling nvme_get_zone_by_slba() instead.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 07e40107e86b..f1a36c2052d0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1542,7 +1542,10 @@ static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_t slba)
 {
     uint32_t zone_idx = nvme_zone_idx(ns, slba);
 
-    assert(zone_idx < ns->num_zones);
+    if (zone_idx >= ns->num_zones) {
+        return NULL;
+    }
+
     return &ns->zone_array[zone_idx];
 }
 
@@ -1619,11 +1622,16 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                                      uint32_t nlb)
 {
-    NvmeZone *zone = nvme_get_zone_by_slba(ns, slba);
-    uint64_t bndry = nvme_zone_rd_boundary(ns, zone);
-    uint64_t end = slba + nlb;
+    NvmeZone *zone;
+    uint64_t bndry, end;
     uint16_t status;
 
+    zone = nvme_get_zone_by_slba(ns, slba);
+    assert(zone);
+
+    bndry = nvme_zone_rd_boundary(ns, zone);
+    end = slba + nlb;
+
     status = nvme_check_zone_state_for_read(zone);
     if (status) {
         ;
@@ -1790,6 +1798,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     slba = le64_to_cpu(rw->slba);
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
+    assert(zone);
 
     nvme_advance_zone_wp(ns, zone, nlb);
 }
@@ -3186,6 +3195,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     if (ns->params.zoned) {
         zone = nvme_get_zone_by_slba(ns, slba);
+        assert(zone);
 
         if (append) {
             bool piremap = !!(ctrl & NVME_RW_PIREMAP);
-- 
2.32.0


