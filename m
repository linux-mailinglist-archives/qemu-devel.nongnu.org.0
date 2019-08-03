Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCA80545
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 10:26:36 +0200 (CEST)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htpN4-0000Ak-Vv
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 04:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41087)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1htpM0-0007pG-0s
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 04:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1htpLy-0006rI-Pr
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 04:25:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1htpLy-0006qZ-5d
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 04:25:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DA583DE22;
 Sat,  3 Aug 2019 08:25:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B359960BF4;
 Sat,  3 Aug 2019 08:25:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 10:25:17 +0200
Message-Id: <20190803082517.15035-2-philmd@redhat.com>
In-Reply-To: <20190803082517.15035-1-philmd@redhat.com>
References: <20190803082517.15035-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Sat, 03 Aug 2019 08:25:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/1] Makefile: remove DESTDIR from firmware file
 content
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Olaf Hering <olaf@aepfle.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Olaf Hering <olaf@aepfle.de>

The resulting firmware files should only contain the runtime path.
Fixes commit 26ce90fde5c ("Makefile: install the edk2 firmware images
and their descriptors")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20190530192812.17637-1-olaf@aepfle.de>
Fixes: https://bugs.launchpad.net/qemu/+bug/1838703
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cfab1561b9..85862fb81a 100644
--- a/Makefile
+++ b/Makefile
@@ -881,7 +881,7 @@ ifneq ($(DESCS),)
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/firmware"
 	set -e; tmpf=3D$$(mktemp); trap 'rm -f -- "$$tmpf"' EXIT; \
 	for x in $(DESCS); do \
-		sed -e 's,@DATADIR@,$(DESTDIR)$(qemu_datadir),' \
+		sed -e 's,@DATADIR@,$(qemu_datadir),' \
 			"$(SRC_PATH)/pc-bios/descriptors/$$x" > "$$tmpf"; \
 		$(INSTALL_DATA) "$$tmpf" \
 			"$(DESTDIR)$(qemu_datadir)/firmware/$$x"; \
--=20
2.20.1


