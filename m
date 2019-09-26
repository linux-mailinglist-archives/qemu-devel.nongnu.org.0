Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2786CBF12C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 13:22:44 +0200 (CEST)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDRr9-0007Ll-6N
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 07:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iDRot-0005Co-Ls
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:20:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iDRos-0004hP-PS
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:20:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53180)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iDRos-0004gj-Jk
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:20:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D838610CC1E6
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 11:20:21 +0000 (UTC)
Received: from localhost (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62BA060126;
 Thu, 26 Sep 2019 11:20:20 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests: fix echi/ehci typo
Date: Thu, 26 Sep 2019 15:19:55 +0400
Message-Id: <20190926111955.17276-3-marcandre.lureau@redhat.com>
In-Reply-To: <20190926111955.17276-1-marcandre.lureau@redhat.com>
References: <20190926111955.17276-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 26 Sep 2019 11:20:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While at it, simplify using $(land).

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/Makefile.include | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 0595914526..3543451ed3 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -182,9 +182,7 @@ check-qtest-i386-$(CONFIG_PVPANIC) +=3D tests/pvpanic=
-test$(EXESUF)
 check-qtest-i386-$(CONFIG_I82801B11) +=3D tests/i82801b11-test$(EXESUF)
 check-qtest-i386-$(CONFIG_IOH3420) +=3D tests/ioh3420-test$(EXESUF)
 check-qtest-i386-$(CONFIG_USB_UHCI) +=3D tests/usb-hcd-uhci-test$(EXESUF=
)
-ifeq ($(CONFIG_USB_ECHI)$(CONFIG_USB_UHCI),yy)
-check-qtest-i386-y +=3D tests/usb-hcd-ehci-test$(EXESUF)
-endif
+check-qtest-i386-$(call land,$(CONFIG_USB_EHCI),$(CONFIG_USB_UHCI)) +=3D=
 tests/usb-hcd-ehci-test$(EXESUF)
 check-qtest-i386-$(CONFIG_USB_XHCI_NEC) +=3D tests/usb-hcd-xhci-test$(EX=
ESUF)
 check-qtest-i386-y +=3D tests/cpu-plug-test$(EXESUF)
 check-qtest-i386-y +=3D tests/q35-test$(EXESUF)
--=20
2.23.0


