Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E966ACE2
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 18:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjvC-0005nq-Le; Sat, 14 Jan 2023 12:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjv0-0005Mn-2r; Sat, 14 Jan 2023 12:02:13 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjuw-0005VO-W8; Sat, 14 Jan 2023 12:02:08 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B9A65C0004;
 Sat, 14 Jan 2023 12:02:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 14 Jan 2023 12:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673715726; x=1673802126; bh=tS
 aUWkK1BpVnxmf768PAhl6XPYazhtuB0CkFo8wladU=; b=cA+/2WE4lyCc9/2QNA
 3+RyIT17ZWvzJMK6JOMh3OqdhKrUWavNT1z6Ru1QsGmi3RWzdCH0S8zJFCzJI2p5
 VCCH1lkV6MxOKqbcJWvNH/p19yfbo7QyLWZ+Rwiod8S3+up4J1hzAIalz4c2sjSh
 gr4TC5bsQZYXIeHIjVueEpWciu7Z/7Peau16jyYT1xb4L3qw273NJS4sZgnlRpHE
 82VrEKM/ZwcrHlPNdMcz3NscS3OgukyTUSUgxWZtCl6zqTnPIH9d8fA+vXYAM52J
 mjE4UHDTD9X+CvlhAFWdd4jqKm8/6V349u2QEuHUhp9uS3QfB+F/PqlHn2pbV8z9
 aKiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673715726; x=1673802126; bh=tSaUWkK1BpVnx
 mf768PAhl6XPYazhtuB0CkFo8wladU=; b=H3aNVJwvrnaR0haSJhdxuAI0DccMz
 PZdeCY61Rjsl8fmpaSJs5TGaOc7MGGUuc/SQEIbbPMMQNvQaXQdV6YseW209S28E
 YnxEZB4JZCL1mbNqzzaGMI971/P9HkOFqXpoorDd6EF2E30cKktEwbtk+6BaVnWu
 kw4+yxNYRXUnPOgsAiBlMEUpwxPp375Xg12Bg6bvYDdKbGAnHh4V4pE6n0atOYdU
 bNXmiQ5GncWFhCN6lMu/E5qlgY+zvffjk8fCKoiIslknMtQu7PB6zrZ3gnq/Y+Bx
 5X9l8GPl01eUaj0aOqUfJEHdzqk6VU4g1HW6wa6xlbB+2w/enMbdO/bbA==
X-ME-Sender: <xms:DeDCY2dX1Vsr3O_9-ujXyywFVw7sGpwlypOnm3wSDV2XjQ8UEy2OOA>
 <xme:DeDCYwPdRvMPYz0SInLsZv4J_BzwNozOE_mbWynTgP2YBDZ_kLfLFQIIFD3o0Ievq
 8esQR_-zFBnoTXDvzE>
X-ME-Received: <xmr:DeDCY3gk4Y99Y-sK74cFVGgg79uazG_0Ffj7rVAySBayyoOm-9m5l-CF4EhCL1sufjfE6uZW9JH8oY7efUQGYQUpIuPpgeVrW-E0uTctXX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieek
 vdelteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:DeDCYz_DI3094Y_wwNO0RVzFbg5dJCU_7zatdfo33TuDqud4QyTaiw>
 <xmx:DeDCYyuA_EWnX3zRheoKk5o4wDVeCiBJlL2ctSLtsKWVKbf6ggvXDA>
 <xmx:DeDCY6HQM5rCPv-dIGkxW0pFnUoP3KUO9NSmjy0mdoB_6TQEc4TySQ>
 <xmx:DuDCYwAbggiUJs2XrzeNkH6h0wcbuleoxK85Pq7sraSYxj6ohrWxeQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:02:04 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/nvram/eeprom_at24c: Add I2C write helper
Date: Sat, 14 Jan 2023 09:01:50 -0800
Message-Id: <20230114170151.87833-6-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114170151.87833-1-peter@pjd.dev>
References: <20230114170151.87833-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c         | 15 +++++++++++++++
 include/hw/nvram/eeprom_at24c.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 0c27eae2b354..69565a420c28 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 
 #include "qapi/error.h"
+#include "qemu/bitops.h"
 #include "qemu/module.h"
 #include "hw/i2c/i2c.h"
 #include "hw/nvram/eeprom_at24c.h"
@@ -138,6 +139,20 @@ void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
     i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
 }
 
+void at24c_eeprom_write(I2CBus *bus, uint8_t address, uint16_t offset,
+                        const uint8_t *buf, uint32_t len)
+{
+    int i;
+
+    i2c_start_send(bus, address);
+    i2c_send(bus, extract16(offset, 8, 8));
+    i2c_send(bus, extract16(offset, 0, 8));
+    for (i = 0; i < len; i++) {
+        i2c_send(bus, buf[i]);
+    }
+    i2c_end_transfer(bus);
+}
+
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
 {
     EEPROMState *ee = AT24C_EE(dev);
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 9d9cf212757c..bbca73a07ad1 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -6,5 +6,7 @@
 #include "hw/i2c/i2c.h"
 
 void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+void at24c_eeprom_write(I2CBus *bus, uint8_t address, uint16_t offset,
+                        const uint8_t *buf, uint32_t len);
 
 #endif
-- 
2.39.0


