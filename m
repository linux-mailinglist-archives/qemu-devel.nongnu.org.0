Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05277C42EE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:48:27 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFQ0P-0000R9-SA
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO9b-0006dB-QJ
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO9a-0000Qn-1u
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO9T-0000MU-GT; Tue, 01 Oct 2019 15:49:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E81318C4266;
 Tue,  1 Oct 2019 19:49:38 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392B55D9CC;
 Tue,  1 Oct 2019 19:49:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 60/67] iotests/254: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:47:08 +0200
Message-Id: <20191001194715.2796-61-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 19:49:38 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/254 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 0404faf853..b44771fbc6 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -19,16 +19,16 @@
 #
=20
 import iotests
-from iotests import qemu_img_create, file_path, log
+from iotests import create_test_image, image_path, log
=20
 iotests.script_initialize(supported_fmts=3D['qcow2'],
                           # compat=3D1.1 is needed for dirty bitmaps
                           unsupported_imgopts=3D['compat=3D0.10'])
=20
-disk, top =3D file_path('disk', 'top')
+disk, top =3D image_path('disk', 'top')
 size =3D 1024 * 1024
=20
-qemu_img_create('-f', iotests.imgfmt, disk, str(size))
+create_test_image(disk, size)
=20
 vm =3D iotests.VM().add_drive(disk, opts=3D'node-name=3Dbase')
 vm.launch()
--=20
2.21.0


