Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5945D2DF4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:41:40 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIaZP-0005Kt-PL
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaJp-00061W-1Z
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaJo-0004UG-2a
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43618)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaJl-0004TC-4O; Thu, 10 Oct 2019 11:25:29 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 365253084288;
 Thu, 10 Oct 2019 15:25:28 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBEDA1001B23;
 Thu, 10 Oct 2019 15:25:27 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 09/23] iotests/147: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:43 +0200
Message-Id: <20191010152457.17713-10-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 10 Oct 2019 15:25:28 +0000 (UTC)
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


