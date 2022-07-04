Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F97565F51
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 00:03:55 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8UAc-0000Ib-UX
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 18:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U2A-0003k0-LM; Mon, 04 Jul 2022 17:55:10 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:49315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U29-0000Lh-0N; Mon, 04 Jul 2022 17:55:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3928C580FE0;
 Mon,  4 Jul 2022 17:55:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 04 Jul 2022 17:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656971708; x=1656975308; bh=e9
 SZDmfo94FT0yn61No+wBgms8HClCR+te1xLFVPLkw=; b=L6D7NTbkr1s2BUImA/
 QwOGy1DK+6382EGhNthACA+poQlbC1YCZvmtJU38+kl3k+yGCWoCGrvTFqhw3Z16
 3qNnqP67YR97nXP1u8DWB9ZFJcKz/Sh50a6GLKFRUlzM15VmCdVqlRIdC/oX8VzH
 y4/4FQUAnbH9cZw5+JiNQBpgd5Yfluzuc625mEYXR70jvGM6W0HLZFsUuC3JkrPW
 AEVy0e6jd4atJdv4Ibijg0gG23BUtxWfORNaaAOqFn4QkBH/iOYvW2nhozX80wVs
 WyUew00UaF2bX2g71xIICFQ+BgABAdliCleKceacoaeqSvC2AE1b3QEecrOvSCLx
 UqQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656971708; x=1656975308; bh=e9S
 ZDmfo94FT0yn61No+wBgms8HClCR+te1xLFVPLkw=; b=aRzWDLdx4R3mLzf2Nc0
 s8tfXjnzlGMVUMF64JiPycp3Mdnd3Yi/upH4rU3ZRznMr7dYpAEQZlTmDsrOQ0W6
 5DP+8yHcvwdbmpFIcz1p7dRxVoJl5jGy5RJSvWH+quV0onRpP7/hGvOSzzFbH0HR
 IlK516qWtxrPibhCmW+qQtWAxGDGoTHwwtO6o/UAt398oSMLmh4nZMmQUAKLoLxf
 FJoXSoxeEDddN55MAdQmflgAg4/s7nBoFiP7LgkazWaT+alf4eQQJNNs0CJ8PPWH
 sJU8Xl0gfA6KimBKYL6FyHjL4L+ztTXktUrLTQ7ZDX6SwkZGp4fGjJIf6KpKmKvG
 j1Q==
X-ME-Sender: <xms:u2HDYp0dJfpTObk8-yp1OzNrAYz49_2fjNmWzUpNZ01NKFk4F7EIOg>
 <xme:u2HDYgHGGpXwikmh-ByRU_x3tzXRSAhH1Ye5anWjF4fpi9rCRRFcxWioj0zgqsEwx
 kUWykut3KQ88mLxCTo>
X-ME-Received: <xmr:u2HDYp6Ml-h2Q3hbM5HDMN3KZOFl48LsX1UHAP9Dm-1VhZFx6QzWTr8UPMcvsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenmhhish
 hsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludehmdenucfj
 ughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghruc
 ffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtthgv
 rhhnpedvgffhgfekheehgeeguedvfeethfeifeelfffgueevudeuiefgffffvdejveefle
 enucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:vGHDYm0_aBu-03L1Ru5S3DMaT4rC3Lmk1vOCzd78pAMb7lc8oatZKg>
 <xmx:vGHDYsGzHo_7MbpEORWof98XxcWcnarslQ94DYPvs4SXdopOCjrSDg>
 <xmx:vGHDYn-LZBoeu1CdEVL7pwyXxHa8Pa_FS6R1yg7_lHLU3DYMIYGT3g>
 <xmx:vGHDYhMl7KOWxF_aBbqTrVPyS3pljWo4L9Y7TvbIqb7lXER2bJufYw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:07 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 6/8] aspeed: Add AST2600 (BMC) to fby35
Date: Mon,  4 Jul 2022 14:54:55 -0700
Message-Id: <20220704215457.38332-6-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704215457.38332-1-peter@pjd.dev>
References: <20220704215457.38332-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You can test booting the BMC with both '-device loader' and '-drive
file'. This is necessary because of how the fb-openbmc boot sequence
works (jump to 0x20000000 after U-Boot SPL).

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
    qemu-system-arm -machine fby35 -nographic \
        -device loader,file=fby35.mtd,addr=0,cpu-num=0 -drive file=fby35.mtd,format=raw,if=mtd

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/fby35.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 03b458584c..5c5224d374 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -6,17 +6,55 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
 #include "hw/boards.h"
+#include "hw/arm/aspeed_soc.h"
 
 #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
 OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
 
 struct Fby35State {
     MachineState parent_obj;
+
+    MemoryRegion bmc_memory;
+    MemoryRegion bmc_dram;
+    MemoryRegion bmc_boot_rom;
+
+    AspeedSoCState bmc;
 };
 
+#define FBY35_BMC_RAM_SIZE (2 * GiB)
+
+static void fby35_bmc_init(Fby35State *s)
+{
+    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
+    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
+                           FBY35_BMC_RAM_SIZE, &error_abort);
+
+    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
+    object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
+                            &error_abort);
+    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
+                             &error_abort);
+    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram),
+                             &error_abort);
+    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0,
+                            &error_abort);
+    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003,
+                            &error_abort);
+    aspeed_soc_uart_set_chr(&s->bmc, ASPEED_DEV_UART5, serial_hd(0));
+    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
+}
+
 static void fby35_init(MachineState *machine)
 {
+    Fby35State *s = FBY35(machine);
+
+    fby35_bmc_init(s);
 }
 
 static void fby35_class_init(ObjectClass *oc, void *data)
@@ -25,6 +63,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Meta Platforms fby35";
     mc->init = fby35_init;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
 }
 
 static const TypeInfo fby35_types[] = {
-- 
2.37.0


