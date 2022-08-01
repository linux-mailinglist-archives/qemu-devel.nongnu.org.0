Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC993586B96
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:10:35 +0200 (CEST)
Received: from localhost ([::1]:55376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVBq-00038x-D1
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oIMa9-0004Mr-Rq
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 23:59:05 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oIMa7-0003rA-Nl
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 23:59:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6D419320076F;
 Sun, 31 Jul 2022 23:59:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 31 Jul 2022 23:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nunn.io; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1659326339; x=1659412739; bh=3FVrNdTHvS
 XaKSnRBPRiFFPUee0nAagt8ISrj6afFjc=; b=KsSfOlsoYLSQ+8Qq4qcY/1PdPy
 JmISwQJswjFXGNpY4GpzRxPdkKXqcp3Jzx4rhuYdopeUqQN/Dhx+OoFrjZ0RacBk
 Ye26K4lOOEti7BcjvJSOmDu0Rm67G6jigD4J3u38pfBaK8z9PXKZMNY+HA/67xHr
 ePjHPiHEaG9aFcbiMxoKH2c9Zou2uoNWPi70TXBoTl3arck0T4YM4pFxNz2RyqY+
 hS5gRh+NeOfnwf+GSRAtLguhRQlByq9wwrmoDtKyU7i4uP8a813vCJwKU6H/lJB5
 kKB/CAamRSXoqZ1avKnmMICYizQrpI4kAvREI8kZfm+8Y0/TfW/lDhiRk26g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659326339; x=1659412739; bh=3FVrNdTHvSXaK
 SnRBPRiFFPUee0nAagt8ISrj6afFjc=; b=W2A6rZtiHReNYcCGzNOfOGBIeTJRr
 9AkGP1eS71/rCuHySRYNz0gH3MWpf7xbxYQ4O/F5aEgj2AIoliEXdYzuyuPVmB1i
 sfWrDPtEukcm/bYoBr3pDwWUzYcxmzLFaTuiZtD/svcKPdKDe5wnpNX+Hh6xkTYg
 ZC+P1X76v/+X16K1YGto0Mjb80pSuC+KLMa0ZIQmtiBcMnIEAa4pB58cWiJiCAN4
 kSYWMMTUW0O7jNsxYXjr83NxEbNFwUNl7w35WuV+GMtk37xzAgxmLClAi1eaaIUj
 lFNv/kDlJQkKLtk7p3aPB2MLbt2chAkqwbAS98Bsj7Q8y35HoqypHbZ4Q==
X-ME-Sender: <xms:g0_nYmZ9fX6oNsWtIvP52eSCoepMyNASvKMtU5vsZG6uIf4B45LsXg>
 <xme:g0_nYpYkFvC5iU_Ft0EvKLzejk5n0_Sdx60FT_WR5aVJfh4EnAD-BIUiE-N-fzolQ
 LBUxNjKlNTtBl8KvQ>
X-ME-Received: <xmr:g0_nYg-w9OPmI41fpwQDowh0yk_JVRsTocX7uKWrNElpfdy35fh9ADa8e2g4mdj6kSIhAQfAhm7iwPRFd9CZ6yuL_wzRhI-_cnlCnGoF7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvvddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfgtgfgguffkffevvffosehtqhhmtdhhtddvnecuhfhrohhmpefglhhlihho
 thcupfhunhhnuceovghllhhiohhtsehnuhhnnhdrihhoqeenucggtffrrghtthgvrhhnpe
 dvveetgfekgeehvdduueekveffffejuddvkefgjeduuedthefffffgffefveeuvdenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvlhhlihhoth
 esnhhunhhnrdhioh
X-ME-Proxy: <xmx:g0_nYorcE3pjZQytSjL1BJrRcG-BKPbSaujtXKLtyDOuUbT0Ye4IvA>
 <xmx:g0_nYhqnFAr3J-5sUi3UMwQJ3Vc2oBM70l12KvwLv7ywUndQXbgE8g>
 <xmx:g0_nYmQey_HrFWlJmtPPLDwwX2_Djp6-dSYYqrcuRYZgNylecBZPgA>
 <xmx:g0_nYo29_ymDllEdhwpWVKPxrPcTIqB3ZUe5A4nlk5jfaHC1_5bVqw>
Feedback-ID: i6a78429f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 Jul 2022 23:58:57 -0400 (EDT)
From: Elliot Nunn <elliot@nunn.io>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: VGA hardware cursor query
Message-Id: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
Date: Mon, 1 Aug 2022 11:58:51 +0800
Cc: kraxel@redhat.com, BALATON Zoltan <balaton@eik.bme.hu>, hsp.cat7@gmail.com
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=64.147.123.20; envelope-from=elliot@nunn.io;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Aug 2022 09:08:00 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear all,

I want to give Mac OS 9 clients access to hardware cursor support, to =
improve
responsiveness in absolute-cursor mode.

Would it be acceptable to add a hardware cursor interface to the VGA =
device?
And if so, can anyone advise on an appropriate register layout?

This is an example of such a patch. Because it alters the Bochs VBE =
interface
it is ONLY an example, NOT fit for acceptance. I have omitted the =
changes to
the binary driver qemu_vga.ndrv.

Kind regards,

Elliot Nunn

---
 hw/display/vga.c               |  35 +++++++++++++++++++++++++++++++++
 include/hw/display/bochs-vbe.h |   7 +++++--
 pc-bios/qemu_vga.ndrv          | Bin 18752 -> 20944 bytes
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 5dca2d1528..9b562e24e2 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -744,6 +744,10 @@ void vbe_ioport_write_data(void *opaque, uint32_t =
addr, uint32_t val)
 {
     VGACommonState *s =3D opaque;
=20
+    static size_t cursorCounter;
+    static uint8_t cursorData[16 * 16 * 4];
+    QEMUCursor *cursor;
+
     if (s->vbe_index <=3D VBE_DISPI_INDEX_NB) {
         trace_vga_vbe_write(s->vbe_index, val);
         switch(s->vbe_index) {
@@ -796,6 +800,37 @@ void vbe_ioport_write_data(void *opaque, uint32_t =
addr, uint32_t val)
             s->vbe_regs[s->vbe_index] =3D val;
             vga_update_memory_access(s);
             break;
+
+        case VBE_DISPI_INDEX_CURSOR_IMG:
+            cursorData[cursorCounter++] =3D val >> 8;
+            cursorData[cursorCounter++] =3D val;
+            cursorCounter &=3D sizeof(cursorData) - 1;
+            break;
+
+        case VBE_DISPI_INDEX_CURSOR_HOTSPOT:
+            cursor =3D cursor_alloc(16, 16);
+           =20
+            if (val =3D=3D 0x8080) { // blank cursor
+                for (int i =3D 0; i < 16*16; i++) {
+                    cursor->data[i] =3D 0;
+                }
+            } else {
+                for (int i =3D 0; i < 16*16; i++) {
+                    cursor->data[i] =3D=20
+                        ((uint32_t)cursorData[i*4] << 24) |
+                        ((uint32_t)cursorData[i*4+1] << 16) |
+                        ((uint32_t)cursorData[i*4+2] << 8) |
+                        (uint32_t)cursorData[i*4+3];
+                }
+
+                cursor->hot_x =3D (int8_t)(val >> 8);
+                cursor->hot_y =3D (int8_t)val;
+            }
+
+            dpy_cursor_define(s->con, cursor);
+            cursor_put(cursor); // dealloc
+            break;
+
         default:
             break;
         }
diff --git a/include/hw/display/bochs-vbe.h =
b/include/hw/display/bochs-vbe.h
index bc2f046eee..7de409bae7 100644
--- a/include/hw/display/bochs-vbe.h
+++ b/include/hw/display/bochs-vbe.h
@@ -19,7 +19,10 @@
 #define VBE_DISPI_INDEX_VIRT_HEIGHT     0x7
 #define VBE_DISPI_INDEX_X_OFFSET        0x8
 #define VBE_DISPI_INDEX_Y_OFFSET        0x9
-#define VBE_DISPI_INDEX_NB              0xa /* size of vbe_regs[] */
+#define VBE_DISPI_INDEX_CURSOR_IMG      0xb
+#define VBE_DISPI_INDEX_CURSOR_HOTSPOT  0xc
+#define VBE_DISPI_INDEX_CURSOR_ABS      0xd
+#define VBE_DISPI_INDEX_NB              0xe /* size of vbe_regs[] */
 #define VBE_DISPI_INDEX_VIDEO_MEMORY_64K 0xa /* read-only, not in =
vbe_regs */
=20
 /* VBE_DISPI_INDEX_ID */
@@ -54,7 +57,7 @@
=20
 /* bochs vbe register region */
 #define PCI_VGA_BOCHS_OFFSET  0x500
-#define PCI_VGA_BOCHS_SIZE    (0x0b * 2)
+#define PCI_VGA_BOCHS_SIZE    (VBE_DISPI_INDEX_NB * 2)
=20
 /* qemu extension register region */
 #define PCI_VGA_QEXT_OFFSET   0x600

--=20
2.30.1 (Apple Git-130)


