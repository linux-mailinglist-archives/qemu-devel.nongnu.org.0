Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DDD91A49
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 01:23:04 +0200 (CEST)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzUVr-00081l-QZ
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 19:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50867)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzURc-00031i-CJ
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzURb-0000gC-Ez
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:18:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzURb-0000ft-A8
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:18:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D67E1057940;
 Sun, 18 Aug 2019 23:18:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-33.brq.redhat.com [10.40.204.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6263458C87;
 Sun, 18 Aug 2019 23:18:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 01:18:24 +0200
Message-Id: <20190818231827.27573-2-philmd@redhat.com>
In-Reply-To: <20190818231827.27573-1-philmd@redhat.com>
References: <20190818231827.27573-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Sun, 18 Aug 2019 23:18:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/4] tests/docker: Use one package per line to
 improve readability
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use one package per line to improve readability. This also
helps while reviewing patches.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/docker/dockerfiles/travis.docker | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/travis.docker b/tests/docker/docker=
files/travis.docker
index e72dc85ca7..35714664a1 100644
--- a/tests/docker/dockerfiles/travis.docker
+++ b/tests/docker/dockerfiles/travis.docker
@@ -5,7 +5,15 @@ ENV LC_ALL en_US.UTF-8
 RUN sed -i "s/# deb-src/deb-src/" /etc/apt/sources.list
 RUN apt-get update
 RUN apt-get -y build-dep qemu
-RUN apt-get -y install device-tree-compiler python2.7 python-yaml dh-aut=
oreconf gdb strace lsof net-tools gcovr
+RUN apt-get -y install \
+    device-tree-compiler \
+    dh-autoreconf \
+    gcovr \
+    gdb strace \
+    lsof \
+    net-tools \
+    python2.7 \
+    python-yaml
 # Travis tools require PhantomJS / Neo4j / Maven accessible
 # in their PATH (QEMU build won't access them).
 ENV PATH /usr/local/phantomjs/bin:/usr/local/phantomjs:/usr/local/neo4j-=
3.2.7/bin:/usr/local/maven-3.5.2/bin:/usr/local/cmake-3.9.2/bin:/usr/loca=
l/clang-5.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin
--=20
2.20.1


