Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7141C1FC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:49:37 +0200 (CEST)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWDY-0005Cb-7l
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVta-0001xs-6t
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:58 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0005nO-Ki
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N5max-1muhUc47b9-017G1o; Wed, 29
 Sep 2021 11:28:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] nubus-device: expose separate super slot memory region
Date: Wed, 29 Sep 2021 11:28:26 +0200
Message-Id: <20210929092843.2686234-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3Kl9yFZE+uL5XFuYwzeDIhOYGsRva3eLS6cIthpJA/jOVRztO9D
 kDIobUvlNcbBbKu82ud2kq0oy+4aUJBzRaFd6Fl9/yC8/KaJovVC1PNrR5/mqHlFO8knRgu
 n22Q8BRef2Xi6blmBI2YIKwkJIuFuu3qRxFNuhqLXPKg3BMB97FJsCryL7FPRbb+bxQUj4R
 ceXQAVJYU02GZexV6x8rA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UGzRPfKx+O4=:v/O7e5EPNiZMXg3oHKLihV
 ppSDJ3emcrWxge7sGEyDbmJwvvMy4jxmsIH1m0CCF1gK2NMjWoQ0InGFX+7nI3CskTVtGdAMT
 54FpWFdfkl2Tg2j2VQPoqu7c2FSl7PbYl3dxQX1yrl0A5AHZi61xt8u8MR0+J8ZsguE28afs2
 VBmHTxMe4N6ihVFSGDFm4OgZG1zDhDYvX0FuAT7XCeKZl9/ToPSaFiHN4o/XF4XSGwkQ6BbAa
 LZO4Nx0UdD2wHW21jFZm+hTCvH05Uyp1ejdF4c7CnKM0gdPm070CHGNoHGglXzBFTeOxYvqLm
 GMUaP+ck3nFYBm7Ta3vvFMbyVyeWGudTPE1bnn+yPN6c0989ncWvjRW+yIj3QGaitiXDRQtK8
 di3aIogofWCxEGg0fNBuaxcSiC8wgoNq9mfUDRWJ2E550J41/xDMh+q13McJS260VPWz6yQRg
 tjAUmDhaTtGSPZyivdb6Rh7ZtD6+w1d7iyx331JP4l9eQRPhrPfLxmbvIrlTwwYJ6KdeFAHiK
 ts5Y14Yv3ybb1q8LbzoigVsTs5FLfzkeVyPE65zq5nYYVqmUpuryqgOrBHWko4h+wm7f82T3r
 dayniBuGG0eSkhm+vPcIcgL7FQ44loLyGElTs5VKaDgzjnis0JdKs99HESGd0RAzZh3ZuFh2E
 PAr4WaDCakAGqQiNZvQy8NiRHcFFuCxS9bBBybnw7yzFPDTQxO33OBGsf3dpL3b74piRZ77k1
 X185+Ik63+3U9FnsZxuwLQw0qM5bdLoAAcbrGA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

According to "Designing Cards and Drivers for the Macintosh Family" each physical
nubus slot can access 2 separate address ranges: a super slot memory region which
is 256MB and a standard slot memory region which is 16MB.

Currently a Nubus device uses the physical slot number to determine whether it is
using a standard slot memory region or a super slot memory region rather than
exposing both memory regions for use as required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/nubus.h |  1 +
 hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 424309dd730d..89b0976aaa3d 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -43,6 +43,7 @@ struct NubusDevice {
     DeviceState qdev;
 
     int slot;
+    MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
 
     /* Format Block */
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index be0126956391..4e23df1280f9 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -168,26 +168,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     }
 
     nd->slot = nubus->current_slot++;
-    name = g_strdup_printf("nubus-slot-%d", nd->slot);
-
-    if (nd->slot < NUBUS_FIRST_SLOT) {
-        /* Super */
-        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
-
-        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
-                           NUBUS_SUPER_SLOT_SIZE);
-        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
-                                    &nd->slot_mem);
-    } else {
-        /* Normal */
-        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
-
-        memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
-        memory_region_add_subregion(&nubus->slot_io, slot_offset,
-                                    &nd->slot_mem);
-    }
 
+    /* Super */
+    slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
+
+    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
+    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
+                       NUBUS_SUPER_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
+                                &nd->super_slot_mem);
+    g_free(name);
+
+    /* Normal */
+    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
+
+    name = g_strdup_printf("nubus-slot-%x", nd->slot);
+    memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->slot_io, slot_offset,
+                                &nd->slot_mem);
     g_free(name);
+
     nubus_register_format_block(nd);
 }
 
-- 
2.31.1


