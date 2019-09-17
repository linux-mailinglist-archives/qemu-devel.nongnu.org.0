Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3BB55E5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 21:03:11 +0200 (CEST)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAIko-0003N1-La
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 15:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iAIdi-0007Gi-FF
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iAIdh-00083E-F6
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:55:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56892)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iAIdh-00082y-9v
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:55:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 34A5FC054C52;
 Tue, 17 Sep 2019 18:55:48 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-165.bos.redhat.com [10.18.17.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D774B1001B09;
 Tue, 17 Sep 2019 18:55:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 14:55:37 -0400
Message-Id: <20190917185537.25417-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 17 Sep 2019 18:55:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/docker: fix typo for debian9-mxe
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

We spelled it debian-9-mxe, but the image is debian9-mxe.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
index 50a400b573..7eac1516f6 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -7,7 +7,7 @@ DOCKER_FILES_DIR :=3D $(SRC_PATH)/tests/docker/dockerfile=
s
 DOCKER_DEPRECATED_IMAGES :=3D debian
 # we don't run tests on intermediate images (used as base by another ima=
ge)
 DOCKER_PARTIAL_IMAGES :=3D debian debian8 debian9 debian10 debian-sid
-DEBIAN_PARTIAL_IMAGES +=3D debian8-mxe debian-9-mxe debian-ports debian-=
bootstrap
+DEBIAN_PARTIAL_IMAGES +=3D debian8-mxe debian9-mxe debian-ports debian-b=
ootstrap
 DOCKER_IMAGES :=3D $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(not=
dir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
 DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
--=20
2.21.0


