Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5508B45671
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 09:33:12 +0200 (CEST)
Received: from localhost ([::1]:49034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbghz-0005ri-H1
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 03:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbgb9-0008Li-AB
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 03:26:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbgb7-0005kh-9n
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 03:26:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hbgay-0005bR-4V; Fri, 14 Jun 2019 03:25:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0C4D22F8BD7;
 Fri, 14 Jun 2019 07:25:55 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 997A060637;
 Fri, 14 Jun 2019 07:25:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 09:24:32 +0200
Message-Id: <20190614072432.820-7-philmd@redhat.com>
In-Reply-To: <20190614072432.820-1-philmd@redhat.com>
References: <20190614072432.820-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 14 Jun 2019 07:25:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/6] .travis.yml: Test static linking
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Bharata B Rao <bharata@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Niels de Vos <ndevos@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
This job currently fails:

      LINK    lm32-softmmu/qemu-system-lm32
    /usr/bin/ld: cannot find -lgtk-3
    /usr/bin/ld: cannot find -latk-bridge-2.0
    /usr/bin/ld: cannot find -latspi
    /usr/bin/ld: cannot find -lsystemd
    /usr/bin/ld: cannot find -lgdk-3
    /usr/bin/ld: cannot find -lwayland-egl
    /usr/bin/ld: cannot find -lmirclient
    /usr/bin/ld: cannot find -lmircore
    /usr/bin/ld: cannot find -lmircookie
    /usr/bin/ld: cannot find -lepoxy
    /usr/bin/ld: cannot find -latk-1.0
    /usr/bin/ld: cannot find -lgdk_pixbuf-2.0
    /usr/bin/ld: cannot find -lselinux
    /usr/bin/ld: cannot find -lgtk-3
    /usr/bin/ld: cannot find -latk-bridge-2.0
    /usr/bin/ld: cannot find -latspi
    /usr/bin/ld: cannot find -lsystemd
    /usr/bin/ld: cannot find -lgdk-3
    /usr/bin/ld: cannot find -lwayland-egl
    /usr/bin/ld: cannot find -lmirclient
    /usr/bin/ld: cannot find -lmircore
    /usr/bin/ld: cannot find -lmircookie
    /usr/bin/ld: cannot find -lepoxy
    /usr/bin/ld: cannot find -latk-1.0
    /usr/bin/ld: cannot find -lgdk_pixbuf-2.0
    /usr/bin/ld: cannot find -lselinux
    /usr/bin/ld: attempted static link of dynamic object `/usr/lib/x86_64=
-linux-gnu/libz.so'
    collect2: error: ld returned 1 exit status
    Makefile:204: recipe for target 'qemu-system-lm32' failed
    make[1]: *** [qemu-system-lm32] Error 1
    Makefile:472: recipe for target 'subdir-lm32-softmmu' failed
    make: *** [subdir-lm32-softmmu] Error 2
---
 .travis.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 08502c0aa2..6962fff826 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -92,6 +92,11 @@ matrix:
         - CONFIG=3D"--disable-user --target-list-exclude=3D${MAIN_SOFTMM=
U_TARGETS}"
=20
=20
+    # Test static linking
+    - env:
+        - CONFIG=3D"--static --target-list=3Dlm32-softmmu"
+
+
     # Just build tools and run minimal unit and softfloat checks
     - env:
         - BASE_CONFIG=3D"--enable-tools"
--=20
2.20.1


