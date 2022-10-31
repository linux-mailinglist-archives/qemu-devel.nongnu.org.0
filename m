Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A14613ECE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCd-0008FP-TX; Mon, 31 Oct 2022 16:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCY-00087a-PD; Mon, 31 Oct 2022 16:16:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCV-0001Hu-Eg; Mon, 31 Oct 2022 16:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHlKI6NyvjoZek9p3zLZkb0QvqJYPf7CWU05w1ygMFI=; b=eCkYYPbjRlrhn23BMfDCbG0TWk
 aE4HAC7LKt/b6qi5G9J6zkhPsPumRxDoJItM9a2xGu8VNNcTjJaqXHGNxBohAjSnsQcu+u9AFPtqn
 IoMAZNvZQ53uFQ8d08X1dr6xO04QBA5KbKfitHefg2/RMC0jExO5BcX/wpKxi7IcnkhtjW+E9Mx7t
 q+IOg7O7uqkrIrUBBTa4Nc4C8dVXYDX+13Hyf4CqIITKZwjIlz+eyo1shd0j0g2z7Yz5wAQFWzSf3
 lIxk53lkBu2bD8aXUsDn1y1MZqlgUbdXWTr+8G3aKDkEReTCueUeWAX8yQmsDb/CQdvbykagYXWe3
 ziyt6hOM77rGyF8DHZtEn0Z17g6srrtxSs3ov3ra5u9FQiECuDZzG+Xbz1/snLgLaAJTtGBFbKhYL
 +idqpvUstpBtT91/0hLQRAUJUT1HCS2reUc7IG9Zkt/B+rNnvXyxU3g3RSdhzodJfGDCm4OB9nlia
 XhxUUMg4zSFJ5NNCjCOiJVwDpacgzzzyixzbnesp6rEPqypE/8Qehm64gBgyFdkFavLyHCcTYT0d4
 YoeKyl38dTNABBqq1g+R81L0CcfGlkHvMPLihKlsy0yao/kuo2RA+pG+d+gynPA2AoKK114hVaq4v
 JrbTq/4OLTjbD7lNPkFrtI886XLx5e+BC22OyuvgI=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCJ-0003Dd-OH; Mon, 31 Oct 2022 20:15:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:35 +0000
Message-Id: <20221031201435.677168-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 14/14] mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

This might allow the compiler to check values.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <f9da172e486c1f57f8542c7c3cb0223cffa89b1f.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 37123daa6b..601ea518f8 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -95,15 +95,17 @@ typedef struct Core99MachineState Core99MachineState;
 DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
                          TYPE_CORE99_MACHINE)
 
-#define CORE99_VIA_CONFIG_CUDA     0x0
-#define CORE99_VIA_CONFIG_PMU      0x1
-#define CORE99_VIA_CONFIG_PMU_ADB  0x2
+typedef enum {
+    CORE99_VIA_CONFIG_CUDA = 0,
+    CORE99_VIA_CONFIG_PMU,
+    CORE99_VIA_CONFIG_PMU_ADB
+} Core99ViaConfig;
 
 struct Core99MachineState {
     /*< private >*/
     MachineState parent;
 
-    uint8_t via_config;
+    Core99ViaConfig via_config;
 };
 
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
-- 
2.30.2


