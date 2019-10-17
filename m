Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4668DAFFB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:24:55 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6hy-0005wS-HH
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5tD-0002Zs-Ny
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5tC-0003Q6-KV
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48206)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5tA-0003Oh-BE; Thu, 17 Oct 2019 09:32:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93AF72A09DB;
 Thu, 17 Oct 2019 13:32:23 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4D5600C4;
 Thu, 17 Oct 2019 13:32:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 09/23] iotests/147: Create socket in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:41 +0200
Message-Id: <20191017133155.5327-10-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 17 Oct 2019 13:32:23 +0000 (UTC)
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/147 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index ab8480b9a4..03fc2fabcf 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -32,7 +32,7 @@ NBD_IPV6_PORT_START =3D NBD_PORT_END
 NBD_IPV6_PORT_END   =3D NBD_IPV6_PORT_START + 1024
=20
 test_img =3D os.path.join(iotests.test_dir, 'test.img')
-unix_socket =3D os.path.join(iotests.test_dir, 'nbd.socket')
+unix_socket =3D os.path.join(iotests.sock_dir, 'nbd.socket')
=20
=20
 def flatten_sock_addr(crumpled_address):
--=20
2.21.0


