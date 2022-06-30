Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE7561081
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 07:15:52 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mWt-0004us-1l
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 01:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mAJ-0003kN-EA; Thu, 30 Jun 2022 00:52:31 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mAE-00073h-Gz; Thu, 30 Jun 2022 00:52:31 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 318A42B058D5;
 Thu, 30 Jun 2022 00:52:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564742; x=1656568342; bh=PR
 oZqJzJq9oinoMfv7DuvwTQs1e7zNhPFSZgAX+uBLo=; b=O6W8C7o+IMuNUU9Si9
 tQw5qax4OIcliCbsaz62aG03l8VGy/zfT2KBQ8xD2vxhxdScyBAYeKYd3VUZYqCk
 GnVi+Q1Y+jUoUajBaeEr6wytrXYO8Uj6H4V73tGNI2/6j5M32tJovHhRPEueYs0s
 jrP1K7ymsVYYrj90oZqrpZD7ya9dW3Ox6f70/rJF5qX+H8zQBNZMbcfLFfgygLdE
 egcQhrVQgv2dWMAD5LckvFXz1jEnN4us7yEImvHgIpbN7Rgx0f9ofU/2WNT7cIne
 3+m3hljFlKKj7GCYQAlz4o/Ll9klilZeMi3BjQcDvqQvGgYHumYk5HTwtWbz3H1K
 bXNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564742; x=1656568342; bh=PRo
 ZqJzJq9oinoMfv7DuvwTQs1e7zNhPFSZgAX+uBLo=; b=tc+zfyLF7lcIhfcVji2
 Bj6LixnGVBso5B8wSCXYexePNpUeeM1OmQa6xK1iuohGmTeNVSYW0bpKvSQbZnvv
 +L/lZ3Xo4s0GSNQ+Bs7gn3OH25JQAWUQQyu5Mk8/0vfN8Q/ptbf3FOeL8q9xZiPU
 usWp0vXFYfFWia0GPLjuvkMVMTZPwRgILKdOetxlKgZzrcyyUIY4el0SVrx1lKuw
 qtsC4s/tCYX8f/r/DP0LEJsxoGHpyQ12fJy1m6v+Y5mJGE7BXKqk0UY3iRCa8DrG
 hM/Bxk11I9UdpIoiovOxvnBMFiIVfmCTXqra4Z8lUr8NcRc1ZJcU79dpNKCc6LRE
 8cA==
X-ME-Sender: <xms:Biy9YlEKc_SFOtyxKkIy4cKWs6E-fzogLYHQx11ofE58if7kGtwdTA>
 <xme:Biy9YqVG4niezWC9eC3uS7o179hvgKiCbiBl4WQFwOAXUEAWJaHADip4vEW8f7SGu
 tvr74lJsqc4zEgWWn4>
X-ME-Received: <xmr:Biy9YnKqTPGMGl23X3Tu6oKOumG9w3N_OgqY8Iy9pTrTQJyD1XTVlaWZFCQyJ7nmPXi3gKCecteEZhEWfLeRvFQFcQ9kwHD_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeetleevtefgleevleelteekffffvdekheekkeejveegheelveehgeeufffgtdei
 leenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:Biy9YrFqwuBOwlNgUkEZ7_enzdw90u0LIbFXm7QAvfGaljfIiKaLyQ>
 <xmx:Biy9YrU3EnTDWFJDF9R2vZDvRu2mAXzKTkxi_D1OqTga7t7eK92pIw>
 <xmx:Biy9YmPykJttFlQq-PemkI7ooQelk5gcWGR8HZ0iledPkhC8B0R9Yg>
 <xmx:Biy9YnoTIxExOf8ndC3FDd4faBru0Q9a3rcEWNU4DfebHMh273G15r02CV4>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:21 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 14/14] hw/arm/aspeed: Add oby35-cl machine
Date: Wed, 29 Jun 2022 21:51:33 -0700
Message-Id: <20220630045133.32251-15-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
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

From: Peter Delevoryas <pdel@fb.com>

The fby35 machine includes 4 server boards, each of which has a "bridge
interconnect" (BIC). This chip abstracts the pinout for the server board
into a single endpoint that the baseboard management controller (BMC)
can talk to using IPMB.

This commit adds a machine for testing the BIC on the server board. It
runs OpenBIC (https://github.com/facebook/openbic) and the server board
is called CraterLake, so the code name is oby35-cl. There's also a
variant of the baseboard that replaces the BMC with a BIC, but that
machine is not included here.

A test image can be built from https://github.com/facebook/openbic using
the instructions in the README.md to build the meta-facebook/yv35-cl
recipe, or retrieved from my Github:

    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.17.01/Y35BCL.elf

And you can run this machine with the following command:

    qemu-system-arm -machine oby35-cl -nographic -kernel Y35BCL.elf

It should produce output like the following:

    [00:00:00.005,000] <inf> usb_dc_aspeed: select ep[0x81] as IN endpoint
    [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x82] as IN endpoint
    [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x1] as IN endpoint
    [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x2] as IN endpoint
    [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x3] as OUT endpoint
    *** Booting Zephyr OS build v00.01.05  ***
    Hello, welcome to yv35 craterlake 2022.25.1
    BIC class type(class-1), 1ou present status(0), 2ou present status(0), board revision(0x1)
    check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
    [init_drive_type] sensor 0x14 post sensor read failed!

    [init_drive_type] sensor 0x30 post sensor read failed!
    [init_drive_type] sensor 0x39 post sensor read failed!
    ipmi_init
    [set_DC_status] gpio number(15) status(0)
    [set_post_status] gpio number(1) status(1)
    uart:~$ [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44

    [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
    [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
    [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44

    [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
    [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
    uart:~$ BIC Ready

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a06f7c1b62..75971ef2ca 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1429,6 +1429,50 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->macs_mask = 0;
 }
 
+static void oby35_cl_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    I2CBus *i2c[14];
+    I2CBus *ssd[8];
+    int i;
+
+    for (i = 0; i < 14; i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+    get_pca9548_channels(i2c[1], 0x71, ssd);
+
+    i2c_slave_create_simple(i2c[0], "fby35-sb-cpld", 0x21);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
+    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
+    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
+    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
+
+    for (int i = 0; i < 8; i++) {
+        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
+    }
+
+    /*
+     * FIXME: This should actually be the BMC, but both the ME and the BMC
+     * are IPMB endpoints, and the current ME implementation is generic
+     * enough to respond normally to some things.
+     */
+    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
+}
+
+static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
+    amc->i2c_init = oby35_cl_i2c_init;
+}
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1494,6 +1538,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("oby35-cl"),
+        .parent        = MACHINE_TYPE_NAME("ast1030-evb"),
+        .class_init    = aspeed_machine_oby35_cl_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.37.0


