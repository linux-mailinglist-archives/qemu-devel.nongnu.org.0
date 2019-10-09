Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C57D1B1A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 23:42:42 +0200 (CEST)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIJjF-0004Sp-MR
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 17:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHw7-0007IN-B9
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHw6-0003fV-C1
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:47:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59114)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHw4-0003dx-01; Wed, 09 Oct 2019 15:47:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0305A18CB919;
 Wed,  9 Oct 2019 19:47:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC99D1001DC0;
 Wed,  9 Oct 2019 19:47:45 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qemu-iotests: 044: pass is actually a noop,
 so remove it
Date: Wed,  9 Oct 2019 15:47:39 -0400
Message-Id: <20191009194740.8079-4-crosa@redhat.com>
In-Reply-To: <20191009194740.8079-1-crosa@redhat.com>
References: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 09 Oct 2019 19:47:47 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/044 | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 8b2afa2a11..aa2a00ceed 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -102,17 +102,14 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, '-o', 'cluster_size=3D5=
12', test_img, '16G')
         self.preallocate(test_img)
-        pass
=20
=20
     def tearDown(self):
         os.remove(test_img)
-        pass
=20
     def test_grow_refcount_table(self):
         qemu_io('-c', 'write 3800M 1M', test_img)
         qemu_img_verbose('check' , test_img)
-        pass
=20
 if __name__ =3D=3D '__main__':
     iotests.main(supported_fmts=3D['qcow2'],
--=20
2.21.0


