Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9038D2E38
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:59:33 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIaqi-0004y2-Ot
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaKK-0006h0-Ul
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaKJ-0004i9-RN
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:26:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaKH-0004gB-Mj; Thu, 10 Oct 2019 11:26:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F0F38D5D88;
 Thu, 10 Oct 2019 15:25:59 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB7641054FF8;
 Thu, 10 Oct 2019 15:25:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 19/23] iotests/222: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:53 +0200
Message-Id: <20191010152457.17713-20-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 10 Oct 2019 15:25:59 +0000 (UTC)
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
 tests/qemu-iotests/222 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index 0ead56d574..3f9f934ad8 100644
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -48,7 +48,7 @@ remainder =3D [("0xd5", "0x108000",  "32k"), # Right-en=
d of partial-left [1]
=20
 with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock') as nbd_sock_path, \
+     iotests.FilePath('nbd.sock', iotests.sock_dir) as nbd_sock_path, \
      iotests.VM() as vm:
=20
     log('--- Setting up images ---')
--=20
2.21.0


