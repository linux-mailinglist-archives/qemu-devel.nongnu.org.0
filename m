Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D984C565F4C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 00:02:19 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8U94-0005nv-Ol
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 18:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U2F-0003tD-5u; Mon, 04 Jul 2022 17:55:18 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U2D-0000MJ-7v; Mon, 04 Jul 2022 17:55:14 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 706FF580FDC;
 Mon,  4 Jul 2022 17:55:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 04 Jul 2022 17:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656971711; x=1656975311; bh=3Q
 leoIU+1JT9mlYnyGHMjE1752p++/xyJu5dhMG40pw=; b=Spg8PmGVK8m/lcVUXu
 ngDv+QT5TqDoeAANXH2sLmHDpZuRHu+nlJZARLZELMqD5O8rEGkSOua/9Eo1nvdk
 0bjdDyrM4K8tyj/VnpxjPbrZO+qeyVbJrwNuSWmbWv79y7XWNHOvhsb4Hd6x9PvS
 yK+O9eoytt3ql4mE99LozFRHM6NH9mQTh0NnBiASjL7sX3lw8DcjFggKU+zlxfy3
 KusKASyAJ5bAWnMD9tYtvwhlavtr3/Df0UZvOBM/b/Hm64wuwwlz9V7bKlY6UQFm
 BtNnI7GoMNdNucETsThfDNnE+zNNyhac0iqlEwMkPXAyqhOaIsRVFGwJmIgY7zj/
 o1IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656971711; x=1656975311; bh=3Ql
 eoIU+1JT9mlYnyGHMjE1752p++/xyJu5dhMG40pw=; b=LfGTVxW0u1zgkXT49Fr
 SyXIawza4tP98y7xjuPa1qLyn50c3VgoY4XtKRhMLHVZFxHXS4sObjk4vOuk2THN
 Nmp8ljywRaByUHL/hy+OAsEsIdKc2THal6RGIeoCmYPwpS1ZChWln95qoaiPdcPw
 Cvjs6IkzMxGNnSwxIs4vcCmp04vxFdK5wQ1AT1UsCaMXjIXeutSqhytXl4epNAqJ
 irvcRf+Y5JpvJ4LSmM11DHbj8+RKyns8CDdjn+gt7YyUc6O4r+/gphf7oznwJUFB
 GUVheR09seJdqmoC6aUKp0w2csdR8sVu6APJhEhN8omhcmWDF6P8i1g175s5HWcO
 Wqg==
X-ME-Sender: <xms:v2HDYoqnNMGLynEpezinUfngNn0-DvXqQ6Z18MCiihWfRI7uZTWizQ>
 <xme:v2HDYuptH_mgvYrDducxytiBxv8weJ_GzenfvbPLodRuK2F0tAbi8J7LRQqSPeeIx
 -VCQk5gcTCR_cl05DY>
X-ME-Received: <xmr:v2HDYtNgOob3EpjDmD1nib2780q5QWxB8gel1ivt3la3dpV1HziJFy_Fcgo3zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenmhhish
 hsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludehmdenucfj
 ughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghruc
 ffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtthgv
 rhhnpedvgffhgfekheehgeeguedvfeethfeifeelfffgueevudeuiefgffffvdejveefle
 enucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgepuden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:v2HDYv43QBvAB7HT-9AqDtAAMGFbpzxTV2qnwpMfmAwr9uMbqRO7MA>
 <xmx:v2HDYn7PEWuZC7IF_kBj-5y0gFMeDTRlBB8D0F02VlXEfQuSBtTyuA>
 <xmx:v2HDYvgoD6Sq40jc9JKOz7X-e-jecWD-hmzN1Nzwyb1BjmRNcTN6Vg>
 <xmx:v2HDYtSI8C0VVdVV0rAzCrAYNUT-bZ4LuKYyXp1E5AWQqUNsFhXPqA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:10 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 8/8] aspeed: Add AST1030 (BIC) to fby35
Date: Mon,  4 Jul 2022 14:54:57 -0700
Message-Id: <20220704215457.38332-8-peter@pjd.dev>
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


