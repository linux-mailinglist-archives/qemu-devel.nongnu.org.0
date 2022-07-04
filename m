Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D3C565E2C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 21:53:26 +0200 (CEST)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8S8L-0004i4-Ff
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 15:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8S6g-0002sC-Ss; Mon, 04 Jul 2022 15:51:42 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8S6e-0000DE-Lr; Mon, 04 Jul 2022 15:51:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 64FA65803AF;
 Mon,  4 Jul 2022 15:51:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 04 Jul 2022 15:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656964297; x=1656967897; bh=Sw6AnPb2jkpWNlAF4H6i19pM/
 re/Qd9enb6AWeyfsnY=; b=qVPRIbVGUT2IRQoGGUbPESyLe9PpV6nvE6CShBpnf
 J+KyyMInnL9qri7qLlA/0C9+NyYInz2xf0WSsI6d+iLTem7kv7OoC4Tk7pE17966
 tj8CzZlXu7nmp4OU8PGRDZkEaWg3A7ZS7VWCwJSFzDGys77bqSlFQJOsNWA+qzHI
 ejFw7Wsm3bkM7ifZJRI4/n+cKnFK/e89UxswpLXJSxfJh4wAefS6joImkiFwWuqQ
 d8UYc9PI0gfQLWVm7uPCZ4HvT/Zgd81AO0qnmOlwN3iDEiP37Mj3xr06ieUDTbMC
 BPvTnmxTerhyABiAmfmn5WCv6lGilApt4SiC24T6V5rpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656964297; x=1656967897; bh=Sw6AnPb2jkpWNlAF4H6i19pM/re/Qd9e
 nb6AWeyfsnY=; b=NwY4BSf/sFr8Nue7JjBTT20/KZZWKCQ4VxlG/bmAZ1tjuGY3
 OQ4ChEfRgBz8rEOBdtLMsXLnId+lSb5v5vOCU9997tmrw/Wb0BxkPEjp2c17932a
 YozK2OCklGqJ+nAC0znwkjtzp6e7VVhdv5EgyRZomPf3YsxTeVjDdHqDVEPbfsng
 OhrGqgPSMH+zjA/bivZeDJnIP8OIAMsmhyfUywUwQZx+FM8/ViXDFHA6+UQFe8h/
 iz9cjZNXmfhBdo/ufFMre1W+R3oGnZ07TA/DWvJD9PUv1zdcMs2gKr/RjtmOfBWT
 bd9HMI2qa6oYSNdXM8tihuvBoiZeTYfK+PDB9g==
X-ME-Sender: <xms:yETDYvW1XEJ934DHC8PFvxNvKKG39ocQcPFUohdFuyang2PYtJAhpA>
 <xme:yETDYnmzxQgOIHkGXjP9gKdpZEsKevw_7mCzB6ds4eCThzMbf7-0yKUsRhHh2kEn0
 j00vBRWmhel31jfp7k>
X-ME-Received: <xmr:yETDYrZ4WLSGg5rThH8zqXPGn8-K_6XIHaXsQY2mcxs2ztNt4g8QHXAQL1jFRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehledgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghr
 ucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpedvjeeghfekjeejiedtuddtvdeugeehheefleetffeugeejuddttefgvdegveei
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvg
 htvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:yETDYqVVyqZQkDqmeY5mh1bFcuF3Fncn7u__vk05XkUs1KZgjmw3pw>
 <xmx:yETDYpl5eBPfI8NqEPVxAWCraseZoGwSh_gz4pyBQZ-RZyp1o6nDhg>
 <xmx:yETDYnfYfc-h-w3O28yelggLvE4K28mzvhMj9_upCc_8IPupfLF3yg>
 <xmx:yUTDYsvl_x8S0FHBkPcjDDmSAI9NcktOr60sAxF0Z9jCh_WyekmcGw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 15:51:36 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: clg@kaod.org
Cc: Peter Delevoryas <peter@pjd.dev>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/i2c/aspeed: Allow machines to set I2CBus
Date: Mon,  4 Jul 2022 12:51:34 -0700
Message-Id: <20220704195135.10348-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
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

In a multi-SoC board, we want to allow machines to construct shared
I2CBus's, so that we can have two SoC I2C controllers attached to a single
I2CBus. We already expose read-only access, this just adds a method for
setting and using an external I2CBus in the Aspeed I2C bus controller.

One issue is that in order to use these methods, the machine needs to reach
into the SoC and call these methods on the I2C controller, and we would
prefer to keep the abstraction at the SoC level. If we create a set of
"aspeed_soc_i2c_get_bus/set_bus" methods though, they will just be
one-liners that don't do anything interesting. I would prefer to avoid that
if possible, because that doesn't seem scalable if we need to do the same
thing for all of the peripherals later.

In addition, we are already reaching into the Aspeed SoC to access the flash
controller to determine the boot rom size, so there is a precedent that we
need to reach into SoC peripherals for data sometimes.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/i2c/aspeed_i2c.c         | 16 +++++++++++++++-
 include/hw/i2c/aspeed_i2c.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 42c6d69b82..00bf58c7a3 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1236,7 +1236,12 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    s->bus = i2c_init_bus(dev, name);
+    /*
+     * If a bus hasn't been provided to the controller, create one from scratch.
+     */
+    if (!s->bus) {
+        s->bus = i2c_init_bus(dev, name);
+    }
     s->slave = i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_BUS_SLAVE,
                                        0xff);
 
@@ -1420,3 +1425,12 @@ I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr)
 
     return bus;
 }
+
+void aspeed_i2c_set_bus(AspeedI2CState *s, int busnr, I2CBus *bus)
+{
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
+
+    if (busnr >= 0 && busnr < aic->num_busses) {
+        s->busses[busnr].bus = bus;
+    }
+}
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 300a89b343..c60f8b291d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -376,5 +376,6 @@ static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
 }
 
 I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr);
+void aspeed_i2c_set_bus(AspeedI2CState *s, int busnr, I2CBus *bus);
 
 #endif /* ASPEED_I2C_H */
-- 
2.37.0


