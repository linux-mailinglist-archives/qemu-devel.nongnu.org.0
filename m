Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCB175EB0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 16:47:58 +0100 (CET)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8nIT-0001o0-AW
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 10:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1j8nHK-0000zZ-LJ
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1j8nHJ-0001zw-7e
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:46 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20367
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1j8nHJ-0001y0-45
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583164003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rrDCMvtCjY4G5cVth8ArRi1GVxIA+sqFn1ld0LSdu5w=;
 b=Ig/DB64Vy77PWQb4eXufZ4mZBPhXCJSJxhasufLDoq03M/MCfhAWsWCQWHd/WiPCrGgB1I
 EcSJAqnjrBCh32w7ZmcqPZNNXAAQuOPMKdo2UUFe4qYKNZddoTF2fLYoWu99tH72tI4mPQ
 B85sOnFo0pr7empbU+u7VeE/zbFFLU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-4S2F2JLhOMuFrIToEB8D6Q-1; Mon, 02 Mar 2020 10:46:42 -0500
X-MC-Unique: 4S2F2JLhOMuFrIToEB8D6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E20DB1051EAA;
 Mon,  2 Mar 2020 15:46:40 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-17.ams2.redhat.com [10.36.117.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C3725D9C9;
 Mon,  2 Mar 2020 15:46:30 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] tests/vhost-user-bridge: move to contrib/
Date: Mon,  2 Mar 2020 16:46:28 +0100
Message-Id: <20200302154630.45620-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user-bridge is not a test. Move it to contrib/.

It will be built with:

  make vhost-user-bridge

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---

Notes:
    v3: don't add vhost-user-bridge to the tools list
        libvhost-user doesn't build on MacOSX and for instance
        vhost-user-blk is also built only on demand
   =20
    v2: update docs

 Makefile                                                      | 3 +++
 Makefile.objs                                                 | 1 +
 contrib/vhost-user-bridge/Makefile.objs                       | 1 +
 tests/vhost-user-bridge.c =3D> contrib/vhost-user-bridge/main.c | 0
 docs/devel/migration.rst                                      | 2 +-
 tests/Makefile.include                                        | 1 -
 6 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 contrib/vhost-user-bridge/Makefile.objs
 rename tests/vhost-user-bridge.c =3D> contrib/vhost-user-bridge/main.c (10=
0%)

diff --git a/Makefile b/Makefile
index aa9cc0b58475..218b8259a49a 100644
--- a/Makefile
+++ b/Makefile
@@ -445,6 +445,7 @@ dummy :=3D $(call unnest-vars,, \
                 libvhost-user-obj-y \
                 vhost-user-scsi-obj-y \
                 vhost-user-blk-obj-y \
+                vhost-user-bridge-obj-y \
                 vhost-user-input-obj-y \
                 vhost-user-gpu-obj-y \
                 qga-vss-dll-obj-y \
@@ -688,6 +689,8 @@ vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) libv=
host-user.a
 =09$(call LINK, $^)
 vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) libvhost-user.a
 =09$(call LINK, $^)
+vhost-user-bridge$(EXESUF): $(vhost-user-bridge-obj-y) libvhost-user.a
+=09$(call LINK, $^)
=20
 rdmacm-mux$(EXESUF): LIBS +=3D "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
diff --git a/Makefile.objs b/Makefile.objs
index 8a1cbe8000e6..c282ff77dda5 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -107,6 +107,7 @@ vhost-user-scsi.o-cflags :=3D $(LIBISCSI_CFLAGS)
 vhost-user-scsi.o-libs :=3D $(LIBISCSI_LIBS)
 vhost-user-scsi-obj-y =3D contrib/vhost-user-scsi/
 vhost-user-blk-obj-y =3D contrib/vhost-user-blk/
+vhost-user-bridge-obj-y =3D contrib/vhost-user-bridge/
 rdmacm-mux-obj-y =3D contrib/rdmacm-mux/
 vhost-user-input-obj-y =3D contrib/vhost-user-input/
 vhost-user-gpu-obj-y =3D contrib/vhost-user-gpu/
diff --git a/contrib/vhost-user-bridge/Makefile.objs b/contrib/vhost-user-b=
ridge/Makefile.objs
new file mode 100644
index 000000000000..36a8d9b49a05
--- /dev/null
+++ b/contrib/vhost-user-bridge/Makefile.objs
@@ -0,0 +1 @@
+vhost-user-bridge-obj-y =3D main.o
diff --git a/tests/vhost-user-bridge.c b/contrib/vhost-user-bridge/main.c
similarity index 100%
rename from tests/vhost-user-bridge.c
rename to contrib/vhost-user-bridge/main.c
diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index e88918f7639e..d00424460e23 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -807,7 +807,7 @@ The Linux kernel userfault support works on `/dev/shm` =
memory and on `hugetlbfs`
 for hugetlbfs which may be a problem in some configurations).
=20
 The vhost-user code in QEMU supports clients that have Postcopy support,
-and the `vhost-user-bridge` (in `tests/`) and the DPDK package have change=
s
+and the `vhost-user-bridge` (in `contrib/`) and the DPDK package have chan=
ges
 to support postcopy.
=20
 The client needs to open a userfaultfd and register the areas
diff --git a/tests/Makefile.include b/tests/Makefile.include
index edcbd475aa70..2dc95c52c82d 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -588,7 +588,6 @@ include $(SRC_PATH)/tests/qtest/Makefile.include
=20
 tests/test-qga$(EXESUF): qemu-ga$(EXESUF)
 tests/test-qga$(EXESUF): tests/test-qga.o $(qtest-obj-y)
-tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-ob=
j-y) libvhost-user.a
=20
 SPEED =3D quick
=20
--=20
2.24.1


