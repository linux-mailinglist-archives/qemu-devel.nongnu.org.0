Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941426CCBF7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 23:12:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGbM-0003S9-JQ; Tue, 28 Mar 2023 17:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phGbH-0003R5-LX
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phGbF-0004sg-NT
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680037884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwaJRLW+gd4LyNpezKNDSLIf+CC9ZFcawv875W/9YD0=;
 b=TAON9j4frouB6aH1mLSxByipFmDnBi5W6j3XkvVqqzKzm/No3Pn3vdjTrkx06Hpej4lkNn
 ILJqx23eMlDRWbr25zCGTXIpOv2Wctq+94hXPhC+uWe3DCseFWH4Q406nNrDa90tSpNJhy
 D1VemCJMKMAM6q9o1MoHGQ40bbbjmpk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-YgzVL0YCOsSjiH_jf-pk5w-1; Tue, 28 Mar 2023 17:11:21 -0400
X-MC-Unique: YgzVL0YCOsSjiH_jf-pk5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D00743810B09;
 Tue, 28 Mar 2023 21:11:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7878BC15BA0;
 Tue, 28 Mar 2023 21:11:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [RFC PATCH 2/3] tests: add python3-venv dependency
Date: Tue, 28 Mar 2023 17:11:18 -0400
Message-Id: <20230328211119.2748442-3-jsnow@redhat.com>
In-Reply-To: <20230328211119.2748442-1-jsnow@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Several debian-based tests need the python3-venv dependency as a
consequence of Debian debundling the "ensurepip" module normally
included with Python.

As this series stands right now, in most cases, Debian requires EITHER:

(A) setuptools and pip, or
(B) ensurepip

It's quite likely most developer workstations running Debian or a
Debian-based distro already have all of these packages. venv creation
will actually be quite a bit faster by installing pip and setuptools,
but for the purposes of this patch I am only adding the strict minimum
necessary.

(For that reason, I chose ensurepip to make sure that as we continue
tweaking and developing the mkvenv script, we can count on Debian having
a fully functional Python installation; but for the sake of this series
it is an arbitrary choice here.)

In one case, even though we already have pip and setuptools, we still
need ensurepip because the version of these tools that shipped with
Debian are known to be broken and do not function correctly inside of a
venv. Using ensurepip bypasses the bug. (This is only for Debian 10,
which we technically no longer support. Even so, I wanted to prove it's
possible to support our oldest platforms.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 3 ++-
 tests/docker/dockerfiles/debian-hexagon-cross.docker  | 3 ++-
 tests/docker/dockerfiles/debian-riscv64-cross.docker  | 3 ++-
 tests/docker/dockerfiles/debian-tricore-cross.docker  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 981e9bdc7b0..f9f401544a0 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -57,7 +57,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         gcc-sh4-linux-gnu \
         libc6-dev-sh4-cross \
         gcc-sparc64-linux-gnu \
-        libc6-dev-sparc64-cross
+        libc6-dev-sparc64-cross \
+        python3-venv
 
 ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
 ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 5308ccb8fe9..344eec900b0 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -20,7 +20,8 @@ RUN apt-get update && \
         bison \
         flex \
         git \
-        ninja-build && \
+        ninja-build \
+        python3-venv && \
 # Install QEMU build deps for use in CI
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 803afb95734..081404e0141 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -28,7 +28,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
     libglib2.0-dev \
     ninja-build \
     pkg-config \
-    python3
+    python3 \
+    python3-venv
 
 # Add ports and riscv64 architecture
 RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index cfd2faf9a80..269bfa8d423 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -33,7 +33,8 @@ RUN apt update && \
        pkgconf \
        python3-pip \
        python3-setuptools \
-       python3-wheel
+       python3-wheel \
+       python3-venv
 
 RUN curl -#SL https://github.com/bkoppelmann/package_940/releases/download/tricore-toolchain-9.40/tricore-toolchain-9.4.0.tar.gz \
     | tar -xzC /usr/local/
-- 
2.39.2


