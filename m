Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D8CB903
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 13:20:44 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGLdb-0005dI-Hq
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 07:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iGKin-0001WQ-PP
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iGKil-0003Ql-UW
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:22:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iGKil-0003QS-PW
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:21:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1111818C8935
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 10:21:59 +0000 (UTC)
Received: from localhost (ovpn-112-73.ams2.redhat.com [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFE685C21A;
 Fri,  4 Oct 2019 10:21:55 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/8] dockerfiles: add dbus-daemon to some of latest
 distributions
Date: Fri,  4 Oct 2019 14:20:50 +0400
Message-Id: <20191004102051.19738-8-marcandre.lureau@redhat.com>
In-Reply-To: <20191004102051.19738-1-marcandre.lureau@redhat.com>
References: <20191004102051.19738-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 04 Oct 2019 10:21:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: berrange@redhat.com, quintela@redhat.com, mprivozn@redhat.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To get dbus-vmstate test covered.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker  | 1 +
 tests/docker/dockerfiles/debian10.docker | 1 +
 tests/docker/dockerfiles/fedora.docker   | 1 +
 tests/docker/dockerfiles/ubuntu.docker   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/docke=
rfiles/centos7.docker
index 953637065c..562d65be9e 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -8,6 +8,7 @@ ENV PACKAGES \
     bzip2-devel \
     ccache \
     csnappy-devel \
+    dbus-daemon \
     flex \
     gcc-c++ \
     gcc \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dock=
erfiles/debian10.docker
index dad498b52e..5de79ae552 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -21,6 +21,7 @@ RUN apt update && \
         build-essential \
         ca-certificates \
         clang \
+        dbus \
         flex \
         gettext \
         git \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
index 4ddc7dd112..4fb1215520 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -9,6 +9,7 @@ ENV PACKAGES \
     ccache \
     clang \
     cyrus-sasl-devel \
+    dbus-daemon \
     device-mapper-multipath-devel \
     findutils \
     flex \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/docker=
files/ubuntu.docker
index f486492224..2182edadea 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -13,6 +13,7 @@ FROM ubuntu:19.04
 ENV PACKAGES flex bison \
     ccache \
     clang \
+    dbus \
     gcc \
     gettext \
     git \
--=20
2.23.0


