Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BD114DF44
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 17:35:57 +0100 (CET)
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixCnM-000216-B6
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 11:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixClA-0008MC-EE
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:33:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixCl5-000831-CS
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:33:40 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25503
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixCl5-00082D-8e
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 11:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580402014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tl+Yh/nsfcb/XxIVsapr7K9sgBQAjDanHTGoCcXw5jc=;
 b=EI30+bCnxJN29dAvliy5ADTfj446um2cfF037UekrOu8iUpLNut0prbYhOKGUSq25+Kfem
 mPLJX5DKspFbtDRuh+gUtWmU62K/GeNYZ6Ccn/ueBtBGvF2gIvpTORZ/IImiluxyaU64E3
 ZtPC6WjOw3DiGdtDKQO8jdbNeopv8Ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-Grbo7aG9OYCjo1HDnDT5hA-1; Thu, 30 Jan 2020 11:33:30 -0500
X-MC-Unique: Grbo7aG9OYCjo1HDnDT5hA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B2F018CA246;
 Thu, 30 Jan 2020 16:33:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 072E35E241;
 Thu, 30 Jan 2020 16:33:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] tests: Explicit usage of Python 3
Date: Thu, 30 Jan 2020 17:32:24 +0100
Message-Id: <20200130163232.10446-5-philmd@redhat.com>
In-Reply-To: <20200130163232.10446-1-philmd@redhat.com>
References: <20200130163232.10446-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, kvm@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the program search path to find the Python 3 interpreter.

Patch created mechanically by running:

  $ sed -i "s,^#\!/usr/bin/\(env\ \)\?python$,#\!/usr/bin/env python3," \
       $(git grep -l 'if __name__.*__main__')

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/docker/travis.py         | 2 +-
 tests/qapi-schema/test-qapi.py | 2 +-
 tests/vm/centos                | 2 +-
 tests/vm/fedora                | 2 +-
 tests/vm/freebsd               | 2 +-
 tests/vm/netbsd                | 2 +-
 tests/vm/openbsd               | 2 +-
 tests/vm/ubuntu.i386           | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/docker/travis.py b/tests/docker/travis.py
index e1433012bd..62fccc5ebb 100755
--- a/tests/docker/travis.py
+++ b/tests/docker/travis.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Travis YAML config parser
 #
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
index bad14edb47..503fb8ad25 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # QAPI parser test harness
 #
diff --git a/tests/vm/centos b/tests/vm/centos
index f2f0befd84..a41ff109eb 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # CentOS image
 #
diff --git a/tests/vm/fedora b/tests/vm/fedora
index 8e270fc0f0..4d7d6049f4 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Fedora VM image
 #
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 33a736298a..fb54334696 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # FreeBSD VM image
 #
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index ec6f3563b2..c5069a45f4 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # NetBSD VM image
 #
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index d6173506f7..22cd9513dd 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # OpenBSD VM image
 #
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 3834cd7a8d..48e9cb1ad3 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Ubuntu i386 image
 #
--=20
2.21.1


