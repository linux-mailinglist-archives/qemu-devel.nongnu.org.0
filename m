Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B734EEB8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 20:16:59 +0200 (CEST)
Received: from localhost ([::1]:37222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heO5p-0001Al-DS
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 14:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1heO4C-0000T2-78
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 14:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1heO4B-0000pE-A5
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 14:15:16 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:41875)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1heO47-0000Wu-Ix
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 14:15:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 493B47462B8;
 Fri, 21 Jun 2019 20:14:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2F8207462AA; Fri, 21 Jun 2019 20:14:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Jun 2019 20:12:28 +0200
To: qemu-devel@nongnu.org
Message-Id: <20190621181459.2F8207462AA@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-devel] [PATCH] ati-vga: Add DDC reg names for debug
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Incremental patch to squash into last series

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/ati_dbg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/ati_dbg.c b/hw/display/ati_dbg.c
index b045f81d06..88b3a11315 100644
--- a/hw/display/ati_dbg.c
+++ b/hw/display/ati_dbg.c
@@ -19,6 +19,8 @@ static struct ati_regdesc ati_reg_names[] = {
     {"CRTC_GEN_CNTL", 0x0050},
     {"CRTC_EXT_CNTL", 0x0054},
     {"DAC_CNTL", 0x0058},
+    {"GPIO_VGA_DDC", 0x0060},
+    {"GPIO_DVI_DDC", 0x0064},
     {"GPIO_MONID", 0x0068},
     {"I2C_CNTL_1", 0x0094},
     {"PALETTE_INDEX", 0x00b0},
-- 
2.13.7


