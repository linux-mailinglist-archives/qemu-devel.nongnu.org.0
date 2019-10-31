Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05912EB233
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 15:11:30 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQBAc-0007MB-Kq
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 10:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iQB1d-0004BM-27
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 10:02:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iQB1Z-0005uW-Ae
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 10:02:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21011
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iQB1Z-0005eQ-56
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 10:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572530522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yxiWjJX/FT49R2PgLCm+TwV/NcfLhOEMmC4etKlIxIk=;
 b=Nl7ZXV6AqmoUQ8F8aZCYuBAK5OIpekFvODQUwXu+Fh+00SyxtUA2dJVRlYWSX+R5PiJmPN
 Y1gjeytHdYxwlpeDpIWNW3JSIv/ZLjqcY315454QTZsH1RGKFAkOaeWPeGxV/gg7COxWfC
 1mxbe6AKb3BG8MOg1SkaXuT6t/pDmXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-Bj2zUOjvPfGI28BiGTf7ag-1; Thu, 31 Oct 2019 10:01:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484BC800D49;
 Thu, 31 Oct 2019 14:01:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-214.brq.redhat.com [10.40.204.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D1B1600CE;
 Thu, 31 Oct 2019 14:01:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/boot_linux_console: Fetch assets from Debian snapshot
 archives
Date: Thu, 31 Oct 2019 15:01:52 +0100
Message-Id: <20191031140152.19769-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Bj2zUOjvPfGI28BiGTf7ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel packaged was fetched from an unstable repository.
Use the stable snapshot archive instead.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 4e9ac0ecc3..f5aa87317c 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -479,7 +479,8 @@ class BootLinuxConsole(Test):
         :avocado: tags=3Darch:m68k
         :avocado: tags=3Dmachine:q800
         """
-        deb_url =3D ('http://ftp.ports.debian.org/debian-ports/pool-m68k/m=
ain'
+        deb_url =3D ('https://snapshot.debian.org/archive/debian-ports'
+                   '/20190922T090906Z/pool-m68k/main'
                    '/l/linux/kernel-image-5.2.0-2-m68k-di_5.2.9-2_m68k.ude=
b')
         deb_hash =3D '0797e05129595f22f3c0142db5e199769a723bf9'
         deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
--=20
2.21.0


