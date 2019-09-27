Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474FC0299
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:45:55 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmoy-0005Fc-L8
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDmm8-00031m-8N
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDmm7-0007Nx-9Z
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:42:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47874)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDmm5-0007GJ-3u; Fri, 27 Sep 2019 05:42:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 528CB11A07;
 Fri, 27 Sep 2019 09:42:52 +0000 (UTC)
Received: from localhost (ovpn-204-76.brq.redhat.com [10.40.204.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE73C60624;
 Fri, 27 Sep 2019 09:42:51 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 03/18] iotests: Drop compat=1.1 in 050
Date: Fri, 27 Sep 2019 11:42:27 +0200
Message-Id: <20190927094242.11152-4-mreitz@redhat.com>
In-Reply-To: <20190927094242.11152-1-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 27 Sep 2019 09:42:52 +0000 (UTC)
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

IMGOPTS can never be empty for qcow2, because the check scripts adds
compat=3D1.1 unless the user specified any compat option themselves.
Thus, this block does not do anything and can be dropped.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/050 | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qemu-iotests/050 b/tests/qemu-iotests/050
index 211fc00797..272ecab195 100755
--- a/tests/qemu-iotests/050
+++ b/tests/qemu-iotests/050
@@ -41,10 +41,6 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2 qed
 _supported_proto file
=20
-if test "$IMGFMT" =3D qcow2 && test $IMGOPTS =3D ""; then
-  IMGOPTS=3Dcompat=3D1.1
-fi
-
 echo
 echo "=3D=3D Creating images =3D=3D"
=20
--=20
2.21.0


