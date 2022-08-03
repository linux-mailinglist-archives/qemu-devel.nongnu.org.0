Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07661588AB0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:41:08 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBoI-0008VA-LX
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oJBdv-00015c-Ti
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:30:25 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oJBdu-0003mq-30
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:30:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B86B95C018B;
 Wed,  3 Aug 2022 06:30:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 03 Aug 2022 06:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1659522619; x=
 1659609019; bh=km60XCfeDaX92zG6kQnllL/PZWX/QXobHnRBmi7f78w=; b=N
 jU7xpKImPMtLOwMV0AWvlbGkmSa+TB5NGPiypfCKztrp854lOI2/foa4kHqY/rpm
 PdqYYW2jXVRV6yOp8q8jDHhBOXjXDWeeA9bZNh/y+3Y7Xe0bn9ya3/nbz7qgWYv1
 ewpnpIl69emTBa6jb9UoSOhf45A9qCRfXIUyHBMyDxCbhEjUEowogwiWdc096ryJ
 /yRRBN2tJFTO6uDnWtW4vBtgSAUvgYuu8m40zl2+NlAmZi5Z5clL/QdhmK9Bb4uV
 RChA0BxnTUGI/vHCa3u4JfzLx4pIUXVQ1Iadp+OmYK69L+5lDCi+jHy6buGwKFpF
 StOXS8cShS5r4Uo7VbAaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659522619; x=
 1659609019; bh=km60XCfeDaX92zG6kQnllL/PZWX/QXobHnRBmi7f78w=; b=X
 XRp4xhu2wEH02nplTMPVAFWmyMyfceDZN01LjeCTvsNSxGG64dsUDKUN1LswUthP
 Ai6HKDUOxnszJ5XFXtTB8rdnm1Cfp/7eYtGY/YuQGaawfBJJk+pQV3DzUkH7bksU
 ppLgB9qTPe8CfnUWVuvwGZUXQABN9ROuhKGAOi8wbnbpzBgWBnjwWqju9dri0HvY
 9SwXEuPNxVwYUGRo4+ZQKBi9WeHFbZCqF1cNUEMQZbETLQ9YzKcqAtYdCsXVgql1
 ojMhaSKANi0dyHD3LeIIIPc449ks02syFfN6S/xqgbBxwNibJ5ocJ2C9koyIK1t5
 qD26UOl1jJCLMpBnbZsWQ==
X-ME-Sender: <xms:O07qYrcBECqJMqfAwfQs74hFg4mWJr87nuu628oMrYPSQ0BgA-RLiQ>
 <xme:O07qYhNBBdn6wYIXUrRuN_NixzvlngqpEv-6DUBJ3Zr8LFNBDS4yQ9VHhZBKnwI-Z
 iMoE9PzFeC4tsgDAQw>
X-ME-Received: <xmr:O07qYkgfmI4gxkxTZiAEIT1Jerm2jJmpkf4rKjWtSPJPwWDrCRbzlaPfrTpXpp5oIPWluCbBRiGKhTn0dYQmpy9dOj6PtSYlldgjSw-lM60VZ5Iz4oH7GJ6K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevfedtffekjeefff
 ejtdduvddujeefvdejleeutdeufefffedtueevvdduveejffenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:O07qYs9tI-7gHdRcjEYVn55duAjTu-dcLwRo14kVxEx5mTwOjy14RQ>
 <xmx:O07qYnt_1TLk67CMM5v3lU30GYewrk5X9i8e4mHXAd9SSydEGKE3Hg>
 <xmx:O07qYrFluiX2lnb0ODvLpMtojdUPHpdVWqHy5iL7j6e5Qxmpij8tVQ>
 <xmx:O07qYg7hRLZNzhO_6_xMYniUNDZo27O4i4xGIpoCIrB6fyZ0ZgKSoQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Aug 2022 06:30:18 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/2] linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
Date: Wed,  3 Aug 2022 11:30:08 +0100
Message-Id: <20220803103009.95972-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
References: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AT_BASE_PLATFORM is a elf auxiliary vector pointing to a string
to pass some architecture information.
See getauxval(3) man-page.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ce902dbd56..e7666c5c60 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1718,6 +1718,10 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #endif /* TARGET_HEXAGON */
 
+#ifndef ELF_BASE_PLATFORM
+#define ELF_BASE_PLATFORM (NULL)
+#endif
+
 #ifndef ELF_PLATFORM
 #define ELF_PLATFORM (NULL)
 #endif
@@ -2148,8 +2152,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     int i;
     abi_ulong u_rand_bytes;
     uint8_t k_rand_bytes[16];
-    abi_ulong u_platform;
-    const char *k_platform;
+    abi_ulong u_platform, u_base_platform;
+    const char *k_platform, *k_base_platform;
     const int n = sizeof(elf_addr_t);
 
     sp = p;
@@ -2171,6 +2175,22 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         }
     }
 
+    u_base_platform = 0;
+    k_base_platform = ELF_BASE_PLATFORM;
+    if (k_base_platform) {
+        size_t len = strlen(k_base_platform) + 1;
+        if (STACK_GROWS_DOWN) {
+            sp -= (len + n - 1) & ~(n - 1);
+            u_base_platform = sp;
+            /* FIXME - check return value of memcpy_to_target() for failure */
+            memcpy_to_target(sp, k_base_platform, len);
+        } else {
+            memcpy_to_target(sp, k_base_platform, len);
+            u_base_platform = sp;
+            sp += len + 1;
+        }
+    }
+
     u_platform = 0;
     k_platform = ELF_PLATFORM;
     if (k_platform) {
@@ -2212,6 +2232,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     }
 
     size = (DLINFO_ITEMS + 1) * 2;
+    if (k_base_platform)
+        size += 2;
     if (k_platform)
         size += 2;
 #ifdef DLINFO_ARCH_ITEMS
@@ -2289,6 +2311,9 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
 #endif
 
+    if (u_base_platform) {
+        NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
+    }
     if (u_platform) {
         NEW_AUX_ENT(AT_PLATFORM, u_platform);
     }
-- 
2.32.1 (Apple Git-133)


