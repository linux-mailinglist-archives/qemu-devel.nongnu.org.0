Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8B127F16
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 16:11:16 +0100 (CET)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJvv-0005fe-Kh
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 10:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiJri-0008BM-O9
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiJrh-0000uE-NK
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:06:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31821
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiJrh-0000to-JS
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576854413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuyE/qTzYXt1c1/LGWpcX7MbcN7ayH6LYIr9Eyrm/Cw=;
 b=GkKBrlW2pV9NcFtbUEkgSWDCsFlMybzI7OnCxCgUT3zGibN+1PC+JC00UZw8KeJyB5gRKg
 J5X5su2bfNTXBexivfN2k9XzAiZq1frO6nyABF97wKDRtfCHYx6vsenuJa0ErhxwGU4pqn
 yX/Lsg+4M+OdMJoiNfm3uFMw8Jp43VQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-xiiHs9BCOZGNpziysWdJAw-1; Fri, 20 Dec 2019 10:06:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 313D8185432E;
 Fri, 20 Dec 2019 15:06:48 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C275E60BF3;
 Fri, 20 Dec 2019 15:06:43 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 7/9] dockerfiles: add dbus-daemon to some of latest
 distributions
Date: Fri, 20 Dec 2019 19:05:20 +0400
Message-Id: <20191220150522.633032-8-marcandre.lureau@redhat.com>
In-Reply-To: <20191220150522.633032-1-marcandre.lureau@redhat.com>
References: <20191220150522.633032-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: xiiHs9BCOZGNpziysWdJAw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker  | 1 +
 tests/docker/dockerfiles/debian10.docker | 1 +
 tests/docker/dockerfiles/fedora.docker   | 1 +
 tests/docker/dockerfiles/ubuntu.docker   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerf=
iles/centos7.docker
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
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/docker=
files/debian10.docker
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
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfi=
les/fedora.docker
index 51d475e6be..987a3c170a 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -8,6 +8,7 @@ ENV PACKAGES \
     ccache \
     clang \
     cyrus-sasl-devel \
+    dbus-daemon \
     device-mapper-multipath-devel \
     findutils \
     flex \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfi=
les/ubuntu.docker
index 18f1100409..4177f33691 100644
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
2.24.0.308.g228f53135a


