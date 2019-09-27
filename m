Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A0C029F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:46:19 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmpN-0005n8-Ba
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDmmF-0003DD-5N
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDmmE-0007Wl-42
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:43:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50080)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDmmB-0007Tf-WA; Fri, 27 Sep 2019 05:43:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FE208A2195;
 Fri, 27 Sep 2019 09:42:59 +0000 (UTC)
Received: from localhost (ovpn-204-76.brq.redhat.com [10.40.204.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF2A25D6B2;
 Fri, 27 Sep 2019 09:42:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 06/18] iotests: Inject space into -ocompat=0.10 in 051
Date: Fri, 27 Sep 2019 11:42:30 +0200
Message-Id: <20190927094242.11152-7-mreitz@redhat.com>
In-Reply-To: <20190927094242.11152-1-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 27 Sep 2019 09:42:59 +0000 (UTC)
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

It did not matter before, but now that _make_test_img understands -o, we
should use it properly here.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/051 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 53bcdbc911..9cd1d60d45 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -157,7 +157,7 @@ echo
 echo =3D=3D=3D With version 2 images enabling lazy refcounts must fail =3D=
=3D=3D
 echo
=20
-_make_test_img -ocompat=3D0.10 $size
+_make_test_img -o compat=3D0.10 $size
=20
 run_qemu -drive file=3D"$TEST_IMG",format=3Dqcow2,lazy-refcounts=3Don
 run_qemu -drive file=3D"$TEST_IMG",format=3Dqcow2,lazy-refcounts=3Doff
--=20
2.21.0


