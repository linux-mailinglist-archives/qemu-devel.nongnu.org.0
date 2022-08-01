Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B658722B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 22:14:48 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIboD-0004Ly-Od
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 16:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oIbjO-0008Cb-So
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:09:38 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:33119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oIbjN-0007N0-0h
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:09:38 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 59F13320091E;
 Mon,  1 Aug 2022 16:09:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Aug 2022 16:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1659384574; x=1659470974; bh=7d
 csOzGvOtPRTRuDhieNVFlsJn4WoKAJH3G9RtfPOII=; b=SsLDwvZWmhpihTPWu6
 Y3+2YnRUIFViL4AO865AC7R4H6mnwKP1rjPnYsaZiUEIyBAAQ6a2Yai0kxC2X4eq
 7WSMJIbzmUgHfCgL5MpG0zu9gEm9EiadhJz9hoiE3A3P3lbsrKUv8knFWq4gxZH8
 032oJKRik4xCUZeuwJ6j4THL26DhxVT5dVaA95j1cLIXXv6oAfBtf39vDzSBUkVa
 rryjLmdIyPXaVJUHIEjxYaJCc+JTYQQqdL4jyTVj/LBogCg4X5+Dxvq4fZwgBY5X
 XWANYDrfxe+fdTOvQwy0NPhOCe1u9j35fARNWH/DW87zBQe2uwlab4XZgi1slvyq
 nhHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659384574; x=1659470974; bh=7dcsOzGvOtPRT
 RuDhieNVFlsJn4WoKAJH3G9RtfPOII=; b=k/oaois0hcfdKlzZzy71x7sSiOFex
 37pP9y6MVBvkwl2NJsdelSYC/jMxsd79XTrL3OLryMq5ZRDQOPwE1eMaJ/Hx2eYm
 idRU6hWdeeKD0YrOkPj4J1q1GdMlJE0NrCgzGSBQY0Nk1bqsyUo5fCG5TShyQgNk
 obzBCKOsC/CyyB5Quam4+QC9Pu20PB+oJgTr+9/zbngOPEn+6EK0PaHy+RNeSnMG
 EiMphndHfMnYJaV+tfP0XZXKHiluZ9abLQBtsgRu7NeXhDq42u7lHwWQ5u4b+K9C
 l3BMqSWx2wdNiavzAmTD9v3bZ+q2kewxPAbbl6fok7yfsog4LFTQE7QGA==
X-ME-Sender: <xms:_jLoYpMYHxZhsXgqMABjKQJEFTmv7xuTtMVxRZ3tN0PDHj-a_uGrhA>
 <xme:_jLoYr-ky8QB-a_BA6Wwpj45llVUJyyOEySLjaxtDpfxUi8m7ge0cGc3jsJVBJakl
 URCXay_Dza1T-TtJ6w>
X-ME-Received: <xmr:_jLoYoQXLTo-mN3aq4JQZrHHUAjFAhKkfO0DQ3eLIySQooOseKtMBE6NNDVxPBmmNEDvz4Efnqx3vGJin9gO7HRHb-F4mNAT27np8wqyV_RAIpl8eY-YG1MH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
 dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:_jLoYlsH57KJAfOifxUgwzZNHj9r_Plfv8-3zR1xUaL0NyjZMjMdpw>
 <xmx:_jLoYheoIasAEogXZQQJpOl5UPoqXOq0vjp193eopDVHR0WaIlk7Xg>
 <xmx:_jLoYh3Yc4Jq9VvhICsAJGU5KtK0l0aOzsbn2x0kFR1OcCLpoLw33A>
 <xmx:_jLoYioB20cBnxlX8fep25NEug-yqM2J7Ibu--qKbF9e1K2LUHoqbg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 16:09:34 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
Date: Mon,  1 Aug 2022 21:09:27 +0100
Message-Id: <20220801200928.73741-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
References: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
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

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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


