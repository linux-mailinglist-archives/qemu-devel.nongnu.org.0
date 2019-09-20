Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EEB99A2
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Sep 2019 00:24:15 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBRK2-0005os-8q
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 18:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iBR9K-0000KI-Np
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iBR9J-000710-Pe
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:13:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iBR9J-00070U-KZ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:13:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2BE430842A8;
 Fri, 20 Sep 2019 22:13:08 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-38.bos.redhat.com [10.18.17.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D2225D9C3;
 Fri, 20 Sep 2019 22:13:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] docker: remove unused debian-sid and debian-ports
Date: Fri, 20 Sep 2019 18:12:54 -0400
Message-Id: <20190920221255.30412-5-jsnow@redhat.com>
In-Reply-To: <20190920221255.30412-1-jsnow@redhat.com>
References: <20190920221255.30412-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 20 Sep 2019 22:13:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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

These are listed as "partial" images, but have no user.
Remove them.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20190920001413.22567-4-jsnow@redhat.com
---
 tests/docker/Makefile.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
index 0a7fc8bc79..cb41652885 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -5,8 +5,8 @@
 DOCKER_SUFFIX :=3D .docker
 DOCKER_FILES_DIR :=3D $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another ima=
ge)
-DOCKER_PARTIAL_IMAGES :=3D debian8 debian9 debian10 debian-sid
-DOCKER_PARTIAL_IMAGES +=3D debian9-mxe debian-ports debian-bootstrap
+DOCKER_PARTIAL_IMAGES :=3D debian8 debian9 debian10
+DOCKER_PARTIAL_IMAGES +=3D debian9-mxe debian-bootstrap
 DOCKER_IMAGES :=3D $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_=
DIR)/*.docker))))
 DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
--=20
2.21.0


