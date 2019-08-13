Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C98BA3A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 15:31:49 +0200 (CEST)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxWtw-0000Lu-G8
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 09:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hxWt2-0007tb-Ff
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hxWt1-0003x1-H3
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:30:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hxWt1-0003vT-C2
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 09:30:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40E6B30BCB8C
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 13:30:48 +0000 (UTC)
Received: from localhost (ovpn-117-191.ams2.redhat.com [10.36.117.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D29891C4;
 Tue, 13 Aug 2019 13:30:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 14:30:42 +0100
Message-Id: <20190813133042.11683-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 13 Aug 2019 13:30:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] usb: reword -usb command-line option and
 mention xHCI
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
Cc: kraxel@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -usb section of the man page is not very clear on what exactly -usb
does and fails to mention xHCI as a modern alternative (-device
nec-usb-xhci).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-options.hx | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 9621e934c0..7d11c016d1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1436,12 +1436,15 @@ STEXI
 ETEXI
=20
 DEF("usb", 0, QEMU_OPTION_usb,
-    "-usb            enable the USB driver (if it is not used by default=
 yet)\n",
+    "-usb            enable on-board USB host controller (if not enabled=
 by default)\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -usb
 @findex -usb
-Enable the USB driver (if it is not used by default yet).
+Enable USB emulation on machine types with an on-board USB host controll=
er (if
+not enabled by default).  Note that on-board USB host controllers may no=
t
+support USB 3.0.  In this case -device nec-usb-xhci can be used instead =
on
+machines with PCI.
 ETEXI
=20
 DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
--=20
2.21.0


