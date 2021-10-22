Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606DB4372BC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:27:14 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdoxN-0006eJ-0j
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonk-00012n-SL
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:16 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003J4-RU
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:16 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQNF3-1mI2eU1Jrt-00MKy7; Fri, 22
 Oct 2021 09:17:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] q800: drop 8-bit graphic_depth check for Apple 21 inch
 display
Date: Fri, 22 Oct 2021 09:17:05 +0200
Message-Id: <20211022071705.471954-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e6Ho5VKfnKPZvDK2ye4MmhBiIQoEqGucOGEY5yIn3I0ff61PBEX
 4yBk/06pr27qTL8uIAeFecvWTJbC3oZyhbO6Gz/vYDTjLJ1UYWveulKCVdOVQEw6q6a3sE6
 J+d+V0FXO7F8IcbDfHxPRZBhSD0FXPEiMPAl13GG6hF9w/DdUrVPGe/sn8jVvLKMh0sBjaD
 176/X8m3CNqFQUL9PHyYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iS+1pJcZir8=:3np9dsTFLp8GsDQt+n5r/6
 6XRdwZP8aJUf39uIkUZDVeyOSwyPVSp7mudPlwqqnjh2XyTkGepMekTZhcmJ9TfRfbtq2+WOv
 FlAJij1+oP5OIRSxLKYyFxvqiHYj3w038d0du64+Fgm+4pWiTnIs6Pe3ZAqmY295bOSUDVkg4
 hpn7mXMoN8BLCB3ApbOQGZG7QBmbObob9nMvrqFbAsZR+AK6MITaS5f8OA6zEavzBMK7tn8LV
 vLqVpwFnwbtpRIbgDz+VHAAop+SNn3ro80BCHZ3dYJ6nAKxVbRgHkOwxzq+VQ/+lz4wRNGKru
 yP5PbwOFv0dxdilZTgoLX/J9tznFHCytUNrIs3HL3wb46qVcIY3fUc5euNJAyr+icoNYiiDYe
 29AzwCckHOdUbviVkquitF5ICc2lFSqImHBu3NKVcurEFw25WPyKbHVOm4Os9cIB/+FPeGLiA
 jc/ZiMCIBfBW9acWVoBRSbv4Z/uyVEPYA1Xeg8xR+5qmexYgzvWk41hbuAq9D7uAMpQElziz5
 B/7lCEiqQDCJ+K3Giwf8dGUiuOeUizINgwQ3+JDvavrO2+XcAtOwKMTCsAPg9aiwwUYd96cq0
 FFxRQesmQ0xtC1FoPlDryWzD9EScCTEn0M66qmn9kQYmZuV2zGPjyw41inu93I6gju2iWRLxt
 nPEso3EUQ13B0uwJTlst/JCHRnVk8F57EmS6l8eA7o28SjooWF0P40lk1JNjX5+wfr/Y=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The graphic_depth check is no longer required since commit df8abbbadf ("macfb:
add common monitor modes supported by the MacOS toolbox ROM") which introduced
code in macfb_common_realize() to only allow the resolutions/depths provided in
macfb_mode_table to be specified for each display type.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: df8abbbadf ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
Message-Id: <20211020141810.7875-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index a081051a8dd5..e4c7c9b88ad0 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -584,7 +584,7 @@ static void q800_init(MachineState *machine)
     qdev_prop_set_uint32(dev, "width", graphic_width);
     qdev_prop_set_uint32(dev, "height", graphic_height);
     qdev_prop_set_uint8(dev, "depth", graphic_depth);
-    if (graphic_width == 1152 && graphic_height == 870 && graphic_depth == 8) {
+    if (graphic_width == 1152 && graphic_height == 870) {
         qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_APPLE_21_COLOR);
     } else {
         qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_VGA);
-- 
2.31.1


