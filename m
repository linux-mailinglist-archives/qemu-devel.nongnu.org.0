Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1554EDF55
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:05:10 +0200 (CEST)
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyEP-0004mF-E1
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:05:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7K-0000Th-Pf; Thu, 31 Mar 2022 12:57:50 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7J-0000td-5U; Thu, 31 Mar 2022 12:57:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EEAE83201F80;
 Thu, 31 Mar 2022 12:57:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 31 Mar 2022 12:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=w1PrQnTVn6Sfbh
 sCoP+N7JZNYIrLtITK7DHkgnGpV20=; b=blE3nlAvTRyNAbr7NaQNxwgvUNzDus
 AcFV23H1zq9kyCBcOe0I8PzIlWW1bWOzmKY7TfWoB7gnmkp1MTGndXhIAn3reHH/
 QOwtliAJCVlThqv37Q6eR90Lltt5rit9rH916sKGUc6v7EjiYTM+pe2bZncoRjEf
 ODJww8STbU9qC4aEM6Lef9M6XA4gME3zp14FluqD0ftuhChh9mXPiC/5eQxvyqMO
 WwhvSU7g0GOOfuVt1fhhzdIY17kFaKPRYo4jDb84dM2EhEx3sHlefJlEW9yTmPGC
 0NhFoFYu85XUtnAPlhp8ERofZW+ROTbtp3bp/O8fevAcAGtYYjWPrz2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w1PrQn
 TVn6SfbhsCoP+N7JZNYIrLtITK7DHkgnGpV20=; b=GZxvRDzDomWRd1GVY24Hj0
 BGUmhXcD8gOzTwY0gtIDmMzeOP1O9H9QtLEq/dJYYENY7BbqmBcwWBav/lXmMyli
 1lAbff4l/NXIoJz8EgaBnE4NyJ9xnynspXwNCQcTZ+T1TgG+bE9xspu94MwBCH8t
 KrB3j+gRv0G+qH+Ns/5Q1mULSM1DU3gHRMzu/Fj7N7UJJqIHjpLOo053leYR3VnX
 SjgMHB6FgzyvUW5Mwkq+ahApaYwm8y05UbrShbRpTGlh0bx/bbNkYO2dc1ir+wF0
 qxB5lAIW/ZwAMRd2t6y1FGyQ/M4XQpsuWMUeD6ym+F0mVsKjoJBcV4edqAfMdHrg
 ==
X-ME-Sender: <xms:id1FYuTfV4ntbh7cW6oK0ycm_SGJ168UhKXpi3m76hhmeBw1rNjukg>
 <xme:id1FYjxIt9PuCSjN802Q-PVTZ7oSKOurqlmOn4sEfZ7xrfcTqGnsgofDSZ_tX0pvg
 KYM4A3DzQYKfSCaenQ>
X-ME-Received: <xmr:id1FYr0BoGYTE0F42qbfb8Q0YWb6EgvqxAVjC144-5-tJ-iG4tauhG690G4QN6v-acVODw1QWiMi1ixGdQQwMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:id1FYqD3zzhwAzO8WWnV4IjQk6nWLH1mBcTkN3RKtMZbnDQszuHCkQ>
 <xmx:id1FYnjzyUwGo6wGEtNI59vv4sdE5c064GeobB2mY_VaqMTnIJdGmQ>
 <xmx:id1FYmoWQSZ5sEZvjmOajD_Q08C7dEonFq8jZbDqdQkIbx0Q5ylPhA>
 <xmx:it1FYsZT9PVFKpvyvL2tQGfvIEvilXlDslvKISYwMTjbOme8yr53pw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 12:57:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] hw/i2c: support multiple masters
Date: Thu, 31 Mar 2022 18:57:34 +0200
Message-Id: <20220331165737.1073520-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331165737.1073520-1-its@irrelevant.dk>
References: <20220331165737.1073520-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Allow slaves to master the bus by registering a bottom halve. If the bus
is busy, the bottom halve is queued up. When a slave has succesfully
mastered the bus, the bottom halve is scheduled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/i2c.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d0cb2d32fa44..145dce60782a 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -13,6 +13,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
 
 #define I2C_BROADCAST 0x00
@@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
 
     bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
+    QSIMPLEQ_INIT(&bus->pending_masters);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
     return bus;
 }
@@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
 /* Return nonzero if bus is busy.  */
 int i2c_bus_busy(I2CBus *bus)
 {
-    return !QLIST_EMPTY(&bus->current_devs);
+    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
 }
 
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
@@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
                                                : I2C_START_SEND);
 }
 
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
+{
+    if (i2c_bus_busy(bus)) {
+        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
+        node->bh = bh;
+
+        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+
+        return;
+    }
+
+    bus->bh = bh;
+    qemu_bh_schedule(bus->bh);
+}
+
+void i2c_bus_release(I2CBus *bus)
+{
+    bus->bh = NULL;
+}
+
 int i2c_start_recv(I2CBus *bus, uint8_t address)
 {
     return i2c_do_start_transfer(bus, address, I2C_START_RECV);
@@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast = false;
+
+    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
+        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
+        bus->bh = node->bh;
+
+        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+        g_free(node);
+
+        qemu_bh_schedule(bus->bh);
+    }
 }
 
 int i2c_send(I2CBus *bus, uint8_t data)
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 5ca3b708c0be..be8bb8b78a60 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -69,13 +69,25 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
 
+typedef struct I2CPendingMaster I2CPendingMaster;
+
+struct I2CPendingMaster {
+    QEMUBH *bh;
+    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
+};
+
 typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMasters;
 
 struct I2CBus {
     BusState qbus;
     I2CNodeList current_devs;
+    I2CPendingMasters pending_masters;
     uint8_t saved_address;
     bool broadcast;
+
+    /* Set from slave currently mastering the bus. */
+    QEMUBH *bh;
 };
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
@@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
 
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
+void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
-- 
2.35.1


