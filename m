Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9841C22F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:01:50 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWPM-0003dp-VC
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVto-0002DX-Oa
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:12 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVti-0005wY-T3
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:12 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mj7yt-1mzbqU26Mv-00fEHL; Wed, 29
 Sep 2021 11:28:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] q800: configure nubus available slots for Quadra 800
Date: Wed, 29 Sep 2021 11:28:43 +0200
Message-Id: <20210929092843.2686234-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:egVA/8lf+F+q1qlgLRDbn/Vz28u9WL2DoeccI9LpOZZ4iovXENY
 kJy4HcaeU+uDu2i/XdleSxAWzL1W/U2TaGTBKZ8PuAOcd+RdJIXPgko2WpXhvTTF4jAMXmg
 WaEl0JvBZSuH3PV8aTKzUP7NIhhWANpHKczSRYITwQXH0KR6jsoyC3cMjt/j0BFiS3F1wpJ
 WCewONqBjigq4Youqox3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2fFB+24ELDk=:S78h6xdVJAGDO73rX+lXeF
 KZfKO/1P7xVExprTGu4Y0GbTus6Ymr/UiEidnVkaaMxiKkvGvN50Paa1kGMrZ9laQg+A5OWYR
 LF4TJ7mmS2s4RATjmbwlqDNtjrv/Hs8xs7vc1KuzhN+sdSXogCKSQglbQTqqQW/DxxrAldFVY
 IzcogzmBjYxINwFwFOS7/nvtbrU8z87JxT0UKb3h21DCb4tqv4TVRuGNrfWT9WrtlyX4/yRdr
 YTJbl2l5fGB9wt7GQsKXi0bKDGx0IMz8kZGG//Qlilm3wQDd2bXiKb3fxUGQbyCT5wa7BOU4U
 aAVj3f+pGz3o9KcXVx/fJBjV42s6/m/gMYOQivSK1vkWO5nOT8jlHLoRqU1OQG7Pod9WK7Trd
 eeKb73AoarXV/+RA4AXC22ZuYhiPNM2gPwLNAES9vKvG9og6WaFxZzcsSyOYQqdBv5B9pq68W
 8jS2Jy2iM9r6SrM3nGSJJHAWuiSNzVhrb491V6GjvCYLWPly9tAgClovhAtzSIM0hii8gx+DW
 YlA5Cj0hEbYug/xUn2q0heDby8o3pY48WYUOr8CRX8Y84QPwuF9AbKAAgE2r8ioT8QorBtRff
 ZmRsMa1nJDNdvGaVc30b1jk9n8l8z3qAktyJsQBN2nOn2uDCvBYs8+DxRqT8dK7bJghi/fLlP
 qPDWf/EScQkiJb6mZxNR7Zol/KS1SHMcMva8UGaEqKPZ+EX9IgVHUBG0U2zV0fawmAew7G6FO
 rt4YmSFrErO7wJHZwqyfYYb01pJFwIu/JInKmA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Slot 0x9 is reserved for use by the in-built framebuffer whilst only slots
0xc, 0xd and 0xe physically exist on the Quadra 800.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-21-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 5bc9df58a097..09b336602482 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -78,6 +78,13 @@
 
 #define MAC_CLOCK  3686418
 
+/*
+ * Slot 0x9 is reserved for use by the in-built framebuffer whilst only
+ * slots 0xc, 0xd and 0xe physically exist on the Quadra 800
+ */
+#define Q800_NUBUS_SLOTS_AVAILABLE    (BIT(0x9) | BIT(0xc) | BIT(0xd) | \
+                                       BIT(0xe))
+
 /*
  * The GLUE (General Logic Unit) is an Apple custom integrated circuit chip
  * that performs a variety of functions (RAM management, clock generation, ...).
@@ -392,6 +399,8 @@ static void q800_init(MachineState *machine)
     /* NuBus */
 
     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
+    qdev_prop_set_uint32(dev, "slot-available-mask",
+                         Q800_NUBUS_SLOTS_AVAILABLE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE);
-- 
2.31.1


