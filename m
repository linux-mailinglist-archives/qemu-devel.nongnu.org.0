Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED460AF0C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:28:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyYg-0004Pt-Kx; Mon, 24 Oct 2022 10:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omyYQ-0004Pc-93
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:35:50 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omyYO-0007n0-PA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:35:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5426D320095F;
 Mon, 24 Oct 2022 10:35:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Oct 2022 10:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1666622145; x=1666708545; bh=B6bxT9nYD31f9UnjEK4BdpiAd
 z0/FssNkxPmslOHOww=; b=QVaZl6FEolJkOWkEoN1t6g+nAeVIdmz+ROy5wDJda
 VA02nxrknhDA4UQgUHlswAnG0Q5lJFQPq5gWcS0Vpe9ZGWic1NFLP/ic1IKmvZGn
 YxudxkwDONx/WZtY+PuocdejWNRUjflPaT6yBnkxYif+woX6PDKHj2PehvcwCuwQ
 Q8nmuOqXwBpuYxzHp0G3BSPW9UdAw7ehGeUoqTIMKhH89uHjbwz1nJ1O4v+AtWXm
 FUvdXdaQq6aVENGJHQtt6hzUslshL6ZETKJK0wv7TbLlvi64Jp1vW7ocDwhiF/8h
 5ct6yfiu2mBXY0eOsuVLLOu0Ti7GisJL4j7xkcaD/V0fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666622145; x=1666708545; bh=B6bxT9nYD31f9UnjEK4BdpiAdz0/FssNkxP
 mslOHOww=; b=ty+ZCncRZrrchpywgRmnt1JS+Wo+jOYKgRrdlThp2A5PRDRa8Ga
 nKdZezF8AcVOhO6R/aR0Ui5gKluDfHC7ePV+5kFMFcpi/lGQlwykHJkKvhIy09gT
 P/vggduW6yOADPoe5Grp/9wK2G4nck8w6tn25UkJ35Rc1MTEojlurQ46C/SECuya
 lrSg4RsMrKYC/wCcdv7OC5WYwsZ6ToCfW0flzyye5U5PkYdwLNADtMQG+vZcsEg2
 Rcb7dgUOICol5XPegtPqgqeduXyAJx82cOsHgJWsaCkICWH9m6o9P6n2J3OaC/Tz
 9mqrP1xsb0gL2YzY2P8Z4AEgE3aPcpt4eag==
X-ME-Sender: <xms:waJWYyzfXLDTD08F48kE-VoDp3yf4ghZzJVF73vgicLeKiiaQqOJUg>
 <xme:waJWY-SpkrSzI0ia-aUAFvGkSJQb2PZVMzrtbUPRQ985RRh2oeYE5rmmIHXBI-55o
 xlU_UykTs5fWqaOTCU>
X-ME-Received: <xmr:waJWY0WGpfTf_w-FtRW8A0g8v9ruBwegU8oIB4F3HTQEuAggnwYqcVILgI6F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:waJWY4iVm8ONFBnbv-p1o3VPsXuS7lSitgN3uTQ3YFmdrezV2QF3ZA>
 <xmx:waJWY0CfOhe_OnmZ-Srt027b2UWxqrKPGXKVXEntCwsYKTd8QvYw3A>
 <xmx:waJWY5Lq714Q0T-h3hoYK_Lkl6VxYQnPwOUGwJ8vQSjF-WXPnP0Vug>
 <xmx:waJWY97J7AgJx_Um4IkKRRzDzK8TDwl_FDtDcIVf44RzVexCaN9BuA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 10:35:45 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] hw/mips/boston: Don't set link_up for xilinx-pcie
Date: Mon, 24 Oct 2022 15:35:40 +0100
Message-Id: <20221024143540.97545-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PCIe port 0 and 1 had link_up set as false previously,
that makes those two ports effectively useless. It can
be annoying for users to find that the device they plug
on those buses won't work at all.

As link_up is true by default, just don't set it again in
boston platform code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..aa7942bbc0 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -424,7 +424,7 @@ static inline XilinxPCIEHost *
 xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
                  hwaddr cfg_base, uint64_t cfg_size,
                  hwaddr mmio_base, uint64_t mmio_size,
-                 qemu_irq irq, bool link_up)
+                 qemu_irq irq)
 {
     DeviceState *dev;
     MemoryRegion *cfg, *mmio;
@@ -436,7 +436,6 @@ xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
     qdev_prop_set_uint64(dev, "cfg_size", cfg_size);
     qdev_prop_set_uint64(dev, "mmio_base", mmio_base);
     qdev_prop_set_uint64(dev, "mmio_size", mmio_size);
-    qdev_prop_set_bit(dev, "link_up", link_up);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -729,21 +728,21 @@ static void boston_mach_init(MachineState *machine)
                      boston_memmap[BOSTON_PCIE0].size,
                      boston_memmap[BOSTON_PCIE0_MMIO].base,
                      boston_memmap[BOSTON_PCIE0_MMIO].size,
-                     get_cps_irq(&s->cps, 2), false);
+                     get_cps_irq(&s->cps, 2));
 
     xilinx_pcie_init(sys_mem, 1,
                      boston_memmap[BOSTON_PCIE1].base,
                      boston_memmap[BOSTON_PCIE1].size,
                      boston_memmap[BOSTON_PCIE1_MMIO].base,
                      boston_memmap[BOSTON_PCIE1_MMIO].size,
-                     get_cps_irq(&s->cps, 1), false);
+                     get_cps_irq(&s->cps, 1));
 
     pcie2 = xilinx_pcie_init(sys_mem, 2,
                              boston_memmap[BOSTON_PCIE2].base,
                              boston_memmap[BOSTON_PCIE2].size,
                              boston_memmap[BOSTON_PCIE2_MMIO].base,
                              boston_memmap[BOSTON_PCIE2_MMIO].size,
-                             get_cps_irq(&s->cps, 0), true);
+                             get_cps_irq(&s->cps, 0));
 
     platreg = g_new(MemoryRegion, 1);
     memory_region_init_io(platreg, NULL, &boston_platreg_ops, s,
-- 
2.37.1 (Apple Git-137.1)


