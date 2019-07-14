Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F76467F06
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jul 2019 14:48:19 +0200 (CEST)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmdvN-0001c3-Qg
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmdvB-0001E7-6O
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 08:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmdvA-00086n-Cu
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 08:48:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hmdvA-000860-7Q
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 08:48:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3EA3859FE;
 Sun, 14 Jul 2019 12:48:02 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-24.brq.redhat.com [10.40.204.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C51895D772;
 Sun, 14 Jul 2019 12:47:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Jul 2019 14:47:55 +0200
Message-Id: <20190714124755.14356-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sun, 14 Jul 2019 12:48:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1] hw/lm32/Kconfig: Milkymist One
 provides a USB 1.1 Controller
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Milkymist SoftUSB block provides the OHCI USB standard
(missed in 0858746b835).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/lm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 3d09c2dd6f..ed2e3060b0 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -11,3 +11,4 @@ config MILKYMIST
     select PFLASH_CFI01
     select FRAMEBUFFER
     select SD
+    select USB_OHCI
--=20
2.20.1


