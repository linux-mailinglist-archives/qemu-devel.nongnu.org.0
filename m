Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF60649DF0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4h3B-0000aZ-3O; Mon, 12 Dec 2022 06:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2s-0000WX-16; Mon, 12 Dec 2022 06:32:31 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2p-0000Kz-MF; Mon, 12 Dec 2022 06:32:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A04B95C00BC;
 Mon, 12 Dec 2022 06:32:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 12 Dec 2022 06:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670844746; x=
 1670931146; bh=8m1c8E059mbxuZppqTwytxsEXCJIhX1yfXNd1wf97cg=; b=c
 Sj3+U+IiVzytdqCKIVO749N2GCk0ZGaiT62yJL4F9abiSWstLDbvJ+4AKcnWunmx
 vL8n981EpLXWbERtrOMCSwMNH6QdGfCKUSOD2tdSDWz75YXR8mE53fwHJCEYe22E
 kNk5uh04PyfnD/YFkUSudXrrcH6I6Ui9zX+G/WDZ7TzuWx6VEfj/ieabwvSaOVEp
 1RNG2rFJyb9SlVi9I5xXG2wpMLCImcOzoeqWI5bNNDdOzLXlqNvEH07TeOImMYD7
 trS2Et1baPuxOAunoSXsexuO34DyGsmHbadLNLXGwgnjYuK8jcAnLYE2XYQLykwk
 6GaWbNv6yAkoPe9chXsVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670844746; x=1670931146; bh=8m1c8E059mbxu
 ZppqTwytxsEXCJIhX1yfXNd1wf97cg=; b=m3dNUdzSFIkPdhrjw/P41LwGx3xHj
 /tEoAk3rtH4YmIEazdn411qFfxl0yeM+pnsf1Qikd21uYQACKeC85vW2Y/FX5DVF
 6qZgPZCMLUl0a8Fl39MwBA1jde3fIO3w8O7uHBYQz02GFaCbPmZ5yX+UKiAaCnFZ
 FFtiwnZliU5jFEky4hx3AJCwMqV9pQizcBaL9yiCs5GNd25x6I4+hLtUVhTO+/x4
 +Wo3lrP3sKq1R+wae8IUk+aje67IsVWizJK+Q+g1HMw+kjjRlW+W6rf+7xRbQ8Un
 AE9lUUM+23Ln5JOTTFsfpqpE+zbPmEJAAH302kJ+l+R1LlZOjxMs45++A==
X-ME-Sender: <xms:ShGXY_-eo3KzzefOfreBeDhlqsgc7_sOOnULbyA-Vfmj-b9EEbBCmA>
 <xme:ShGXY7vojc3wQw1aWawBoD73UchKBDHS7SDhIonVgjJqVV4H0f_X07_FV8FYueWeT
 qwOedOTeZgzf2AosXM>
X-ME-Received: <xmr:ShGXY9BxSLISjXRuyZZirlEbKBdkKI2BZ0-zluycWRnPMlj7UZ6rKOhlqrR_ugqJjscpawLKAEouNWc_2gbh_Jt_Nzo6UW10QN3C4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ShGXY7fBvI9BTwK9aV84-tjWVJXIOZjggEC3ML4VX-zeqD9mTBWglA>
 <xmx:ShGXY0OpYEwsh_5E3UPlkNIp0pnetO_FrJwFcHEpfm5QY7HQ5ZaUeQ>
 <xmx:ShGXY9nf5AFoibD_YUUPOxdddh9YhzVB7GyKq-MxcnuzCHdFdbddTg>
 <xmx:ShGXYwDCwrkofKdR6TQSwpFIU_8bZfWLCT9v1EWrUXTNYl6mp5z5gg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:32:24 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org
Subject: [PATCH v3 3/4] hw/nvme: fix missing endian conversions for doorbell
 buffers
Date: Mon, 12 Dec 2022 12:32:14 +0100
Message-Id: <20221212113215.33135-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212113215.33135-1-its@irrelevant.dk>
References: <20221212113215.33135-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=k.jensen@samsung.com;
 h=from:subject; bh=doT5nRT0xvow8F5EsCaGBtk1nH8Pm4/JHwZAe+CxHQ0=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXET8DvQfZOBxT5OOoqNnYGXWAbUHsmCEPgB/2
 AGxVxn7PKYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxE/AAoJEE3hrzFtTw3pNK
 YH/0S5snsNAwJAErsuEkTuJFX8rC4crDwMKUJehCTJ/fOUA2SOMoO3+32Z/vINn+cTQIFte4EoPD5n
 rIYSW6M6XsBWd1pnpsXbnQQt1W1c/5yphoiXC0ZPjzGV1crWo/6wuJtWcspymNpX5F2hajwQSAjjjC
 mRsa5bgFVN0KPjnYmrzkFsHmMCqd5G5ZZAqce43GQDzqb0hr1UDWkupk/t4PtzJ1iMrj8Poe+s15ZO
 ytOv0NFVlkJKEFIkJmN92jThJnOIXuL9ZkXgf001XwCRE2ZqLqYLY809xk+h/zI5sZ8bTYW+1/M2mc
 K/3jMMGb3610HzXWnPphCiTSGuQBwOEVP3EaUF
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The eventidx and doorbell value are not handling endianness correctly.
Fix this.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cfab21b3436e..8af70f0216f0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6148,16 +6148,20 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
+    uint32_t v = cpu_to_le32(sq->tail);
+
     trace_pci_nvme_update_sq_eventidx(sq->sqid, sq->tail);
 
-    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &sq->tail,
-                  sizeof(sq->tail));
+    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &v, sizeof(v));
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
-    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &sq->tail,
-                 sizeof(sq->tail));
+    uint32_t v;
+
+    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &v, sizeof(v));
+
+    sq->tail = le32_to_cpu(v);
 
     trace_pci_nvme_update_sq_tail(sq->sqid, sq->tail);
 }
-- 
2.38.1


