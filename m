Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1099154DF0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:29:16 +0100 (CET)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izoi3-0008I0-Vw
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoaP-0000BX-76
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:21:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoaN-0004ub-In
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:21:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20038
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoaN-0004oM-Dz
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMoANmnIr065In7cpsXfcRTK4RqZYlQX6qpfl4tBv1s=;
 b=SHzItiGCMVSCg6m/T6g8x9ac/WaJutz8dSFhc1JTHaWS52qPaG2qjpXcxe857KBbgLv9jk
 xsUaHFGd3MeoGMjga8pH3TDwZCiZbk22AZk5Vj1ugFr7t0qcZ/Kunl0W4S0YDUPPe0ALTh
 mfVWCj2lZg7E0oQ9Cso4gU8UwbmZ2Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-z9MNhgKYMkKhMUPy65Vikg-1; Thu, 06 Feb 2020 16:21:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49C591034B07
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 21:21:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1AB360BEC;
 Thu,  6 Feb 2020 21:21:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/46] tests/acceptance/boot_linux_console: Do not use VGA on
 Clipper machine
Date: Thu,  6 Feb 2020 22:19:13 +0100
Message-Id: <20200206211936.17098-24-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: z9MNhgKYMkKhMUPy65Vikg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we only read the serial console, we don't need to force a
VGA display. This fixes when running a binary built with
--without-default-devices:

  ERROR: qemu-system-alpha: standard VGA not available

We also need the '-nodefaults' argument to avoid:

  ERROR: qemu-system-alpha: Unsupported NIC model: e1000

Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200129212345.20547-27-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index a6ce917e45..34d37eba3b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -541,7 +541,7 @@ class BootLinuxConsole(Test):
=20
         self.vm.set_console()
         kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE + 'console=
=3DttyS0'
-        self.vm.add_args('-vga', 'std',
+        self.vm.add_args('-nodefaults',
                          '-kernel', uncompressed_kernel,
                          '-append', kernel_command_line)
         self.vm.launch()
--=20
2.21.1


