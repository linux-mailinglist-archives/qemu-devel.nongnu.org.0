Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E8BBB27
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 20:20:29 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCSwm-0007Hh-7n
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 14:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iCSoQ-0000tj-FQ
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iCSoP-0000lW-3C
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iCSoO-0000jf-Nh
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5C81898114;
 Mon, 23 Sep 2019 18:11:47 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-231.bos.redhat.com [10.18.17.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE781001B00;
 Mon, 23 Sep 2019 18:11:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] docker: removed unused debian8 partial image
Date: Mon, 23 Sep 2019 14:11:36 -0400
Message-Id: <20190923181140.7235-3-jsnow@redhat.com>
In-Reply-To: <20190923181140.7235-1-jsnow@redhat.com>
References: <20190923181140.7235-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 23 Sep 2019 18:11:47 +0000 (UTC)
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

debian8 partial base is also not consumed by any image, so remove it.
For QEMU's development cycle, we only support debian9 (stretch) and
debian10 (buster).

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/docker/Makefile.include           |  2 +-
 tests/docker/dockerfiles/debian8.docker | 34 -------------------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian8.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
index 485de7f59d..b20a810016 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -6,7 +6,7 @@ DOCKER_SUFFIX :=3D .docker
 DOCKER_FILES_DIR :=3D $(SRC_PATH)/tests/docker/dockerfiles
 DOCKER_DEPRECATED_IMAGES :=3D debian
 # we don't run tests on intermediate images (used as base by another ima=
ge)
-DOCKER_PARTIAL_IMAGES :=3D debian debian8 debian9 debian10 debian-sid
+DOCKER_PARTIAL_IMAGES :=3D debian debian9 debian10 debian-sid
 DOCKER_PARTIAL_IMAGES +=3D debian9-mxe debian-ports debian-bootstrap
 DOCKER_IMAGES :=3D $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(not=
dir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
 DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
diff --git a/tests/docker/dockerfiles/debian8.docker b/tests/docker/docke=
rfiles/debian8.docker
deleted file mode 100644
index 1212a85c35..0000000000
--- a/tests/docker/dockerfiles/debian8.docker
+++ /dev/null
@@ -1,34 +0,0 @@
-#
-# Docker multiarch cross-compiler target
-#
-# This docker target is builds on Debian and Emdebian's cross compiler t=
argets
-# to build distro with a selection of cross compilers for building test =
binaries.
-#
-# On its own you can't build much but the docker-foo-cross targets
-# build on top of the base debian image.
-#
-FROM debian:jessie-slim
-
-MAINTAINER Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
-
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sou=
rces.list
-
-# Setup some basic tools we need
-RUN apt update && \
-    DEBIAN_FRONTEND=3Dnoninteractive apt-get install -yy eatmydata && \
-    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
-    apt-get install -y --no-install-recommends \
-        bison \
-        binutils-multiarch \
-        build-essential \
-        ca-certificates \
-        clang \
-        curl \
-        flex \
-        gettext \
-        git \
-        gnupg \
-        pkg-config \
-        python-minimal
-
--=20
2.21.0


