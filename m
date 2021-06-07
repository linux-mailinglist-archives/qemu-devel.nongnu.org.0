Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CFC39E6F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:00:24 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKU1-0007pS-Vt
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRd-0003wj-BR; Mon, 07 Jun 2021 14:57:54 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:48269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRb-0005sb-13; Mon, 07 Jun 2021 14:57:53 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHGPA-1ld71X0cls-00DK0q; Mon, 07
 Jun 2021 20:57:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] hw/display/macfb: Classify the "nubus-macfb" as display
 device
Date: Mon,  7 Jun 2021 20:57:26 +0200
Message-Id: <20210607185730.346641-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tt0sc0LtYllA4S0x/3XzCfB9OK25thfRDOssunvbP1YPrAfwu35
 xNWTHFOTtQWOCAdgyR7vpHB8eVtLC4/PS9bqn/ovVh/bXQNF8sx8qdO0Qm6mjZvY87d8pyn
 B8VhZrVkmrQAGUSnvHhZBA0mJdAy8J2kNCMPlq4QxsDCfu7jPR5GA5S3wtJR4jsJLn1BJ5j
 FAovq/ea/pohFxJBytY8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ikvEsHSB+/A=:iDqJJPwszZDLAyT+VrFYF2
 vK79gTB1Y7kjjqu/yKoI2KMAVgmIbZeycwqiETstKcO67QjrPdo26Os2sy+3tQWerzEBvtWNN
 /R4WzALW1ovlwU2sFXcULanF8th86ZHS9KrndpOyZLbT605sZGZDlwtCzOAdv1Wj7g6pDup1a
 /hE8J22Pe8lN/xcVHor5DMz4bhymJGZyJYTC1OIrrkzHLVeEMNzDAQ0XtUFNnlFDolrWRQYZ2
 6H3VMvXzqUnmZzMxIm4v3daLl5a2uNwBft3HUKlP/L0FC36bKJN3bfAWvLKGXtd2DUThzexme
 fRoRBTAqA3ubhHFOHWF/7z4p/JSuNj/BV0UwRd8Qkg55G98B9mpIY4PA/h3E8gXoUY72HnkfD
 kNSsohZ+nL9A24e/Ha4mf308572hUVFlTaZObkM6P4RUTvl65vcc0oseXDBtWm1pYGBWwWnft
 flN9MwppfSAbZlQFxvr2ehkiDAEKlnXjUxRQtE/8zkrdn5S72Qjw7Z3P4bTOk1U7swtSCaF/h
 +t+M9kkhsm83CwRa2qrRB8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The "nubus-macfb" currently shows up as uncategorized device in
the output of "-device help". Put it into the display category
to fix this ugliness.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210531073255.46286-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index ff8bdb846b97..d8183b9bbde6 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -450,6 +450,7 @@ static void macfb_nubus_class_init(ObjectClass *klass, void *data)
     dc->desc = "Nubus Macintosh framebuffer";
     dc->reset = macfb_nubus_reset;
     dc->vmsd = &vmstate_macfb;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     device_class_set_props(dc, macfb_nubus_properties);
 }
 
-- 
2.31.1


