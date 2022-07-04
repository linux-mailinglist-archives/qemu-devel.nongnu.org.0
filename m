Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA44565F4A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 00:01:35 +0200 (CEST)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8U8M-0004KV-Gz
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 18:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U29-0003gT-4B; Mon, 04 Jul 2022 17:55:09 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:39177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8U27-0000LI-CP; Mon, 04 Jul 2022 17:55:08 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 989FE580FDE;
 Mon,  4 Jul 2022 17:55:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 04 Jul 2022 17:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656971706; x=
 1656975306; bh=nUTitRz1TxZmUf62qy6RkmAW6MN3XsO2koccG7mGFHk=; b=b
 sDYXh/CJgt9lp2+s3DDRJMwplt8vGpWVrwQITzQV5d5fnaUR9+ynBJ/DDBiVfuAf
 N3Ymqw5Wc3JR8N1SvzYE5IMgXJlOm84/AVud2r1Qs/CKw05H3o0+EQ+A+chlH83z
 gi2h62KsRV9y1XgM5KHZtYVaUApMdD5Gz9zzJX72IoTlhi7KM4PolPfTF5VnOo5m
 /YTlqEscSdrizuGYzPfCL4OKHQeQlEimlfmd2N1OxiGpVhvsppgE0YMmQeTZgY4D
 QG5B/g2UxJGb4fCoG4hQ0jJLsXhTFHcBUGnfLJtoULCTAF+19dLmywYPWcZqII71
 ndSMK5THjBYrIeYSazpkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656971706; x=1656975306; bh=nUTitRz1TxZmUf62qy6RkmAW6MN3XsO2koc
 cG7mGFHk=; b=Fg5unATpmgDDkuIdg8RD3z/0QBLhzI/eMUrl90BpGjsSLZarcOx
 CIAYmkMFUgL8C/lucNktSVloyWxn1iDKCR2VjIzygB8OgYMkHNVNnks09w2peUFn
 lJ0s8y/ahH5oSfCtD1mJi3nNKwjyiKjview8Ljg3lMaqHwIFX3adC7PLKfJBJHn9
 78je2RGqGcOpVHWGZ2k9eDx6L+o2G/b9bN1SP5VV7Er8wXoeapg059BVNsoiwkZQ
 LIvytZQSQCSokJPmCbO85ACU0Hz5PgVByFpmPSwcqqmqIqDrsH38Rk9zoJ+rT7ia
 L0ykmr/fNncitrOz7vJ3rKEa4C9ONF7V+aw==
X-ME-Sender: <xms:umHDYvuqZSXmL1P0zHSjSdoMFlpKyeNn4994Ax5L4YHsynhaaSJwFA>
 <xme:umHDYgdrQdUcqH91E9YhxGCs32wWUoOxCJVs-NprcFI4fLRk0yxR0qYxnvQquj9rG
 gMV4jtAUvbYoQI-SKE>
X-ME-Received: <xmr:umHDYiw010aR8X_anC0V7Zf3v5afYV-AIufUHdCPdwesEco-ht6PekyHWk707g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeitdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenmhhish
 hsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludehmdenucfj
 ughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheprfgvthgvrh
 cuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrthht
 vghrnhepkedtiefhkeffheegveevgeelteffleehhedvgeekkefffeegvdevfeevieevje
 einecuffhomhgrihhnpehmvghtrgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:umHDYuMq9Aetdi-gOdL3DiGQYOefl7C7a6ejpGX3grJ0AEpCKj8ZNQ>
 <xmx:umHDYv_4BWE_JI-2OUHHWeO2FjfnbkNgLi-02_RLQbnjzKK96kMKDw>
 <xmx:umHDYuW6OtvDtw4ziu5zmKmqpZ2vsJEUVrPt_LgpkH8PvsAJylGugA>
 <xmx:umHDYqkW1OtVUaWwJHrpSvhOOzs9RZ_Y4_7OBEAnUE8yBcLWq2I2Jg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 17:55:05 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 5/8] aspeed: Add fby35 skeleton
Date: Mon,  4 Jul 2022 14:54:54 -0700
Message-Id: <20220704215457.38332-5-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704215457.38332-1-peter@pjd.dev>
References: <20220704215457.38332-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS        |  1 +
 hw/arm/fby35.c     | 39 +++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build |  3 ++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fby35.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d9378511b7..147330ddd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
+F: hw/arm/fby35.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
new file mode 100644
index 0000000000..03b458584c
--- /dev/null
+++ b/hw/arm/fby35.c
@@ -0,0 +1,39 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+
+#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
+OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
+
+struct Fby35State {
+    MachineState parent_obj;
+};
+
+static void fby35_init(MachineState *machine)
+{
+}
+
+static void fby35_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Meta Platforms fby35";
+    mc->init = fby35_init;
+}
+
+static const TypeInfo fby35_types[] = {
+    {
+        .name = MACHINE_TYPE_NAME("fby35"),
+        .parent = TYPE_MACHINE,
+        .class_init = fby35_class_init,
+        .instance_size = sizeof(Fby35State),
+    },
+};
+
+DEFINE_TYPES(fby35_types);
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 2d8381339c..92f9f6e000 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
   'aspeed.c',
   'aspeed_ast2600.c',
-  'aspeed_ast10x0.c'))
+  'aspeed_ast10x0.c',
+  'fby35.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
 arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-- 
2.37.0


