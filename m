Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C943561074
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 07:06:44 +0200 (CEST)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mO2-0004HY-J3
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 01:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9k-0002ed-P5; Thu, 30 Jun 2022 00:51:56 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:46123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9g-0006yY-2s; Thu, 30 Jun 2022 00:51:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 19DC62B058FA;
 Thu, 30 Jun 2022 00:51:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 00:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656564708; x=
 1656568308; bh=N0eFFVgHAmXBFVzsAD9U6zt1yfvoYHWtLZBTvp5im+4=; b=N
 5EiVPKwiEgVxcdmo1PPn5lyJCAatFZ3zKRDdlXb+s+e/MkAlV8rn+dZwVzG/jaJG
 VFtCpPQfDIvhg1MNeoVI5t4+8cv8MuFcUyrozjGBK/+f6it1/unZsmlhEKr1790/
 Ywr5tohbQNRB32K9GbHegNSAyQtIbs8R7ZiWfZKMB456dF9nUcmaXzeDHPbLX1J/
 gqoRcUN8IM4Kr16UXTrXSpVi6SlZiCj+oTz0BvOCxi3yw7v9qSOX06w7PRRv3R/H
 BtScvEW+U/z6tjEZmsfjExR/PN378+1xecfisUZEO8XGeBhypFXi08qfQSLSufaF
 tQQfExtVlYm81AiQGhYHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656564708; x=1656568308; bh=N0eFFVgHAmXBFVzsAD9U6zt1yfvoYHWtLZB
 Tvp5im+4=; b=UWSSEWLCdt2tMvd/mGy5nKzGTE9o0zz64oueH42eFrzjig3Xlyr
 WBsGtx37NQfR6PIQGln0jLnM65rmwjwZmqBYmzdB4uP5NqZpZt3OsMTqUzBE22K7
 qKRl1Bx6zMs94lechadcj2jD9IFrcKNTwyOShiYyr9ae+FgFKAKdcMc9SU8yIu35
 UtB+kVu2/2O7gj897qY1yYdhIZcItQQFitUf6mPc2FyKeQl+BDIGRCnv4wjAnmxf
 DOMt4wducskb78d3tCnC1uWbCbhCaRHTNJ/BBa95eexB5Au80P/n34z9Lkb2LMrB
 hXNl1Dgti55aCE/cq3hX5mwYu01a7zL5NIw==
X-ME-Sender: <xms:5Cu9YseOAsKjsj-7D08iRMPQUoEdaN-4xaXWAfJ6tmy_uixpf83mJw>
 <xme:5Cu9YuOwx2BIzYZU2vVGlmw0Pnb1cAvuU9T6JDY9ME_8RXN0dL1yowEw1VirV_Ocf
 fl1zenjUF85AyYgFHk>
X-ME-Received: <xmr:5Cu9YtialoCx9_N3cwPJFy1WhdPeFKhn12F3KSAU39mxRwyClb6v83qeIxcwulBJ56LXKf8TLWFfVdrtMKGZnB1iHZTwCwE1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefr
 vghtvghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepffevudejfeehteegkedtieelhfffvefgleelveejledvvdehfeduudefteek
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 gvsehpjhgurdguvghv
X-ME-Proxy: <xmx:5Cu9Yh9qQWNi3RUYj3eWjWbNn5QBQd5Cg-MfZWkvQgEvUb5T1wgYVA>
 <xmx:5Cu9YovNCft6iCsYDMV5Kr9lAbEMzkeuQ_pW3lwEnjYY1jtAZVseoQ>
 <xmx:5Cu9YoEC4jj6Qv2x7FPJ8MyBZf4gsJMxpMIguZLYQ3hACwkwth7Z9w>
 <xmx:5Cu9YmDpATU3uA-IsUgvhm-xF4z3ruFMhJq7tpcG8SuqzGtBbaM8qQnia5Y>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:47 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 04/14] hw/i2c: support multiple masters
Date: Wed, 29 Jun 2022 21:51:23 -0700
Message-Id: <20220630045133.32251-5-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Klaus Jensen <k.jensen@samsung.com>

Allow slaves to master the bus by registering a bottom halve. If the bus
is busy, the bottom half is queued up. When a slave has succesfully
mastered the bus, the bottom half is scheduled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg : - fixed typos in commit log ]
Message-Id: <20220601210831.67259-4-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/i2c.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d0cb2d32fa..145dce6078 100644
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
index 5ca3b708c0..be8bb8b78a 100644
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
2.37.0


