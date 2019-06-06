Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF43755B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 15:37:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYsa5-00026G-U7
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 09:37:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hYsUv-0006sj-CP
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hYsUt-0003S3-Vz
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:32:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49074)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>) id 1hYsUr-0001jC-Vl
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 09:32:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84BDB80E5F
	for <qemu-devel@nongnu.org>; Thu,  6 Jun 2019 13:31:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-196.ams2.redhat.com
	[10.36.116.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F423168426;
	Thu,  6 Jun 2019 13:31:40 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Date: Thu,  6 Jun 2019 15:31:10 +0200
Message-Id: <20190606133110.13754-7-lersek@redhat.com>
In-Reply-To: <20190606133110.13754-1-lersek@redhat.com>
References: <20190606133110.13754-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 06 Jun 2019 13:31:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/6] pc-bios: update the README file with
 edk2-stable201905 information
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refresh the "pc-bios/README" file with edk2, OpenSSL, and Berkeley
SoftFloat release info, matching the edk2-stable201905 firmware images
added in the previous patch.

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Ref: https://bugs.launchpad.net/qemu/+bug/1831477
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 pc-bios/README | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/pc-bios/README b/pc-bios/README
index 807d95dd5418..180795a55b8a 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -55,9 +55,11 @@
   variable store templates built from the TianoCore community's EFI Deve=
lopment
   Kit II project
   <https://github.com/tianocore/tianocore.github.io/wiki/EDK-II>. The im=
ages
-  were built at git tag "edk2-stable201903". The firmware binaries bundl=
e parts
-  of the OpenSSL project, at git tag "OpenSSL_1_1_0j" (the OpenSSL tag i=
s a
-  function of the edk2 tag). Licensing information is given in
-  "edk2-licenses.txt". The image files are described by the JSON documen=
ts in
-  the "pc-bios/descriptors" directory, which conform to the
-  "docs/interop/firmware.json" schema.
+  were built at git tag "edk2-stable201905". The firmware binaries bundl=
e parts
+  of the OpenSSL project, at git tag "OpenSSL_1_1_1b" (the OpenSSL tag i=
s a
+  function of the edk2 tag). Parts of the Berkeley SoftFloat library are
+  bundled as well, at Release 3e plus a subsequent typo fix (commit
+  b64af41c3276f97f0e181920400ee056b9c88037), as an OpenSSL dependency on=
 32-bit
+  ARM. Licensing information is given in "edk2-licenses.txt". The image =
files
+  are described by the JSON documents in the "pc-bios/descriptors" direc=
tory,
+  which conform to the "docs/interop/firmware.json" schema.
--=20
2.19.1.3.g30247aa5d201


