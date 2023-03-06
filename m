Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A66AC360
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:35:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBvM-0006Q5-P4; Mon, 06 Mar 2023 09:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvI-0006OO-8W; Mon, 06 Mar 2023 09:34:46 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvG-0005UM-7H; Mon, 06 Mar 2023 09:34:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 321B85C0277;
 Mon,  6 Mar 2023 09:34:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 06 Mar 2023 09:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678113281; x=
 1678199681; bh=AoJcLbOjjsqShe+hmnUOhuScOjXiV9Lpwp3DsSQHk+o=; b=K
 Prd1LIPxrx6jVaUFJTESSaIJKH0dIYcp0anlfbyV7s3H/RORfsjybXiOYbcGq0ob
 0TLYBdrvOwh5tJNuHwh1U4B6kSu8pofNzvW/IStFaCoyZCEvIjWPFibh9Xgql5zj
 3559+mhGvQHIZmTA332Hcd2opAARLckSwrD40VJ9PlweELs3Py4b7s2uTUeQ12lg
 2SaNSw5tahiAzn7C7sHoadMkj2A+gJ+MGor2Xdiil1jLARIgKWehHiqoRW3A+Ca2
 j+BMXslXNzA6HOJB6ZLaKb7IyzVXsdfVsjw9ceONIfA0/q5JNp9qOh6aDV5yb9dk
 jtJRwwlnAdZurZDql9h9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678113281; x=
 1678199681; bh=AoJcLbOjjsqShe+hmnUOhuScOjXiV9Lpwp3DsSQHk+o=; b=p
 fe0IcdwqhEJgqA2BsyzOc5aEXSRHTEFFpX2LItLkQKdixYqvVWo/mgdOkIVggMP9
 +dYxyLHU4xC6b3zCn5PpOd5mqPCgrOZ0hHpqoewNge8DjOxcAERn+TnwHBaFglwg
 lGpHbvnSRAZM3a+iFgvJ98ktk1ndVvJoF/FJHzbSKMzC7a7HGg+6KFkOOrW9UuTC
 jU2fHI9cDnQgziZ0z8De1MuHgX0hmzm4GocDxdFVVtm9POSX3AeSRbIhiPb1d3HT
 /Rbhjdtmsiuet9u0YHhaYBlDifNyuTjaXKHUFe+uifrCmiXsx/415p1yEXPW9YOM
 jFiwf5iytL6I1U0YWhOBQ==
X-ME-Sender: <xms:AfoFZHmQnknfje4rLVhJrFwBOeyOQYNL7zMZWAWw7xF8_crAhzgxsA>
 <xme:AfoFZK1V0jMNDPCm7Lh5lMnpcTln8zji5syCxPN1wwYH001J3hkVUjPcdRbnzW66p
 59dcV3rshyJ2c26Zb0>
X-ME-Received: <xmr:AfoFZNpAZAIT6i5hh9VHKZ8GWaXVMkI09LVE207LhLLp-jJ7Yj3sMuZYxAigcbofQA6dxi4SGB90XTcOiP80seGfMAl341sXxvlovbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AfoFZPnkzjBaNbubP8KBlCoXoSD33a35OQNkcN2tzBX8o5myB0Sc1Q>
 <xmx:AfoFZF34nun8XHPbLAy49XPB-JtfH1bVgGQI1_qLytKA-CY-AVfl5A>
 <xmx:AfoFZOvpdWhICcQBkUT3dvP8fAPxuvV9MTA8F-l57C1dv9xUFH5mgA>
 <xmx:AfoFZOtb2Ik238NvyYIiwVOZdRbruXjfHnRfd9r1wSvb2-3ylafAjA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 09:34:39 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Joel Granados <j.granados@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 1/5] hw/nvme: move adjustment of data_units{read,written}
Date: Mon,  6 Mar 2023 15:34:29 +0100
Message-Id: <20230306143433.10351-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306143433.10351-1-its@irrelevant.dk>
References: <20230306143433.10351-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=k.jensen@samsung.com;
 h=from:subject; bh=KpSFv221ENOzRh4hLzCplOfU3hk5j+akPNWluv6GEyc=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQF+fiWOZTclcfhdnIIamhZbT88tj47gIF4n
 SCODl/pCV2f9IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkBfn4AAoJEE3hrzFt
 Tw3pmbsH/1w7Pq7wcV9Lr4/trsbDGAqdAxMcCWKGASDFM1mUto68QMODdgysf+jEbn4jzJ3b/o2
 UsMz69IWNOdaePS5/5VO5HO8J1/MbQ4pshGIrKwWjh9S+LY3lzr+OkMt4SgAhaYAgkseOQmE6y2
 hs49kfQC91bezbHvWNnyY3MyMVFig0C9NpHLjBTj54wWKRXwOqMOj8rkIuBLXJPCLuotop5nbVS
 OCHXm/X+JfTKCpR24lsc4mJe++949vh17OdrmYtOB5YhmNa1SJRM/CumwX7v4gzPB1hze39bBdw
 J2EXDSK/5iL7rpj+NdxlGrWX+0CCh1g45hle1Ad7T9eZ9V6TzE3Y1anR
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joel Granados <j.granados@samsung.com>

Move the rounding of bytes read/written into nvme_smart_log which
reports in units of 512 bytes, rounded up in thousands. This is in
preparation for adding the Endurance Group Information log page which
reports in units of billions, rounded up.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Joel Granados <j.granados@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f25cc2c235e9..99b92ff20b9a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4386,8 +4386,8 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
 {
     BlockAcctStats *s = blk_get_stats(ns->blkconf.blk);
 
-    stats->units_read += s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
-    stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
+    stats->units_read += s->nr_bytes[BLOCK_ACCT_READ];
+    stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE];
     stats->read_commands += s->nr_ops[BLOCK_ACCT_READ];
     stats->write_commands += s->nr_ops[BLOCK_ACCT_WRITE];
 }
@@ -4401,6 +4401,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     uint32_t trans_len;
     NvmeNamespace *ns;
     time_t current_ms;
+    uint64_t u_read, u_written;
 
     if (off >= sizeof(smart)) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -4427,10 +4428,11 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     trans_len = MIN(sizeof(smart) - off, buf_len);
     smart.critical_warning = n->smart_critical_warning;
 
-    smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
-                                                        1000));
-    smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
-                                                           1000));
+    u_read = DIV_ROUND_UP(stats.units_read >> BDRV_SECTOR_BITS, 1000);
+    u_written = DIV_ROUND_UP(stats.units_written >> BDRV_SECTOR_BITS, 1000);
+
+    smart.data_units_read[0] = cpu_to_le64(u_read);
+    smart.data_units_written[0] = cpu_to_le64(u_written);
     smart.host_read_commands[0] = cpu_to_le64(stats.read_commands);
     smart.host_write_commands[0] = cpu_to_le64(stats.write_commands);
 
-- 
2.39.2


