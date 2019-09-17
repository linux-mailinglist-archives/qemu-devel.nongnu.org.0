Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE69B55E3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 21:02:44 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAIkM-00038r-MX
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 15:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iAIY2-0002NC-Gr
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iAIXz-0004rd-Tl
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:49:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iAIXz-0004rU-Oy
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:49:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D34B6C058CA4;
 Tue, 17 Sep 2019 18:49:54 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-165.bos.redhat.com [10.18.17.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20C9A600C4;
 Tue, 17 Sep 2019 18:49:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 14:49:48 -0400
Message-Id: <20190917184948.24627-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 17 Sep 2019 18:49:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/vm: remove unused --target-list option
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not used; so remove the distraction.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/Makefile.include | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index fea348e845..61758101fa 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -28,7 +28,6 @@ vm-help vm-test:
 	@echo
 	@echo "Special variables:"
 	@echo "    BUILD_TARGET=3Dfoo		 - Override the build target"
-	@echo "    TARGET_LIST=3Da,b,c    	 - Override target list in builds"
 	@echo '    EXTRA_CONFIGURE_OPTS=3D"..."'
 	@echo "    J=3D[0..9]*            	 - Override the -jN parameter for ma=
ke commands"
 	@echo "    DEBUG=3D1              	 - Enable verbose output on host and=
 interactive debugging"
@@ -65,7 +64,6 @@ vm-build-%: $(IMAGES_DIR)/%.img
 		$(if $(BUILD_TARGET),--build-target $(BUILD_TARGET)) \
 		--snapshot \
 		--build-qemu $(SRC_PATH) -- \
-		$(if $(TARGET_LIST),--target-list=3D$(TARGET_LIST)) \
 		$(if $(EXTRA_CONFIGURE_OPTS),$(EXTRA_CONFIGURE_OPTS)), \
 		"  VM-BUILD $*")
=20
--=20
2.21.0


