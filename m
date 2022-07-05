Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7425677BB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:26:13 +0200 (CEST)
Received: from localhost ([::1]:45972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8oBY-0008GO-H8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o0I-00020h-P2; Tue, 05 Jul 2022 15:14:34 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o03-00017G-82; Tue, 05 Jul 2022 15:14:34 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F8CD580342;
 Tue,  5 Jul 2022 15:14:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Jul 2022 15:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048458; x=1657052058; bh=lZ
 uqub4ThUWL0quzvaaMyTM7ejNi1VqAGjh1FQiCuMQ=; b=4ThoW56wv7OdQ9II1R
 alTFbq0wVbdNvJV7xdisfHozaCpdxpulToU4bQ6cLnw/UQVPMCX4nNv0483HqHtX
 0kpm8FI0GNKgFgpVCjI3X/p/cZ8iJASjwplBoFmKWz1qxdwpBa0W6FD0jgdSjJQT
 NqDtxnpvPatRBdSZK3B+KruTB5LYQFWkh6qRWBpXnwJdICo24fd6u8FrJDhsmvL9
 c8l6XYZd+m6yhhVfCH25ZAUJkWE4EUdzfSGDWZM+n5UwEevmYR5ORPnqioumUkzX
 d+uc04wRgq3QDAe/rgb/fG+aGXJ+1r1JA8v3BLEG+2vjKe9nYfNfgbowQoepFMCt
 3UdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048458; x=1657052058; bh=lZu
 qub4ThUWL0quzvaaMyTM7ejNi1VqAGjh1FQiCuMQ=; b=lsxrnNLQtWn0ddJwuqk
 BtJSzyHCYtmQAWDdFMuCX3fnDw2h00MpDGJ3Bhqhvz6RyF8xbDCmXpzEOev4m1m8
 UTXIVUIr4Luz/wakSOzGqHyIn94/LL1KVJg+WRq61kR/gk1bNLQaXfooOF0Pzn1T
 H1zpWtXlmKtUXbOxeJNFGB1+rKzb5XMW3rgPUzvbs39V7jX+QxAL1nOSUjoY6raR
 R/7oOoDzfL1SWCT3Vtuedb0qew7z3mty/5XjSN+VRk48K9aFsrtmH4HuHZJHNNS8
 krW4qHzhtN+H1pW1sg/oc7B3C6ALjMH4FGwhbLA6WlusDc+fIqXFlNGb5El1BsDh
 GCg==
X-ME-Sender: <xms:io3EYuRsqa5b4YPC4WJiQulGi7xhOHZFYTMeeyNswvG5BEuFjJv3vA>
 <xme:io3EYjxRHvg4UTkLaNa19GA98l1vm9mKBVd6HZcz08KF9IaONlV4fx4U26yYyun2Q
 8noiXusXdIjuuckhmQ>
X-ME-Received: <xmr:io3EYr3WlMSaNTz7jboVUnMr3UmVrx2Uk_xy31ZXuNNJG6lQGvBwSMOJ1THKFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpedvgffhgfekheehgeeguedvfeethfeifeelfffgueevudeuiefgffffvd
 ejveefleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
 vgepudenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:io3EYqCobI3Hggd4jzHtdMZvgr5kEtW8Asd07WDVBHhQlp1DHPho-w>
 <xmx:io3EYnhQh0ZA3c3vuVqK1lnQrWudMjZ66sGcLCMzjuEr_QsLkLArgA>
 <xmx:io3EYmqvb1n1PncOno0b4ukhvYJj0CU16RevH1bBqh5ukruaZB0XbQ>
 <xmx:io3EYta3ZTcRaoHm-vz-y3jV9YN-IRgKakFpuntqqXDv6VofodvLzw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:17 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] aspeed: Add AST1030 (BIC) to fby35
Date: Tue,  5 Jul 2022 12:13:59 -0700
Message-Id: <20220705191400.41632-9-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

With the BIC, the easiest way to run everything is to create two pty's
for each SoC and reserve stdin/stdout for the monitor:

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
    qemu-system-arm -machine fby35 \
        -drive file=fby35.mtd,format=raw,if=mtd \
        -device loader,file=fby35.mtd,addr=0,cpu-num=0 \
        -serial pty -serial pty -serial mon:stdio -display none -S

    screen /dev/ttys0
    screen /dev/ttys1
    (qemu) c

This commit only adds the the first server board's Bridge IC, but in the
future we'll try to include the other three server board Bridge IC's
too.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/fby35.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index d3edfa3b10..031602800f 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -11,7 +11,9 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 #include "hw/boards.h"
+#include "hw/qdev-clock.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/arm/boot.h"
 
 #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
 OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
@@ -22,8 +24,11 @@ struct Fby35State {
     MemoryRegion bmc_memory;
     MemoryRegion bmc_dram;
     MemoryRegion bmc_boot_rom;
+    MemoryRegion bic_memory;
+    Clock *bic_sysclk;
 
     AspeedSoCState bmc;
+    AspeedSoCState bic;
 
     bool mmio_exec;
 };
@@ -110,11 +115,31 @@ static void fby35_bmc_init(Fby35State *s)
     }
 }
 
+static void fby35_bic_init(Fby35State *s)
+{
+    s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
+    clock_set_hz(s->bic_sysclk, 200000000ULL);
+
+    memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
+
+    object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
+    qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
+    object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
+                             &error_abort);
+    aspeed_soc_uart_set_chr(&s->bic, ASPEED_DEV_UART5, serial_hd(1));
+    qdev_realize(DEVICE(&s->bic), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&s->bic.fmc, "sst25vf032b", 2, 2);
+    aspeed_board_init_flashes(&s->bic.spi[0], "sst25vf032b", 2, 4);
+    aspeed_board_init_flashes(&s->bic.spi[1], "sst25vf032b", 2, 6);
+}
+
 static void fby35_init(MachineState *machine)
 {
     Fby35State *s = FBY35(machine);
 
     fby35_bmc_init(s);
+    fby35_bic_init(s);
 }
 
 
@@ -141,7 +166,7 @@ static void fby35_class_init(ObjectClass *oc, void *data)
     mc->init = fby35_init;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
+    mc->min_cpus = mc->max_cpus = mc->default_cpus = 3;
 
     object_class_property_add_bool(oc, "execute-in-place",
                                    fby35_get_mmio_exec,
-- 
2.37.0


