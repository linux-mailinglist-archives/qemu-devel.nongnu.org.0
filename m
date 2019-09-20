Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A7B8864
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 02:16:04 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB6ah-00052h-6g
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 20:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iB6Z6-00049e-EZ
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 20:14:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iB6Z4-000529-NJ
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 20:14:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iB6Z4-00051p-I4
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 20:14:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8B5A3DE04;
 Fri, 20 Sep 2019 00:14:21 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-38.bos.redhat.com [10.18.17.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40C4119C5B;
 Fri, 20 Sep 2019 00:14:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] docker: remove debian8-mxe definitions
Date: Thu, 19 Sep 2019 20:14:12 -0400
Message-Id: <20190920001413.22567-3-jsnow@redhat.com>
In-Reply-To: <20190920001413.22567-1-jsnow@redhat.com>
References: <20190920001413.22567-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 20 Sep 2019 00:14:21 +0000 (UTC)
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

We don't have a debian8-mxe dockerfile anymore.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
index 8825821127..7af476d957 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -6,7 +6,7 @@ DOCKER_SUFFIX :=3D .docker
 DOCKER_FILES_DIR :=3D $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another ima=
ge)
 DOCKER_PARTIAL_IMAGES :=3D debian8 debian9 debian10 debian-sid
-DEBIAN_PARTIAL_IMAGES +=3D debian8-mxe debian-9-mxe debian-ports debian-=
bootstrap
+DEBIAN_PARTIAL_IMAGES +=3D debian-9-mxe debian-ports debian-bootstrap
 DOCKER_IMAGES :=3D $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_=
DIR)/*.docker))))
 DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
--=20
2.21.0


