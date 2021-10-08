Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CE3426A4F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:57:19 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoV4-0006Ui-C8
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJp-0006SS-Pj
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:41 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJj-00072y-5C
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:41 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mati7-1nB9wL0pmV-00cNgH; Fri, 08
 Oct 2021 13:45:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] q800: wire macfb IRQ to separate video interrupt on VIA2
Date: Fri,  8 Oct 2021 13:45:18 +0200
Message-Id: <20211008114518.757615-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nEm9MPuJR+mgEUR5WMSOssJHt+LcMuZUc1D0RbU2huVa54emPym
 6ORXppOE+yjNjSehjc5zKxItf6z8ZAzsVZp2ewP9nXMGh0dUc4F+Kd09K+rbO+RvKDCvPgv
 0fWkwJcblrSQde1eRKPvCQ0GKFbmxMbCjoOX0Kdez2+4cX8TDyA9tOVeawJ+FGuUSAq/gBR
 67fcMzwR9/CM+Hcash5ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sOZY2ANzCro=:HEJa9izIulRJ4WFYnvTfol
 AL+SquH1PGRLU0MZUmOYwR8SVbgxML+jzbFogYlU2hon1jLn2bCUSUty62mTDioerL5U+sGzf
 DjvMwTmvtSEvs/AqwUSo3cNEC1hclx2WUp0x+tFmkmSl+eXJ6xEHV5icNZFbAx5Hd/sD8o65j
 TT7T8fkAZWxdv3iHuyZJTlBGqfjlDusKPfkOP5djjt4//IewSOrwIixWtWTqFA5qX7tQBGePe
 hahiFNklno+89sIq1TdVb46xou6lCSYetHfnG9lVto5EZgMhHYM3/IkczLz9WfC+OevHFI6jE
 sQHGspd3NyUoHp39ZiHuTBDhSebbKWROwRrVI3OUV1Dr4x7aogmh+UMI1d/jmza3DYobpy9Yb
 SnxxVtCfDwGe3X7mBCG6zcL7AgUgrG++GIF/OVrMumFVP6IxqQKMkz8aQ4P4RLJntX1wvFjzD
 h3KOKFHPOpuzbcY26f/hESjNNE5hdxHR0UiOZ5mtnshiJght5fZtDWzFOVEIylrni8hyD4HOD
 btTbm8XXEgMR4FRm4TTaUQUj2zFSFxs0yb6EZIYHrw9RSGyTyWvsX4VSxkprQRMoma6eKSjfH
 Szy8uMASX4Rqr9CdhKiBtw6X5e5rlyxPC6oOHSMc8S4Ob951wQQxDaTSFnYUYnmk4MfXX0fwE
 I5ge7ko5j+YGje0jT3j8gtIt3JoF4R/Lw1MFD2Ru5Adj5OJm3VEYY36nlAnM8GOIrpxOuY/QO
 7Au7Sq7T9TpT9K5CvCsNI6kwfch44kVuKqSDOQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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

Whilst the in-built Quadra 800 framebuffer exists within the Nubus address
space for slot 9, it has its own dedicated interrupt on VIA2. Force the
macfb device to occupy slot 9 in the q800 machine and wire its IRQ to the
separate video interrupt since this is what is expected by the MacOS
interrupt handler.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-14-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index df3fd3711e6e..fd4855047e3f 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -407,8 +407,10 @@ static void q800_init(MachineState *machine)
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
-
-    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
+    qdev_connect_gpio_out(dev, 9,
+                          qdev_get_gpio_in_named(via2_dev, "nubus-irq",
+                          VIA2_NUBUS_IRQ_INTVIDEO));
+    for (i = 1; i < VIA2_NUBUS_IRQ_NB; i++) {
         qdev_connect_gpio_out(dev, 9 + i,
                               qdev_get_gpio_in_named(via2_dev, "nubus-irq",
                                                      VIA2_NUBUS_IRQ_9 + i));
@@ -419,6 +421,7 @@ static void q800_init(MachineState *machine)
     /* framebuffer in nubus slot #9 */
 
     dev = qdev_new(TYPE_NUBUS_MACFB);
+    qdev_prop_set_uint32(dev, "slot", 9);
     qdev_prop_set_uint32(dev, "width", graphic_width);
     qdev_prop_set_uint32(dev, "height", graphic_height);
     qdev_prop_set_uint8(dev, "depth", graphic_depth);
-- 
2.31.1


