Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB27144062
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 16:21:49 +0100 (CET)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itvLg-000274-Gz
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 10:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itvGG-00070h-Ez
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:16:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itvGE-0005D7-UP
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:16:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20587
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itvGE-0005Ct-Pq
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579619770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEpsyadu7vYAwnKkNX9/a5tUeKZfr6O+ualpnw2u/24=;
 b=EUXrcgP4of/qGprOSD6sLBTLk3Qgoq1/I717lVcNHd+ORHYawJWEonyLd3CRIhywR7DXfQ
 LCRFDP1EKCNhCAW+CboZKr5sdCDiI1q1sBfUdMHEOmwPfkyCSJPb+h+sWBiab8EXquc9Pw
 eCt2cirbxjESGswinfhIxc/mjTIC4ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-tdTDKlRzOheJuMTnX0wLOA-1; Tue, 21 Jan 2020 10:16:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56AF618AAFAC
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 15:16:02 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCB060C88;
 Tue, 21 Jan 2020 15:15:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] gitlab-ci.yml: Add jobs to build EDK2 firmware binaries
Date: Tue, 21 Jan 2020 16:15:43 +0100
Message-Id: <20200121151543.18538-3-philmd@redhat.com>
In-Reply-To: <20200121151543.18538-1-philmd@redhat.com>
References: <20200121151543.18538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tdTDKlRzOheJuMTnX0wLOA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two GitLab job to build the EDK2 firmware binaries.

The first job build a Docker image with the packages requisite
to build EDK2, and store this image in the GitLab registry.
The second job pull the image from the registry and build the
EDK2 firmware binaries.

The docker image is only rebuilt if the GitLab YAML or the
Dockerfile is updated.
The second job is only built when the roms/edk2/ submodule is
updated, when a git-ref starts with 'edk2' or when the last
commit contains 'EDK2'. The files generated are archived in
the artifacts.zip file.

With edk2-stable201905, it took 2 minutes 52 seconds to build
the docker image, and 36 minutes 28 seconds to generate the
artifacts.zip with the firmware binaries (filesize: 10MiB).

See: https://gitlab.com/philmd/qemu/pipelines/107553178

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .gitlab-ci-edk2.yml          | 49 ++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/edk2/Dockerfile | 27 ++++++++++++++++++++
 .gitlab-ci.yml               |  3 +++
 MAINTAINERS                  |  2 ++
 4 files changed, 81 insertions(+)
 create mode 100644 .gitlab-ci-edk2.yml
 create mode 100644 .gitlab-ci.d/edk2/Dockerfile

diff --git a/.gitlab-ci-edk2.yml b/.gitlab-ci-edk2.yml
new file mode 100644
index 0000000000..088ba4b43a
--- /dev/null
+++ b/.gitlab-ci-edk2.yml
@@ -0,0 +1,49 @@
+docker-edk2:
+ stage: build
+ rules: # Only run this job when the Dockerfile is modified
+ - changes:
+   - .gitlab-ci-edk2.yml
+   - .gitlab-ci.d/edk2/Dockerfile
+   when: always
+ image: docker:19.03.1
+ services:
+ - docker:19.03.1-dind
+ variables:
+  GIT_DEPTH: 3
+  IMAGE_TAG: $CI_REGISTRY_IMAGE:edk2-cross-build
+  # We don't use TLS
+  DOCKER_HOST: tcp://docker:2375
+  DOCKER_TLS_CERTDIR: ""
+ before_script:
+ - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
+ script:
+ - docker pull $IMAGE_TAG || true
+ - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMI=
T_SHA
+                                        --tag $IMAGE_TAG .gitlab-ci.d/edk2
+ - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
+ - docker push $IMAGE_TAG
+
+build-edk2:
+ rules: # Only run this job when ...
+ - changes: # ... roms/edk2/ is modified (submodule updated)
+   - roms/edk2/*
+   when: always
+ - if: '$CI_COMMIT_REF_NAME =3D~ /^edk2/' # or the branch/tag starts with =
'edk2'
+   when: always
+ - if: '$CI_COMMIT_MESSAGE =3D~ /edk2/i' # or last commit description cont=
ains 'EDK2'
+   when: always
+ artifacts:
+   paths: # 'artifacts.zip' will contains the following files:
+   - pc-bios/edk2*bz2
+   - pc-bios/edk2-licenses.txt
+   - edk2-stdout.log
+   - edk2-stderr.log
+ image: $CI_REGISTRY_IMAGE:edk2-cross-build
+ variables:
+   GIT_DEPTH: 3
+ script: # Clone the required submodules and build EDK2
+ - git submodule update --init roms/edk2
+ - git -C roms/edk2 submodule update --init
+ - export JOBS=3D$(($(getconf _NPROCESSORS_ONLN) + 1))
+ - echo "=3D=3D=3D Using ${JOBS} simultaneous jobs =3D=3D=3D"
+ - make -j${JOBS} -C roms efi 2>&1 1>edk2-stdout.log | tee -a edk2-stderr.=
log >&2
diff --git a/.gitlab-ci.d/edk2/Dockerfile b/.gitlab-ci.d/edk2/Dockerfile
new file mode 100644
index 0000000000..b4584d1cf6
--- /dev/null
+++ b/.gitlab-ci.d/edk2/Dockerfile
@@ -0,0 +1,27 @@
+#
+# Docker image to cross-compile EDK2 firmware binaries
+#
+FROM ubuntu:16.04
+
+MAINTAINER Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+
+# Install packages required to build EDK2
+RUN apt update \
+    && \
+    \
+    DEBIAN_FRONTEND=3Dnoninteractive \
+    apt install --assume-yes --no-install-recommends \
+        build-essential \
+        ca-certificates \
+        dos2unix \
+        gcc-aarch64-linux-gnu \
+        gcc-arm-linux-gnueabi \
+        git \
+        iasl \
+        make \
+        nasm \
+        python \
+        uuid-dev \
+    && \
+    \
+    rm -rf /var/lib/apt/lists/*
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d9a90f795d..228783993e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,3 +1,6 @@
+include:
+  - local: '/.gitlab-ci-edk2.yml'
+
 before_script:
  - apt-get update -qq
  - apt-get install -y -qq flex bison libglib2.0-dev libpixman-1-dev geniso=
image
diff --git a/MAINTAINERS b/MAINTAINERS
index 55d3642e6c..2c768ed3d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2368,6 +2368,8 @@ F: roms/edk2
 F: roms/edk2-*
 F: tests/data/uefi-boot-images/
 F: tests/uefi-test-tools/
+F: .gitlab-ci-edk2.yml
+F: .gitlab-ci.d/edk2/
=20
 Usermode Emulation
 ------------------
--=20
2.21.1


