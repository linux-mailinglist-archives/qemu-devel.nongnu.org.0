Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E93112F93
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 17:06:59 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icXB4-0000Mz-2d
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 11:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1icWru-0007Vi-5u
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 10:47:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1icWrs-0000Rp-99
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 10:47:09 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53018
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1icWrs-0000F5-2l
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 10:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575474416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WkRx7Bv6afUEMvOsobegDUv3reP8taV3sqxSAvgXx4=;
 b=ewRxzUJeM3jvyU75wISLl36+sOoqOu32EDXM/JtJPvXaZbK0W4ExlIkdoHR524zmNdThNI
 0UJ/Kh7w6gFRj4aLHJKO4875BQQcv4HtkrxA6ZS/wBbEO9TW1sgV34BDabeDGxIKNjxbOP
 WxCdh6tv2kanzhicUyKNlI+vCL1G3og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329--VM5xHynOcS5n0ehbrGJsg-1; Wed, 04 Dec 2019 10:46:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6B6E18543A0;
 Wed,  4 Dec 2019 15:46:51 +0000 (UTC)
Received: from thuth.com (ovpn-117-39.ams2.redhat.com [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5590F600C8;
 Wed,  4 Dec 2019 15:46:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] tests/test-util-filemonitor: Skip test on non-x86
 Travis containers
Date: Wed,  4 Dec 2019 16:46:16 +0100
Message-Id: <20191204154618.23560-6-thuth@redhat.com>
In-Reply-To: <20191204154618.23560-1-thuth@redhat.com>
References: <20191204154618.23560-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: -VM5xHynOcS5n0ehbrGJsg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: qemu-block@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Eric Auger <eric.auger@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test-util-filemonitor fails in restricted non-x86 Travis containers
since they apparently blacklisted some required system calls there.
Let's simply skip the test if we detect such an environment.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/test-util-filemonitor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/test-util-filemonitor.c b/tests/test-util-filemonitor.c
index 301cd2db61..45009c69f4 100644
--- a/tests/test-util-filemonitor.c
+++ b/tests/test-util-filemonitor.c
@@ -406,10 +406,21 @@ test_file_monitor_events(void)
     char *pathdst =3D NULL;
     QFileMonitorTestData data;
     GHashTable *ids =3D g_hash_table_new(g_int64_hash, g_int64_equal);
+    char *travis_arch;
=20
     qemu_mutex_init(&data.lock);
     data.records =3D NULL;
=20
+    /*
+     * This test does not work on Travis LXD containers since some
+     * syscalls are blocked in that environment.
+     */
+    travis_arch =3D getenv("TRAVIS_ARCH");
+    if (travis_arch && !g_str_equal(travis_arch, "x86_64")) {
+        g_test_skip("Test does not work on non-x86 Travis containers.");
+        return;
+    }
+
     /*
      * The file monitor needs the main loop running in
      * order to receive events from inotify. We must
--=20
2.18.1


