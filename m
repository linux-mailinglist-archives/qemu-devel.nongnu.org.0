Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB556107D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 07:13:17 +0200 (CEST)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mUN-0001do-Tn
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 01:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mAB-0003Qk-6U; Thu, 30 Jun 2022 00:52:23 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:60167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mA6-000737-Ag; Thu, 30 Jun 2022 00:52:22 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0AACF2B058FA;
 Thu, 30 Jun 2022 00:52:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 00:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564735; x=1656568335; bh=gy
 g2RNC50wimjfzibmXXr3OYmVTc/sRE8Mv6uRfLhMk=; b=0bSGFMw4ZzuqcQnXKW
 WkF+kqeVUsfldq5Ac0CXX0wEmzgvatHP9gXImTRBPE/XoFPVebINmb9yXfbtB3fi
 nHUnb6zK+sV7tsHn6Wd3QsIHrQoiD+6CNdf/BUdX0gIQn+7Nk4AJfscQSUC/c16e
 MaL9IOucWOHJTw4DTau3R3iXbiy/96q7c8lU75fhQ64upbioF6LviUUe1vQyBaIs
 gU3LoaqukkVOky+foRxBQ+OLyVbZXjbFYj5bzoHU2wxRL65THW6+iia9t9GHsEBt
 5i3q9G2sAVG5YeAKFuTMn4cWnBYFhyfnCjOkdruE6ClM5xpwKU0LOFxhYK7MCGe6
 DsAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564735; x=1656568335; bh=gyg
 2RNC50wimjfzibmXXr3OYmVTc/sRE8Mv6uRfLhMk=; b=dPQgGv17xQCuApn/v7Y
 kqkrVenG7cNr4hQL0snutkNvShMPXicxbOo8Q8S3hEN1fUticQkBzDgnEAB4Fpov
 lHCLOJ5X+FhPuwGgl+3oYV0yK5sMaBKvKKMOSOKt/lR3b5oQWlgAXYapL3MQ34Q9
 wAuwYlP8ispFL/Xf5oPy+a88f8Y5AqtcDqZt11akF0sQCjr6eSvMYolRKKI2zIda
 gkIAqwOTby1kVtm9dq8G6AopoOQNTE7O1g2ahED2Gy8ZY4exCcg1e8lRUFxHgimp
 D9ky8qFTZ03kxNcprpxksbFtTFnab1LYmoOkjnQK8ykwR0WeNSIjyi3jhD1RRA3f
 IkQ==
X-ME-Sender: <xms:_yu9Ys2pgkAq9yhbO86BNLTAdS4gzoIAzldG7i5lNuYFn9I02cN5mg>
 <xme:_yu9YnGWInN5VQrJWGPMpOnNl06var7od9SVI4m0jBWdw5RnNQmOPfvrBl_RjCG85
 -DqFIA3T0L75outylY>
X-ME-Received: <xmr:_yu9Yk7sb75-xcRcQ9CrHLoSCSlm0uj_V9DypUHoz_edbXJ2tGupVME2T0BaM4vrtjpMt84NEGvng5WFL5hZw4N_JI_uqudZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpedvvddvvdeikeetuddtteejleeuudehuddvtedtheetvefhtdeifeeguefgtdeg
 udenucffohhmrghinhepmhgvthgrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:_yu9Yl0dwWT3qXF4Pb7wBaQAAOb1wX-gS8SGvoA5gWjgGKsS-hxqSg>
 <xmx:_yu9YvHSmlqFeXc0e5O_gGK4mMb-pfqpqPgg5wppYC2ZHEZ_5bIjCA>
 <xmx:_yu9Yu_ygqKDZe-4xHnYNRYNBnQi3KtHPhsaEQKOlOeDZqutzHw0yQ>
 <xmx:_yu9YlaESsUTlMSImfmD6x5D2u15py41BlnKasH1Y-Gc9CnUN4uUOtO1Ftw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:14 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 12/14] hw/misc/aspeed: Add fby35-sb-cpld
Date: Wed, 29 Jun 2022 21:51:31 -0700
Message-Id: <20220630045133.32251-13-me@pjd.dev>
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

fby35 machines have 1 BMC on a baseboard and 2-4 server boards with BIC's.
There are also CPLD's on each of the boards, one type of CPLD on the
baseboard and another type on each of the server boards. This commit adds an
implementation of some of the logic performed by the server board CPLD,
which is connected to the server board BIC.

fby35 machines have 1 baseboard with a BMC (AST2600) and 4 server boards
with bridge interconnects (BIC's, AST1030's). Each server board has a CPLD
on it which provides FRU information and some synchronization functionality
with the BMC. The baseboard also has one CPLD, but it does other stuff.

This commit just adds some of the FRU functionality to allow the BIC to
startup without any errors.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 MAINTAINERS             |   1 +
 hw/misc/fby35_sb_cpld.c | 128 ++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build     |   3 +-
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/fby35_sb_cpld.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 05cf84b58c..3ffd473db1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
+F: hw/misc/fby35_sb_cpld.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/misc/fby35_sb_cpld.c b/hw/misc/fby35_sb_cpld.c
new file mode 100644
index 0000000000..f170a6c781
--- /dev/null
+++ b/hw/misc/fby35_sb_cpld.c
@@ -0,0 +1,128 @@
+/*
+ * fby35 Server Board CPLD
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/i2c/i2c.h"
+#include "hw/registerfields.h"
+
+#define BOARD_ID_CLASS1 0b0000
+#define BOARD_ID_CLASS2 0b0001
+
+#define TYPE_FBY35_SB_CPLD "fby35-sb-cpld"
+OBJECT_DECLARE_SIMPLE_TYPE(Fby35SbCpldState, FBY35_SB_CPLD);
+
+REG8(CLASS_TYPE, 0x5);
+    FIELD(CLASS_TYPE, RESERVED, 0, 2);
+    FIELD(CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 2, 1);
+    FIELD(CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 3, 1);
+    FIELD(CLASS_TYPE, BOARD_ID, 4, 4);
+REG8(BOARD_REVISION, 0x8);
+    FIELD(BOARD_REVISION, VALUE, 0, 4);
+    FIELD(BOARD_REVISION, RESERVED, 4, 4);
+
+struct Fby35SbCpldState {
+    I2CSlave parent_obj;
+
+    uint8_t target_reg;
+    uint32_t regs[10];
+};
+
+static void fby35_sb_cpld_realize(DeviceState *dev, Error **errp)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->target_reg = 0;
+
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, BOARD_ID, 0b0000);
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 1);
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 1);
+    ARRAY_FIELD_DP32(s->regs, BOARD_REVISION, VALUE, 0x1);
+}
+
+static int fby35_sb_cpld_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        break;
+    case I2C_START_SEND:
+        s->target_reg = 0;
+        break;
+    case I2C_START_SEND_ASYNC:
+    case I2C_FINISH:
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t fby35_sb_cpld_i2c_recv(I2CSlave *i2c)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
+
+    switch (s->target_reg) {
+    case R_CLASS_TYPE:
+    case R_BOARD_REVISION:
+        return s->regs[s->target_reg];
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Register read unimplemented: 0x%02x\n",
+                      __func__, s->target_reg);
+        return 0xff;
+    }
+}
+
+static int fby35_sb_cpld_i2c_send(I2CSlave *i2c, uint8_t data)
+{
+    Fby35SbCpldState *s = FBY35_SB_CPLD(i2c);
+
+    if (s->target_reg == 0) {
+        s->target_reg = data;
+        return 0;
+    }
+
+    switch (s->target_reg) {
+    case R_CLASS_TYPE:
+    case R_BOARD_REVISION:
+        s->regs[s->target_reg] = data;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Register write unimplemented: 0x%02x 0x%02x\n",
+                      __func__, s->target_reg, data);
+        break;
+    }
+
+    return 0;
+}
+
+static void fby35_sb_cpld_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
+
+    dc->realize = fby35_sb_cpld_realize;
+    i2c->event = fby35_sb_cpld_i2c_event;
+    i2c->recv = fby35_sb_cpld_i2c_recv;
+    i2c->send = fby35_sb_cpld_i2c_send;
+}
+
+static const TypeInfo types[] = {
+    {
+        .name = TYPE_FBY35_SB_CPLD,
+        .parent = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(Fby35SbCpldState),
+        .class_init = fby35_sb_cpld_class_init,
+    },
+};
+
+DEFINE_TYPES(types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..948e25c440 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -117,7 +117,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
-  'aspeed_peci.c'))
+  'aspeed_peci.c',
+  'fby35_sb_cpld.c'))
 
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
-- 
2.37.0


