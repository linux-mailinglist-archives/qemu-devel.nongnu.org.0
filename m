Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE3B5677AF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:21:50 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8o7J-0001me-Oh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o01-0001HZ-07; Tue, 05 Jul 2022 15:14:17 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzy-00016M-5W; Tue, 05 Jul 2022 15:14:15 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5DB7D58033E;
 Tue,  5 Jul 2022 15:14:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 05 Jul 2022 15:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657048453; x=
 1657052053; bh=yDKJlSkhbsWjdQEFewxhI4RxzhEQ+vZqzNkyMVEwDYE=; b=A
 WEABDTO3jIqjdeJOuU9VvPNdx+4tcKwp//oSrBifmTJhg90bjZJ8wtZxGvcbNLJu
 0K+GhkDky0OqMEgPcSHzY7T3tzP7IbfejXK0H++c6r9e5JuUvNC8zUguPnemoAMZ
 NDNDmunsX6067rb3/3JzX2Wxay8B9aMhn7+89dHUcON8L97uB4UFkTIXt7qk8csf
 KUZGdJsbxb5ziP56czPdH2UbT5bxlxSUDyUac+MdU68HDFLaXVcDjzKFirHdWqXV
 Kl60lvzOhUGg/2mRetNJ3SHzAqT941XLXGBEPJO6lt3wmRiOczdbnBX6uulbOR1E
 6tpB/dcVIUarg1zZ80P1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1657048453; x=1657052053; bh=yDKJlSkhbsWjdQEFewxhI4RxzhEQ+vZqzNk
 yMVEwDYE=; b=bzKfvhYdiuDa94dGmykkXrneFiQKeR8v7XrXGF9uxNwTWLKu1N2
 o/O7iep/sqaRYiFDHoCYO8RR/mW/O72ngb6VAyvIQV7pfCmpzAhmpMtWsyhVPx+0
 bvybRcXyn9F0v6P5a4oDHcbbpU1XhFaHRjO4sPMy1nvoL+MvSpndOWKviyNtq6R2
 DGXtnmOgAdOm88pIllea3QjGXSmD++BatzAR6WVHKq8O8dzhaNzfO6uAI0jmbDY0
 cPGQyUFS48+FGkmfgL3sDStlTi3TgbfTTPhm4XmxrvUKkfGEO1+w3uIcXf0VkzL/
 QsyK4VN9JPF6JVaE1XYJ+7LoGbbS8+TyogQ==
X-ME-Sender: <xms:hY3EYgbqDSuDDm3cahKO6k2QkLskj2UPSVXhKAAypFIidtycV0xsdg>
 <xme:hY3EYrYkrA6tghLnFBsjxZNQ0xWXy_iuBbsP1c-z9C5dZ6D6xPaY1GuPoVyx_8G8D
 0u-H0HGhLSuIMNRM3w>
X-ME-Received: <xmr:hY3EYq99b4topQhToTECnrbkJpO8xatCYXd8eWh-OjjH6XDa-GfV_Wc-jClT9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheprf
 gvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggft
 rfgrthhtvghrnhepkedtiefhkeffheegveevgeelteffleehhedvgeekkefffeegvdevfe
 evieevjeeinecuffhomhgrihhnpehmvghtrgdrtghomhenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:hY3EYqopm21uKHoqJbikeVMwxriwlPYyIzqL09BMnxX8M2CkDkZQfw>
 <xmx:hY3EYro9eyNjiK9zEj0m_n3Jo0jA6T39rq_LOXf3kGH5bf8XygWy2A>
 <xmx:hY3EYoQATYlg5yF4F8wfLmKwjQtQatkyyWCD0ZNyJnhu0oyj9zXkng>
 <xmx:hY3EYsCKVFMDI2M8hUZHfrKJh4dzk__5z7oD6U4UK5sOXbbU9hl2gA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:12 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH v2 5/9] aspeed: Add fby35 skeleton
Date: Tue,  5 Jul 2022 12:13:56 -0700
Message-Id: <20220705191400.41632-6-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS        |  1 +
 hw/arm/fby35.c     | 39 +++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build |  3 ++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fby35.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 450abd0252..fce6161ce5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1065,6 +1065,7 @@ F: hw/net/ftgmac100.c
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


