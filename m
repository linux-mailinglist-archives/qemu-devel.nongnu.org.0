Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A1C31D5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 12:55:49 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFFop-00075D-U3
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 06:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iFFkO-0003Xi-6y
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:51:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iFFkM-0007Pl-6p
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:51:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iFFkI-0007MA-DB
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 06:51:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FCDB10DCC94;
 Tue,  1 Oct 2019 10:51:04 +0000 (UTC)
Received: from thuth.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF71446;
 Tue,  1 Oct 2019 10:51:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/5] tests: fix echi/ehci typo
Date: Tue,  1 Oct 2019 12:50:54 +0200
Message-Id: <20191001105057.3949-3-thuth@redhat.com>
In-Reply-To: <20191001105057.3949-1-thuth@redhat.com>
References: <20191001105057.3949-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 10:51:04 +0000 (UTC)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

While at it, simplify using $(land).

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-Id: <20190926111955.17276-3-marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Fixes: dad5ddcea3b661 ("check: Only test usb-ehci when it is compiled in"=
)
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.18.1


