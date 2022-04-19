Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9A506C30
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:20:52 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmqf-0001Kw-Qu
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmh1-0006bg-A1; Tue, 19 Apr 2022 08:10:51 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmgz-0003dS-B3; Tue, 19 Apr 2022 08:10:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 282753202005;
 Tue, 19 Apr 2022 08:10:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 08:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650370246; x=
 1650456646; bh=q01/cVRPT0x6aob+KmSCWwgCWxOKa//IJaewPcOdEDE=; b=m
 2M5/C8NlB4I5Z7UP8Zh372uWmRO7bIgu43SuDXh/fOqNnr3Yowj9dwOgDEPRh3fp
 ZimYm0LcWEuUq4k+YKXcz+OrDYuub7jmM4TdgjgniuuKXZYFBNx3nwRhUSGI3VV3
 +OE5ccNjnZuxvps7ekU7Q90037nYw+uBSIoMkHgElLMXnxPuCmBk/tQHYEpIfBzu
 aWd7Hai1PItsBeaPPh7WC6bV9IOu7qg1EHxA6FjPiVbL/VBh9jI85KX/lo0uLVpr
 CqE8hcnd1mygDU/gEU3ko/tm4P3URKwnNVjYJjnP+1eLL0EBavA3IWbJNBKLBu8s
 qS7PTmzdwhxWJd06bliiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650370246; x=1650456646; bh=q01/cVRPT0x6aob+KmSCWwgCWxOKa//IJae
 wPcOdEDE=; b=SalpCrK21jL8haa1k+MN92jOz970Wdsq2Ui3q0P6nD2TcLBPoMs
 C0pBH+AEoejE5RVBzW95xiBccN9qApTc/jMuGC/SiBoRumMFrSLNPvzjrzte07rc
 GpGFKAPTvcll73dQkVLfJlsV0YGLbTzjZC57cmqM7FXXrzwL5/iS18pO8LPL2lLg
 4kAE7oRaD/ffQ2JkfaJEoc1hLQEkkYqDwF+HRTe1aPxaQhsYhLYHMAZ10JUqfyjH
 OeR0Ff9WSE1ZVCDfJ+YA0Q4s82geP1NgOXZOwpYVF7T0yyGiI0MDX13dzsLzzsOb
 GCqc7AjwupogkvDjbvuCohIpO/szL7eJ6PQ==
X-ME-Sender: <xms:xqZeYjeVe7NEVItMjKLajG1AQGuTQAs7Xq4QzHpxU8s-EmNFzssCSQ>
 <xme:xqZeYpMOWPzmCJH_1IhFojvOBfhvbDNq4-4WwnxSVidEO8Shq9FTcbUb04_shX2qW
 X1RGbBAdgz-F-F-C28>
X-ME-Received: <xmr:xqZeYsieem-hoe3abOGwamAtbjBYiQxO1Szytk75xYv6e3Mu5HwVid7G--mToxzS8RPizclq3I9n0-eTunEPMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xqZeYk-3ILcMgh4_qaV0Pnt3hgobwhxDfynktyVZmEKpqtYLfSynOA>
 <xmx:xqZeYvvKthjbssPsdygo9s8Rx31Nn8kCN_GmEAXIovixdToJoQTyLg>
 <xmx:xqZeYjGLfAqpuGZX5ss1Dq1lEb0HND5dKXUXnARVp1dInDYkZJdqGg>
 <xmx:xqZeYlW3Ev27g_HivEFJSm20FEQQw6Qt_PAee3fFtjBt8104M-HTbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:10:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/nvme: enforce common serial per subsystem
Date: Tue, 19 Apr 2022 14:10:35 +0200
Message-Id: <20220419121039.1259477-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419121039.1259477-1-its@irrelevant.dk>
References: <20220419121039.1259477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Identify Controller Serial Number (SN) is the serial number for the
NVM subsystem and must be the same across all controller in the NVM
subsystem.

Enforce this.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 1 +
 hw/nvme/subsys.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 739c8b8f7962..7f2e8f1b6491 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -48,6 +48,7 @@ typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     NvmeBus     bus;
     uint8_t     subnqn[256];
+    char        *serial;
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index fb58d639504e..691a90d20947 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -27,6 +27,13 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
         return -1;
     }
 
+    if (!subsys->serial) {
+        subsys->serial = g_strdup(n->params.serial);
+    } else if (strcmp(subsys->serial, n->params.serial)) {
+        error_setg(errp, "invalid controller serial");
+        return -1;
+    }
+
     subsys->ctrls[cntlid] = n;
 
     for (nsid = 1; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
-- 
2.35.1


