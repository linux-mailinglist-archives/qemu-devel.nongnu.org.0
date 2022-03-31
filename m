Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30B4EDF61
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:09:21 +0200 (CEST)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyIR-0008B8-VM
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:09:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7O-0000aF-HO; Thu, 31 Mar 2022 12:57:54 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:54403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7M-0000uB-OZ; Thu, 31 Mar 2022 12:57:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 512A83200D53;
 Thu, 31 Mar 2022 12:57:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 31 Mar 2022 12:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=E8TGgHBmb8YTpb
 lAPf4UvSi8DdBrWVKmfO/PISxXVcM=; b=VEXps+3iasuEIx0p93dJQi5L6mJoNO
 aT/lIO6g5n/QKxF3UjZBpa44z5fzkWiWTde/OzWyEXJ9E73X0EjvKtQR+4HioLLg
 WaXh43FG0qw28YiAVLASCXe86+ZV+kriG3pH4gmwyuBBfqMPfrNAIiZQHl5pXSGV
 2M4AlLgLMnwIogHtwvvQIgz3AiNVVkz1i2Q+Xm4vKI3ergNZDLsebU+TgCSt7JOX
 /xlGgv2d/JJclhacb7GhgKZsWmL47phpweD+OrNE1KabRsOGXZEs6MeY4D/Myr47
 2VwkWN4dsoktQwElXfQL6In6GEjD87lzn5L7fDyY5g9lFKdUafr8krvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E8TGgH
 Bmb8YTpblAPf4UvSi8DdBrWVKmfO/PISxXVcM=; b=DcdcJ4lO5DfoCzhPw3wc8r
 LAeUyr+y7b2S1pQvCLt0dgfFZNxE+/2QHe3eGO4jEx9NTOxRh461u1llhpM2uwZI
 d8mWDGi3OW1U/DLb4FsR+kg5fNRrAOEFJyOudaHs45A4WQZmUp/oelw2039bZuM2
 T+5rsS56eqxe/boTFCCmf1KVzTVrxsSxLob6uvD/LfLerbfDZjOOvaS7NgLPlALA
 jVQPa/cebMI8OVUCoz9MOPcTlaHZzgIRHkwMFMn5rGceQEaQKsrNM8M6AJV8gyE2
 90xDBrPNFnS8DC6HyOT5vKTsvIY05YRZ0Th6WZK/OlmswUlyej/DkYwGroHbjQTA
 ==
X-ME-Sender: <xms:jd1FYucIfTfszPCtHR7ilNfZrr5zbOKL6FzXq-GpEincPugEqJEpew>
 <xme:jd1FYoNwJsWkpPAQXUouFgKcbAjRxNdOQzEAgFhlmxb141DisH9ozk-CqfL1Ivz2s
 EMqrJVMb5oqrLL6mus>
X-ME-Received: <xmr:jd1FYvjxl8Q5iGWB_aZyBgIRXIKrl68r9EkRjA4nSWHU38o6h6SFkkNEBdCaKsfn35PaEB7cQbM2vib8ED5ung>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jd1FYr9Cmp04D27zR3_ZVbSCbm0VxThSGrnbqldu7i7WW0nPmgs1ag>
 <xmx:jd1FYqvJ_Rg4Qjgv3T7DdHxDnTQGuoZigHNm8fh7azWSGmGLC76feA>
 <xmx:jd1FYiEcyVvCQzTubfH7hBS_bmZCpyha6u4RrzdvknafI2nGYVMuzw>
 <xmx:jd1FYrkc5mXcr1aPPNS7fClNYr_yb9m60DMZFs8z1u73OtotBpk8dQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 12:57:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] hw/i2c: add async send
Date: Thu, 31 Mar 2022 18:57:35 +0200
Message-Id: <20220331165737.1073520-3-its@irrelevant.dk>
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

Add an asynchronous version of of i2c_send that requires an explicit
acknowledgement on the bus.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/core.c        | 23 +++++++++++++++++++++++
 include/hw/i2c/i2c.h |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 145dce60782a..344d764d7eaa 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -261,6 +261,20 @@ int i2c_send(I2CBus *bus, uint8_t data)
     return ret ? -1 : 0;
 }
 
+int i2c_send_async(I2CBus *bus, uint8_t data)
+{
+    I2CNode *node = QLIST_FIRST(&bus->current_devs);
+    I2CSlave *slave = node->elt;
+    I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(slave);
+
+    if (sc->send_async) {
+        sc->send_async(slave, data);
+        return 0;
+    }
+
+    return -1;
+}
+
 uint8_t i2c_recv(I2CBus *bus)
 {
     uint8_t data = 0xff;
@@ -297,6 +311,15 @@ void i2c_nack(I2CBus *bus)
     }
 }
 
+void i2c_ack(I2CBus *bus)
+{
+    if (!bus->bh) {
+        return;
+    }
+
+    qemu_bh_schedule(bus->bh);
+}
+
 static int i2c_slave_post_load(void *opaque, int version_id)
 {
     I2CSlave *dev = opaque;
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index be8bb8b78a60..ae58e4151585 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -28,6 +28,9 @@ struct I2CSlaveClass {
     /* Master to slave. Returns non-zero for a NAK, 0 for success. */
     int (*send)(I2CSlave *s, uint8_t data);
 
+    /* Master to slave. */
+    void (*send_async)(I2CSlave *s, uint8_t data);
+
     /*
      * Slave to master.  This cannot fail, the device should always
      * return something here.
@@ -129,9 +132,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
 
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_ack(I2CBus *bus);
 void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
 void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
+int i2c_send_async(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
                   I2CNodeList *current_devs);
-- 
2.35.1


