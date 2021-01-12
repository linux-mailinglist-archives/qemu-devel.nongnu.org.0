Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA22F2561
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 02:28:06 +0100 (CET)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz8Td-0007Ql-HP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 20:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kz8RS-0006Lb-K1
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 20:25:50 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kz8RP-0004Zv-71
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 20:25:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86721580626;
 Mon, 11 Jan 2021 20:25:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 20:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=b/0LcBWxGeivY5XSxd1tWLYCCR
 ozE7CkKoA2Pg1+4b8=; b=J60Vwy6AFexgkPi7WVHzDSekXGryJB8+/FxNPHFLjn
 NUDDICGVisoGDjIjS4MOJMs40Zej8UJdIvy8r+JNGKM8PNUR9Q7X7YaMWjfx+itn
 gcAUWmlETPKrtX5YNzaL2N0xWKwrNaj+hsbVria+B6vkqywMGFQOm2MkGxlhK9Rq
 LQLnGzUzvgZmZPnykR3EaMr3Ysc7T0rJG1uisVGnsnjE+5d/IrhlmaLTh+ZeD2w5
 uhRXAzggUpOOzYI59aeAVPWLJvFT/I73xSuzan7DDFXKgPb5GcLeHiJfJFYeIvV2
 5apl0amMReEcjqtc3wtlprpS8ST40T4kv5Kbia4bj/mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b/0LcBWxGeivY5XSx
 d1tWLYCCRozE7CkKoA2Pg1+4b8=; b=JVnpxgvFCPlYbD5hHanZqV52wD57SsjZo
 8FvkMRM0dABQZBL6wV3hRSi+mb74vOTzjO6EvZ8QOkiCEkcVv52YsdA1yCv9uaIl
 XsNDyNsHcG4hBSTX6+dFqhMYniVcMKl55PszFlBRhTgxPbQkpRpZXWpWAOcryJMe
 DEtsyxa6+MtKlbQBsw7NatXOgJidPjuHjJiPhGOJKsaD2Xy9VuNSt/qwyJKGbtLY
 Ormm80aOwGDEZRqVDo6Iv0PhtU5//TzeXzKN4G2S/hRx3qWvGA9bm5ykTZyr3vJq
 NYnNKu0Rn2mftnJjW1HTgVp2SWS6SHeZGqrY3cOyNAsTEMC5QrIwA==
X-ME-Sender: <xms:mfr8X6R0m-H1oB-BWziEe-HF3u6KlM9as8-jVxmUBAAm4B_8oPahbA>
 <xme:mfr8X_wdIsEQwAtNkHYAlIDqRK4GtjEpLd7FNuyg9PoKWujvZxfNAXSz5kOtPLYN8
 2Mk5Kym8JvGeubaSIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
 jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
 grthhtvghrnhephfejtdektdeuhedtieefteekveffteejteefgeekveegffetvddugfel
 iefhtddunecukfhppeduudeirddvvdekrdekgedrvdenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
 rghtrdgtohhm
X-ME-Proxy: <xmx:mfr8X32EJwasRvj7RGD97aeV10dovEXswHMmWe3fRot-Xzf5MGWsxg>
 <xmx:mfr8X2Aj--3AF5AXmPPL5aiH7v570aAtmzEqbRKKHFfPt65renz7FQ>
 <xmx:mfr8XzgUeg6DgMf6qIucRXPMnOHaRN3xxTc9d11sZjWzWNbfe25JvA>
 <xmx:mvr8X1eUNV8scl0t0Dvf3qygxnMozmMNQ3uEGK_w2ItHu4pBW97hPQ>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECB4E24005B;
 Mon, 11 Jan 2021 20:25:43 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/loongson_liointc: Fix per core ISR handling
Date: Tue, 12 Jan 2021 09:25:27 +0800
Message-Id: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per core ISR is a set of 32-bit registers spaced by 8 bytes.
This patch fixed calculation of it's size and also added check
of alignment at reading & writing.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/intc/loongson_liointc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index f823d484e0..cc11b544cb 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -41,7 +41,7 @@
 #define R_IEN_CLR               0x2c
 #define R_ISR_SIZE              0x8
 #define R_START                 0x40
-#define R_END                   0x64
+#define R_END                   (R_START + R_ISR_SIZE * NUM_CORES)
 
 struct loongson_liointc {
     SysBusDevice parent_obj;
@@ -125,7 +125,12 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
     }
 
     if (addr >= R_START && addr < R_END) {
-        int core = (addr - R_START) / R_ISR_SIZE;
+        hwaddr offset = addr - R_START;
+        int core = offset / R_ISR_SIZE;
+
+        if (offset % R_ISR_SIZE) {
+            goto out;
+        }
         r = p->per_core_isr[core];
         goto out;
     }
@@ -169,7 +174,12 @@ liointc_write(void *opaque, hwaddr addr,
     }
 
     if (addr >= R_START && addr < R_END) {
-        int core = (addr - R_START) / R_ISR_SIZE;
+        hwaddr offset = addr - R_START;
+        int core = offset / R_ISR_SIZE;
+
+        if (offset % R_ISR_SIZE) {
+            goto out;
+        }
         p->per_core_isr[core] = value;
         goto out;
     }
-- 
2.30.0


