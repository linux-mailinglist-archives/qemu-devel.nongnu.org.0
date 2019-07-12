Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DF6703B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 15:40:06 +0200 (CEST)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlvmO-0004b5-RV
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 09:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57339)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvm4-0003of-Le
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvm3-00069N-OV
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:39:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvm0-0005zJ-NE; Fri, 12 Jul 2019 09:39:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1620D308FC4B;
 Fri, 12 Jul 2019 13:39:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3B9019C67;
 Fri, 12 Jul 2019 13:39:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:21 +0200
Message-Id: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 12 Jul 2019 13:39:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A series of obvious patches to build without the deprecated
bluetooth devices. Still worth for 4.1 or too late?
It is clearly not a bugfix.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (7):
  hw/arm: Nokia N-series tablet requires Bluetooth
  hw/usb: Bluetooth HCI USB depends on USB & BLUETOOTH
  MAINTAINERS: Add a Bluetooth entry
  vl: Fix 'braces' coding style issues
  vl: Use qemu_strtoi() instead of strtol()
  vl: Extract bt_parse() into its own file
  hw/bt: Allow building with CONFIG_BLUETOOTH disabled

 MAINTAINERS         |   7 +++
 Makefile.objs       |   3 +-
 bt-opts.c           | 140 ++++++++++++++++++++++++++++++++++++++++++++
 bt-stubs.c          |  18 ++++++
 hw/arm/Kconfig      |   1 +
 hw/bt/Makefile.objs |   4 +-
 hw/usb/Kconfig      |   2 +-
 include/sysemu/bt.h |   3 +
 vl.c                | 121 --------------------------------------
 9 files changed, 174 insertions(+), 125 deletions(-)
 create mode 100644 bt-opts.c
 create mode 100644 bt-stubs.c

--=20
2.20.1


