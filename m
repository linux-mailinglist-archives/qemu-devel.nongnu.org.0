Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE595DB00A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:27:23 +0200 (CEST)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6kM-0000SB-AX
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5tY-0002mY-HS
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5tX-0003eE-Ix
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5tV-0003bO-5N; Thu, 17 Oct 2019 09:32:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DDA8289F305;
 Thu, 17 Oct 2019 13:32:43 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8DE5DA60;
 Thu, 17 Oct 2019 13:32:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 18/23] iotests/209: Create socket in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:50 +0200
Message-Id: <20191017133155.5327-19-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 17 Oct 2019 13:32:43 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/209 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
index 259e991ec6..e0f464bcbe 100755
--- a/tests/qemu-iotests/209
+++ b/tests/qemu-iotests/209
@@ -24,7 +24,8 @@ from iotests import qemu_img_create, qemu_io, qemu_img_=
verbose, qemu_nbd, \
=20
 iotests.verify_image_format(supported_fmts=3D['qcow2'])
=20
-disk, nbd_sock =3D file_path('disk', 'nbd-sock')
+disk =3D file_path('disk')
+nbd_sock =3D file_path('nbd-sock', base_dir=3Diotests.sock_dir)
 nbd_uri =3D 'nbd+unix:///exp?socket=3D' + nbd_sock
=20
 qemu_img_create('-f', iotests.imgfmt, disk, '1M')
--=20
2.21.0


