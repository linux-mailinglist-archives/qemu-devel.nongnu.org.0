Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3D42CCC1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:24:07 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maljK-0005RD-JA
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh8-0002my-4K
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:21:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48402
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh3-0006kC-Uh
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:21:49 -0400
Received: from [2a00:23c4:8b9d:d300:c17b:cf83:be43:9708] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malgm-0000Dh-Hk; Wed, 13 Oct 2021 22:21:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 13 Oct 2021 22:21:25 +0100
Message-Id: <20211013212132.31519-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:d300:c17b:cf83:be43:9708
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/8] mac_via: update comment for VIA1B_vMystery bit
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to both Linux and NetBSD, port B bit 6 is used on the Quadra 800 to
configure the GLUE logic in A/UX mode. Whilst the name VIA1B_vMystery isn't
particularly descriptive, the patch leaves this to ensure that the constants
in mac_via.c remain in sync with Linux's mac_via.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 993bac017d..7a53a8b4c0 100644
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
2.20.1


