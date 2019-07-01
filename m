Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C276346908
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 22:30:20 +0200 (CEST)
Received: from localhost ([::1]:55104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbsq3-00039b-PS
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 16:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56277)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lersek@redhat.com>) id 1hbsjl-0006pB-Kt
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 16:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1hbsjk-0006xz-11
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 16:23:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1hbsjj-0006xL-Pw
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 16:23:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BDF313092645
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 20:23:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-141.ams2.redhat.com
 [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FAE95C1A1;
 Fri, 14 Jun 2019 20:23:44 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 22:23:31 +0200
Message-Id: <20190614202333.19355-5-lersek@redhat.com>
In-Reply-To: <20190614202333.19355-1-lersek@redhat.com>
References: <20190614202333.19355-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 14 Jun 2019 20:23:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/6] roms/Makefile.edk2: update input file list
 for "pc-bios/edk2-licenses.txt"
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(1) For TianoCore Bugzilla

      https://bugzilla.tianocore.org/show_bug.cgi?id=3D1373

    the majority of the edk2 tree was relicensed under the
    BSD-2-Clause-Patent license:

      https://spdx.org/licenses/BSD-2-Clause-Patent.html>

    Edk2 commit f53de8aecb12 ("edk2: Add License-History.txt", 2019-04-09=
)
    added a new file called "License-History.txt", describing license and
    contributor agreement changes over time.

(2) For advacing edk2's OpenSSL git submodule to the 1.1.1b release, a
    more up-to-date ArmSoftFloatLib instance became necessary, on 32-bit
    ARM. Therefore, the embedded (and by now, obsolete) Berkeley SoftFloa=
t
    library was replaced with a git submodule of the same, checked out at
    the latest release ("3e", plus a typo fix on top -- commit
    b64af41c3276). This was implemented for TianoCore Bugzilla

      https://bugzilla.tianocore.org/show_bug.cgi?id=3D1845

    in edk2 commit range b6cfa686e42d..371e7001e8d5.

Include the edk2 project's "License-History.txt" file, and the Berkeley
SoftFloat library's "COPYING.txt", in our generated
"pc-bios/edk2-licenses.txt" text file.

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Ref: https://bugs.launchpad.net/qemu/+bug/1831477
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 roms/Makefile.edk2 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index 6a19498d0738..c2f2ff59d5b1 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -17,7 +17,9 @@ toolchain =3D $(shell source ./edk2-funcs.sh && qemu_ed=
k2_get_toolchain $(1))
=20
 licenses :=3D \
 	edk2/License.txt \
+	edk2/License-History.txt \
 	edk2/OvmfPkg/License.txt \
+	edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
 	edk2/CryptoPkg/Library/OpensslLib/openssl/LICENSE
=20
 # The "edk2-arm-vars.fd" varstore template is suitable for aarch64 as we=
ll.
--=20
2.19.1.3.g30247aa5d201



