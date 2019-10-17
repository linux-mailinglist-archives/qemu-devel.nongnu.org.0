Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE45DB01E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:31:33 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6oO-0005S5-HT
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5tX-0002kH-8C
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5tW-0003dK-7w
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49086)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5tS-0003aK-Jn; Thu, 17 Oct 2019 09:32:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6592018CB912;
 Thu, 17 Oct 2019 13:32:41 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 043B560872;
 Thu, 17 Oct 2019 13:32:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 17/23] iotests/208: Create socket in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:49 +0200
Message-Id: <20191017133155.5327-18-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 17 Oct 2019 13:32:41 +0000 (UTC)
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
 tests/qemu-iotests/208 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/208 b/tests/qemu-iotests/208
index 1e202388dc..546eb1de3e 100755
--- a/tests/qemu-iotests/208
+++ b/tests/qemu-iotests/208
@@ -26,7 +26,7 @@ iotests.verify_image_format(supported_fmts=3D['generic'=
])
=20
 with iotests.FilePath('disk.img') as disk_img_path, \
      iotests.FilePath('disk-snapshot.img') as disk_snapshot_img_path, \
-     iotests.FilePath('nbd.sock') as nbd_sock_path, \
+     iotests.FilePath('nbd.sock', iotests.sock_dir) as nbd_sock_path, \
      iotests.VM() as vm:
=20
     img_size =3D '10M'
--=20
2.21.0


