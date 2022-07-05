Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C55677B0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:22:17 +0200 (CEST)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8o7j-0002l7-SR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o03-0001PR-JW; Tue, 05 Jul 2022 15:14:19 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o00-00016f-V4; Tue, 05 Jul 2022 15:14:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 31DED5802FB;
 Tue,  5 Jul 2022 15:14:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 05 Jul 2022 15:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048455; x=1657052055; bh=e9
 SZDmfo94FT0yn61No+wBgms8HClCR+te1xLFVPLkw=; b=ScIxCAxiK0AmpmzStz
 YsaIT7TUicvktZ2cgi5NEDiy22VWxvQehNcmiz9Z5igYJ79+QpnoHIZp9o0C2ZXo
 gJ6/SUbOSN+n7dLtCNpRqo3oiWTfagNvj6kzNOgiE4jU/yeVxJD0bUhrT0sEowDO
 Rl3wJk0SERLSWtyZe5c6pWQITPwJBB1uNfLd3L5+XrSFVYzu6GUONtcvYWsa1Odi
 k3iQNEvZWhRaiA1/uI96/+tqmWchgWe/tTweEPZ6I2jAonavb+/pS2vsca9RHLjH
 udfFbk5gAeE4sLThVbcMdTMJI8BJPThr/6fEJyi5lN2zHbGD+Up+vloUsMF0zZiI
 8oTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048455; x=1657052055; bh=e9S
 ZDmfo94FT0yn61No+wBgms8HClCR+te1xLFVPLkw=; b=trbpu1mJwUiOgVhQMG/
 xfuL3UaeAV6EVeBr6EhhXTUJTQrvZAFzj8mfWEhKzj6+5mjqwKx1OzB2uV+zrvGt
 08WGjpmGQsILqobFt5O1t5ikM34U0N2fNH6A+bZ0X4NUmIfV7BPkhM2XWqiI68aB
 mseale4C09ee51uxRrNJpdOHYPtM9f70lQJ/EQNjQxC6uo4slcDnxMkaLtv9909x
 oFPFBp2QtZ+R5dUPCvD32/vDYgCqjUXxfEAuBCYE+54t1fkF7xU1P8z9OmxnVx98
 aUcx19YBjJtfaRViEeFMjPagyUSKXnhLDSyjIvvC7CN9kcfibFwwVz2Vv/eKOXPs
 rqg==
X-ME-Sender: <xms:ho3EYoGL0-VeOpEv8D54zONCn0_MaYlRm1NawZn_NSQAEA6o6H6Cmw>
 <xme:ho3EYhVoSquVgf7_6Ni8foIFt1Cu8o51FyxnyYzzZj2VtucvoKbAMCpRgrCjD2WbA
 Ah8fJywKEDGJcifXlI>
X-ME-Received: <xmr:ho3EYiKH7ei9SbpjFuxJS1pgBdq4mf_CdhgSgCCYpUZGgVbN0WtElm2_NSL_dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpedvgffhgfekheehgeeguedvfeethfeifeelfffgueevudeuiefgffffvd
 ejveefleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:ho3EYqGBxuhnOase5GYvymuFQ4O40nPvSZlM1C1WlxHJvIy7dLPqZQ>
 <xmx:ho3EYuWbq89AyJSORpmBSvHzm0LYTY0wOVTFsQkxxabLTPhjEy6KGA>
 <xmx:ho3EYtO6I2ghzwGjkijPPUqqVfaTTNcMBAivQISNAAwf3gAxwRmnbw>
 <xmx:h43EYgcRIWSApLQJ6ajRCGZPGEYDwu1PUX7W2sBhOx0TL83kIc-7fQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:14 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] aspeed: Add AST2600 (BMC) to fby35
Date: Tue,  5 Jul 2022 12:13:57 -0700
Message-Id: <20220705191400.41632-7-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
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


