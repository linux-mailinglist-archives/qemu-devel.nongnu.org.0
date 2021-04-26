Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB436AB42
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:49:09 +0200 (CEST)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lasFA-0002zH-3t
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1lasEH-0002Z3-Rr
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 23:48:13 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1lasEE-000241-IB
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 23:48:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A8B65C0078;
 Sun, 25 Apr 2021 23:48:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 25 Apr 2021 23:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=g3BlWP
 aDuhYbF02cJ6YoeePymT94Qfj0PRakYSq2bxw=; b=PNBptw/QQT8lCwmC0Mn/o0
 xXYNhh9jv65KPbHvD6qTPe+3198OwdipKkpiJhJaFghdoxKL2rXg82/2nARlMIQD
 61z92iBLJlkKE5OC4JPod/cSwFCMLVUPJ2tltu+7VK03Dk95ofXGiJBCK1DPOCHa
 mk+PTlUqfi+Ioyc9432cWeQe/8eHOYVTfclhk1LuJlQtvvxRL7BtQ94tZ1/Cw9dI
 wIuArOMXXsN0MHlbV0fSRLfgACsFL6HI5EV5eKxxilAoWihwKAn+qhLhqyEM8wC2
 3C8Dw2MugKJR+y0F4jhQx68HuqYh/KNe+T1yJ+q5QLmbTi8v33nqQ5YSsprVVK3A
 ==
X-ME-Sender: <xms:-DeGYKtwHWCTAFZvSuVHKhdBl4W7TCXpvZ59rEirOvjbPECRlwYDMg>
 <xme:-DeGYPe2XM_IRdHwR-jf9F3QuZ8M47WiYqrzbN3cGhF4txjcq9XPTSpr4FP7KXCbi
 yjZKmPkFOo6Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddujedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtghogfesthekre
 dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
 khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
 eqnecuggftrfgrthhtvghrnhephefhfeetueelvddvtedttdevieeluedtvedtfeejieel
 hedutdeuheduieejgfegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheple
 durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
 homh
X-ME-Proxy: <xmx:-DeGYFwp8Gv-mQfG9HsP2DIaCapDgasBkUij_-MKuh2S_A9oDD7gFw>
 <xmx:-DeGYFOwHegGMcKXwH3B9cytPLXUJti4d2zZkKxXkdDOS7Kx4kJTZw>
 <xmx:-DeGYK9p1kNEy35qL_JRyEK8OWzHoiMm5IuRLOyb1t_VkCOmMy7Sxw>
 <xmx:-DeGYLIxDpt0H1Ujid8eyf3LaL3PjbaT95R7DGAEqQUAze_McSEWbA>
Received: from localhost.localdomain (ip5b434f04.dynamic.kabel-deutschland.de
 [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6E71240057;
 Sun, 25 Apr 2021 23:48:07 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386: load kernel on xen using DMA
Date: Mon, 26 Apr 2021 05:47:10 +0200
Message-Id: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=66.111.4.26;
 envelope-from=marmarek@invisiblethingslab.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kernel on Xen is loaded via fw_cfg. Previously it used non-DMA version,
which loaded the kernel (and initramfs) byte by byte. Change this
to DMA, to load in bigger chunks.
This change alone reduces load time of a (big) kernel+initramfs from
~10s down to below 1s.

This change was suggested initially here:
https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
Apparently this alone is already enough to get massive speedup.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/i386/pc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a03..14e43d4da4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -839,7 +839,8 @@ void xen_load_linux(PCMachineState *pcms)
 
     assert(MACHINE(pcms)->kernel_filename != NULL);
 
-    fw_cfg = fw_cfg_init_io(FW_CFG_IO_BASE);
+    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
+                                &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     rom_set_fw(fw_cfg);
 
-- 
2.26.3


