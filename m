Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7357104F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:38:23 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5n4-0005q2-R2
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hQ-0007lx-6p; Mon, 11 Jul 2022 22:32:32 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hO-0006YA-1L; Mon, 11 Jul 2022 22:32:31 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 387F0580A08;
 Mon, 11 Jul 2022 22:32:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 22:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657593149; x=1657596749; bh=pG
 sGK45f/Ri6DTtanJdSX5iZ4ftWDYqlLviaTcX/oX4=; b=rUVfnEISfOGn2EWTMn
 xXmuuTTJbaBDXtwqsby9c/ccEa7sF7G2Ap4hRObWXQFIty2w9yXGNb2cCuEm4O+G
 VIuSEb1ffsm39OvKLfUHBPNsxqEDy6NsU/Yp9yaUtBIuKFFardix2frwDzV0zy6N
 w/IrOBK/YCwf41MPoPvLk8iGMLM+3bIFEMDyWA/nqYuM58AoTQbE4Ss4yQhdYOJu
 aTf/9x0iYVWdtfOKjxqKQlJ9vUMZ2k6hbRsqU4R9qzvdfiHrBZNBUrx351WzW9ve
 9QK0SYMT0IL+sYNDGvpSEzczPyxwXh5IWx0uxapWpBazfEwG2GgO2YRE7QG8D9qA
 GnOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657593149; x=1657596749; bh=pGsGK45f/Ri6D
 TtanJdSX5iZ4ftWDYqlLviaTcX/oX4=; b=hn82RcjIAChR+K6fCKx71gxHmipms
 lTqHSt/v5y8MW6jsOGvdVLTX1nnwh8acsvZGEgY8PFZmXEOFVuFOwad8YsNNp0+B
 wBnpbRtRA2c9SSVVepK+Wb4zSdnY5WEn4vfmCnE1cbzRNwpq4NihN4HIwIoZvG2X
 yOCsQ1trYux2HZc0zxnS7E8IsvcD0zxyDmEJtgJkR0ocLk0yPb9fun2gKP9RAHHl
 9qFKKN2uKiMjZ1RRGO5VsCSgA8R1noY03cgDPH4rRK6ibVdAP2NWPP/kUun7nVFB
 ltl18DTx85i4Z/IX5PpbrUHqN/JVav0VSIXEhGTMWwifDCGZjgC66EYFA==
X-ME-Sender: <xms:PN3MYuJ_tHcsXFTobOhDnzjDlAlx3QmnBiJZR772jsCr-QyyEA8mrg>
 <xme:PN3MYmKbDUs7laqRXh7fn-ekXYumEICoKho3H3NB470dGiQY5IijPY7kkazcTgGT5
 mjw7nnNiD8wyj0feJ4>
X-ME-Received: <xmr:PN3MYuuMHWBzlquvZ7jD6y9bVeG0AkzHCnwuO-9uYYyg-CfE2Ka6ENEFjy2rAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Pd3MYjaOt3DkRJmL9IEfq8FZhUSpldXSsevBt5RuzXdiqmTpWOJ3Ig>
 <xmx:Pd3MYlbV9xGr20YXeJ6SPtRM2c-3Z2SZ68JrFKODsKm_Z5YTa_AerA>
 <xmx:Pd3MYvC1XxCnMznMrARuRecdTvAqZnfd_taFo-Gd8PDcUbYNn1gLcg>
 <xmx:Pd3MYjOGxdSpbeD14cxGdzBIKt3Kg7xjt_vq2ZK6Q2uOv8WymzEWNw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 22:32:28 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] qtest/aspeed_gpio: Add input pin modification test
Date: Mon, 11 Jul 2022 19:32:17 -0700
Message-Id: <20220712023219.41065-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712023219.41065-1-peter@pjd.dev>
References: <20220712023219.41065-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

Verify the current behavior, which is that input pins can be modified by
guest OS register writes.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index bac63e8742..8f52454099 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -28,6 +28,11 @@
 #include "qapi/qmp/qdict.h"
 #include "libqtest-single.h"
 
+#define AST2600_GPIO_BASE 0x1E780000
+
+#define GPIO_ABCD_DATA_VALUE 0x000
+#define GPIO_ABCD_DIRECTION  0x004
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -46,6 +51,27 @@ static void test_set_colocated_pins(const void *data)
     g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
 }
 
+static void test_set_input_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    char name[16];
+    uint32_t value;
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DIRECTION, 0x00000000);
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
+        }
+    }
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0xffffffff);
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0x00000000);
+}
+
 int main(int argc, char **argv)
 {
     QTestState *s;
@@ -56,6 +82,7 @@ int main(int argc, char **argv)
     s = qtest_init("-machine ast2600-evb");
     qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
                         test_set_colocated_pins);
+    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
     r = g_test_run();
     qtest_quit(s);
 
-- 
2.37.0


