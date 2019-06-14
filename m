Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B536146045
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:13:12 +0200 (CEST)
Received: from localhost ([::1]:51900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbmx5-00030D-TL
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47005)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbmSu-000284-Ri
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbmSs-0006er-Tp
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:42:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29963)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbmSY-0006HQ-Jy; Fri, 14 Jun 2019 09:41:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C1F4CC049D67;
 Fri, 14 Jun 2019 13:41:17 +0000 (UTC)
Received: from localhost (unknown [10.40.205.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A90C17983;
 Fri, 14 Jun 2019 13:41:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 14 Jun 2019 15:40:21 +0200
Message-Id: <20190614134021.32486-21-mreitz@redhat.com>
In-Reply-To: <20190614134021.32486-1-mreitz@redhat.com>
References: <20190614134021.32486-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 14 Jun 2019 13:41:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 20/20] iotests: Test qemu-img convert -C
 --salvage
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support this combination (yet), so this should yield an error
message.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190507203508.18026-8-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/082     | 1 +
 tests/qemu-iotests/082.out | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/082 b/tests/qemu-iotests/082
index bbbdf555dc..3286c2c6db 100755
--- a/tests/qemu-iotests/082
+++ b/tests/qemu-iotests/082
@@ -162,6 +162,7 @@ echo =3D=3D=3D convert: -C and other options =3D=3D=3D
 run_qemu_img convert -C -S 4k -O $IMGFMT "$TEST_IMG" "$TEST_IMG".target
 run_qemu_img convert -C -S 8k -O $IMGFMT "$TEST_IMG" "$TEST_IMG".target
 run_qemu_img convert -C -c -O $IMGFMT "$TEST_IMG" "$TEST_IMG".target
+run_qemu_img convert -C --salvage -O $IMGFMT "$TEST_IMG" "$TEST_IMG".tar=
get
=20
 echo
 echo =3D=3D=3D amend: Options specified more than once =3D=3D=3D
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 7e25706813..58de358b38 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -567,6 +567,9 @@ qemu-img: Cannot enable copy offloading when -S is us=
ed
 Testing: convert -C -c -O qcow2 TEST_DIR/t.qcow2 TEST_DIR/t.qcow2.target
 qemu-img: Cannot enable copy offloading when -c is used
=20
+Testing: convert -C --salvage -O qcow2 TEST_DIR/t.qcow2 TEST_DIR/t.qcow2=
.target
+qemu-img: Cannot use copy offloading in salvaging mode
+
 =3D=3D=3D amend: Options specified more than once =3D=3D=3D
=20
 Testing: amend -f foo -f qcow2 -o lazy_refcounts=3Don TEST_DIR/t.qcow2
--=20
2.21.0


