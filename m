Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F99670D4A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvK1-00022A-DE; Tue, 17 Jan 2023 18:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJy-000200-NC; Tue, 17 Jan 2023 18:24:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJu-0003KL-3t; Tue, 17 Jan 2023 18:24:47 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D1DA5C0191;
 Tue, 17 Jan 2023 18:24:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 18:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673997881; x=1674084281; bh=cC
 eOwvKefjF8ECs0zlkP8SCX+hkhTPxzfHumDwCvOes=; b=bxuJmS9+bcO3LDsJvc
 AyurIIDcfBCDta/oqs1WCMXwC0L1Hchdf803eb7nu4BhN0xX8+JIGN7d/ap6f/P5
 3HsdJY7lsn9ZEWOD2TRAqD3KXTEuCdp39uZsaqYHP/NNQaabHezz0IvjyIR7MIW7
 dVTTZfy/hPrqcnfqMJRDyPJr2FqZoFqu+OV1QwbVAnwaN0gWviaxpuop/zsjxIF4
 AFOwViolhJ2qiSDqNjcYqSlYePPrZVtmWI/3QIxj4KgF1woaRf0JVMukwZZWPH1p
 2qWU1tlo3JX29ccasWphLxa24SY1RNgUGEJIfu8uSqDQ7eslkHGzBDI8qpyMqUc+
 eY4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673997881; x=1674084281; bh=cCeOwvKefjF8E
 Cs0zlkP8SCX+hkhTPxzfHumDwCvOes=; b=cu3oNOO6ng1vmBrtMteALRysRSrdS
 Rah4K/PtcRtcdwGkNJezxZ2nebso9DZooVQMH8i+kQePxKcDF4MaxbDMgjLypJH7
 spFirj0YGqJUjefP3xm56qlpsjyywT4trrWTlOj6LtiGxtj4rAE4yBl9gD06DRZ8
 h9nVHTVwR7gnt0jAccahqlpQz43xwFCjPB8E+mjYduZH1/AMxthQCTXU/z6RBQVg
 QV450Hce8BmhHxUD63Mg3S7CytZDuZN+kqSBgqB3Mc6oOApWz5bGPh5BYxvZ4Vj1
 ZXC7W418N10Vp7hW/n2uzvcvFEAZxp2Qz3xbfbQA9h7EG9ega/6SLC3jw==
X-ME-Sender: <xms:OS7HY9tzHryKzErmhkqkRfKf072WX2mcj_3NfBp8WqP-Nxk46TjFOg>
 <xme:OS7HY2cy6HSrr5KAR2wvY079WhMMVF0M_OVaihix8awCollvGyw40o8vBggUsSNq6
 OEA1od0E2xZpHJSWd8>
X-ME-Received: <xmr:OS7HYwxYeiQEjeFX1SSfydqCpRE-ZomT3qt8xpxQJfH4nk5BSjmkLebSYOPMSkpTIBhS6ytH5UUOIE5qOKWWL1trYLQXX9FQgZ_SBZwSFbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:OS7HY0OxJUvi3YaQCAjNxy4vhGvnwdaTtSb_J23WFWrfyQk9HDMkyA>
 <xmx:OS7HY99vVpwVEDf__fyH1AiqpEm0Fk61BkQQ0mfoLCOOhIXj7C-9vg>
 <xmx:OS7HY0WYyj0V3pB71ZO_0SLvJcX_RMIxxVydgxdy_LSkLvZ017OyBA>
 <xmx:OS7HY5Rb39RvpbEgzzjSGQIyDofX5hC8Xjaph15PwQM6XhNgmarLPQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:39 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 5/5] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Tue, 17 Jan 2023 15:24:27 -0800
Message-Id: <20230117232427.74496-6-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117232427.74496-1-peter@pjd.dev>
References: <20230117232427.74496-1-peter@pjd.dev>
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

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index f8d751fa278d..5074776bff04 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->init_rom) {
@@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.0


