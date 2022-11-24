Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBBA6380BA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 22:45:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyJnA-0006UB-Cd; Thu, 24 Nov 2022 16:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyJn7-0006SX-85
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 16:29:53 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyJn5-00048Z-AE
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 16:29:52 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 118995C006F;
 Thu, 24 Nov 2022 16:29:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 24 Nov 2022 16:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1669325388; x=1669411788; bh=dm
 OpAvA3bhWgYn/lylWwmVdF8CAkxHvKHzSB9q6GZ1E=; b=ygCCSgcrvQKROw98ko
 Dta7tp/Szd5OteapjbboLRe8iBPkJJAkAHsIOXZSpsciEm/f1z6oqqft7DFWRaeY
 h0pd/AqCeV6V69PGr8/FfjyqQ/9fbJ7FCgAXJaG6MMQFP3+117wUWt4kVeYCAsY/
 D9eaGXHUSlD6SIDQGvpXiToCuZwuBSoA7oKcAYfhVMdNy9dGl2Ad+/A7kqqn35RV
 05UsGPmVX57DEQelKQreKS5MjpZPwWpLFGaXK3FYapoceKdpw79zRPc6zWwtUAzV
 dau9FBYqGz9trfdr4FCjy3yqih+FnnhmLY8A+maxLNb+ETti5guFH9WdX6MvJSpa
 3Xhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669325388; x=1669411788; bh=dmOpAvA3bhWgY
 n/lylWwmVdF8CAkxHvKHzSB9q6GZ1E=; b=eSW08tL1kMdrcG6nncMPyzjhAWD22
 YqC/PdiVanlCO0H5cufiLxWG3d5qAnjNUIppmv7j7DD+TiNlViS3LYxrcHJJzmjF
 6ILbJghIFlg5bd7fiHSKX4wtfuL9jBDLvz0DwPXhwQPHaSS5hrxGzZm4jdCkZJEH
 EzHVncsrq8pnIElgpBQel1TCKEW4GSRcHC3ncdkLYNy+PTfwxyyw+5EVA9sE4ObM
 aPFQbLI6F25jl4mcJAgG9FgH8ATxTxbjpzXF+O380HR5cq8E/tdtatkUqEt2uQUF
 wAucSHbiE8T6AQ7jPs4hkVfrTKg05YopN+S90tHk7zxrYAXhYdYgfHLig==
X-ME-Sender: <xms:S-J_Y1cd8pgsf6TjSHM4YATXZ6ZUcoyTYCdXCRqYU-0xXLGLRHU5IQ>
 <xme:S-J_YzPEnGtsjIPQXkiWVH1jf0YEtqSA-fOmCUNqueQd6pRWcAt3h9zxXC0cFMzPo
 suyxC2m2FU-7svP1NI>
X-ME-Received: <xmr:S-J_Y-izaborMlheCjU2qgWCGMOBhnWmmNXjm9NqM076P0SJkl9o_-u1LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:S-J_Y-91Z6UK_ttj1hNbY2UIiE7t4pD43rbQzQGakQx9Ktqk_f9SHg>
 <xmx:S-J_Yxu1mZfiZQcZiuS1e_25EiNEMB2yTwCD07lsedupFAO2WpRY6g>
 <xmx:S-J_Y9H68oSFcNCNXtqoyoIihiMK-rkMz70YMVJLXiEBubULPH2G8Q>
 <xmx:TOJ_YyWwdyxxbh5kmmey4TMLVE3RnB_l7cQh8ooFwiGRBOHGxsYK3w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 16:29:47 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 1/3] hw/intc: Add missing include for goldfish_pic.h
Date: Thu, 24 Nov 2022 21:29:14 +0000
Message-Id: <20221124212916.723490-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
References: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
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

hw/sysbus.h is missed in goldfish_pic.h.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/hw/intc/goldfish_pic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
index e9d552f796..3e79580367 100644
--- a/include/hw/intc/goldfish_pic.h
+++ b/include/hw/intc/goldfish_pic.h
@@ -10,6 +10,8 @@
 #ifndef HW_INTC_GOLDFISH_PIC_H
 #define HW_INTC_GOLDFISH_PIC_H
 
+#include "hw/sysbus.h"
+
 #define TYPE_GOLDFISH_PIC "goldfish_pic"
 OBJECT_DECLARE_SIMPLE_TYPE(GoldfishPICState, GOLDFISH_PIC)
 
-- 
2.37.1 (Apple Git-137.1)


