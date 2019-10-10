Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8BD2DD0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:33:39 +0200 (CEST)
Received: from localhost ([::1]:41150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIaRc-0004KO-7s
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaKA-0006Rj-7x
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaK8-0004d9-8H
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaK5-0004b2-Qf; Thu, 10 Oct 2019 11:25:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F12A910C0516;
 Thu, 10 Oct 2019 15:25:48 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCBA10018FF;
 Thu, 10 Oct 2019 15:25:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 16/23] iotests/205: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:50 +0200
Message-Id: <20191010152457.17713-17-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 10 Oct 2019 15:25:49 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/205 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index 76f6c5fa2b..4bb2c21e8b 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -24,7 +24,7 @@ import iotests
 import time
 from iotests import qemu_img_create, qemu_io, filter_qemu_io, QemuIoInte=
ractive
=20
-nbd_sock =3D os.path.join(iotests.test_dir, 'nbd_sock')
+nbd_sock =3D os.path.join(iotests.sock_dir, 'nbd_sock')
 nbd_uri =3D 'nbd+unix:///exp?socket=3D' + nbd_sock
 disk =3D os.path.join(iotests.test_dir, 'disk')
=20
--=20
2.21.0


