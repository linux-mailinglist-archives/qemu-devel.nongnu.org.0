Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89052354629
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:22 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTEx-0005r3-Fy
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 13:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTT7u-0004bp-Bg; Mon, 05 Apr 2021 13:35:02 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTT7e-00014v-3T; Mon, 05 Apr 2021 13:35:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 472A65C00E8;
 Mon,  5 Apr 2021 13:34:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qQSn4qZrcN7Pg
 OW+0g4MaabmZlGAce9keeJ8TpfIV1k=; b=PH20GZ/KlWAlF6KQ/0D87imPMcQMH
 2S5MsrNpv9EAOxFbvCTRCrR/9b8tJbD+FcLXw9JheysGYEkyvr+1wplalBDa2OBp
 Gfwzm/wgC1c35+q57tnVjVK/9qAHomYm2k3q/dJHaothFK8/jnIYtCC3qHMi5GFM
 FvlTrnAbn3K8jCYS50UGjc0bRw9b7c+WomN2C78Gb2ktT3rZhU6af3M4yGlHjyOF
 o4nsU8BaYe/0EFX3KAkmhD3Beet2aGqVWYr7KUg3iFvKYV7zKUogknbGLYP2w/+D
 w1LX30yTFskIrQPT3fSJH9ZAUKKcaPredEVCTaEheed8Nvn3cXowdBXUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qQSn4qZrcN7PgOW+0g4MaabmZlGAce9keeJ8TpfIV1k=; b=KHRFMozX
 RS7S8KsSimLN7NwLx+VYrS54g7kgjGk6Ho9Dbmp9m0bqFFPcAohBRi8YYFJYs0YL
 V/hzV+w+4ieVsdehpfG67q7BDO14IpsKwwJT5IXjGHHkn0y+V8ur/rZh2BY9Icya
 lh6rR7e6Gc6/23axTPsy62SCpJ4ypsyRuVdmcKzpDp/ri+FyUCeVAA7w9RsFIPKs
 9wNJudvi7rCP5dP12NEwP5bGE34O7hi4YFeD7zOKWp7r7r7X0VMT3XZ11z2nseT+
 cyjVr0FxcgAfiprJpMXfX7NK7nQY32NF0C95KPqS8tp9VNZXBv1fOwxmr0qIfYZ/
 rrdYNSGE7vVB7w==
X-ME-Sender: <xms:NUprYDLguvLpA3d6ZI6sSy1HK7T2UUTSU5BAAQ1oHfIcOVkR32IHiA>
 <xme:NUprYHJ9DJHnNCpyUgTewOsaZn7_giSsWYQ-sujDcpPeQQhLoFTw_e66PqE5dN5Iv
 3jkDU3wp83uKw1RAd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NUprYLstfnOdaNraoLXwZV3SIDrTPITRlGGmic3QlRFkqn2s8nXD2A>
 <xmx:NUprYMbmFiF0tz54C7oID-TH0h6pubkcdymnyBK52mlU9ek98vWSIg>
 <xmx:NUprYKbq4Vjh3DcNtqShNh95cl_G-2e6JA69P5WdiGeFztzc8ZVKcQ>
 <xmx:NUprYPO1SBnrhBdrFZcl7-QhVhrgZO_ySoiYzoHZatvMvaDPB4pKrQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDB711080068;
 Mon,  5 Apr 2021 13:34:42 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 2/2] hw/block/nvme: expose 'bootindex' property
Date: Mon,  5 Apr 2021 19:34:35 +0200
Message-Id: <20210405173435.36486-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405173435.36486-1-its@irrelevant.dk>
References: <20210405173435.36486-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Joelle van Dyne <j@getutm.app>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

The check for `n->namespace.blkconf.blk` always fails because
this is in the initialization function.

Signed-off-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 08c204d46c43..7244534a89e9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -6328,11 +6328,9 @@ static void nvme_instance_init(Object *obj)
 {
     NvmeCtrl *n = NVME(obj);
 
-    if (n->namespace.blkconf.blk) {
-        device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
-                                      "bootindex", "/namespace@1,0",
-                                      DEVICE(obj));
-    }
+    device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
+                                  "bootindex", "/namespace@1,0",
+                                  DEVICE(obj));
 
     object_property_add(obj, "smart_critical_warning", "uint8",
                         nvme_get_smart_warning,
-- 
2.31.1


