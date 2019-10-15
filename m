Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F33D78F4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 16:43:50 +0200 (CEST)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKO3B-0006Co-2f
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 10:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iKNo4-0006tl-IY
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iKNo3-0000Ad-3n
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iKNnw-0008TB-3r; Tue, 15 Oct 2019 10:28:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 818052106;
 Tue, 15 Oct 2019 14:28:00 +0000 (UTC)
Received: from localhost (ovpn-117-226.ams2.redhat.com [10.36.117.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CDD53DB4;
 Tue, 15 Oct 2019 14:27:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 11/21] iotests: Replace IMGOPTS='' by --no-opts
Date: Tue, 15 Oct 2019 16:27:19 +0200
Message-Id: <20191015142729.18123-12-mreitz@redhat.com>
In-Reply-To: <20191015142729.18123-1-mreitz@redhat.com>
References: <20191015142729.18123-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 15 Oct 2019 14:28:00 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/071 | 4 ++--
 tests/qemu-iotests/174 | 2 +-
 tests/qemu-iotests/178 | 4 ++--
 tests/qemu-iotests/197 | 4 ++--
 tests/qemu-iotests/215 | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index fab526666b..4e31943244 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -58,7 +58,7 @@ echo
 echo "=3D=3D=3D Testing blkverify through filename =3D=3D=3D"
 echo
=20
-TEST_IMG=3D"$TEST_IMG.base" IMGOPTS=3D"" IMGFMT=3D"raw" _make_test_img $=
IMG_SIZE |\
+TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG=
_SIZE |\
     _filter_imgfmt
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=3Draw,file.driver=3Dblkverify,file.raw.filen=
ame=3D$TEST_IMG.base $TEST_IMG" \
@@ -73,7 +73,7 @@ echo
 echo "=3D=3D=3D Testing blkverify through file blockref =3D=3D=3D"
 echo
=20
-TEST_IMG=3D"$TEST_IMG.base" IMGOPTS=3D"" IMGFMT=3D"raw" _make_test_img $=
IMG_SIZE |\
+TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG=
_SIZE |\
     _filter_imgfmt
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=3Draw,file.driver=3Dblkverify,file.raw.filen=
ame=3D$TEST_IMG.base,file.test.driver=3D$IMGFMT,file.test.file.filename=3D=
$TEST_IMG" \
diff --git a/tests/qemu-iotests/174 b/tests/qemu-iotests/174
index 0a952a73fd..e2f14a38c6 100755
--- a/tests/qemu-iotests/174
+++ b/tests/qemu-iotests/174
@@ -40,7 +40,7 @@ _unsupported_fmt raw
=20
=20
 size=3D256K
-IMGFMT=3Draw IMGKEYSECRET=3D IMGOPTS=3D _make_test_img $size | _filter_i=
mgfmt
+IMGFMT=3Draw IMGKEYSECRET=3D _make_test_img --no-opts $size | _filter_im=
gfmt
=20
 echo
 echo "=3D=3D reading wrong format should fail =3D=3D"
diff --git a/tests/qemu-iotests/178 b/tests/qemu-iotests/178
index 21231cadd3..75b5e8f314 100755
--- a/tests/qemu-iotests/178
+++ b/tests/qemu-iotests/178
@@ -62,8 +62,8 @@ $QEMU_IMG measure -O foo "$TEST_IMG" # unknown image fi=
le format
=20
 make_test_img_with_fmt() {
     # Shadow global variables within this function
-    local IMGFMT=3D"$1" IMGOPTS=3D""
-    _make_test_img "$2"
+    local IMGFMT=3D"$1"
+    _make_test_img --no-opts "$2"
 }
=20
 qemu_io_with_fmt() {
diff --git a/tests/qemu-iotests/197 b/tests/qemu-iotests/197
index 1d4f6786db..4d3d08ad6f 100755
--- a/tests/qemu-iotests/197
+++ b/tests/qemu-iotests/197
@@ -66,8 +66,8 @@ if [ "$IMGFMT" =3D "vpc" ]; then
 fi
 _make_test_img 4G
 $QEMU_IO -c "write -P 55 3G 1k" "$TEST_IMG" | _filter_qemu_io
-IMGPROTO=3Dfile IMGFMT=3Dqcow2 IMGOPTS=3D TEST_IMG_FILE=3D"$TEST_WRAP" \
-    _make_test_img -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_create
+IMGPROTO=3Dfile IMGFMT=3Dqcow2 TEST_IMG_FILE=3D"$TEST_WRAP" \
+    _make_test_img --no-opts -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_c=
reate
 $QEMU_IO -f qcow2 -c "write -z -u 1M 64k" "$TEST_WRAP" | _filter_qemu_io
=20
 # Ensure that a read of two clusters, but where one is already allocated=
,
diff --git a/tests/qemu-iotests/215 b/tests/qemu-iotests/215
index 2eb377d682..55a1874dcd 100755
--- a/tests/qemu-iotests/215
+++ b/tests/qemu-iotests/215
@@ -63,8 +63,8 @@ if [ "$IMGFMT" =3D "vpc" ]; then
 fi
 _make_test_img 4G
 $QEMU_IO -c "write -P 55 3G 1k" "$TEST_IMG" | _filter_qemu_io
-IMGPROTO=3Dfile IMGFMT=3Dqcow2 IMGOPTS=3D TEST_IMG_FILE=3D"$TEST_WRAP" \
-    _make_test_img -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_create
+IMGPROTO=3Dfile IMGFMT=3Dqcow2 TEST_IMG_FILE=3D"$TEST_WRAP" \
+    _make_test_img --no-opts -F "$IMGFMT" -b "$TEST_IMG" | _filter_img_c=
reate
 $QEMU_IO -f qcow2 -c "write -z -u 1M 64k" "$TEST_WRAP" | _filter_qemu_io
=20
 # Ensure that a read of two clusters, but where one is already allocated=
,
--=20
2.21.0


