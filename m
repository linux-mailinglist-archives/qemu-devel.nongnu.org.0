Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD162B56E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovE15-0005Br-Gd; Wed, 16 Nov 2022 03:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovE0x-00058T-VM; Wed, 16 Nov 2022 03:43:24 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovE0v-0001sW-Na; Wed, 16 Nov 2022 03:43:23 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D90125C0277;
 Wed, 16 Nov 2022 03:43:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Nov 2022 03:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668588199; x=
 1668674599; bh=Cs8VdeXGOWhZrwhzmc8K/BTaHo9gT/9IJ81cljyfUPY=; b=T
 Z+DOlax0QBXWQgCEQjhkok5vEr4lyc8FGU2Th+8KrwOVe721UQu2j8c7TqNm8NFt
 cgC0JgxyhOcHfAFiebYPAFjPK45EsHtd954V/+kP8vF9AW7PX/H/xwQmUIReX4UQ
 n8hLq/uhwaWDrraI9aCqXzKLrj0MvmRfAH6HiXSStMdNZe0D7cyIEdJsTDRvBWeU
 Gou6KFj8ohh/t4gl3CeIsXALb4+knw/NbQjGNf8YfLSt7rq2ePCNSfi6mz9okhJp
 QHzxaW7PShJYKmxI4Looedh3CI2Pr9JoLeTkUdSWECnZS8G4lY9A/mPUnVdSW0Xa
 NNymL8/up3aDMJHrxreoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668588199; x=1668674599; bh=Cs8VdeXGOWhZr
 whzmc8K/BTaHo9gT/9IJ81cljyfUPY=; b=RwHFHO3RnsF23K5CddTxGaqinFrca
 TBAhp+/ou1rWgJaR9GT1tol/Fd93ZhL2K9ZhWinUsXfTydk4iLRC44Dj7fZlpsub
 VYoRxtLFJTwXUWIIzh0NjDTDmPP86l4RBTqmO8EXIyxbARvsSzfAj5WMhGXMUxne
 /5MfmNBifvzr8lKKKseqjg35p/Vcs1mhaH8Q+rEZannd9ZYnyYRr9CaZqGxl8nEx
 PJXu9tJrOSqu4QOY+HUbZJ2pRpx1W+E4Btbl2WEcxdWFcUkUtuKvRKBErPdwDXWp
 K3Qi2vc+tp1Gt2bmxOuI855I9k2OtZy7qOSwPd8sJ4ZZpjeqlthScy9AA==
X-ME-Sender: <xms:p6J0YwQNwBY1jeRbKaX8ZeWK3rALf8yGolUBY10mZxT5xprF2IJABQ>
 <xme:p6J0Y9w-HfuxmoCRxsTG_7-omefQq3aHyXuQYgYwG9Im_zMUNCZ3FEfeWpJ-jyVKo
 zow9UD8PelSL7AyhpE>
X-ME-Received: <xmr:p6J0Y93DHeTUM6_Dh5gdM6_B3y58ogMn9UoOSEeSx-gS3vMB13iui-3_CCTQ4sotW8jqyFp8Ukk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:p6J0Y0BfRFk3svCp1W-xxgwB4Ry8yDd7jch1x1IoAP-dAA93oSp8Tw>
 <xmx:p6J0Y5jS8_qFu31d_90HJJ9onxmDu8qYabSpXWHtus05fg66oYKn7g>
 <xmx:p6J0YwrXC17QRRYLp28Jy9jHRjNZCCI8-wxFcRUweh9NoxVrL6wPCw>
 <xmx:p6J0Y0rAzWfiQAzs759eu5kKgz3zos43ADtPjRWTrrv_ANPukogI6A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 03:43:18 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>,
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when bus
 is idle
Date: Wed, 16 Nov 2022 09:43:10 +0100
Message-Id: <20221116084312.35808-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116084312.35808-1-its@irrelevant.dk>
References: <20221116084312.35808-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3129; i=k.jensen@samsung.com;
 h=from:subject; bh=T5ZXUEf7MEBpxo1GSb5s2xLGSwC+XetAjLEbhTf2BsU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN0oqAU7M5T0BUVO974KIuUsAkvaYO8XxAx5wiT
 WpczTpYtVYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjdKKgAAoJEE3hrzFtTw3pPd
 kIAL7FJld6jQ2z7l8iKdg6i1oPJlJVoR90O1vnTBtCk6eNKOm8iJxWxyxe3eOByoiBKIacZ6Uf84sG
 bl0Qd9cZhWF+vElLGFNWDvvN1LZo3bkn0tHzdLuHC4N7j5G9bnEf/5L406ULtf3phGMPIYbHQ95Ck7
 l9C7KWF0M8Mx0AdfQykLDpSp4pMmhDaTQIJvk4VsSZPQU8AJvefehkn8CsX2EZxg+bXRoTzyeNH9/u
 rq7bialrcq6ZP86gqhKiG9whkoyVeNqTuF1K7IJD4N/wTpYJoqgEw7hU+4fkb4tkrim510a2sWGi3p
 MNZ4f2n36zzEfNlOBxwjrtHNPrPQu6ypV9wKhV
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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

From: Klaus Jensen <k.jensen@samsung.com>

It is not given that the current master will release the bus after a
transfer ends. Only schedule a pending master if the bus is idle.

Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/aspeed_i2c.c  |  2 ++
 hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
 include/hw/i2c/i2c.h |  2 ++
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index c166fd20fa11..1f071a3811f7 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         }
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_IDLE);
+
+        i2c_schedule_pending_master(bus->bus);
     }
 
     if (aspeed_i2c_bus_pkt_mode_en(bus)) {
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d4ba8146bffb..bed594fe599b 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -185,22 +185,39 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 
 void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
 {
+    I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
+    node->bh = bh;
+
+    QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+}
+
+void i2c_schedule_pending_master(I2CBus *bus)
+{
+    I2CPendingMaster *node;
+
     if (i2c_bus_busy(bus)) {
-        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
-        node->bh = bh;
-
-        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+        /* someone is already controlling the bus; wait for it to release it */
+        return;
+    }
 
+    if (QSIMPLEQ_EMPTY(&bus->pending_masters)) {
         return;
     }
 
-    bus->bh = bh;
+    node = QSIMPLEQ_FIRST(&bus->pending_masters);
+    bus->bh = node->bh;
+
+    QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+    g_free(node);
+
     qemu_bh_schedule(bus->bh);
 }
 
 void i2c_bus_release(I2CBus *bus)
 {
     bus->bh = NULL;
+
+    i2c_schedule_pending_master(bus);
 }
 
 int i2c_start_recv(I2CBus *bus, uint8_t address)
@@ -234,16 +251,6 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast = false;
-
-    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
-        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
-        bus->bh = node->bh;
-
-        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
-        g_free(node);
-
-        qemu_bh_schedule(bus->bh);
-    }
 }
 
 int i2c_send(I2CBus *bus, uint8_t data)
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 9b9581d23097..2a3abacd1ba6 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -141,6 +141,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
  */
 int i2c_start_send_async(I2CBus *bus, uint8_t address);
 
+void i2c_schedule_pending_master(I2CBus *bus);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 void i2c_ack(I2CBus *bus);
-- 
2.38.1


