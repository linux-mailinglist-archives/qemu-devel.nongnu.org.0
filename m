Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354643729A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:19:50 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdoqD-0003jI-9o
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonh-0000wg-7A
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:51907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdonf-0003Hk-7N
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:12 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MUY5o-1mDJgZ2vy4-00QPZG; Fri, 22
 Oct 2021 09:17:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] mac_via: update comment for VIA1B_vMystery bit
Date: Fri, 22 Oct 2021 09:16:57 +0200
Message-Id: <20211022071705.471954-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TU/a7e1QjqNkZeChwc7W6zHgZyXY89QvlSJTgDBi+t+izSTwM1k
 vWnGw1/WuA377QkjOunXH/2L/KqQH0zoKrTSF76PFd0KFhvLf3JWUYeDAHCo9KCgIhmbjRv
 mIK4V2opFzknBiAsmEgucmpVOuw5jzaUlR4TgWhUp6S3oyB/PRNvk6RsXWskPhNLWYOqSxI
 kIKOoBFKXTu28Xjtv5A9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:56Yk+GDQU+s=:lAae3T5k/ODGe5zhefinmZ
 jKOCRHEKjsMY9knrXH8i/h5hk644RvzQjibAPQ5/4ZqJ8AVGAybAOgQKDWHTRKAmD6bf9FZ5N
 m6lOdsJ1GzadEROYNGWC0bF4ZvUDPI+gIDKOpK7mxCKvEKZuXvXaMYxG/+fkMzxpqBME4kYoS
 0ApZmv2ANM9S2etVKgZ7SGaiDB/l4SY6Eb8QkbdVjwkKzCXvCvDEECrWm2tuYud6FZR7Evzxh
 qRn5FJXUH1Emex6mOZxYH5yPEjZtTOLOTIQeDPw1Oz5amzAWflH/DY0FyXCDul1Vu1WFujWjL
 V8+9fdVCo3PkmzumBSYSUeZV2InitvrrydAnBJT80RB1BpHMCLxu6LS943kPhwWHSmGV1Mdfc
 GD0z7Ctv03qS0YIdqVXYEPfE/ckjCBzvFkBUnGkMhuLhfgJSplgHv2pLRIDjB8TNmD7e4f2Vp
 0JGYTqWjLcVT9+oo8g0/xVGpCO+OLtJFhKXf1OZ9lr7dpkgVKiGd0IrlQ4FWeoUePZROQO7sC
 ZfsGa+fp2lmDI7cXbMaoeKt0C7kJPLfJ6lkl3CpsothfRJo6VtMWzaRVjMZughcq52oLsmr3s
 q2CXcbxosZYLFYWsvx8yoN2si4yTA5lWqLS0Aby8sIFIDqIL6FvBNYajJh8bSqb2+nqYwHOyA
 VtIkzbUQPYCgksHISb0nb0cYCnWl8hatenTJKWgwQYCtIZpQTdONJT/Ee0O+yh6B5Nvs=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

According to both Linux and NetBSD, port B bit 6 is used on the Quadra 800 to
configure the GLUE logic in A/UX mode. Whilst the name VIA1B_vMystery isn't
particularly descriptive, the patch leaves this to ensure that the constants
in mac_via.c remain in sync with Linux's mac_via.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 993bac017db8..7a53a8b4c04d 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -130,6 +130,10 @@
                                 * On SE/30, vertical sync interrupt enable.
                                 * 0=enabled. This vSync interrupt shows up
                                 * as a slot $E interrupt.
+                                * On Quadra 800 this bit toggles A/UX mode which
+                                * configures the glue logic to deliver some IRQs
+                                * at different levels compared to a classic
+                                * Mac.
                                 */
 #define VIA1B_vADBS2   0x20    /* ADB state input bit 1 (unused on IIfx) */
 #define VIA1B_vADBS1   0x10    /* ADB state input bit 0 (unused on IIfx) */
-- 
2.31.1


